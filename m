Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FE33A360
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 08:03:15 +0100 (CET)
Received: from localhost ([::1]:37384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLKmP-0004zt-GS
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 03:03:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLKlD-0004Wn-Ky
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 03:01:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:33001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lLKlB-0003Lk-Rr
 for qemu-devel@nongnu.org; Sun, 14 Mar 2021 03:01:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y13so4677554pfr.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 23:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SN1lM9HXLvnSugUX+RHDK8PqAOsb6RY5AUIbJPvtZX4=;
 b=VkV+DO+uYfzbPiDMz4ASQKXnIHK7BEuCduu55qHKbUqyaACssBbwY3PEEcAjJ9d6Xt
 jdUrCbSrA0ChIiVLnuWftrCcse+bhm3mtIiyeR4TJKPYJCU8UGKibU7GCpvHBPYr2hLL
 7JguSC82iGD7cKoM46L7Ho2BPZI+FDZ/G4E1CbN/mXbm8X1FhhrATTj4WrwJHwxq8gv+
 88eQnB1l6+Of5JnVlpIciMYrq3dKbM8WrqEu1O6Q19NhdKtH6QIwkJh4VlU5AsIAeXEJ
 WfkElsKGS95sJS4AY8HjoUbmo/qP0GAD1j2D8PnOlPDyiDd0WR78g3yAvlgPzwkMUtJP
 /3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SN1lM9HXLvnSugUX+RHDK8PqAOsb6RY5AUIbJPvtZX4=;
 b=bcQAmyrbASgPUGRG61FyHJzj5VLOHuY+EUDmANmrp7Y2ntpyrWB0qyi3U42vLQ5ust
 fN6UnGutRuKKimqQgDv3idmrCEE0vzKVt6RuYPqFLVNN0MtvimlW9hHVgnlGAzplitQw
 4iwjk5+Hh63RKXLt2FZx8cISE+H80CWS4JIA+B0YMfBuiSM36masQZfg41gkLgkDd32u
 4jGiBWNznOOyvhU9xMyvjJEN0FyAPxcT6RDBFkfudPkV5CLhiD2+r7KiXL/UPxySQZXS
 FEYR0Zy9ggBcHzytHWvGBZlAHz7K6yrx/oToap+GGcUuVRINDhZ85q7gNBPZoHz4cXe8
 GBNw==
X-Gm-Message-State: AOAM532SWQsUyv7efeK/XW0n+HcM+Qx/iJ3yf3ZnV4YCtWHjClM/Uhr0
 pcyBaddgPVmgqp+GKc5mOaxh0fb4kLnxjQ==
X-Google-Smtp-Source: ABdhPJy5KrPRna0R8iHtSgXeWzkKP4OQNNP81P3xPR7v7QpNSlzkjSxMTxcRz6DmtF2favBv+WDIow==
X-Received: by 2002:a62:58c6:0:b029:1ee:70e1:a094 with SMTP id
 m189-20020a6258c60000b02901ee70e1a094mr5636392pfb.38.1615705316160; 
 Sat, 13 Mar 2021 23:01:56 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:4d9:8412:486c:67d5])
 by smtp.gmail.com with ESMTPSA id l10sm3917549pfc.125.2021.03.13.23.01.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Mar 2021 23:01:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Do not raise keys before QEMU resigns active
Date: Sun, 14 Mar 2021 16:01:47 +0900
Message-Id: <20210314070147.34731-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
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

ui/cocoa used to raise all keys before it resigns active to prevent a
stuck key problem caused by key up events it does not see while it is
inactive. The problem is solved by checking -[NSEvent modifierFlags] in
commit 6d73bb643aa725348aabe6a885ac5fb0b7f70252, which is better
because it handles the case that key *down* events are missed while it
is inactive.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a7848ae0a30..ac8989947f5 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -326,7 +326,6 @@ - (BOOL) isAbsoluteEnabled;
 - (float) cdx;
 - (float) cdy;
 - (QEMUScreen) gscreen;
-- (void) raiseAllKeys;
 @end
 
 QemuCocoaView *cocoaView;
@@ -996,18 +995,6 @@ - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
 - (float) cdx {return cdx;}
 - (float) cdy {return cdy;}
 - (QEMUScreen) gscreen {return screen;}
-
-/*
- * Makes the target think all down keys are being released.
- * This prevents a stuck key problem, since we will not see
- * key up events for those keys after we have lost focus.
- */
-- (void) raiseAllKeys
-{
-    with_iothread_lock(^{
-        qkbd_state_lift_all_keys(kbd);
-    });
-}
 @end
 
 
@@ -1143,13 +1130,6 @@ - (BOOL)windowShouldClose:(id)sender
     return NO;
 }
 
-/* Called when QEMU goes into the background */
-- (void) applicationWillResignActive: (NSNotification *)aNotification
-{
-    COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
-    [cocoaView raiseAllKeys];
-}
-
 /* We abstract the method called by the Enter Fullscreen menu item
  * because Mac OS 10.7 and higher disables it. This is because of the
  * menu item's old selector's name toggleFullScreen:
-- 
2.24.3 (Apple Git-128)


