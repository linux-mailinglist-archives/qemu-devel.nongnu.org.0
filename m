Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40F0669D05
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:58:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIz-0003TM-1P; Fri, 13 Jan 2023 10:49:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIa-0003D7-CN
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:58 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIY-0006dP-JR
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:56 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k8so6963819wrc.9
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wdqhVDWv9Gp7qzXSERirZmjSbsn2UR1g28gq9g6+5/Y=;
 b=FxSXDJ1sJnjouMlE2ebkLJxe5O8HrrxskwRR4CDpWiPwMY0rAHADcUMnyh4T5bDmiz
 gKuDYGjfAT5ewwP1196P0j6BSVzc8Z5KCO1AUyjYvflR5RqIC19lzYMfCFNaeERuiay9
 t3j/Le6JXIpu0mAYwGcIGpFI6AznDirJO4optHBmx6NfuFbdplOsAYpSzaKyKpInEA5m
 3oAdH6uLD8A2FdTTe4nTCkhl0sth5tIcKjFUA0cfSgVxUmk+w1B0QHr8nL0Kw5uDuEVf
 Jbg9MAFiMzhnwZDLd7SWeHSvDOyNnaqbUF3OWl480fWBF37g2oFEvXka72PWyE4tSjWu
 NMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wdqhVDWv9Gp7qzXSERirZmjSbsn2UR1g28gq9g6+5/Y=;
 b=FY+kex7FgbTRo3gXsVREQNG0Dv3MZ/mBnYbdb305Zb7IekpFujDsn6NQ4ZGvVoJ82o
 8YJU+SDInmol8dWJWXvFPiMPCpFydQ/atrz03NlEzltjt/cmHPw0ypXZ2v/OdF/plUsl
 DHatMMyL0vbXbmwpwa+CVu7CIt6KyHYwGCSZtCCgSYUQOsMI4yQIVIDbq/yB2N6LEtoi
 rU6NkSOjs2BuT0QS+fn5qAQRByF3u+aIKBoEiVbJZPbxomr5vQEjYFRjcc4/dsXYz3va
 xrzZTGjU2Yxr77PJN0pEnckyIAIukUFSkifjLIQVKbgvQX81XNgUMBvOe+jTDdmS6XAF
 gEcQ==
X-Gm-Message-State: AFqh2krxHMP+Bu5M6KJkDiqFAd+kTdZcMXLwcYUU/cBv88wYh/CKYN5D
 oRBLBhDMOKLNTYya0zCNrO3i6bNFc9TyZtFa
X-Google-Smtp-Source: AMrXdXvFAmIw6I3lSB0fc4zlYk9S4lcegZNxy5M1cZNke2VJ7YLH3lBdT/s6ntKSDLFVr8JLKEa0lw==
X-Received: by 2002:a5d:56c1:0:b0:288:d139:3690 with SMTP id
 m1-20020a5d56c1000000b00288d1393690mr37314619wrw.67.1673624933061; 
 Fri, 13 Jan 2023 07:48:53 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l1-20020adfe9c1000000b00289bdda07b7sm18724022wrn.92.2023.01.13.07.48.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 41/46] hw/pci-host/bonito: Use 'bonito_host' for PCI host
 bridge code
Date: Fri, 13 Jan 2023 16:45:27 +0100
Message-Id: <20230113154532.49979-42-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

To make it easier to differentiate between the Host Bridge
object and its PCI function #0, rename bonito_pcihost* as
bonito_host*.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230105130710.49264-3-philmd@linaro.org>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 450eb29ec0..5c0928ffe6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -627,7 +627,7 @@ static const VMStateDescription vmstate_bonito = {
     }
 };
 
-static void bonito_pcihost_realize(DeviceState *dev, Error **errp)
+static void bonito_host_realize(DeviceState *dev, Error **errp)
 {
     PCIHostState *phb = PCI_HOST_BRIDGE(dev);
     BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
@@ -795,23 +795,23 @@ static const TypeInfo bonito_info = {
     },
 };
 
-static void bonito_pcihost_class_init(ObjectClass *klass, void *data)
+static void bonito_host_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
 
-    dc->realize = bonito_pcihost_realize;
+    dc->realize = bonito_host_realize;
 }
 
-static const TypeInfo bonito_pcihost_info = {
+static const TypeInfo bonito_host_info = {
     .name          = TYPE_BONITO_PCI_HOST_BRIDGE,
     .parent        = TYPE_PCI_HOST_BRIDGE,
     .instance_size = sizeof(BonitoState),
-    .class_init    = bonito_pcihost_class_init,
+    .class_init    = bonito_host_class_init,
 };
 
 static void bonito_register_types(void)
 {
-    type_register_static(&bonito_pcihost_info);
+    type_register_static(&bonito_host_info);
     type_register_static(&bonito_info);
 }
 
-- 
2.38.1


