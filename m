Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E324F0497
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 17:48:08 +0200 (CEST)
Received: from localhost ([::1]:55868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nafyw-0003B2-Q2
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 11:48:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nafyD-0002Wb-0I
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 11:47:21 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:50977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nafyB-0007FZ-8L
 for qemu-devel@nongnu.org; Sat, 02 Apr 2022 11:47:20 -0400
Received: from quad ([82.142.17.26]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M5wTt-1ndhBC1Mqp-007RUr; Sat, 02
 Apr 2022 17:47:13 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] nubus: fix memory leak in nubus_bridge_init()
Date: Sat,  2 Apr 2022 17:47:11 +0200
Message-Id: <20220402154711.679252-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w8I4FzDHmNSjxAPdScMQMR/oXQI/aEstA61wLAqu2xbC5kwC2cF
 WJSMhGr73lfHiyjpRsaChun6kty2tGvayIrd17Lk9fuLCm73o5Ws3tPSeHUlSpmQV9Nq7f4
 m1a95BcvKvKmhq999ZNk13niahiLeVbjTrmdzYt+fS77B/K4idHyF8hhK8SePWCZ5IpYHu1
 oZRnYWAdSiFECa3hLEsjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J8yR98ZBZdg=:/j9d5R8qtAAbivCRXCUjb2
 TYdjJ1nGe+TOxw/tMypuOVaQlpPddsaKTj4kJVFtLWEw7aF71ooErJ85CLhxE83ive254ToSs
 rlhe4CdpfVfHltKlPcc/sa5PRlp0WehUqXWtucYdYw1pL4bwH+nOPqEwtlIWi7bMW0PVWVRLd
 K8ajRp9eScI7fJIRGdpto+en+ehrDk4Bq24LjAqFf4zEyieQUoKyv6eiMhb0CXsBds1e/fZ4K
 tScN+WSQKJewqGn1VzvRxv97GfTbatP9OQIXZSvQPILZeN+G0u9cZ3t1AhpGwGZwRetXFgGM0
 KypdEVXBQhRYQruSOqF+qKW4Jb9z9hapEB1dhWms14ueQC1PCA25M6KE/o37orEjdzTel+Oo1
 YyP+RngILZwGHGhDEbCdhChEzjyMZvYPLYCg8gMIVN3bE8hBgZzh/KOnwOvqWrAQKDkG5wGWE
 Zbai9fpu6v6cuXbIPaqt8N+E7IqawrBfVx/xhvM4GgRd+w2GslYrY9Pq40u8eHusbBTqAJl3P
 D8uHM0y3eUAwu9J82SIVDKWQDp7ls2Xz10CWPRIswrMl1uQMqlht9+a/kYytRhR2+r4BXPNdt
 cK7QQJAlnPpjs49Fyg+fIIZhQLMIotU/MMTndlR8g3UveFmwpq0KdFs+pemuKjOs3Eb2ixShs
 kFzRB1xhYaoArN0BrxNMOpfd59wRRj/lkb5euR7TJGYkzV5cY14GXu8d8UzvbiJWVdno=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move qbus_init() to a realize function.

Leak detected by valgrind:

  QTEST_QEMU_BINARY="valgrind --leak-check=full \
  --show-leak-kinds=definite ./qemu-system-m68k" \
  tests/qtest/device-introspect-test \
  -p /m68k/device/introspect/concrete/defaults/none
  ...
  ==606164== 6 bytes in 1 blocks are definitely lost in loss record 123 of 1,771
  ==606164==    at 0x484486F: malloc (vg_replace_malloc.c:381)
  ==606164==    by 0x4FF0428: g_malloc (gmem.c:106)
  ==606164==    by 0x5004433: g_strdup (gstrfuncs.c:364)
  ==606164==    by 0x3D1BA6: memory_region_do_init (memory.c:1170)
  ==606164==    by 0x3D1BA6: memory_region_init (memory.c:1195)
  ==606164==    by 0x375C88: nubus_init (nubus-bus.c:104)
  ==606164==    by 0x49DE82: object_init_with_type (object.c:377)
  ==606164==    by 0x49DE82: object_initialize_with_type (object.c:519)
  ==606164==    by 0x495772: qbus_init (bus.c:158)
  ==606164==    by 0x375DDB: nubus_bridge_init (nubus-bridge.c:21)
  ==606164==    by 0x49DE82: object_init_with_type (object.c:377)
  ==606164==    by 0x49DE82: object_initialize_with_type (object.c:519)
  ==606164==    by 0x49E028: object_new_with_type (object.c:734)
  ==606164==    by 0x5660AC: qmp_device_list_properties (qom-qmp-cmds.c:146)
  ==606164==    by 0x67CC35: qmp_marshal_device_list_properties (qapi-commands-qdev.c:66)
  ...

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bridge.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
index a42c86080f25..51c3f6328784 100644
--- a/hw/nubus/nubus-bridge.c
+++ b/hw/nubus/nubus-bridge.c
@@ -18,11 +18,17 @@ static void nubus_bridge_init(Object *obj)
     NubusBridge *s = NUBUS_BRIDGE(obj);
     NubusBus *bus = &s->bus;
 
-    qbus_init(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
-
     qdev_init_gpio_out(DEVICE(s), bus->irqs, NUBUS_IRQS);
 }
 
+static void nubus_bridge_realize(DeviceState *d, Error **errp)
+{
+    NubusBridge *s = NUBUS_BRIDGE(d);
+    NubusBus *bus = &s->bus;
+
+    qbus_init(bus, sizeof(NubusBus), TYPE_NUBUS_BUS, d, NULL);
+}
+
 static Property nubus_bridge_properties[] = {
     DEFINE_PROP_UINT16("slot-available-mask", NubusBridge,
                        bus.slot_available_mask, 0xffff),
@@ -34,6 +40,7 @@ static void nubus_bridge_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
 
     dc->fw_name = "nubus";
+    dc->realize = nubus_bridge_realize;
     device_class_set_props(dc, nubus_bridge_properties);
 }
 
-- 
2.35.1


