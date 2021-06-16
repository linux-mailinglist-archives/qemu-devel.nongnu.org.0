Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD453A8E74
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:38:28 +0200 (CEST)
Received: from localhost ([::1]:58000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKVf-00027E-8M
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE3-0003kT-Ax; Tue, 15 Jun 2021 21:20:15 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:34622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ltKE0-0004LF-07; Tue, 15 Jun 2021 21:20:15 -0400
Received: by mail-qk1-x72a.google.com with SMTP id k11so995155qkk.1;
 Tue, 15 Jun 2021 18:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MKj6WbNGYNDETat7wPp4iyJPvKx6ZccNLrkYbFNYwsw=;
 b=TZTYmCO6KofkU1d5z1x4EJdQT0GRkIgAfllsn322IPw3Ix1ff1u949noA5P59lBv8C
 ArJ0w9if2ES4oYTEQfKDNj6uK1pfFiiHjzaGkR6aI50A0Vh3P+3CgQox7T/8rC3U/Ord
 GGtNHx3G1ucOEjrFmhCQnVOy+Rj1Z3++DVOOLmygBZAcX8zghh30Rf5jmtsVVG0OjVv7
 1iMQ6Mmck0bE4RFMnmo3VPlKgBpxTSD9gzOH12M3811arXMedW6Yrxh/CJX5nNfWHcvf
 H8MfaUv7pd1fWg372MJ6kiZW2e/sj34Je2MKj7Y0CjPSAfeWHwd+ri3avhB5VYQXiA//
 wYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MKj6WbNGYNDETat7wPp4iyJPvKx6ZccNLrkYbFNYwsw=;
 b=uM3WvzHZO4tJDJaS/AutrdfwKT2Sy975K7JotC5dkHgM5Z7Oe0lTH5RXURItQZ+F7w
 XB9FVvDEbU3cuU4W/vLmZsxtvYkhe9+abv0SdkcivX9GBS+a4lYpKbMeNwjIWP05Qf9J
 e0g86E1bQS57sGf5Sg5TmHwOjTj0l5hW0xt1D1gSUYj0KksuDDO4W6jAR3OEQf7sZKDL
 3YUxIxuwIaKJDlv5LXDCtxba6mA9khFfqnlqIwSIouisAhlHZLd07qrdzrRi9lazdJuZ
 NVhd+RXHTOQS0dIRxkCLptYqJOZVyTLtrm5d4FAmgXTgF7IolyGbznP6htd82Pzr/O2+
 iiAA==
X-Gm-Message-State: AOAM533vimuOsETHFX0CGTdBk/X7O6kVEBoz1HBzsfINh607cT/j4Dhw
 ReOJ2RIdSyps4UQdnSX1BHydKJvGEr4=
X-Google-Smtp-Source: ABdhPJwt/QEgyubEOVz+k+dW752PvDMG3wyULMoQSETgBUCsKF0UrmONj815vEjqa9fKj1n0Qjwgng==
X-Received: by 2002:ae9:ed96:: with SMTP id c144mr2537017qkg.401.1623806410221; 
 Tue, 15 Jun 2021 18:20:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id f19sm627994qkg.70.2021.06.15.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 18:20:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 5/7] nvdimm: add PPC64 'device-node' property
Date: Tue, 15 Jun 2021 22:19:42 -0300
Message-Id: <20210616011944.2996399-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616011944.2996399-1-danielhb413@gmail.com>
References: <20210616011944.2996399-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>, aneesh.kumar@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The spapr-nvdimm driver is able to operate in two ways. The first
one is as a regular memory in which the NUMA node of the parent
pc-dimm class is used. The second mode, as persistent memory, allows for
a different NUMA node to be used based on the locality of the device.

At this moment we don't have a way to express this second NUMA node for
the persistent memory mode. This patch introduces a new 'device-node'
property that will be used by the PPC64 spapr-nvdimm driver to set a
second NUMA node for the nvdimm.

CC: Shivaprasad G Bhat <sbhat@linux.ibm.com>
CC: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/mem/nvdimm.c         | 31 +++++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h | 12 ++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b67156..96298e3fda 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -96,15 +96,46 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
     g_free(value);
 }
 
+static void nvdimm_get_device_node(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    NVDIMMDevice *nvdimm = NVDIMM(obj);
+    int64_t value = nvdimm->device_node;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void nvdimm_set_device_node(Object *obj, Visitor *v,
+                                   const char *name, void *opaque,
+                                   Error **errp)
+{
+    NVDIMMDevice *nvdimm = NVDIMM(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    nvdimm->device_node = value;
+}
 
 static void nvdimm_init(Object *obj)
 {
+    NVDIMMDevice *nvdimm = NVDIMM(obj);
+
     object_property_add(obj, NVDIMM_LABEL_SIZE_PROP, "int",
                         nvdimm_get_label_size, nvdimm_set_label_size, NULL,
                         NULL);
 
     object_property_add(obj, NVDIMM_UUID_PROP, "QemuUUID", nvdimm_get_uuid,
                         nvdimm_set_uuid, NULL, NULL);
+
+    nvdimm->device_node = -1;
+    object_property_add(obj, NVDIMM_DEVICE_NODE, "int",
+                        nvdimm_get_device_node,
+                        nvdimm_set_device_node,
+                        NULL, NULL);
 }
 
 static void nvdimm_finalize(Object *obj)
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..e3298ef841 100644
--- a/include/hw/mem/nvdimm.h
+++ b/include/hw/mem/nvdimm.h
@@ -49,6 +49,7 @@
 OBJECT_DECLARE_TYPE(NVDIMMDevice, NVDIMMClass, NVDIMM)
 
 #define NVDIMM_LABEL_SIZE_PROP "label-size"
+#define NVDIMM_DEVICE_NODE  "device-node"
 #define NVDIMM_UUID_PROP       "uuid"
 #define NVDIMM_UNARMED_PROP    "unarmed"
 
@@ -89,6 +90,17 @@ struct NVDIMMDevice {
      * The PPC64 - spapr requires each nvdimm device have a uuid.
      */
     QemuUUID uuid;
+
+   /*
+    * The spapr-nvdimm (PPC64 NVDIMM) driver supports two modes of
+    * operation: regular memory and persistent memory. When using the
+    * device as regular memory, the NUMA nodeid that comes from
+    * PC_DIMM_NODEPROP is to be used. When used as persistent memory,
+    * the guest should consider the 'device-node' instead since it
+    * indicates the locality of the device to an established NUMA
+    * node, which is more relevant to this type of usage.
+    */
+    int device_node;
 };
 
 struct NVDIMMClass {
-- 
2.31.1


