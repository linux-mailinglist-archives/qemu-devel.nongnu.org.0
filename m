Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6928F31F816
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:19:09 +0100 (CET)
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3oR-0008Mo-TL
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:19:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3mX-0007rO-Gq
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:17:09 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD3mV-0006jO-Jh
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:17:09 -0500
Received: by mail-pl1-x635.google.com with SMTP id s16so3179931plr.9
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M9oDkfej678wUz8QTuCnY7792PBW2W7sesrMhNOqn90=;
 b=GKSzpB1NAO1Q4xDwThaO7YQRAaC8CXoglA9z075tdXqW5omafNtDiOMDY7SOITz9YB
 flma0xXc/Ztyq4AXHOucSxhyjbRpMB5s0wQ8oz64rtKrMb+tq34OJZikbBV0QaoGRouP
 sl6Ut571TDwh3WSMeAGNFwzxKXsJ/b46xotBDvxU6GQK5tDhSqlLWMPRAyKMpbFTrnXh
 y4SexMoM1EQiS8jU0DjfyDYYEXXMBupl2taP9uY6gq66xs7DUBE0/MUuz//f4a1IHXaz
 KSHR2aMHVhNp2jALAapmrnL1h3+f4exHGkctDuVcd8dE+Ksd/CaNipRmHniJk2V8KT9J
 +wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M9oDkfej678wUz8QTuCnY7792PBW2W7sesrMhNOqn90=;
 b=FOC88yI6oFZicT/E5GGBHspg4+RnhbZNFTwyiTFt9Z3AtAngc7fPHPraswlei6ujLH
 rfSJCKmDIYJagqbkMvrUgY5FrLw4wGHdofYq85hrAthJk0xqC2fqS4C7urhukQwVLdh6
 PYQ/BKcpIozVDBmmiEGdzY3EcTbmUFJVDtVALrnwNl12YKmV0E/Yg9enozA1D2lF1M/I
 ATYIkBtDPJImwNL5jxJMQ3n1JEFLuBGpLDsNMz4kPLbrg2wYpvZGhosN4/DVuGmZDJYF
 9CJAekFmyG0ZnTyGwyV71VopT01MJ6xzEZIkdnSZA759Yn7bYMd+HMywDaHW9OCfDNJo
 wehg==
X-Gm-Message-State: AOAM530Y50KxFrUVXnzDWxILfKY6XnXhQ+7RIQZFt2u7F04BVuXXxNPI
 ZOQs8ueQfnSMDXOzeme5b/d8Hp/9Xfzv9Q==
X-Google-Smtp-Source: ABdhPJyFVtmkJxmwUjsZIM5CQtShZhdB0QO4mXL1mB6tC/WgHkLHoM4m1fyBGYgvrSKejWxiF3r76g==
X-Received: by 2002:a17:90b:718:: with SMTP id
 s24mr7743154pjz.160.1613733425895; 
 Fri, 19 Feb 2021 03:17:05 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id s23sm9026861pfc.211.2021.02.19.03.17.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 03:17:05 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Do not exit immediately after shutdown
Date: Fri, 19 Feb 2021 20:16:52 +0900
Message-Id: <20210219111652.20623-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
References: <CAFEAcA_eKtZ--p=S9P7_9cEDxfvBVsb_aP4p6Luc+9XutGDxYA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/cocoa used to call exit immediately after calling
qemu_system_shutdown_request, which prevents QEMU from actually
perfoming system shutdown. Just sleep forever, and wait QEMU to call
exit and kill the Cocoa thread.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..cbd03667bd8 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1121,7 +1121,13 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
     COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
 
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
-    exit(0);
+
+    /*
+     * Sleep here, because returning will cause OSX to kill us
+     * immediately; the QEMU main loop will handle the shutdown
+     * request and terminate the process.
+     */
+    [NSThread sleepForTimeInterval:INFINITY];
 }
 
 - (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
-- 
2.24.3 (Apple Git-128)


