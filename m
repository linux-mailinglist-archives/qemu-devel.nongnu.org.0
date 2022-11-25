Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1829763891B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:53:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXGI-0005lZ-MW; Fri, 25 Nov 2022 06:52:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGH-0005jp-CG
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oyXGF-0003At-M1
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:52:53 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so3225414wmi.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JK4BwjUjq8SMTmsNOtUO5YdKWY0srVFYt//aP/k+QgA=;
 b=TcMiNe5qph7XT4bxapz8Lbi+HIkmiXXNZiOV5Yx1gmBgUcLSlJFd0YV12qmpFJzbLt
 o5sEXiKvy6cc7yQdLpOrcl4tPyxLs5sFlKxgJa5mNYV/Dj2w1JBgqIEw0JlclDk8tFAK
 p30/VOMBysf19DhjD/yfXvZJLrpyf/0nqXSwFGFvbyZT8bwOqsJt6pSTJDQjs0YLOVO1
 i1wpBs5lbr+uTm7k3WsSZkoiI0wYf370xjK+3eqTtO2mwsPbCTFokaFihbP8Sbj/x1HK
 +pgp1tRtyAeBGn3CtVTWec1fDSvn2ueLwYP2zWMh2sLlSlQCcWOtpC0BUGRXPMYj33EZ
 OnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JK4BwjUjq8SMTmsNOtUO5YdKWY0srVFYt//aP/k+QgA=;
 b=VVuQ8mG3K2lBfIFtt2vNp200OUL0UaWWs7OTpxh3FIoWdQ4+JDzVNMIvy3gzYqsZHq
 oPbKsgF/j12CUOO6CO/EFGivqy27jwNUnpL1WVNJNS5a6m88zDkE+bc5ta0e1sockNvE
 nnkkkk0CFXuJKBVAE/4/Xk1qJ95iUzxaD91Wdz62JYZoLOp+Rv0Dj3F9QSxoQ/GjbQwe
 drrygSl1GpykgOv2mat7WdjGpTURwN0P8OzsK2AxJ4Dk0CoU5sdWP2fZvUZsbb7BDXqj
 9phTqRUx4B1ZlvXZZCFsRiAlew8ITekkv6GUM+hJ/jiVYXrO2UUsQz6xtZOqfr1rjggY
 Ko1A==
X-Gm-Message-State: ANoB5pkLu4ws8+EyFF0lvP31IdATG4RqsdQGBlscuC513cZlPFlaOC4q
 Vo9jjPo1ML6hmIZKtBPzQNZkjGlbMTXVkw==
X-Google-Smtp-Source: AA0mqf7IMp7QZO81Avos7hnJfv4HZfGWxF04BivZroOWaNMisrojQSuOiouu6As1vdgw+HuaXhR6RA==
X-Received: by 2002:a1c:f401:0:b0:3cf:8731:8110 with SMTP id
 z1-20020a1cf401000000b003cf87318110mr13902642wma.32.1669377169243; 
 Fri, 25 Nov 2022 03:52:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b003c6f8d30e40sm9728258wmq.31.2022.11.25.03.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:52:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 7/7] hw/pci-host/pnv_phb3_msi: Convert TYPE_PHB3_MSI
 to 3-phase reset
Date: Fri, 25 Nov 2022 11:52:40 +0000
Message-Id: <20221125115240.3005559-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221125115240.3005559-1-peter.maydell@linaro.org>
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Convert the TYPE_PHB3_MSI class to 3-phase reset, so we can
avoid using the device_class_set_parent_reset() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/ppc/xics.h      |  2 +-
 hw/pci-host/pnv_phb3_msi.c | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/include/hw/ppc/xics.h b/include/hw/ppc/xics.h
index 00b80b08c27..95ead0dd7c9 100644
--- a/include/hw/ppc/xics.h
+++ b/include/hw/ppc/xics.h
@@ -95,7 +95,7 @@ struct ICSStateClass {
     DeviceClass parent_class;
 
     DeviceRealize parent_realize;
-    DeviceReset parent_reset;
+    ResettablePhases parent_phases;
 
     void (*reject)(ICSState *s, uint32_t irq);
     void (*resend)(ICSState *s);
diff --git a/hw/pci-host/pnv_phb3_msi.c b/hw/pci-host/pnv_phb3_msi.c
index ae908fd9e41..41e63b066f9 100644
--- a/hw/pci-host/pnv_phb3_msi.c
+++ b/hw/pci-host/pnv_phb3_msi.c
@@ -228,12 +228,14 @@ static void phb3_msi_resend(ICSState *ics)
     }
 }
 
-static void phb3_msi_reset(DeviceState *dev)
+static void phb3_msi_reset_hold(Object *obj)
 {
-    Phb3MsiState *msi = PHB3_MSI(dev);
-    ICSStateClass *icsc = ICS_GET_CLASS(dev);
+    Phb3MsiState *msi = PHB3_MSI(obj);
+    ICSStateClass *icsc = ICS_GET_CLASS(obj);
 
-    icsc->parent_reset(dev);
+    if (icsc->parent_phases.hold) {
+        icsc->parent_phases.hold(obj);
+    }
 
     memset(msi->rba, 0, sizeof(msi->rba));
     msi->rba_sum = 0;
@@ -287,11 +289,12 @@ static void phb3_msi_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     ICSStateClass *isc = ICS_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     device_class_set_parent_realize(dc, phb3_msi_realize,
                                     &isc->parent_realize);
-    device_class_set_parent_reset(dc, phb3_msi_reset,
-                                  &isc->parent_reset);
+    resettable_class_set_parent_phases(rc, NULL, phb3_msi_reset_hold, NULL,
+                                       &isc->parent_phases);
 
     isc->reject = phb3_msi_reject;
     isc->resend = phb3_msi_resend;
-- 
2.25.1


