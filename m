Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08273EB770
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:08:59 +0200 (CEST)
Received: from localhost ([::1]:36574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYnq-0008Oi-T7
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkI-0001qv-Rb
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:18 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkG-0003W6-By
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:18 -0400
Received: by mail-wr1-x432.google.com with SMTP id q6so2207970wrv.6
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jhalmmK6++gWTwtUeGZefnNC1U+Cc5q6S1SHf1iSyOA=;
 b=pn4AgDNhnpOX7akdxp6+mX5yr3hIq2IwJKgPI/N31fpwF+3Q7mO2KOI6Eb3CTqraPg
 K4n9zWZ+1S1qv0DbacF66tHTvz6ILYue+iEkCHiaAq9OC+rqlIBJC3saa+kAaUnbdvkP
 ARhVuUtAY4wVvpk70AwY4CAtbW3M0JXH165upWhb1Lq2gHp3vNmrz9B3lo6bvKpcGh7F
 uobuDXFNPGOY4jCGBW6HRvxb5/HQxW9Gxv69yD7wx2ewWpOkdi8H12Na9TOZ3Twcx4yj
 MV9uivBa9otxkFcufO4AU9+oK8MSDjcW9Gysa6aTLklq0P24J+ruPgeQhT/M0uoIsx9f
 R48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jhalmmK6++gWTwtUeGZefnNC1U+Cc5q6S1SHf1iSyOA=;
 b=H4t6pWghL0hO5DmYI5MuKzxjPP5iVpu1NaxlrmILH9W0lUWBfhR1u3pioYRhOUK653
 bBjssNu8yvIAxEHIVI6oI+zB0kseYp6GHzqN6XDeXQv6uOszmDAqpdQRCKGr9Eivj9x2
 wW6QCr0DQXTd32R2Aybfcr9i3L+4vFsBHALVh5YgEsrr5eKe76j0CZJjk6mKhKLd7DXs
 zwCmb5hAG3WCsuK5m4ETuvcHHrobmo4TlpPrReM45rXUbiWjTOnMRdjkVzyVm9ZihnII
 pEPM1GVQq9b4biHNXj8MZGcrjZlB4qw5vmI0aEP5PuFZxpAQnU6eCRArXrh5uKWUhmBb
 oAiQ==
X-Gm-Message-State: AOAM530t5eHonC8Qggg5i8TSPvvq9i4KdpCywXoN5QVqoJwgnFnM84H+
 AkOrmD6ik5xVeOo3+l65qgCR2RqUdlN+9w==
X-Google-Smtp-Source: ABdhPJyDVX23f7B9WSlIcMpJxAo8NdqyJsxjxEs7BDESxn7Sev7aCW7ojmQJvq32rC81rKKnTqDhQg==
X-Received: by 2002:adf:f68d:: with SMTP id v13mr3708616wrp.358.1628867114749; 
 Fri, 13 Aug 2021 08:05:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h9sm1836361wrv.84.2021.08.13.08.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:05:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 4/4] tests/tcg/multiarch/linux-test: Zero-initialize
 sockaddr structs
Date: Fri, 13 Aug 2021 16:05:06 +0100
Message-Id: <20210813150506.7768-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Eric Blake <eblake@redhat.com>,
 Corey Minyard <minyard@acm.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zero-initialize sockaddr_in and sockaddr_un structs that we're about
to fill in and pass to bind() or connect(), to ensure we don't leave
possible implementation-defined extension fields as uninitialized
garbage.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


