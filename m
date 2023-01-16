Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AE66C3E5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:31:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQn-0001KQ-Tc; Mon, 16 Jan 2023 10:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQm-0001KD-NU; Mon, 16 Jan 2023 10:29:52 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQl-00088B-2x; Mon, 16 Jan 2023 10:29:52 -0500
Received: by mail-ej1-x636.google.com with SMTP id qx13so10547778ejb.13;
 Mon, 16 Jan 2023 07:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5s77MYq/Ag1sBiM8HXH3NbAmPKNbAbFrUF5peJzEPa8=;
 b=er288XyiAzUAQ0VxASV8hP+wlOO5jgpGMa7NNHNmSLv7fxrf2eBbNUil2CsH+pjrvm
 6R7ZVxsR05kxCpmUfLHNQnkgmr63Dmy6m7DT20U3PEwgM/HhOwevyaIVJag7/7UsXbxr
 EFXdGEBQx/w3xpA4F2h4bNsWKOjA/xt+4FaJsPaGPkcLJt37ZOz1YeeJsH8HJYOLCGOH
 gbSUKDtgrNHJK/CPJYcUd5u7erdPXBstmVP30zju98bJ4Be8EIGT36mS01772HoC1x4T
 hbVkmT28d0ZP9MI8AV6WtYqH28+U0PbNeOHHbmxMxqEB1e7+PuVNzC9NTEknJw7mnsrC
 IcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5s77MYq/Ag1sBiM8HXH3NbAmPKNbAbFrUF5peJzEPa8=;
 b=mcufHT1DQQaZZiONFG79uCd5HIk31yjwwTKPsecHdY6QEQ2FMiSAFlBDDjd7nB5Bj9
 NubqOCYbzu2daSbQBb8pHviDOk+Lb5gCqMjw7q1NuRGPtk8Don785NX7JZEcTSHTje7l
 CI9s4X6WrjePnLLr9X60ie+5ApXUdWJnw+gUOxpoXKoUrhnK9eYfw7jmKRYehWOUAob2
 mL2j8AanJsvKwjUhES/rnZiB1IN/fuF32Z5lvknF0ia2ZTXKN470oAD3M5ijsVcoiJvk
 +s4JEeDNvzmbJSbVJYIFJm0cmvohkxKn8v9HF5pxspbYADCuwdDylgoIDCfHAOsGSl1H
 ExTA==
X-Gm-Message-State: AFqh2ko2Z+BR9ITHuhsqILfUynkp6+MT/llebwbUrI5mIltGMiV3fwh2
 S4M1FVWhXHMKWviOsJ0pZJjKLMjTZ8Q=
X-Google-Smtp-Source: AMrXdXsTow+wpFAT5RV87k/7a1FbmA9vvAWKNuJ0qJhMLsC8SSJgotggLzcGPkj7/vVAMNvK9+AGnw==
X-Received: by 2002:a17:907:c786:b0:7ad:a797:5bb9 with SMTP id
 tz6-20020a170907c78600b007ada7975bb9mr105736287ejc.29.1673882989141; 
 Mon, 16 Jan 2023 07:29:49 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 7/7] piix3, ich9: Reuse qbus_build_aml()
Date: Mon, 16 Jan 2023 16:29:08 +0100
Message-Id: <20230116152908.147275-8-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116152908.147275-1-shentey@gmail.com>
References: <20230116152908.147275-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/smbus_ich9.c | 5 +----
 hw/isa/lpc_ich9.c   | 5 +----
 hw/isa/piix3.c      | 5 +----
 3 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index ee50ba1f2c..52ba77f3fc 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -97,13 +97,10 @@ static void ich9_smbus_realize(PCIDevice *d, Error **errp)
 
 static void build_ich9_smb_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
-    BusChild *kid;
     ICH9SMBState *s = ICH9_SMB_DEVICE(adev);
     BusState *bus = BUS(s->smb.smbus);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_smb_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 0ab0a341be..d5d4b0f177 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -813,7 +813,6 @@ static void ich9_send_gpe(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
 static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     ICH9LPCState *s = ICH9_LPC_DEVICE(adev);
     BusState *bus = BUS(s->isa_bus);
     Aml *sb_scope = aml_scope("\\_SB");
@@ -835,9 +834,7 @@ static void build_ich9_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-            call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void ich9_lpc_class_init(ObjectClass *klass, void *data)
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 283b971ec4..a9cb39bf21 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -306,7 +306,6 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
 static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
 {
     Aml *field;
-    BusChild *kid;
     Aml *sb_scope = aml_scope("\\_SB");
     BusState *bus = qdev_get_child_bus(DEVICE(adev), "isa.0");
 
@@ -322,9 +321,7 @@ static void build_pci_isa_aml(AcpiDevAmlIf *adev, Aml *scope)
     aml_append(sb_scope, field);
     aml_append(scope, sb_scope);
 
-    QTAILQ_FOREACH(kid, &bus->children, sibling) {
-        call_dev_aml_func(DEVICE(kid->child), scope);
-    }
+    qbus_build_aml(bus, scope);
 }
 
 static void pci_piix3_class_init(ObjectClass *klass, void *data)
-- 
2.39.0


