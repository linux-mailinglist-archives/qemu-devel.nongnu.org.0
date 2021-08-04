Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10993E0364
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 16:34:25 +0200 (CEST)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBHyS-00072s-RL
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 10:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsO-0003YD-3y
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mBHsM-0003Xf-EN
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 10:28:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628087285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y5iury3rvhB+SWrtNuW5D7gCQ979PrFSPMcUa5g8Cq8=;
 b=RKzZW6f4TCZ9oit/NMHFZO6aLaIo2b9jIqo0ak6/ZPE4MxrtRHKrLEIXzlKq5O/4SQl73y
 uCnZ2SU/Iwwg5d6sV+yyB8kVNy+lI4nY8Umc6YgL0rtUgDktDa0/ORk1jUEqcNxfCz4SBl
 KMjGNir1BoJfI88/PAb13zu+2UZpobQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-RX3Asm3xOoyxONfJDskZgg-1; Wed, 04 Aug 2021 10:28:02 -0400
X-MC-Unique: RX3Asm3xOoyxONfJDskZgg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7480880292B;
 Wed,  4 Aug 2021 14:28:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C40AB5F724;
 Wed,  4 Aug 2021 14:27:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9435D180098C; Wed,  4 Aug 2021 16:27:37 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/7] floppy: build as modules.
Date: Wed,  4 Aug 2021 16:27:36 +0200
Message-Id: <20210804142737.3366441-7-kraxel@redhat.com>
In-Reply-To: <20210804142737.3366441-1-kraxel@redhat.com>
References: <20210804142737.3366441-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add module_obj() annotations, update meson build rules.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/block/fdc-isa.c    |  2 ++
 hw/block/fdc-sysbus.c |  4 ++++
 hw/block/fdc.c        |  2 ++
 hw/block/meson.build  | 17 ++++++++++++++---
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index a5a124fb9236..fb2139760f8c 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -259,6 +259,7 @@ static const TypeInfo isa_fdc_info = {
     .class_init    = isabus_fdc_class_init,
     .instance_init = isabus_fdc_instance_init,
 };
+module_obj(TYPE_ISA_FDC);
 
 static void isa_fdc_register_types(void)
 {
@@ -266,3 +267,4 @@ static void isa_fdc_register_types(void)
 }
 
 type_init(isa_fdc_register_types)
+module_dep("hw-block-fdc");
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index b358b6467ef5..8cc65cd92642 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -137,6 +137,7 @@ static const TypeInfo sysbus_fdc_common_typeinfo = {
     .class_init    = sysbus_fdc_common_class_init,
     .class_size    = sizeof(FDCtrlSysBusClass),
 };
+module_obj(TYPE_SYSBUS_FDC);
 
 static Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
@@ -164,6 +165,7 @@ static const TypeInfo sysbus_fdc_typeinfo = {
     .parent        = TYPE_SYSBUS_FDC,
     .class_init    = sysbus_fdc_class_init,
 };
+module_obj("sysbus-fdc");
 
 static Property sun4m_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
@@ -190,6 +192,7 @@ static const TypeInfo sun4m_fdc_typeinfo = {
     .parent        = TYPE_SYSBUS_FDC,
     .class_init    = sun4m_fdc_class_init,
 };
+module_obj("sun-fdtwo");
 
 static void sysbus_fdc_register_types(void)
 {
@@ -199,3 +202,4 @@ static void sysbus_fdc_register_types(void)
 }
 
 type_init(sysbus_fdc_register_types)
+module_dep("hw-block-fdc");
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index ba42537e8d26..95a1467f3faf 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -74,6 +74,7 @@ static const TypeInfo floppy_bus_info = {
     .parent = TYPE_BUS,
     .instance_size = sizeof(FloppyBus),
 };
+module_obj(TYPE_FLOPPY_BUS);
 
 static void floppy_bus_create(FDCtrl *fdc, FloppyBus *bus, DeviceState *dev)
 {
@@ -564,6 +565,7 @@ static const TypeInfo floppy_drive_info = {
     .instance_size = sizeof(FloppyDrive),
     .class_init = floppy_drive_class_init,
 };
+module_obj(TYPE_FLOPPY_DRIVE);
 
 /********************************************************/
 /* Intel 82078 floppy disk controller emulation          */
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 8460042fe320..b336773ac591 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -1,3 +1,5 @@
+hw_block_modules = {}
+
 softmmu_ss.add(files(
   'block.c',
   'cdrom.c',
@@ -5,9 +7,6 @@ softmmu_ss.add(files(
 ))
 softmmu_ss.add(when: 'CONFIG_ECC', if_true: files('ecc.c'))
 softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc-module.c'))
-softmmu_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
-softmmu_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
-softmmu_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
 softmmu_ss.add(when: 'CONFIG_NAND', if_true: files('nand.c'))
 softmmu_ss.add(when: 'CONFIG_ONENAND', if_true: files('onenand.c'))
 softmmu_ss.add(when: 'CONFIG_PFLASH_CFI01', if_true: files('pflash_cfi01.c'))
@@ -20,4 +19,16 @@ softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
 
+fdc_ss = ss.source_set()
+fdc_isa_ss = ss.source_set()
+fdc_sysbus_ss = ss.source_set()
+fdc_ss.add(when: 'CONFIG_FDC', if_true: files('fdc.c'))
+fdc_isa_ss.add(when: 'CONFIG_FDC_ISA', if_true: files('fdc-isa.c'))
+fdc_sysbus_ss.add(when: 'CONFIG_FDC_SYSBUS', if_true: files('fdc-sysbus.c'))
+hw_block_modules += {'fdc': fdc_ss,
+                     'fdc-isa' : fdc_isa_ss,
+                     'fdc-sysbus' : fdc_sysbus_ss }
+
 subdir('dataplane')
+
+modules += { 'hw-block': hw_block_modules }
-- 
2.31.1


