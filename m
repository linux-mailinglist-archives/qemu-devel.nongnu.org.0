Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368C031FB79
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 15:57:20 +0100 (CET)
Received: from localhost ([::1]:56848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7Db-0005nV-6J
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 09:57:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73R-0002JU-0V
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:49 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73A-0003SU-CY
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:46:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id x4so7881610wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vhghzb1KxboqZ+GwFa0MaTa9cSu8tLM6q3ZGrvP0/yI=;
 b=zWt7xen9sIh++ZpFy7HZ/9gg1zpkaopEVGu/BOzrszGvPGtUhsTmezigIYtERRYv92
 t7qKY1JGTNKXiF6Df845qvtEiYQpWV9nZPiyyWgBbZLe3l3cJ57OY8QEl0ErBQ626Xv4
 42fWt0FlK0UwwViMwfbPULTmwWsmTcQIJI13gPciRdX2AsYPSzD9TVleu7ErpbXZ5Kgi
 kx8PC6C5WsjG0xAt9QKEmeAO507z8s0Vm+qYRPmiFSyg/IWy7LsNJ2RTRDFhoZAUIESp
 liuZ4IgUXUGnfIH0UKlFr5emA+8UlB/Q24MWL1GXJXerVX9tJlM6vF/yROrWFSKfhtuo
 0AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vhghzb1KxboqZ+GwFa0MaTa9cSu8tLM6q3ZGrvP0/yI=;
 b=hT04TjnhHG9zaKyIUGFEKzRV1rD3HHAJagnly3En6SOI9JlBo+PRRNTauDv9s6Rb9I
 whETWWS+2fID4Qsxa8Z8L+NlURWlKMjV2aNBuNRn9ob5SJwW4IKNeCv/VXtzF13f6lvp
 zYzwS0KvwFZqoyHlVRymMGVOQetbMKu0f5OyLNulRrPcZ2S8PwPkypMXXHmJz0vcmQsV
 siL56FwjoyGAtkUOzDdEW28GMmXyiM6eMNDnoCGQ/pJcz4yjLT5x5X+4S3G+H7DkqZy9
 ncBzAaSShluW3QQ57nvj4kLJf551aM4s+fA8ENHBSKRt94LMv8fkO6EIDmjfQXyU8JZw
 +wUQ==
X-Gm-Message-State: AOAM530IiqHJ05objx9soPVuExUv1x1INaqOkExpyT+5Kz3V7+7lHxUf
 0GpTit4goLWJTV6ch0SlrxdeHw==
X-Google-Smtp-Source: ABdhPJxPM12ZstDgVxoYBHxk82151pQJAQmNVhmoYZsfK0Mqyie3V0JsHqPSQ/xeYWdFvDP8ZaVUtw==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr8484824wmh.99.1613745991111;
 Fri, 19 Feb 2021 06:46:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/44] hw/misc/iotkit-sysctl: Handle CPU_WAIT,
 NMI_ENABLE for SSE-300
Date: Fri, 19 Feb 2021 14:45:47 +0000
Message-Id: <20210219144617.4782-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the SSE-300 the CPU_WAIT and NMI_ENABLE registers have
moved offsets, so they are now where the SSE-200's WICCTRL
and EWCTRL were. The SSE-300 does not have WICCTLR or EWCTRL
at all, and the old offsets are reserved:

 Offset    SSE-200      SSE-300
-----------------------------------
 0x118     CPUWAIT      reserved
 0x118     NMI_ENABLE   reserved
 0x120     WICCTRL      CPUWAIT
 0x124     EWCTRL       NMI_ENABLE

Handle this reshuffle, and the fact that SSE-300 has only
one CPU and so only one active bit in CPUWAIT.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/iotkit-sysctl.c | 88 +++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 12 deletions(-)

diff --git a/hw/misc/iotkit-sysctl.c b/hw/misc/iotkit-sysctl.c
index 7f8608c814c..54004bebcbf 100644
--- a/hw/misc/iotkit-sysctl.c
+++ b/hw/misc/iotkit-sysctl.c
@@ -172,7 +172,17 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         }
         break;
     case A_CPUWAIT:
-        r = s->cpuwait;
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            r = s->cpuwait;
+            break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this is reserved (for INITSVTOR2) */
+            goto bad_offset;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_NMI_ENABLE:
         switch (s->sse_version) {
@@ -183,12 +193,26 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->nmi_enable;
             break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this is reserved (for INITSVTOR3) */
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
         break;
     case A_WICCTRL:
-        r = s->wicctrl;
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            r = s->wicctrl;
+            break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this offset is CPUWAIT */
+            r = s->cpuwait;
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_EWCTRL:
         switch (s->sse_version) {
@@ -197,6 +221,10 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
         case ARMSSE_SSE200:
             r = s->ewctrl;
             break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this offset is is NMI_ENABLE */
+            r = s->nmi_enable;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -279,6 +307,21 @@ static uint64_t iotkit_sysctl_read(void *opaque, hwaddr offset,
     return r;
 }
 
+static void cpuwait_write(IoTKitSysCtl *s, uint32_t value)
+{
+    int num_cpus = (s->sse_version == ARMSSE_SSE300) ? 1 : 2;
+    int i;
+
+    for (i = 0; i < num_cpus; i++) {
+        uint32_t mask = 1 << i;
+        if ((s->cpuwait & mask) && !(value & mask)) {
+            /* Powering up CPU 0 */
+            arm_set_cpu_on_and_reset(i);
+        }
+    }
+    s->cpuwait = value;
+}
+
 static void iotkit_sysctl_write(void *opaque, hwaddr offset,
                                  uint64_t value, unsigned size)
 {
@@ -319,19 +362,32 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
         set_init_vtor(0, s->initsvtor0);
         break;
     case A_CPUWAIT:
-        if ((s->cpuwait & 1) && !(value & 1)) {
-            /* Powering up CPU 0 */
-            arm_set_cpu_on_and_reset(0);
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            cpuwait_write(s, value);
+            break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this is reserved (for INITSVTOR2) */
+            goto bad_offset;
+        default:
+            g_assert_not_reached();
         }
-        if ((s->cpuwait & 2) && !(value & 2)) {
-            /* Powering up CPU 1 */
-            arm_set_cpu_on_and_reset(1);
-        }
-        s->cpuwait = value;
         break;
     case A_WICCTRL:
-        qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl WICCTRL unimplemented\n");
-        s->wicctrl = value;
+        switch (s->sse_version) {
+        case ARMSSE_IOTKIT:
+        case ARMSSE_SSE200:
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl WICCTRL unimplemented\n");
+            s->wicctrl = value;
+            break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this offset is CPUWAIT */
+            cpuwait_write(s, value);
+            break;
+        default:
+            g_assert_not_reached();
+        }
         break;
     case A_SECDBGSET:
         /* write-1-to-set */
@@ -420,6 +476,11 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl EWCTRL unimplemented\n");
             s->ewctrl = value;
             break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this offset is is NMI_ENABLE */
+            qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
+            s->nmi_enable = value;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -499,6 +560,9 @@ static void iotkit_sysctl_write(void *opaque, hwaddr offset,
             qemu_log_mask(LOG_UNIMP, "IoTKit SysCtl NMI_ENABLE unimplemented\n");
             s->nmi_enable = value;
             break;
+        case ARMSSE_SSE300:
+            /* In SSE300 this is reserved (for INITSVTOR3) */
+            goto bad_offset;
         default:
             g_assert_not_reached();
         }
-- 
2.20.1


