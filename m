Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2939A5C4
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:31:21 +0200 (CEST)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqFc-0006lL-Fx
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopl1-0001Wx-Gz
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopky-0007ER-BC
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:43 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so6401484wrv.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=L2jnhOpXcbKctD5AkMO99CRTbMJj/R4Ja+o8LEVjQag=;
 b=E3wWZNyBtVOgvHeqqSPvK5MXLtYDiuoXr6IEtHVQiJupsjsbL7CFYSRw6P1g+cmQY9
 ZkTZnwXXrCrZS2b//9+DPC5DV/2cs8l1Wm6xGVWlh8vcImaDVwpCPEC9dig1LqsrpcR7
 k1doRmJV6jyF3wgnHRYjU2XJqgcYg3Tv1UW52NYz2+rFmodwoCdQyLpaOeHf8nMkuyV6
 bsAwWsrfkLHrX4C4eZzsTOIKqKtkery6poroPID8sGBoVKKrfF5958gpGQFw3TY7Je89
 Yt3N9qH0ehVIEc1b+h4l50GyZguwZVzMhV2HnG2UWmMydfysYmZPcpiRrEupQ12oePHI
 fo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L2jnhOpXcbKctD5AkMO99CRTbMJj/R4Ja+o8LEVjQag=;
 b=MC97ds0Zkb+UGW9sQw0MxbbB4R285WGTAO+fsX4vjhpRD+w7zCkTdx85kDHCaewh46
 fCUfmh8/1ecY63zA/mBQJUalPr1+CI9bLDFIyscOmUXEcbMqKAXX27i4QkwzzCoaz4j2
 j+49QLWdZv740NehqJ6O2KBBa+DrrRD+n2H6auVRhp9yQ7YVKBqPv6eP/j1vs5SgXgbE
 WjSuquNVV0leGfChUPBmvd/kd+hHTy5M0P9n/gG9GjRqE+YgIO0xkL7Jlhg2ylK4hcFU
 /QD8tN4yWmXRAWGXhYR3W7XP3xf+SfTyiW/S7xRj/zU56k/npPwn1nhnXrYeU5HTUDkx
 tgOg==
X-Gm-Message-State: AOAM530F5LCbTMwO+IJogo11HW6p8iuZ0xm/GN0rPDUyMIPzLOl81rHc
 OjksN35slcR0v5DsPhetwJzqks7tsHxPFQHc
X-Google-Smtp-Source: ABdhPJxFBLNIsmlNcYhCAm758FumKuw2d8RUouKGslF47DIuI2YhDfXQvDtdCoLGaQV4AC8QYq7zJA==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr616670wrm.177.1622735979035;
 Thu, 03 Jun 2021 08:59:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] hvf: Move hvf internal definitions into common header
Date: Thu,  3 Jun 2021 16:58:50 +0100
Message-Id: <20210603155904.26021-32-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Alexander Graf <agraf@csgraf.de>

Until now, Hypervisor.framework has only been available on x86_64 systems.
With Apple Silicon shipping now, it extends its reach to aarch64. To
prepare for support for multiple architectures, let's start moving common
code out into its own accel directory.

This patch moves a few internal struct and constant defines over.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Sergio Lopez <slp@redhat.com>
Message-id: 20210519202253.76782-5-agraf@csgraf.de
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hvf_int.h   | 30 ++++++++++++++++++++++++++++++
 target/i386/hvf/hvf-i386.h | 31 +------------------------------
 2 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 4c657b054c1..ef84a24dd96 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -13,6 +13,36 @@
 
 #include <Hypervisor/hv.h>
 
+/* hvf_slot flags */
+#define HVF_SLOT_LOG (1 << 0)
+
+typedef struct hvf_slot {
+    uint64_t start;
+    uint64_t size;
+    uint8_t *mem;
+    int slot_id;
+    uint32_t flags;
+    MemoryRegion *region;
+} hvf_slot;
+
+typedef struct hvf_vcpu_caps {
+    uint64_t vmx_cap_pinbased;
+    uint64_t vmx_cap_procbased;
+    uint64_t vmx_cap_procbased2;
+    uint64_t vmx_cap_entry;
+    uint64_t vmx_cap_exit;
+    uint64_t vmx_cap_preemption_timer;
+} hvf_vcpu_caps;
+
+struct HVFState {
+    AccelState parent;
+    hvf_slot slots[32];
+    int num_slots;
+
+    hvf_vcpu_caps *hvf_caps;
+};
+extern HVFState *hvf_state;
+
 void hvf_set_phys_mem(MemoryRegionSection *, bool);
 void assert_hvf_ok(hv_return_t ret);
 hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
diff --git a/target/i386/hvf/hvf-i386.h b/target/i386/hvf/hvf-i386.h
index 94e5c788c48..76e9235524c 100644
--- a/target/i386/hvf/hvf-i386.h
+++ b/target/i386/hvf/hvf-i386.h
@@ -18,39 +18,10 @@
 
 #include "qemu/accel.h"
 #include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
 #include "cpu.h"
 #include "x86.h"
 
-/* hvf_slot flags */
-#define HVF_SLOT_LOG (1 << 0)
-
-typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;
-    uint8_t *mem;
-    int slot_id;
-    uint32_t flags;
-    MemoryRegion *region;
-} hvf_slot;
-
-typedef struct hvf_vcpu_caps {
-    uint64_t vmx_cap_pinbased;
-    uint64_t vmx_cap_procbased;
-    uint64_t vmx_cap_procbased2;
-    uint64_t vmx_cap_entry;
-    uint64_t vmx_cap_exit;
-    uint64_t vmx_cap_preemption_timer;
-} hvf_vcpu_caps;
-
-struct HVFState {
-    AccelState parent;
-    hvf_slot slots[32];
-    int num_slots;
-
-    hvf_vcpu_caps *hvf_caps;
-};
-extern HVFState *hvf_state;
-
 void hvf_handle_io(CPUArchState *, uint16_t, void *, int, int, int);
 
 #ifdef NEED_CPU_H
-- 
2.20.1


