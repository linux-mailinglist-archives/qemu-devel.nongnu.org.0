Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B58470084A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:43:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxS4x-0007d4-4C; Fri, 12 May 2023 08:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4v-0007ci-9a
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pxS4t-0006QK-S4
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683895255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aIB+ovZerG0ccnmBXZPESU0t/A5sJiaaWAt1pFb5Qa8=;
 b=OkW3ZgPHP3RuoiQrFL8jLbMlHksR70BYFR/2hNyQeAt0zIb0uIKRDWb/0ZwahuIYx0L8+q
 IsmMTzvL/vTZ4XA+qRFigrecgIE7gpjC1P+aPuzDULQhGLsiTLbXbVgtpOiUEyXEakWVc4
 tI7OF72wwZOia+SNsQSbafQCEEK2kfE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-P35hFIQNOGif643PRjG2jQ-1; Fri, 12 May 2023 08:40:45 -0400
X-MC-Unique: P35hFIQNOGif643PRjG2jQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9A383C0ED5B;
 Fri, 12 May 2023 12:40:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.251])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A29C1121314;
 Fri, 12 May 2023 12:40:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 06/18] hw/s390x: Use MachineClass->default_nic in the s390x
 machine
Date: Fri, 12 May 2023 14:40:21 +0200
Message-Id: <20230512124033.502654-7-thuth@redhat.com>
In-Reply-To: <20230512124033.502654-1-thuth@redhat.com>
References: <20230512124033.502654-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark the default NIC via the new MachineClass->default_nic setting
so that the machine-defaults code in vl.c can decide whether the
default NIC is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e6f2c62625..fe30722e33 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -245,6 +245,7 @@ static void s390_create_sclpconsole(const char *type, Chardev *chardev)
 
 static void ccw_init(MachineState *machine)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
     int ret;
     VirtualCssBus *css_bus;
     DeviceState *dev;
@@ -292,7 +293,7 @@ static void ccw_init(MachineState *machine)
     }
 
     /* Create VirtIO network adapters */
-    s390_create_virtio_net(BUS(css_bus), "virtio-net-ccw");
+    s390_create_virtio_net(BUS(css_bus), mc->default_nic);
 
     /* init consoles */
     if (serial_hd(0)) {
@@ -746,6 +747,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = s390_machine_device_unplug_request;
     nc->nmi_monitor_handler = s390_nmi;
     mc->default_ram_id = "s390.ram";
+    mc->default_nic = "virtio-net-ccw";
 
     object_class_property_add_bool(oc, "aes-key-wrap",
                                    machine_get_aes_key_wrap,
-- 
2.31.1


