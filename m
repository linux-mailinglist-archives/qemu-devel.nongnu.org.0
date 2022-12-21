Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0E06535E1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q3-0000da-Hm; Wed, 21 Dec 2022 13:02:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pu-0000SS-Sc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Pr-0004HU-GD
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAE5XBbZPxRtMxJ3gEaAlG9mV4wCpEybbi9pnLU1/nQ=;
 b=G8XmjRAWT4u5lpC6HgHfITEmYD2CrTKqEI+QGTCqUoe3TLLbSHUrPLBz+ezBmnv4nsSoHH
 XOUSInNKwU36NZxzalFpeklh4WqipoX64AJzb3iKo0IiSlg+OIh3nxQEziYafxJlm+Fi62
 QtwXZr2Ld55pnNu69sniMJTyigimEww=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-Fx08TasWO6m7tZ56GS1pAg-1; Wed, 21 Dec 2022 13:02:03 -0500
X-MC-Unique: Fx08TasWO6m7tZ56GS1pAg-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso11080859ejb.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AAE5XBbZPxRtMxJ3gEaAlG9mV4wCpEybbi9pnLU1/nQ=;
 b=a09N/PRIywKILBORss32nW12HhAD6vEZokh+fcQW4cTuBEx4AQgCLLhL74YjLlP08d
 5pE/Qf67PHT0wo5o3nl9Pau8ggWigrvIxOJgipGP0XwMeCONWrJnXQhWPLyn3dz8t+Vb
 WPuHsizyDmWCAIgZhXyEfmXQIw9tzzsS28S6VkSvNnEwsjcZztpq76jx4TBK5ZekTttC
 0FrvgILb8VVc9AM/NbYZ/iqJYiTzqhzIXm+8myxQEm2aUC/Y6nN7kCswbDCv8eQIYp+s
 a1ZWDSeF5AbXGNPFVQzJVVepezE44UQAs6rcFTCrzDqxyCGnKAobApgK/jr2eE0DVF5Q
 Dyww==
X-Gm-Message-State: AFqh2kribvubu8h2VWvljvIl4GrRkEggwNlhno1fCZZIjwsUVDtfK7FN
 lPgspnjJ1AvrwbgELFL7JqXviyn9IFWJT/A7Dwt4nbM6oLSuNKsrRCNrFbFYeUlN8swW1YUdtU1
 PeWXhOX79MxKXG1Ac4PbDai7dRoJ5mCgV2b+h0oYs40nqPGnmXnVkxnJLTGEAUNs2bPk=
X-Received: by 2002:a17:906:6dd4:b0:836:e6f7:8138 with SMTP id
 j20-20020a1709066dd400b00836e6f78138mr2317854ejt.13.1671645721618; 
 Wed, 21 Dec 2022 10:02:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtz9NiO98rFIisjcQLy+a33NiFMA8me5RWH/4x2IGqySdM+etozbEHizPLQcs7ff/0Y1FSxeg==
X-Received: by 2002:a17:906:6dd4:b0:836:e6f7:8138 with SMTP id
 j20-20020a1709066dd400b00836e6f78138mr2317833ejt.13.1671645721348; 
 Wed, 21 Dec 2022 10:02:01 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 sy26-20020a1709076f1a00b007c0b530f3cfsm7370946ejc.72.2022.12.21.10.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PULL 06/24] ide: Add "ide-cf" driver, a CompactFlash card
Date: Wed, 21 Dec 2022 19:01:23 +0100
Message-Id: <20221221180141.839616-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Lubomir Rintel <lkundrak@v3.sk>

This allows attaching IDE_CFATA device to an IDE bus. Behaves like a
CompactFlash card in True IDE mode.

Tested with:

  qemu-system-i386 \
    -device driver=ide-cf,drive=cf,bus=ide.0 \
    -drive id=cf,index=0,format=raw,if=none,file=cf.img

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Message-Id: <20221130120319.706885-1-lkundrak@v3.sk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/ide/qdev.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 618045b85ace..6f6c7462f3b6 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -283,6 +283,11 @@ static void ide_cd_realize(IDEDevice *dev, Error **errp)
     ide_dev_initfn(dev, IDE_CD, errp);
 }
 
+static void ide_cf_realize(IDEDevice *dev, Error **errp)
+{
+    ide_dev_initfn(dev, IDE_CFATA, errp);
+}
+
 #define DEFINE_IDE_DEV_PROPERTIES()                     \
     DEFINE_BLOCK_PROPERTIES(IDEDrive, dev.conf),        \
     DEFINE_BLOCK_ERROR_PROPERTIES(IDEDrive, dev.conf),  \
@@ -341,6 +346,32 @@ static const TypeInfo ide_cd_info = {
     .class_init    = ide_cd_class_init,
 };
 
+static Property ide_cf_properties[] = {
+    DEFINE_IDE_DEV_PROPERTIES(),
+    DEFINE_BLOCK_CHS_PROPERTIES(IDEDrive, dev.conf),
+    DEFINE_PROP_BIOS_CHS_TRANS("bios-chs-trans",
+                IDEDrive, dev.chs_trans, BIOS_ATA_TRANSLATION_AUTO),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ide_cf_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    IDEDeviceClass *k = IDE_DEVICE_CLASS(klass);
+
+    k->realize  = ide_cf_realize;
+    dc->fw_name = "drive";
+    dc->desc    = "virtual CompactFlash card";
+    device_class_set_props(dc, ide_cf_properties);
+}
+
+static const TypeInfo ide_cf_info = {
+    .name          = "ide-cf",
+    .parent        = TYPE_IDE_DEVICE,
+    .instance_size = sizeof(IDEDrive),
+    .class_init    = ide_cf_class_init,
+};
+
 static void ide_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k = DEVICE_CLASS(klass);
@@ -365,6 +396,7 @@ static void ide_register_types(void)
     type_register_static(&ide_bus_info);
     type_register_static(&ide_hd_info);
     type_register_static(&ide_cd_info);
+    type_register_static(&ide_cf_info);
     type_register_static(&ide_device_type_info);
 }
 
-- 
2.38.1


