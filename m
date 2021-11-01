Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F0442166
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:07:11 +0100 (CET)
Received: from localhost ([::1]:54488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdaJ-0003M2-1X
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHc-0000f0-3r
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHY-0008Rr-2e
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0YpUHkH8QkEwzNTR61Yyssu2TGxSWXI2GUicTQR5x2E=;
 b=dW3S/xsW3Nhpx9gJyz2xjOv/aeZPIyPLnBdq3+AY2EhEZ/NVx82qu5laWDcJWxXGdp6Q1H
 DJYcDPN9c0naamF7s3/6o8hvYBvYDSNe4WA1P752NkkZs2NdJN6FS1CLlY+ZG+kdJTaPHI
 KW7xnyqwZn2w8ehdmDyoXRXXfxjigcY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-0pdbgbrtO16suM8e0oqAuw-1; Mon, 01 Nov 2021 14:43:42 -0400
X-MC-Unique: 0pdbgbrtO16suM8e0oqAuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso43108wml.9
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0YpUHkH8QkEwzNTR61Yyssu2TGxSWXI2GUicTQR5x2E=;
 b=QL8lodMtcPZ+j7/1O7RaUeJFnaZhX1fhvn/bhO0G/bu9a+zNg8zmOno1CKIEbcBK6J
 3ollROquHzgFispE4NNOELc7IBWlcnbVDzDWGgUYdpsnEGX4UWJBohmWbbHdh8u/k5mK
 /s468vej6mpPm3eKQBgVAOphZ+o8uWZMPW3f6pyUeTg/rZFKPQnS9st7yx6dLAhZkPyl
 MU64ixxvnr8OttC4VIURHXK3Hc0u7P8+VxcyNaXAH1yGrdXXGifknmtxIMXARCys6jdu
 jzV1xJeb8ZvKzNFqEIxwC3xirn4+X8nriI79CiVSuIkCnLIjXKmnRMbjvbwU3Nvku62E
 t5cQ==
X-Gm-Message-State: AOAM531rZJlbh60ELRdL0u4oNwtq0PATwrySggMYuU2ou+Z9O4eTQVR+
 XHN1UHRl5vDFvUur3SU7sa6TMN2Jn20Q1sD2aeioKhckFy8J+rWlX/LbPr4Bdc+7FEIE/u7rgeT
 cvRCymfXmX7NBkJStSFv10vavsWfydZlFpo2nrd3QxAsu+G2jJb3ilXtINOI699VM
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr39073539wrs.262.1635792221222; 
 Mon, 01 Nov 2021 11:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy96s9T2qC8MqXugO/zZLgnIT6dX4xTBLgmQxzVTNY8vxctATLUEnprd1PTV1LM4aY6TbGxnA==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr39073499wrs.262.1635792220987; 
 Mon, 01 Nov 2021 11:43:40 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j40sm286137wms.16.2021.11.01.11.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] machine: add device_type_is_dynamic_sysbus function
Date: Mon,  1 Nov 2021 19:42:57 +0100
Message-Id: <20211101184259.2859090-9-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

Right now the allowance check for adding a sysbus device using
-device cli option (or device_add qmp command) is done well after
the device has been created. It is done during the machine init done
notifier: machine_init_notify() in hw/core/machine.c

This new function will allow us to do the check at the right time and
issue an error if it fails.

Also make device_is_dynamic_sysbus() use the new function.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211029142258.484907-2-damien.hedde@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 15 +++++++++++++++
 hw/core/machine.c   | 13 ++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index e36fc7d8615..602993bd5ab 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -52,6 +52,21 @@ void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp);
  */
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 
+/**
+ * device_type_is_dynamic_sysbus: Check if type is an allowed sysbus device
+ * type for the machine class.
+ * @mc: Machine class
+ * @type: type to check (should be a subtype of TYPE_SYS_BUS_DEVICE)
+ *
+ * Returns: true if @type is a type in the machine's list of
+ * dynamically pluggable sysbus devices; otherwise false.
+ *
+ * Check if the QOM type @type is in the list of allowed sysbus device
+ * types (see machine_class_allowed_dynamic_sysbus_dev()).
+ * Note that if @type has a parent type in the list, it is allowed too.
+ */
+bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type);
+
 /**
  * device_is_dynamic_sysbus: test whether device is a dynamic sysbus device
  * @mc: Machine class
diff --git a/hw/core/machine.c b/hw/core/machine.c
index dc15f5f9e5c..7c4004ac5a0 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -548,18 +548,25 @@ void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 
 bool device_is_dynamic_sysbus(MachineClass *mc, DeviceState *dev)
 {
-    bool allowed = false;
-    strList *wl;
     Object *obj = OBJECT(dev);
 
     if (!object_dynamic_cast(obj, TYPE_SYS_BUS_DEVICE)) {
         return false;
     }
 
+    return device_type_is_dynamic_sysbus(mc, object_get_typename(obj));
+}
+
+bool device_type_is_dynamic_sysbus(MachineClass *mc, const char *type)
+{
+    bool allowed = false;
+    strList *wl;
+    ObjectClass *klass = object_class_by_name(type);
+
     for (wl = mc->allowed_dynamic_sysbus_devices;
          !allowed && wl;
          wl = wl->next) {
-        allowed |= !!object_dynamic_cast(obj, wl->value);
+        allowed |= !!object_class_dynamic_cast(klass, wl->value);
     }
 
     return allowed;
-- 
2.31.1


