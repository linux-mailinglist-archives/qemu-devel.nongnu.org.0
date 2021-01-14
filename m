Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F92D2F5B45
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 08:28:38 +0100 (CET)
Received: from localhost ([::1]:54890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzx3c-0008RA-S4
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 02:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyP-0004s7-BQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:13 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:39371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1kzwyN-0002TB-JW
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 02:23:13 -0500
Received: by mail-pf1-x42f.google.com with SMTP id m6so2831048pfm.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 23:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5aRMVfeWr0427W87tSaA5SIA22TuAHOEnWTjLyc5oxw=;
 b=cewohgorb3L9xjwon9k2GTNrv/1u3taVLE1GfUTKj5VGJz3+ZDBgDpVtLGzVgiUCWq
 R6hA93coQYnLzQW5fv4lFgo/x40Z0Z7NTLUzCu3Xt5Vr9jOIeGstCNx8LNOr5wGbxTrs
 v1kpggqYPY3MaGwbI6z0goxMuvyLzPk8qZm6ISttyHGMidPIh3AeatIt+iUzUbkxUL3r
 m41m9a1exV6Hxgp2X6Lux9GB7M/SVjiOYJLLT/HPLiy+0f5zPVtfFR749AMMCc6DK+bP
 /Xq6Zk9g84azveIHDUoAuqx0Ga7lOua0kNNDnIz/68pLpERKtjU7fgzDFhGhFfKQDEHM
 LrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5aRMVfeWr0427W87tSaA5SIA22TuAHOEnWTjLyc5oxw=;
 b=ppEr+0io6XButVdnYzb3Xy5Tvzca9EyZD5xGZDWOi1hWETWZMPgqmXy+58jctV+xIP
 G505kEgUoA6rj6MkJhlZb5fitZt1Yr9K5oUZ0m6AFLWf+pEh0zchEXJ76gvl+rU00QPI
 iCB3ifdaScfF2GWu3Qy1IOqq9nkKrPz3H8l+S7YTtHl8c/N2e/xVNb6mH1v2yFUslFkq
 Rn0kbckOCLEROXydFnArSvOBSnpSx3Is0U35PsNCksqDtOiNPRxBUonLXBVp3nb6bJUi
 KmnAe7U+dG4PnRCibKqwMc26Vylz6+rpVEMiO6kgvlf9GRPQhnJeQ7rhDA8QRKP9WI3H
 ZxSg==
X-Gm-Message-State: AOAM530UdpTyW0WV94qPKAsql0Hplm+KS6Lehj0S3/1YUCXPJ7ml//Sq
 dyjbrc4H6BdTd+WHBhK+mnDbNA==
X-Google-Smtp-Source: ABdhPJw0+rRn/fgp6Kb1e77agHlYPb0YZh3odK8KTnJR8kcZdkDTaQ5CtlQgwY2miNRj9vUDnY4d6w==
X-Received: by 2002:a63:5952:: with SMTP id j18mr6318838pgm.29.1610608990285; 
 Wed, 13 Jan 2021 23:23:10 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id i7sm4450323pfc.50.2021.01.13.23.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:23:09 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v3 3/4] hw/block/nvme: add smart_critical_warning property
Date: Thu, 14 Jan 2021 15:22:50 +0800
Message-Id: <20210114072251.334304-4-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114072251.334304-1-pizhenwei@bytedance.com>
References: <20210114072251.334304-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x42f.google.com
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

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 hw/block/nvme.c | 40 ++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f361103bb4..ce9a9c9023 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1214,6 +1214,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
     }
 
     trans_len = MIN(sizeof(smart) - off, buf_len);
+    smart.critical_warning = n->smart_critical_warning;
 
     smart.data_units_read[0] = cpu_to_le64(DIV_ROUND_UP(stats.units_read,
                                                         1000));
@@ -2826,6 +2827,41 @@ static Property nvme_props[] = {
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
+    uint8_t value, cap = 0;
+    uint64_t pmr_cap = CAP_PMR_MASK;
+
+    if (!visit_type_uint8(v, name, &value, errp)) {
+        return;
+    }
+
+    cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
+          | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
+    if (s->bar.cap & (pmr_cap << CAP_PMR_SHIFT)) {
+        cap |= NVME_SMART_PMR_UNRELIABLE;
+    }
+
+    if ((value & cap) != value) {
+        error_setg(errp, "unsupported smart critical warning value");
+        return;
+    }
+
+    s->smart_critical_warning = value;
+}
+
 static const VMStateDescription nvme_vmstate = {
     .name = "nvme",
     .unmigratable = 1,
@@ -2856,6 +2892,10 @@ static void nvme_instance_init(Object *obj)
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


