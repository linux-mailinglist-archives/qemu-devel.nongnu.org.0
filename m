Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E347638A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:41:09 +0100 (CET)
Received: from localhost ([::1]:58740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxb5I-0000Cy-E7
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:41:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq7-0003vI-CP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:28 -0500
Received: from [2a00:1450:4864:20::433] (port=42545
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mxaq5-0004Fu-EH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 15:25:27 -0500
Received: by mail-wr1-x433.google.com with SMTP id c4so40216155wrd.9
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 12:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g9ILVW2e3Wz+75W91mAmLGa/p+44XplQBZq4j1RIf8o=;
 b=Rusit/swwwajlzQE72Oj9upVYS/yqFgWWvyWAhC9FfOpV3JpUG06JMBZSRhTV5B6tF
 U6OjiNSgxuls0dr33pbADdtrPWoC3QDnpMd0yr5rArS21JGnTTUZd77NXFmcf/bDzkWG
 LNHS93deKtGqlrpjLmVGKc5yPb4oIfzeW1ug6NF851PAzL+PkZpMeH/mQDmWOcURXxRE
 abIVKz30VAajUDGGkQ9U9qiBlMmmg4CGTAoK4lHc1uoP1TghKRn2qJL1/X8TD77ozHMa
 d8TBAzAnL68Jz4DBK1bQ4SAYBqsbcNJlpvhJgRUV2FPnCcUT+vOEzgrgxTRvJfYxQDEx
 psYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=g9ILVW2e3Wz+75W91mAmLGa/p+44XplQBZq4j1RIf8o=;
 b=bZ7d2h8nnuK+h51bqjZk5qBnBft8wmaGlZfnyghvyylVyjyr0AdKnTB0/DZnBnH5n7
 l/tHdicXf15M4shgj1VPHyue8uMQDfWaasshdQ22YpZ2FEOCJooa9rx53PBcaeTY24Hj
 KfuLf/VeRi3c5fXg3bHvbBW2utjPYPOh/5wwAtBb08IIIhJJoQml33ouPs0FTPLbQzIe
 IpAesJk+OTxhBhbC7Ys2RNN5pSHquvxnZpt096sFVF3k+F8p+uihtfjEMTHAupVNWyKR
 ERijb8qfxlr3422VGakU2pGJzdv5hN48esjGYGF4KthtH7ln/G+tw0tVMAtRGFzizQiE
 PC4A==
X-Gm-Message-State: AOAM530JMj2Jmpdl8kDejqeShyZqxFvLtW5QjsPoki27ZLUeTJ3ech+r
 lg/zyAffddmA5TUN9YxqsE49uxjbwaw=
X-Google-Smtp-Source: ABdhPJxhT6VLNpmBTTa9OcMgbqTwtO6OjuqcI6bf3Qq043R0+XTZZZh4duhfLLh984u9g/8pI7vLjg==
X-Received: by 2002:adf:e8d2:: with SMTP id k18mr5269197wrn.187.1639599924100; 
 Wed, 15 Dec 2021 12:25:24 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id y11sm3794708wry.70.2021.12.15.12.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:25:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] numa: Support SGX numa in the monitor and Libvirt
 interfaces
Date: Wed, 15 Dec 2021 21:25:13 +0100
Message-Id: <20211215202515.91586-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215202515.91586-1-pbonzini@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Yang Zhong <yang.zhong@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yang Zhong <yang.zhong@intel.com>

Add the SGXEPCSection list into SGXInfo to show the multiple
SGX EPC sections detailed info, not the total size like before.
This patch can enable numa support for 'info sgx' command and
QMP interfaces. The new interfaces show each EPC section info
in one numa node. Libvirt can use QMP interface to get the
detailed host SGX EPC capabilities to decide how to allocate
host EPC sections to guest.

(qemu) info sgx
 SGX support: enabled
 SGX1 support: enabled
 SGX2 support: enabled
 FLC support: enabled
 NUMA node #0: size=67108864
 NUMA node #1: size=29360128

The QMP interface show:
(QEMU) query-sgx
{"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
[{"node": 0, "size": 67108864}, {"node": 1, "size": 29360128}], "flc": true}}

(QEMU) query-sgx-capabilities
{"return": {"sgx": true, "sgx2": true, "sgx1": true, "sections": \
[{"node": 0, "size": 17070817280}, {"node": 1, "size": 17079205888}], "flc": true}}

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
Message-Id: <20211101162009.62161-4-yang.zhong@intel.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/sgx.c         | 51 +++++++++++++++++++++++++++++++++++--------
 qapi/misc-target.json | 19 ++++++++++++++--
 2 files changed, 59 insertions(+), 11 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index d04299904a..5de5dd0893 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -83,11 +83,13 @@ static uint64_t sgx_calc_section_metric(uint64_t low, uint64_t high)
            ((high & MAKE_64BIT_MASK(0, 20)) << 32);
 }
 
