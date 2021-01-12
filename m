Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EE72F2938
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 08:52:07 +0100 (CET)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzETG-000317-I5
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 02:52:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzEQu-0001bV-HV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:49:40 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:38807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzEQs-0002iR-7N
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 02:49:40 -0500
Received: by mail-pl1-x630.google.com with SMTP id d4so153058plh.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 23:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iirlCwjvMpIb0qx3Fc7xuD+1vEwlFlrqkaNXF92YMa0=;
 b=oX2Gy+uvi+Nrj+umcySclfD4OBg9Jrd0E+yXJNzV+859hmxGwN++k5T+RioPCstfBp
 J830gXPkbV2wVFUul4YMBtUwQUQCBbVGW59BMqU0XJeLNAgGvF2SV8bbE/sGaKJAGFBQ
 9kR8Cdr+nCjdPLy1up/JXwCpJi9du8kG9Uf1NiRtuOP9JzPez9wXqIRbreLRY7kkVHRe
 xV+1OZLdJTlQGtCG5Q0kADtfrVGbwK65NyeD0roLhvOD79odCS9kzVtuaKXofMFj8GeK
 OIcoXQiCBrE3RFzckLsGC2bpcbAsPqAMj61OZ8wxM7frueSlU+6IUChJSFfoRtmL+neH
 y0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iirlCwjvMpIb0qx3Fc7xuD+1vEwlFlrqkaNXF92YMa0=;
 b=tat54Vpcnvn2YIG3koPYD+D11Ysh3fO6BjDTzsnMPbjrfmVdfX3l/2gOI/mPdzoJzo
 7d/gMUBy1ZYIdcFtofsiHfxFCYciQWWjpgYPHHTzr4qbEgjPCaplC6KJOqEYM9o0RUhR
 n2/f3D11p6P10YKeW1zLwp5C+uI4bdvI3RxPXLtUFsnMSiyd3tBf4NiH9i8upJX76DDl
 LK0gXT0vJefpwGv7SvDRb3I+TuPSzwtNIBJ2gxkcXz+FmLbn5fe/Tp3t4hAmUTn+uURt
 OXCWCOepKA8mqyZzNB/yORYM4KA6dowEPgnDERbLGUFx2pN6CohAKLys5qXDc6Re3Jug
 ve5g==
X-Gm-Message-State: AOAM530Pzs8Dq8S2F4FfpXJSacHavk7OYuMAZInKKI1TdwUgDNXNeuu0
 eJW6HIol6hA4NEJmTzBd1wvVQw==
X-Google-Smtp-Source: ABdhPJzp3WHv16M66FQLbiYhoY6eE4bCNnw0B9+wBsDlYpEjBEW+GP5k7iuIxfyayGkYOp4KkWKfhw==
X-Received: by 2002:a17:90a:66ce:: with SMTP id
 z14mr3204107pjl.153.1610437776950; 
 Mon, 11 Jan 2021 23:49:36 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id 193sm2144582pfz.36.2021.01.11.23.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 23:49:36 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v2 1/1] hw/block/nvme: add smart_critical_warning property
Date: Tue, 12 Jan 2021 15:49:24 +0800
Message-Id: <20210112074924.217862-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112074924.217862-1-pizhenwei@bytedance.com>
References: <20210112074924.217862-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c | 28 ++++++++++++++++++++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 27d2c72716..a98757b6a1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1214,6 +1214,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     trans_len = MIN(sizeof(smart) - off, buf_len);
+    smart.critical_warning = n->smart_critical_warning;
 
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
                                                         1000));
@@ -2827,6 +2828,29 @@ static Property nvme_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+
+static void nvme_get_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *s = NVME(obj);
+    uint8_t value = s->smart_critical_warning;
+
+    visit_type_uint8(v, name, &value, errp);
+}
+
+static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
+                                   void *opaque, Error **errp)
+{
+    NvmeCtrl *s = NVME(obj);
+    uint8_t value;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    s->smart_critical_warning = value;
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -2857,6 +2881,10 @@ static void nvme_instance_init(Object *obj)
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
index e080a2318a..64e3497244 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -139,6 +139,7 @@ typedef struct NvmeCtrl {
     uint64_t    timestamp_set_qemu_clock_ms;    /* QEMU clock time */
     uint64_t    starttime_ms;
     uint16_t    temperature;
+    uint8_t     smart_critical_warning;
 
     HostMemoryBackend *pmrdev;
 
-- 
2.25.1


