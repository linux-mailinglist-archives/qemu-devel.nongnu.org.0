Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AAF31F609
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 09:49:46 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD1Tt-0003zx-Mv
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 03:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Qh-0002iR-Sk
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:46:27 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lD1Qg-0006lC-8F
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 03:46:27 -0500
Received: by mail-pj1-x102a.google.com with SMTP id t2so3747039pjq.2
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 00:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P+uipSD9NddkUR6OLWT/Fc4TSWusq61aoq6KLfefx9A=;
 b=TYOcVF5Xir5G2IayFz9s7BF9mJPjGWCfPE0aqByLm8S77MGuEXkIRLhFMnRVJpsCaG
 b9H9xOmQCe/Ub9Z6YUdu2I1RHsBpdxwKNYO7gyFE093g4Om9jZ6yemaeHomnxV00cpVO
 SBq3MCsT10VSQr7XnP6inIT+T1xJsa2gj8GRezte5KoyFAUwlslI7kHoNoe8X1E0O+ex
 903bXVn6Njeq2lVP1R+QV0RFizab6UCcpaYb1tJqeoe7GrYoaP7vXughqWlXKp00UDru
 r3oT9yRNS7PIH3QSMraNxK4h63Di6xlYrzs0/qa33gFADMSZ6vPA6lkardHIwOOWupI4
 iykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P+uipSD9NddkUR6OLWT/Fc4TSWusq61aoq6KLfefx9A=;
 b=IoIzpuGdp6FuNAsD3iYNK5amxwshuiu0jc0KaCPhLST6inhpa1fcczQCBCWYxkVDrU
 p7g50YgvzOWvObxpyNX6hkeeFXY+wlBmdhM4pVdeYU/4D+3u7npbX6+GJUUhpvtGY3zs
 8cuIdv7yyJzTrp+/R6yzgUf6ANckIf1YKL4y9kMN7R5+yUv7yOfc8kzHKhTHPMb1iq1B
 XMHEZ+6gtFZEY2nDW6Ii8TBFwimu6ZmeH/YwTYdEmnZm9jLYRMxDI7ulGpBxO6aSgaUJ
 qsGrawaoMMSiOZB+lSt1kraK2C+FknoQfXDDjZXzS7EctnnCl+XYCGdlnMu7Tpaf3P09
 z07w==
X-Gm-Message-State: AOAM532yXeYX9vsoiiWeNF9//F3V2Fqnmf95GBYQ/IILoqeNWHgd85Yl
 IgbRNFjRBTCQfBGSbCMyKEg6yPqd4b94lg==
X-Google-Smtp-Source: ABdhPJyot4dSr1oruAMJOHILlk/em1CBFu06rGv9ziWKCE/xJXcku/XZBOB6O4y9R4ys+5321jLW5g==
X-Received: by 2002:a17:90a:4603:: with SMTP id
 w3mr8350115pjg.125.1613724384477; 
 Fri, 19 Feb 2021 00:46:24 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id j9sm7554246pjn.32.2021.02.19.00.46.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 00:46:24 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not exit immediately after shutdown
Date: Fri, 19 Feb 2021 17:46:18 +0900
Message-Id: <20210219084618.90311-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
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
 ui/cocoa.m | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..65bb74134ca 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1121,7 +1121,7 @@ - (void)applicationWillTerminate:(NSNotification *)aNotification
     COCOA_DEBUG("QemuCocoaAppController: applicationWillTerminate\n");
 
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
-    exit(0);
+    [NSThread sleepForTimeInterval:INFINITY];
 }
 
 - (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication
-- 
2.24.3 (Apple Git-128)


