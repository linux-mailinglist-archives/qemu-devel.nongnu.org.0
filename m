Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EAE689C5E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxTg-0001lU-TZ; Fri, 03 Feb 2023 09:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTe-0001gS-8B
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxTc-0005qu-Ct
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:55:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id h16so4856423wrz.12
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+umTNh0pbiZOqriKf5LBKbWjyWBQDWdA/pzjCDYec3I=;
 b=lPgZ9n5K6CrRTxxEvSmCqY3ghiogDX+rg/hCCPZOkska+sJM5KTqot5rIAqQeeMbEQ
 9CYZPKlEaD1JEVEF+kffMJtFgVlO8oOgwhEfEfHmCk07Afv/GiyZrYS2/Zm3O1T7lm7B
 RB1tQMNLC8i1ObzebgXpBUa85iEhQvn5OKyH1oSAkAmo2R1nQfojrEj4k8KgL9HUbApg
 o0DMjNiDWI5mbBsEn6fLg6qwfmi8U8Gdgc9YaCwJnzO1v30khNF6OZZgmRXFcRoLp7Gh
 YPLJ2hHcAiiwQT6kw2GT+eag7pUW8LUb9B1kMXe2x+1eBVRweY4Jn51ExYzsFyvWpEKH
 1OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+umTNh0pbiZOqriKf5LBKbWjyWBQDWdA/pzjCDYec3I=;
 b=XqPh7eDHbbQ3nF8oDcV2pzgF6xUU5knIarf5RVo6EDmY9CiwH7at+rpGAzB8GhPnqy
 qcENPfUL8opoVtGJoDB/6cBablw61vo2fkn+6MPJ5+kskS+7gEPGvUst1mnssoUqMenv
 qcCDIuakVLpd1nssZcws5G10Y4Ccm1gesTEpgDrBniQWt+l9c7FbADg5ErKQBNb5E7XG
 CNzCu2AIuCjsDk8vnQGBX9lB7/3Ak7dWdVYUWD8K0ZoW4E6bMNhfQRPkuMbxSqpK2u4D
 hclANCRbWhUod7fIIi4gIdWyEvX2jOyI+tnk9CzNS3WGDC1MOv5RZWI0HBBrVvMvJxXe
 jfbA==
X-Gm-Message-State: AO0yUKUr5+57YTVx73B3rLAI9DlqVFkuvfVqEcYQW8+bUL1K2dD8mtkZ
 qBNghMMqw0JxwyRngWfY4DFMqj6Mx0E4e5kn
X-Google-Smtp-Source: AK7set/o5jDjbwYDFHfq3iuwRB+/VIgrYxfU6k0h0zYsbwGWfFzkZLPTtGE020K19LPOqntG4GD8wQ==
X-Received: by 2002:adf:a102:0:b0:2bf:942b:ddc with SMTP id
 o2-20020adfa102000000b002bf942b0ddcmr8142730wro.55.1675436143513; 
 Fri, 03 Feb 2023 06:55:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d690a000000b002bbedd60a9asm2175645wru.77.2023.02.03.06.55.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:55:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 01/15] hw/pci/pcie_sriov: Replace fprintf(error_pretty) ->
 warn_reportf_err()
Date: Fri,  3 Feb 2023 15:55:22 +0100
Message-Id: <20230203145536.17585-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pcie_sriov.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index f0bd72e069..93b0624599 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -196,19 +196,17 @@ static void register_vfs(PCIDevice *dev)
 
 static void unregister_vfs(PCIDevice *dev)
 {
-    Error *local_err = NULL;
     uint16_t num_vfs = dev->exp.sriov_pf.num_vfs;
     uint16_t i;
 
     trace_sriov_unregister_vfs(dev->name, PCI_SLOT(dev->devfn),
                                PCI_FUNC(dev->devfn), num_vfs);
     for (i = 0; i < num_vfs; i++) {
+        Error *errp = NULL;
         PCIDevice *vf = dev->exp.sriov_pf.vf[i];
-        object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
-        if (local_err) {
-            fprintf(stderr, "Failed to unplug: %s\n",
-                    error_get_pretty(local_err));
-            error_free(local_err);
+        object_property_set_bool(OBJECT(vf), "realized", false, &errp);
+        if (errp) {
+            warn_reportf_err(errp, "Failed to unplug: ");
         }
         object_unparent(OBJECT(vf));
     }
-- 
2.38.1


