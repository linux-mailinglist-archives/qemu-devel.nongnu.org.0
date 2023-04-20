Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 790866E89C5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:51:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNAr-0001XW-8u; Thu, 20 Apr 2023 01:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAa-0001Fd-BP
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNAY-0001Rg-Ml
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:49:24 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-24781e23c27so508615a91.0
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969761; x=1684561761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkFnOWz8k65GM78Vyn6pXiVzR9tMO/XJPCs+OY+XiaI=;
 b=Mp4j0c2kuhf2ZlEuma9sk80kSAWTE2MkAvRTv4AE1d8FB6Biz747jB65m5LRnwvh7w
 ae5J9H/d8E81Hr1Mhv2odznz+An+92keMUXNBAb9ZlrG8A9WRkJCHUkvP8G6yRm7Q0/Q
 H2x64uBguon/t7nPufkRWxMlmNDm0vOcDSC3IV0egd3Smq70kS2lAi5xra0GrwGhcr8K
 taqcUWw7nZM92sBnjiIPUNxUXTajX5Sxe+WzNKsyanE9HHe/sUl+HGmOm5IzEnE4J6jw
 mej1f2atOneeXf3HfK4iMYigr6pwq6fMnxr02Vv+K5UHwJgP62p++sEJhbteY9e92nUZ
 xk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969761; x=1684561761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkFnOWz8k65GM78Vyn6pXiVzR9tMO/XJPCs+OY+XiaI=;
 b=dVAHEZd8ufcePNANtL1aX2nnyl70XtxVPeElQxA5ywCD9OMregTr0cnXooLFmVrFMd
 4GvQfSjRghIkC3RBjvgNhKRLplE3HPGcXyceeqMxpczUAUatL6HUipasvr4JP/WfhPDS
 pLKBk/P1dGDj3wsuSdXuc3S2KykJz/X+IvmGOoqDgoXJViP8c6iQSD8/3Xne7F6UHguD
 GJVCh4hQQx45sSCrnumZvbgTWdaqmDHVOgGrjmrOdZiQtqCVZV6mwn+2KyhwJfi/V3pp
 040iqEYraC9OE4+F2DXFhJonKzBni4/4Y6gU2fEPWHgTqDbfdqB8DEQRtE1mOoXhKWs0
 +zvg==
X-Gm-Message-State: AAQBX9c8je5ajjDdmKBMCMvzZahfLaPRedAUz+/sAlbCRDw0VWeOs84e
 /phVxUSB8HkE6VUD1ZwbZX2gWChnFpj+hpFe8hk=
X-Google-Smtp-Source: AKy350aLOK852XIVGlNoSX8qW95WsJwyDxZC+kjNJ5xhGOlKX7eSZ/KiOVkDA+Ss95z7Gu4nWPwF2g==
X-Received: by 2002:a17:90a:3181:b0:247:8b61:a41 with SMTP id
 j1-20020a17090a318100b002478b610a41mr475328pjb.25.1681969761579; 
 Wed, 19 Apr 2023 22:49:21 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:21 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 30/41] igb: Implement MSI-X single vector mode
Date: Thu, 20 Apr 2023 14:46:46 +0900
Message-Id: <20230420054657.50367-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index c24c522244..2c287688c7 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1870,7 +1870,7 @@ igb_update_interrupt_state(IGBCore *core)
 
     icr = core->mac[ICR] & core->mac[IMS];
 
-    if (msix_enabled(core->owner)) {
+    if (core->mac[GPIE] & E1000_GPIE_MSIX_MODE) {
         if (icr) {
             causes = 0;
             if (icr & E1000_ICR_DRSTA) {
@@ -1905,7 +1905,12 @@ igb_update_interrupt_state(IGBCore *core)
         trace_e1000e_irq_pending_interrupts(core->mac[ICR] & core->mac[IMS],
                                             core->mac[ICR], core->mac[IMS]);
 
-        if (msi_enabled(core->owner)) {
+        if (msix_enabled(core->owner)) {
+            if (icr) {
+                trace_e1000e_irq_msix_notify_vec(0);
+                msix_notify(core->owner, 0);
+            }
+        } else if (msi_enabled(core->owner)) {
             if (icr) {
                 msi_notify(core->owner, 0);
             }
-- 
2.40.0


