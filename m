Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D074F31FE27
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:47:39 +0100 (CET)
Received: from localhost ([::1]:50856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9sQ-0001BQ-To
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:47:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kD-0002Tl-Jl
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9kA-0005Sh-It
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cia92nKBjrGhWlmymfB9YbxEpc3m+J7hFEI/efRN2yM=;
 b=B4hXWITd3MjdLXlv+hDENzBkDbtF1k/RhVVeqq0EQHFIg5KW6/GDY7YCXxmHMWtp0LfMbF
 37i31N10OEciZT/BSHw4ryts9n6RJRCAi66FBgyRndsVPHMJn0/5AaHxX+6IfWkwqNv0Ql
 i3PmLrBdebVcPlgX+3xBrlzsZ65Gpcs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-TNcNUVInMOyUe__ODBA2ow-1; Fri, 19 Feb 2021 12:39:04 -0500
X-MC-Unique: TNcNUVInMOyUe__ODBA2ow-1
Received: by mail-wr1-f69.google.com with SMTP id e11so2715059wro.19
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cia92nKBjrGhWlmymfB9YbxEpc3m+J7hFEI/efRN2yM=;
 b=d2Ces4wScKyBqybQadYUr0SwKFkeIuxAJJscLdSU8Olg9QcfUY4DrrHZ1sPYwBzbB1
 10McnTjdsEf264Jt5TDFfrgPAyHfOboD4bMG8kTJtkf7TqF8IFUF01Ki284ESAlOl7MZ
 vSoNvBLYsreouTLKx3Sv1hUWqDi0hbQzQ8M7wZKDSxD8c5Vmcr2F+uAobmu/MB8/Ge9w
 KXZSLxKrw4OxYM3RmCIoglNj2qMnETbc5dikOc3KX8YhbRJcrJOOnmcF+aB8jqMlpCi3
 T5Nxlz4UMvKHGhK02QliMdQFQePS0x7lXfgewrM2WTLZI+BXtsG6FXJEaffGplHuhn9T
 XUdw==
X-Gm-Message-State: AOAM533zgRW6UdNxAe2g5qt3/McihAWF6yhX9iKAv9UngO9KRXPrxkqA
 UTmy+ZHbpQ0uAlELOoc9/5yrVPVb/V9O20yRPx+B+3FjpTSmpDalcwKooqVv5xmxWHYW2oQWr92
 VAs5qqJQ9pQ9B18fRx8QqGht7m59zl13829JKNp6X7dY8wQCqBjuN569ZfWJhosbr
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr7417338wmg.183.1613756342572; 
 Fri, 19 Feb 2021 09:39:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqNL2hop6t3K45dchD7vTDRIpUNwjlifOUsXeOhz1mjGEWf1uUBOU5I8vzusScCU0mSzJMIw==
X-Received: by 2002:a1c:dd09:: with SMTP id u9mr7417287wmg.183.1613756342265; 
 Fri, 19 Feb 2021 09:39:02 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u7sm13826375wrt.67.2021.02.19.09.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:39:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
Date: Fri, 19 Feb 2021 18:38:38 +0100
Message-Id: <20210219173847.2054123-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219173847.2054123-1-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the valid_accelerators[] field to express the list
of valid accelators a machine can use, and add the
machine_class_valid_for_current_accelerator() and
machine_class_valid_for_accelerator() methods.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/boards.h | 24 ++++++++++++++++++++++++
 hw/core/machine.c   | 26 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 68d3d10f6b0..4d08bc12093 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                const CpuInstanceProperties *props,
                                Error **errp);
 
+/**
+ * machine_class_valid_for_accelerator:
+ * @mc: the machine class
+ * @acc_name: accelerator name
+ *
+ * Returns %true if the accelerator is valid for the machine, %false
+ * otherwise. See #MachineClass.valid_accelerators.
+ */
+bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name);
+/**
+ * machine_class_valid_for_current_accelerator:
+ * @mc: the machine class
+ *
+ * Returns %true if the accelerator is valid for the current machine,
+ * %false otherwise. See #MachineClass.valid_accelerators.
+ */
+bool machine_class_valid_for_current_accelerator(MachineClass *mc);
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type);
 /*
  * Checks that backend isn't used, preps it for exclusive usage and
@@ -125,6 +143,11 @@ typedef struct {
  *    should instead use "unimplemented-device" for all memory ranges where
  *    the guest will attempt to probe for a device that QEMU doesn't
  *    implement and a stub device is required.
+ * @valid_accelerators:
+ *    If this machine supports a specific set of virtualization accelerators,
+ *    this contains a NULL-terminated list of the accelerators that can be
+ *    used. If this field is not set, any accelerator is valid. The QTest
+ *    accelerator is always valid.
  * @kvm_type:
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities
@@ -166,6 +189,7 @@ struct MachineClass {
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
+    const char *const *valid_accelerators;
 
     void (*init)(MachineState *state);
     void (*reset)(MachineState *state);
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 970046f4388..c42d8e382b1 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -518,6 +518,32 @@ static void machine_set_nvdimm_persistence(Object *obj, const char *value,
     nvdimms_state->persistence_string = g_strdup(value);
 }
 
+bool machine_class_valid_for_accelerator(MachineClass *mc, const char *acc_name)
+{
+    const char *const *name = mc->valid_accelerators;
+
+    if (!name) {
+        return true;
+    }
+    if (strcmp(acc_name, "qtest") == 0) {
+        return true;
+    }
+
+    for (unsigned i = 0; name[i]; i++) {
+        if (strcasecmp(acc_name, name[i]) == 0) {
+            return true;
+        }
+    }
+    return false;
+}
+
+bool machine_class_valid_for_current_accelerator(MachineClass *mc)
+{
+    AccelClass *ac = ACCEL_GET_CLASS(current_accel());
+
+    return machine_class_valid_for_accelerator(mc, ac->name);
+}
+
 void machine_class_allow_dynamic_sysbus_dev(MachineClass *mc, const char *type)
 {
     QAPI_LIST_PREPEND(mc->allowed_dynamic_sysbus_devices, g_strdup(type));
-- 
2.26.2