-static uint64_t sgx_calc_host_epc_section_size(void)
+static SGXEPCSectionList *sgx_calc_host_epc_sections(void)
 {
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
     uint32_t i, type;
     uint32_t eax, ebx, ecx, edx;
-    uint64_t size = 0;
+    uint32_t j = 0;
 
     for (i = 0; i < SGX_MAX_EPC_SECTIONS; i++) {
         host_cpuid(0x12, i + 2, &eax, &ebx, &ecx, &edx);
@@ -101,10 +103,13 @@ static uint64_t sgx_calc_host_epc_section_size(void)
             break;
         }
 
-        size += sgx_calc_section_metric(ecx, edx);
+        section = g_new0(SGXEPCSection, 1);
+        section->node = j++;
+        section->size = sgx_calc_section_metric(ecx, edx);
+        QAPI_LIST_APPEND(tail, section);
     }
 
-    return size;
+    return head;
 }
 
 static void sgx_epc_reset(void *opaque)
@@ -168,13 +173,35 @@ SGXInfo *qmp_query_sgx_capabilities(Error **errp)
     info->sgx1 = eax & (1U << 0) ? true : false;
     info->sgx2 = eax & (1U << 1) ? true : false;
 
-    info->section_size = sgx_calc_host_epc_section_size();
+    info->sections = sgx_calc_host_epc_sections();
 
     close(fd);
 
     return info;
 }
 
+static SGXEPCSectionList *sgx_get_epc_sections_list(void)
+{
+    GSList *device_list = sgx_epc_get_device_list();
+    SGXEPCSectionList *head = NULL, **tail = &head;
+    SGXEPCSection *section;
+
+    for (; device_list; device_list = device_list->next) {
+        DeviceState *dev = device_list->data;
+        Object *obj = OBJECT(dev);
+
+        section = g_new0(SGXEPCSection, 1);
+        section->node = object_property_get_uint(obj, SGX_EPC_NUMA_NODE_PROP,
+                                                 &error_abort);
+        section->size = object_property_get_uint(obj, SGX_EPC_SIZE_PROP,
+                                                 &error_abort);
+        QAPI_LIST_APPEND(tail, section);
+    }
+    g_slist_free(device_list);
+
+    return head;
+}
+
 SGXInfo *qmp_query_sgx(Error **errp)
 {
     SGXInfo *info = NULL;
@@ -193,14 +220,13 @@ SGXInfo *qmp_query_sgx(Error **errp)
         return NULL;
     }
 
-    SGXEPCState *sgx_epc = &pcms->sgx_epc;
     info = g_new0(SGXInfo, 1);
 
     info->sgx = true;
     info->sgx1 = true;
     info->sgx2 = true;
     info->flc = true;
-    info->section_size = sgx_epc->size;
+    info->sections = sgx_get_epc_sections_list();
 
     return info;
 }
@@ -208,6 +234,7 @@ SGXInfo *qmp_query_sgx(Error **errp)
 void hmp_info_sgx(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
+    SGXEPCSectionList *section_list, *section;
     g_autoptr(SGXInfo) info = qmp_query_sgx(&err);
 
     if (err) {
@@ -222,8 +249,14 @@ void hmp_info_sgx(Monitor *mon, const QDict *qdict)
                    info->sgx2 ? "enabled" : "disabled");
     monitor_printf(mon, "FLC support: %s\n",
                    info->flc ? "enabled" : "disabled");
-    monitor_printf(mon, "size: %" PRIu64 "\n",
-                   info->section_size);
+
+    section_list = info->sections;
+    for (section = section_list; section; section = section->next) {
+        monitor_printf(mon, "NUMA node #%" PRId64 ": ",
+                       section->value->node);
+        monitor_printf(mon, "size=%" PRIu64 "\n",
+                       section->value->size);
+    }
 }
 
 bool sgx_epc_get_section(int section_nr, uint64_t *addr, uint64_t *size)
diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 5aa2b95b7d..1022aa0184 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -337,6 +337,21 @@
   'if': 'TARGET_ARM' }
 
 
+##
+# @SGXEPCSection:
+#
+# Information about intel SGX EPC section info
+#
+# @node: the numa node
+#
+# @size: the size of epc section
+#
+# Since: 6.2
+##
+{ 'struct': 'SGXEPCSection',
+  'data': { 'node': 'int',
+            'size': 'uint64'}}
+
 ##
 # @SGXInfo:
 #
@@ -350,7 +365,7 @@
 #
 # @flc: true if FLC is supported
 #
-# @section-size: The EPC section size for guest
+# @sections: The EPC sections info for guest
 #
 # Since: 6.2
 ##
@@ -359,7 +374,7 @@
             'sgx1': 'bool',
             'sgx2': 'bool',
             'flc': 'bool',
-            'section-size': 'uint64'},
+            'sections': ['SGXEPCSection']},
    'if': 'TARGET_I386' }
 
 ##
-- 
2.33.1



