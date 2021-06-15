Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232CF3A7363
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:39:16 +0200 (CEST)
Received: from localhost ([::1]:57572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsy2t-0000gd-5b
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxg-0000UG-2H; Mon, 14 Jun 2021 21:33:52 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lsxxe-0002av-46; Mon, 14 Jun 2021 21:33:51 -0400
Received: by mail-qt1-x831.google.com with SMTP id u20so10095921qtx.1;
 Mon, 14 Jun 2021 18:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lfy76N0NY/1aMHF2KprIQN24YDxSOiwpQMaSev64vXg=;
 b=nzDoSlZpuUpIhcs2v+K4+dOL880TV7lyM8+7ux2gmQ7X0fV9fVSblUYicAA7HlBzj6
 jRfI4by7DqJk22Haozh/813A4jEvAoIdWIe4TpReNAXOdETPDyrxxzVEcyQn7czrEu9c
 GumrevTGti8ttTse4Grg8aJDn6YmOaaZXM1MXR9NjZ+qF+3KMVdnfMojo7M0szIkijEE
 e2hIzn8CQw5JIwbt+9+Y/RYAD0JPOOTvEx6U4JaRoAOPOd2w4T///BnuOtxWYnXJJaer
 nNInc+ZqjKSjrC4fuHGm04CX2K+jKWMbt/QgRWpmhKA3s+R/nvdTuPAI4Yse/a+Nuzfx
 QOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lfy76N0NY/1aMHF2KprIQN24YDxSOiwpQMaSev64vXg=;
 b=qYQjVcFX0EP/0MHd1FS0er8qVbugSa8p9xhP+67YILqf/2CeE4VGgwekqb+viYfDwa
 SWeceeAIuyhNOe/l4QCYV8Dwv7SThrzjYLOa+cpYGhx/gjR79V9qjhAF+e20khQ8ElsF
 MaIo2C1Az4vCqxCvLxBU4j7GvDfdFC3aBWxUxjEZO0aIvHVLT7o46s5ZgB9qsW7Sue7g
 LGRJnrVCudKEsSLaVj5poah0U0CmcoEJSNJD2UvIuUy4OJ+jLM2xoMoO9EGXcHytmT0X
 Wgu28u28F8KjeUF3BRsQfSLSRrxSewYn66oWcSmip/Y2LQ1auq1RfNyCCFCkWRW/twoa
 Vclw==
X-Gm-Message-State: AOAM532hwG1bFdtgQgOFpMMf7SjzCXjRQymTzfGYN77KIOYfhsd3UHIT
 AQtS2+scSl3akInYxvdE9p+nx1y5dzNKTA==
X-Google-Smtp-Source: ABdhPJyr5UVADKkb2QcX8Gmg3JfyvAeTEPPe3XYgAaHR0sxlDuD6ln410ENZ04Dqs+XuHEwn7jhzoA==
X-Received: by 2002:a05:622a:20a:: with SMTP id
 b10mr669248qtx.349.1623720828669; 
 Mon, 14 Jun 2021 18:33:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7c6:4d9a:784f:a7de:c020:5f1e])
 by smtp.gmail.com with ESMTPSA id h2sm11639320qkf.106.2021.06.14.18.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:33:48 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 6/8] nvdimm: add PPC64 'device-node' property
Date: Mon, 14 Jun 2021 22:33:07 -0300
Message-Id: <20210615013309.2833323-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615013309.2833323-1-danielhb413@gmail.com>
References: <20210615013309.2833323-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x831.google.com
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
 hw/mem/nvdimm.c         | 28 ++++++++++++++++++++++++++++
 include/hw/mem/nvdimm.h | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index 7397b67156..030ccf7575 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -96,6 +96,29 @@ static void nvdimm_set_uuid(Object *obj, Visitor *v, const char *name,
     g_free(value);
 }
 
+static void nvdimm_get_device_node(Object *obj, Visitor *v,
+                                         const char *name, void *opaque,
+                                         Error **errp)
+{
+    NVDIMMDevice *nvdimm = NVDIMM(obj);
+    uint8_t value = nvdimm->device_node;
+
+    visit_type_uint8(v, name, &value, errp);
+}
+
+static void nvdimm_set_device_node(Object *obj, Visitor *v,
+                                         const char *name, void *opaque,
+                                         Error **errp)
+{
+    NVDIMMDevice *nvdimm = NVDIMM(obj);
+    uint8_t value;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    nvdimm->device_node = value;
+}
 
 static void nvdimm_init(Object *obj)
 {
@@ -105,6 +128,11 @@ static void nvdimm_init(Object *obj)
 
     object_property_add(obj, NVDIMM_UUID_PROP, "QemuUUID", nvdimm_get_uuid,
                         nvdimm_set_uuid, NULL, NULL);
+
+    object_property_add(obj, NVDIMM_DEVICE_NODE, "uint8",
+                        nvdimm_get_device_node,
+                        nvdimm_set_device_node,
+                        NULL, NULL);
 }
 
 static void nvdimm_finalize(Object *obj)
diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
index bcf62f825c..430169322f 100644
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
+    uint8_t device_node;
 };
 
 struct NVDIMMClass {
-- 
2.31.1


