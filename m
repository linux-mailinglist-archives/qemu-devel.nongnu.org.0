Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C61B63D530
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 13:05:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0LoW-0007BS-6Y; Wed, 30 Nov 2022 07:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1p0LoS-00079T-LF; Wed, 30 Nov 2022 07:03:41 -0500
Received: from mail.v3.sk ([167.172.186.51] helo=shell.v3.sk)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lkundrak@v3.sk>)
 id 1p0LoP-0005RL-46; Wed, 30 Nov 2022 07:03:38 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id F3999DD144;
 Wed, 30 Nov 2022 11:51:03 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Thdc7ZOhp-wc; Wed, 30 Nov 2022 11:51:03 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 277E8DD130;
 Wed, 30 Nov 2022 11:51:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qdfmXqGDQfNj; Wed, 30 Nov 2022 11:51:03 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id F09AFDD0FC;
 Wed, 30 Nov 2022 11:51:02 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: John Snow <jsnow@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Lubomir Rintel <lkundrak@v3.sk>
Subject: [RESEND PATCH] ide: Add "ide-cf" driver, a CompactFlash card
Date: Wed, 30 Nov 2022 13:03:19 +0100
Message-Id: <20221130120319.706885-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=167.172.186.51; envelope-from=lkundrak@v3.sk;
 helo=shell.v3.sk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

This allows attaching IDE_CFATA device to an IDE bus. Behaves like a
CompactFlash card in True IDE mode.

Tested with:

  qemu-system-i386 \
    -device driver=3Dide-cf,drive=3Dcf,bus=3Dide.0 \
    -drive id=3Dcf,index=3D0,format=3Draw,if=3Dnone,file=3Dcf.img

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 hw/ide/qdev.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 618045b85a..6f6c7462f3 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -283,6 +283,11 @@ static void ide_cd_realize(IDEDevice *dev, Error **e=
rrp)
     ide_dev_initfn(dev, IDE_CD, errp);
 }
=20
+static void ide_cf_realize(IDEDevice *dev, Error **errp)
+{
+    ide_dev_initfn(dev, IDE_CFATA, errp);
+}
+
 #define DEFINE_IDE_DEV_PROPERTIES()                     \
     DEFINE_BLOCK_PROPERTIES(IDEDrive, dev.conf),        \
     DEFINE_BLOCK_ERROR_PROPERTIES(IDEDrive, dev.conf),  \
@@ -341,6 +346,32 @@ static const TypeInfo ide_cd_info =3D {
     .class_init    =3D ide_cd_class_init,
 };
=20
+static Property ide_cf_properties[] =3D {
+    DEFINE_IDE_DEV_PROPERTIES(),
+    DEFINE_BLOCK_CHS_PROPERTIES(IDEDrive, dev.conf),
+    DEFINE_PROP_BIOS_CHS_TRANS("bios-chs-trans",
+                IDEDrive, dev.chs_trans, BIOS_ATA_TRANSLATION_AUTO),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void ide_cf_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    IDEDeviceClass *k =3D IDE_DEVICE_CLASS(klass);
+
+    k->realize  =3D ide_cf_realize;
+    dc->fw_name =3D "drive";
+    dc->desc    =3D "virtual CompactFlash card";
+    device_class_set_props(dc, ide_cf_properties);
+}
+
+static const TypeInfo ide_cf_info =3D {
+    .name          =3D "ide-cf",
+    .parent        =3D TYPE_IDE_DEVICE,
+    .instance_size =3D sizeof(IDEDrive),
+    .class_init    =3D ide_cf_class_init,
+};
+
 static void ide_device_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *k =3D DEVICE_CLASS(klass);
@@ -365,6 +396,7 @@ static void ide_register_types(void)
     type_register_static(&ide_bus_info);
     type_register_static(&ide_hd_info);
     type_register_static(&ide_cd_info);
+    type_register_static(&ide_cf_info);
     type_register_static(&ide_device_type_info);
 }
=20
--=20
2.37.3


