Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EB33F8D33
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:41:43 +0200 (CEST)
Received: from localhost ([::1]:59146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJNm-0000OC-Ot
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn0-0006B9-Gc
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImy-000091-TC
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:42 -0400
Received: by mail-wm1-x32a.google.com with SMTP id f10so2260365wml.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JHk5K28csa+x2X+vcfWlcE7ytViOJHrw2fgmN/di2rw=;
 b=R0pZzWSeXhzSzC6fVYaQMuXpey7SPsAzjluCbpJpmMBNQCsIxCqOkWO7PUAGv4ZMdl
 0CQVE0RPfHN8P0bryZV4Tn0WjUgTBisHgOfEW2vtYTRGF/fyMgVScGghLehxai5op7kt
 qxHNXtmyuuaeM6NivTmlxfTFKovTxYJxwvvyV84PBtg8Ie26tvkrHXTm9+YQc4EPn0F6
 Vfgz1XaYEyY308LwiROw4n4wVbFjOWTN4huDDixKEk7L/ZeSj/sEtaXDGKwh307ffK7D
 yoYHOvl1f21NL0V7GNdvhNWJweBaWb1DfL0Hrz2N2nswxM0QSl7ygKebbcXgp6ISwjsf
 lHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JHk5K28csa+x2X+vcfWlcE7ytViOJHrw2fgmN/di2rw=;
 b=g/IN4Z5Wf8hF2AoOfTB6jQd/wai0u30XyH9kTMcLT5GvhHPu02yEi4/VoaiM4K6AHe
 0YTlcqxc+Ge2a7FxcxEfICkq7LAr4eC9SvVWFPSAS9DNYemHCWJCmiTY/he1AHQIB2IT
 fu1DKBv40ir5uHn+MV7OyGOsQlTxqvhivzcR06domAeGwizSvoNk6mbl52kaxOxLD1iW
 IqBPzGOLEkiyir/BdrsU4BFytecWinEjaOLlqFuUrdaN+jYA/tSwo5u56a7ewiZ6PX7F
 92gkn5XP602WKmNGu3qwmXIB3E5KJPmkO6CEUPZJtNaTPrDABlrpyVSB3uXOqS2xp9YP
 /qrg==
X-Gm-Message-State: AOAM530bcSt/KZk4UYqhcWn5qqmg6YxnSgEDF0yDtsW/haQ0JzQWEeGz
 pwaUqmB9jnU7EDHyNKEZxADCSg6XPOKubA==
X-Google-Smtp-Source: ABdhPJzUtoWEMdFHZlPuYF0MCrawvf0feTt1LZG6iutqdx3xHY9FxtkjET0vSTwDqIADAGlZ2rZa+w==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr4627965wmz.93.1629997419526;
 Thu, 26 Aug 2021 10:03:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:39 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 29/37] tests/tcg/multiarch/linux-test: Zero-initialize sockaddr
 structs
Date: Thu, 26 Aug 2021 18:02:59 +0100
Message-Id: <20210826170307.27733-30-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero-initialize sockaddr_in and sockaddr_un structs that we're about
to fill in and pass to bind() or connect(), to ensure we don't leave
possible implementation-defined extension fields as uninitialized
garbage.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210813150506.7768-5-peter.maydell@linaro.org
---
 tests/tcg/multiarch/linux-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
index c8c6aeddeb3..019d8175ca6 100644
--- a/tests/tcg/multiarch/linux-test.c
+++ b/tests/tcg/multiarch/linux-test.c
@@ -251,7 +251,7 @@ static void test_time(void)
 static int server_socket(void)
 {
     int val, fd;
-    struct sockaddr_in sockaddr;
+    struct sockaddr_in sockaddr = {};
 
     /* server socket */
     fd = chk_error(socket(PF_INET, SOCK_STREAM, 0));
@@ -271,7 +271,7 @@ static int server_socket(void)
 static int client_socket(uint16_t port)
 {
     int fd;
-    struct sockaddr_in sockaddr;
+    struct sockaddr_in sockaddr = {};
 
     /* server socket */
     fd = chk_error(socket(PF_INET, SOCK_STREAM, 0));
-- 
2.20.1


