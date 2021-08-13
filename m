Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352C13EB760
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 17:07:19 +0200 (CEST)
Received: from localhost ([::1]:58842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEYmE-0004Nh-8i
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 11:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkD-0001gE-Qb
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:45664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mEYkC-0003Sf-32
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 11:05:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id v4so6614182wro.12
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BHlWsE4JPaRi6+IZ5sgTgLjKwD9Y471AteUNq+zIfJ4=;
 b=p1l4rhOGD8MQzvgCjecYzp8jkIEaLO/l1mnZ4vxVA/ayNb+GTu2xO4BIHAoMwZQTmH
 fcOUW9EfyXQo/WnoiiFAQ70UOJSbys1t7Lc4MROeo2MRwtR9666KT6S5VKC2I0uiPl4W
 BoCkwtmXRSqyLGo+cM0KItrHiJmw24yuYIqOQGsFKqzESoJCvVIzcnK3Ifq48i5JmZBn
 N6rssnXDyJajYszRcEs9EuX2Fm64dD+1m/ufLDxwmXngCeSMmAox+4c3WSnargsFI3X/
 tHR/IIanlqth5D69imVUMFMAbjeynRDn0arZ6Yp55lMGSnW+DmIb3MTYh0aHUhPXcNH6
 NOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BHlWsE4JPaRi6+IZ5sgTgLjKwD9Y471AteUNq+zIfJ4=;
 b=shzmrcYNl/DNke/UDqxHjnKzFuwznjYll7o6PdG7c/G4rYgx9Tt5jgp4uXk3f2Ozr/
 96ctfLyulKF4/9589W8814so6ksc3A2yuLU8nhld3S0Ok8w6QweEeFnOtc6iTTlnb7jW
 Vi0h+OQhusL1WBXLEvkpNUYpuoLTzZRrNroG9zqv/pnVdYMv/amDrJHUwoKWGPciC7Tm
 2kqCJPhn5ieolU3ooeVb7tNYlcTXfozyHzbHeZQum67PfN1KqMwJ45OFUy5RMYW/KGSJ
 0gO7DFX8ttwvi2nHrNFTvHxFYmxGnobhdzb54hwCO5wr/U+7ONsf0U+ilQsSHfpBBf/E
 9u/A==
X-Gm-Message-State: AOAM532p6GB+Wf5qA6v42yXkk1yuM7TZe15oz7+fq8ekPZpJe4K36zvZ
 zXqumXHp0WhdPPbyAoKppgXI1hNXF0xTUw==
X-Google-Smtp-Source: ABdhPJyGX0AC9IRkYhDL1uhsL3iS3J+AFgqjaxZ+stJPHjGrkkbZe34MCe7pBfBXQBLcRAv+lQqtow==
X-Received: by 2002:adf:d227:: with SMTP id k7mr3723491wrh.392.1628867110776; 
 Fri, 13 Aug 2021 08:05:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id h9sm1836361wrv.84.2021.08.13.08.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 08:05:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/4] gdbstub: Zero-initialize sockaddr structs
Date: Fri, 13 Aug 2021 16:05:04 +0100
Message-Id: <20210813150506.7768-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210813150506.7768-1-peter.maydell@linaro.org>
References: <20210813150506.7768-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
 gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index 52bde5bdc97..5d8e6ae3cd9 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3218,7 +3218,7 @@ static bool gdb_accept_socket(int gdb_fd)
 
 static int gdbserver_open_socket(const char *path)
 {
-    struct sockaddr_un sockaddr;
+    struct sockaddr_un sockaddr = {};
     int fd, ret;
 
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
@@ -3247,7 +3247,7 @@ static int gdbserver_open_socket(const char *path)
 
 static bool gdb_accept_tcp(int gdb_fd)
 {
-    struct sockaddr_in sockaddr;
+    struct sockaddr_in sockaddr = {};
     socklen_t len;
     int fd;
 
-- 
2.20.1


