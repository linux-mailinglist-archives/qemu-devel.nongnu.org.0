Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0A92F70F1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:28:51 +0100 (CET)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Fn8-0007XQ-4C
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:28:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Flj-00062T-1G
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:23 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Flh-0000hS-9R
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:22 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l23so4409015pjg.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jNuSz+nFqys03+vNsU/AA8pxB86XfjreXgHeY68HruQ=;
 b=no2QQ7dfLQKBvb2ALUAkfmZV2cCaHUyk1rZDOcjS9gO0gId7gKc2/hpA/OKmmlDnGc
 Kg52go37vOV4/98VAAov56esz4qKl5+uaVNOvZC6TFS9fCTpVfowz0D+Sh4eZUrXhOSa
 PDXmBb6nmc8uLsbF9Aw+Ymoqu5eEPXEBG6z2wP9PVAZJzNUVe54P8rhBMQSQjWUKaQHx
 5ZwLdIHETW0uyK1t6l9lnOmLUJ70FKmcJpxbcKVErL59TGn6ILeEl+V/NniqCXL8O4MB
 5/gDw0sVq/t+T61/Nki6vo1pYIIeeaZmgeJs83XFBXYdovxvhcWmPLl2lGfDHr0rwSwq
 5GhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jNuSz+nFqys03+vNsU/AA8pxB86XfjreXgHeY68HruQ=;
 b=AELJwEUtyUeb6D+YN2cLOaisDZJLSN9ZczMeYVKO1xbbeqnTz6uSq3dtqawFcT/ob+
 sH9BJW90K1OkZULXBdHax6arx8fQ0mOBFi1BqhJKYyEKIjSxEIe7lyfpRmy1yYsV9TsF
 4omPpdrDRXU9jF27vOWm6hAEN01b2/fhpmu1qyD4ro2/AW4ywMjGfspVVOQ7hqRQDEdM
 kXvdowD9SNcJMJivVv2cvHB4yZqTBjJGUIyfAaySUPvk+1WL70bbAmKiMoNFtbf3SBtv
 XNZ8MR5dIZcm8/QkCXO3k/Et9b+IvhitxBCcC+CQBldtb5PLSB05+BPEaXpEuHj2HkVy
 SeLw==
X-Gm-Message-State: AOAM530RHmjkagbXmbNzQ5UMqgSekEeltzQbKlNHx11ZVjcEouYvx0Y6
 zAJv8R4TiGXJTMcGITkGjnlJLg==
X-Google-Smtp-Source: ABdhPJzS/fUj/CuviCgZ/WTSyJE0+7tRGeCCo5GO5pwQLMYRcF3Qa34LNc30QKihqaFskaWjs0uAfw==
X-Received: by 2002:a17:90a:f0c5:: with SMTP id
 fa5mr8396621pjb.144.1610681239952; 
 Thu, 14 Jan 2021 19:27:19 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id j16sm6583662pjj.18.2021.01.14.19.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:27:19 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v4 2/3] hw/block/nvme: add smart_critical_warning property
Date: Fri, 15 Jan 2021 11:27:01 +0800
Message-Id: <20210115032702.466631-3-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115032702.466631-1-pizhenwei@bytedance.com>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is a very low probability that hitting physical NVMe disk
hardware critical warning case, it's hard to write & test a monitor
agent service.

For debugging purposes, add a new 'smart_critical_warning' property
to emulate this situation.

The orignal version of this change is implemented by adding a fixed
property which could be initialized by QEMU command line. Suggested
by Philippe & Klaus, rework like current version.

Test with this patch:
1, change smart_critical_warning property for a running VM:
 #virsh qemu-monitor-command nvme-upstream '{ "execute": "qom-set",
  "arguments": { "path": "/machine/peripheral-anon/device[0]",
  "property": "smart_critical_warning", "value":16 } }'
2, run smartctl in guest
 #smartctl -H -l error /dev/nvme0n1

  === START OF SMART DATA SECTION ===
  SMART overall-health self-assessment test result: FAILED!
  - volatile memory backup device has failed

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c      | 45 +++++++++++++++++++++++++++++++++++++++++---
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  1 +
 3 files changed, 44 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 0854ee3072..2d71ebeb30 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2425,6 +2425,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     trans_len = MIN(sizeof(smart) - off, buf_len);
+    smart.critical_warning = n->smart_critical_warning;
 
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
                                                         1000));
@@ -4346,6 +4347,40 @@ static Property nvme_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *n = NVME(obj);
+    uint8_t value = n->smart_critical_warning;
+
+    visit_type_uint8(v, name, &value, errp);
+}
+
+static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *n = NVME(obj);
+    uint8_t value, cap = 0;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
+          | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
+    if (NVME_CAP_PMR(n->bar.cap)) {
+        cap |= NVME_SMART_PMR_UNRELIABLE;
+    }
+
+    if ((value & cap) != value) {
+        error_setg(errp, "unsupported smart critical warning bits: 0x%x",
+                   value & ~cap);
+        return;
+    }
+
+    n->smart_critical_warning = value;
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -4369,13 +4404,17 @@ static void nvme_class_init(ObjectClass *oc, void *data)
 
 static void nvme_instance_init(Object *obj)
 {
-    NvmeCtrl *s = NVME(obj);
+    NvmeCtrl *n = NVME(obj);
 
-    if (s->namespace.blkconf.blk) {
-        device_add_bootindex_property(obj, &s->namespace.blkconf.bootindex,
+    if (n->namespace.blkconf.blk) {
+        device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
                                       "bootindex", "/namespace@1,0",
                                       DEVICE(obj));
     }
+
+    object_property_add(obj, "smart_critical_warning", "uint8",
+                        nvme_get_smart_warning,
+                        nvme_set_smart_warning, NULL, NULL);
 }
 
 static const TypeInfo nvme_info = {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b7fbcca39d..bd5a2b416f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -145,6 +145,7 @@ typedef struct NvmeCtrl {
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
+    uint8_t     smart_critical_warning;
 
     HostMemoryBackend *pmrdev;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 0baf4b27cd..520bc2e4cf 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -60,6 +60,7 @@ enum NvmeCapMask {
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
+#define NVME_CAP_PMR(cap)   (((cap) >> CAP_PMR_SHIFT)    & CAP_PMR_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
-- 
2.25.1


