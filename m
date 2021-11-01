Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB89442107
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:45:03 +0100 (CET)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdEs-0005Fy-Mc
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:45:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHf-0000nj-SC
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHe-0008Sq-6f
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wrRJbxTfXKoNE9RhSD+9rCBC0L1fCrHGd+SeOdkp/14=;
 b=Wl6vIytR1dLYwH7oMrX8MdoM05i1HhKrwF8uh7mIjgF1X7UJ/LJnoxFHzRkGpaOU1fEP0I
 Pkbm/zLJhDqvTUzqHd2tnpG+UIUIIcrWklQaCOlzWg1qGK50LTNRS6TEDQWCclPd21Ovxm
 i8hcScd/amiC3Jed4uajZb7JltKB7l0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-ASYS9H9nOkmiZ-KBvDwl-g-1; Mon, 01 Nov 2021 14:43:47 -0400
X-MC-Unique: ASYS9H9nOkmiZ-KBvDwl-g-1
Received: by mail-wr1-f72.google.com with SMTP id
 z5-20020a5d6405000000b00182083d7d2aso2097177wru.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wrRJbxTfXKoNE9RhSD+9rCBC0L1fCrHGd+SeOdkp/14=;
 b=NjHiMtIoK5S7jhBYCLhtsmk2RBoBRro/VchvyJ7V8svEWatZqZiqqsdfVd+0HJUSMy
 r49lylAoOsp2KqlgZNEj5R9ZKbOfzVjucMJz7ZHCHXVT+Goouw4kpu0n9MpRh08ixyPK
 F0eUs/27WVXUsf1wQY/S0Oc6iPXzNyD4HoqdfaqaA1BebgVyhtvg1mYQN/10FhaitKhQ
 J+juLqmkV7CkMamdQWkTCtOLGG7Ol0DNAC6LktZwKUdmbyvUSMiKw3V85ruoN9B7T0lp
 hyefsiRgDusDUtyxwqxVvDOmKl9qqDHRSCZt4JXo8GiANGttk7+ZZyGNKTPLl3VKYrVY
 aklw==
X-Gm-Message-State: AOAM531xoNZo846YN1QRo77jtpQIa/cV84Q+QlRBkkrtERKBkJQFJA9w
 n4Zr8JX2BG2djlREzh8d8PIeTRwGP6Vt3X0Qpf71y0X7P6NAhiCrJjHk5D+Rb6rIwzlsf/v1KBK
 ZrosmWJJ7B4abBL2O8c70N9rvx+hPSmq0GFlAscxZQaOfxrzDvhKiVAjYZJ2eiyhl
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr11122625wrw.104.1635792225774; 
 Mon, 01 Nov 2021 11:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2utyBz54X2ezIzxsjFjSLvMDAbTQkGqrOuc8GVm1HB/EpzH9jSQ7tuQC1VbotVp26ooV79w==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr11122591wrw.104.1635792225597; 
 Mon, 01 Nov 2021 11:43:45 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u16sm275280wmc.21.2021.11.01.11.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] qdev-monitor: Check sysbus device type before creating it
Date: Mon,  1 Nov 2021 19:42:58 +0100
Message-Id: <20211101184259.2859090-10-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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

Add an early check to test if the requested sysbus device type
is allowed by the current machine before creating the device. This
impacts both -device cli option and device_add qmp command.

Before this patch, the check was done well after the device has
been created (in a machine init done notifier). We can now report
the error right away.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211029142258.484907-3-damien.hedde@greensocs.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/qdev-monitor.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 4851de51a5c..e49d9773d2d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -42,6 +42,7 @@
 #include "qemu/cutils.h"
 #include "hw/qdev-properties.h"
 #include "hw/clock.h"
+#include "hw/boards.h"
 
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -254,6 +255,16 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
+    if (object_class_dynamic_cast(oc, TYPE_SYS_BUS_DEVICE)) {
+        /* sysbus devices need to be allowed by the machine */
+        MachineClass *mc = MACHINE_CLASS(object_get_class(qdev_get_machine()));
+        if (!device_type_is_dynamic_sysbus(mc, *driver)) {
+            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
+                       "a dynamic sysbus device type for the machine");
+            return NULL;
+        }
+    }
+
     return dc;
 }
 
-- 
2.31.1


