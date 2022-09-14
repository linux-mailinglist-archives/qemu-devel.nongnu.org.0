Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3B5B8D9C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:55:49 +0200 (CEST)
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVfw-0002oO-Pq
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxj-0005lO-A1
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:12 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:35444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxe-0004PI-Li
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:05 -0400
Received: by mail-wr1-x435.google.com with SMTP id bz13so26496404wrb.2
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=GVr9W2EvQrzSJqGSBV+Z7b6JdNyGZ1lSF1Vl2i4FAiA=;
 b=DB87SMj0H3G5KcYfniOmice61S8e+DttWx3ge9vzvta3YpThQs91z1P23bf3+1BHkE
 /fc0287e03/EzTjFj+GLuaBU0YhO+yVZTbEi5v63L6N3yXfcMRYvBjf0Rrgw08rusBTt
 azj34x8P4kBe1VBYB/LVGL2CbbSA69NUgpK35YvT3lcY6lHa+zUcqu6Mf+S0IzM3q/+c
 Asb3zQcH1jIRqu2Qed5JEvswEwFb8G4zPc76KKtP4TDFvTOwaLj1kSTAGUckhKLNY8Ab
 nkru2P1pyaMLLDJw18hEokN/1KHSZRhidPwLKLjKlXbRGfSiESNzYQ5EFOtNYX3tVOBl
 0nGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GVr9W2EvQrzSJqGSBV+Z7b6JdNyGZ1lSF1Vl2i4FAiA=;
 b=ZlAczNhnSBvanAzpEYfw4HqpAcPZnB5N3wHLX5F9OU5foLmDvS+MsbzCsj7cfmJa69
 VfDkGN04M5BOOIorBVUr2KYaolB167tT2e2mGnGP23jNCJ9FbQldOl9oLbyiasgPgp99
 lQ1Pn8iAmU8e9vIcKE16GjnJxiibK2A/jzYMfVt2wRF31bvI+HkfpZwA9h4ojer1aIR9
 L+OsscqLD2OrNpnYGMH9vb0+nxMS7CD2P/4cD+nZmfXGNWkO+N7XJZ3mpOBv8B3SzAaY
 31kMSKv9wYaD+FA0K8KA7xdaAaKb8Zky4SZ4fz93Oc9stAU0fz4XhJXwFiHRVXHYjlYx
 niqg==
X-Gm-Message-State: ACgBeo0QCrFex0lyr5uA/2JEUCPkkfWdx8fHJrEUvwx4SYTjTwpc3ZbL
 u8PZpLh6xPr+DwOebatkCiDf3FVa4u9VDS6I
X-Google-Smtp-Source: AA6agR6sGPhAhftOhCg51tnvwbrERkXuvT9wBINDd4VtGe0/R813VtyHP0/uGyBBD+6ZtliQLrpDWQ==
X-Received: by 2002:a5d:6301:0:b0:226:d87b:b55c with SMTP id
 i1-20020a5d6301000000b00226d87bb55cmr20824981wru.560.1663171797713; 
 Wed, 14 Sep 2022 09:09:57 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l10-20020adfe58a000000b0022863395912sm13314406wrm.53.2022.09.14.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AEBB1FFBB;
 Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RFC PATCH  3/4] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Wed, 14 Sep 2022 17:09:54 +0100
Message-Id: <20220914160955.812151-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914160955.812151-1-alex.bennee@linaro.org>
References: <20220914160955.812151-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that MxTxAttrs encodes a CPU we should use that to figure it out.
This solves edge cases like accessing via gdbstub or qtest.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
---
 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..7feedac735 100644
--- a/hw/intc/arm_gic.c
+++ b/hw/intc/arm_gic.c
@@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] = {
     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, 0xb1
 };
 
-static inline int gic_get_current_cpu(GICState *s)
+static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
 {
-    if (!qtest_enabled() && s->num_cpu > 1) {
-        return current_cpu->cpu_index;
-    }
-    return 0;
+    /*
+     * Something other than a CPU accessing the GIC would be a bug as
+     * would a CPU index higher than the GICState expects to be
+     * handling
+     */
+    g_assert(attrs.requester_cpu == 1);
+    g_assert(attrs.requester_id < s->num_cpu);
+
+    return attrs.requester_id;
 }
 
-static inline int gic_get_current_vcpu(GICState *s)
+static inline int gic_get_current_vcpu(GICState *s, MemTxAttrs attrs)
 {
-    return gic_get_current_cpu(s) + GIC_NCPU;
+    return gic_get_current_cpu(s, attrs) + GIC_NCPU;
 }
 
 /* Return true if this GIC config has interrupt groups, which is
@@ -951,7 +956,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
     int cm;
     int mask;
 
-    cpu = gic_get_current_cpu(s);
+    cpu = gic_get_current_cpu(s, attrs);
     cm = 1 << cpu;
     if (offset < 0x100) {
         if (offset == 0) {      /* GICD_CTLR */
@@ -1182,7 +1187,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
     int i;
     int cpu;
 
-    cpu = gic_get_current_cpu(s);
+    cpu = gic_get_current_cpu(s, attrs);
     if (offset < 0x100) {
         if (offset == 0) {
             if (s->security_extn && !attrs.secure) {
@@ -1476,7 +1481,7 @@ static void gic_dist_writel(void *opaque, hwaddr offset,
         int mask;
         int target_cpu;
 
-        cpu = gic_get_current_cpu(s);
+        cpu = gic_get_current_cpu(s, attrs);
         irq = value & 0xf;
         switch ((value >> 24) & 3) {
         case 0:
@@ -1780,7 +1785,7 @@ static MemTxResult gic_thiscpu_read(void *opaque, hwaddr addr, uint64_t *data,
                                     unsigned size, MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    return gic_cpu_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
@@ -1788,7 +1793,7 @@ static MemTxResult gic_thiscpu_write(void *opaque, hwaddr addr,
                                      MemTxAttrs attrs)
 {
     GICState *s = (GICState *)opaque;
-    return gic_cpu_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    return gic_cpu_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 /* Wrappers to read/write the GIC CPU interface for a specific CPU.
@@ -1818,7 +1823,7 @@ static MemTxResult gic_thisvcpu_read(void *opaque, hwaddr addr, uint64_t *data,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_cpu_read(s, gic_get_current_vcpu(s), addr, data, attrs);
+    return gic_cpu_read(s, gic_get_current_vcpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
@@ -1827,7 +1832,7 @@ static MemTxResult gic_thisvcpu_write(void *opaque, hwaddr addr,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_cpu_write(s, gic_get_current_vcpu(s), addr, value, attrs);
+    return gic_cpu_write(s, gic_get_current_vcpu(s, attrs), addr, value, attrs);
 }
 
 static uint32_t gic_compute_eisr(GICState *s, int cpu, int lr_start)
@@ -1860,7 +1865,7 @@ static uint32_t gic_compute_elrsr(GICState *s, int cpu, int lr_start)
 
 static void gic_vmcr_write(GICState *s, uint32_t value, MemTxAttrs attrs)
 {
-    int vcpu = gic_get_current_vcpu(s);
+    int vcpu = gic_get_current_vcpu(s, attrs);
     uint32_t ctlr;
     uint32_t abpr;
     uint32_t bpr;
@@ -1995,7 +2000,7 @@ static MemTxResult gic_thiscpu_hyp_read(void *opaque, hwaddr addr, uint64_t *dat
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_hyp_read(s, gic_get_current_cpu(s), addr, data, attrs);
+    return gic_hyp_read(s, gic_get_current_cpu(s, attrs), addr, data, attrs);
 }
 
 static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
@@ -2004,7 +2009,7 @@ static MemTxResult gic_thiscpu_hyp_write(void *opaque, hwaddr addr,
 {
     GICState *s = (GICState *)opaque;
 
-    return gic_hyp_write(s, gic_get_current_cpu(s), addr, value, attrs);
+    return gic_hyp_write(s, gic_get_current_cpu(s, attrs), addr, value, attrs);
 }
 
 static MemTxResult gic_do_hyp_read(void *opaque, hwaddr addr, uint64_t *data,
-- 
2.34.1


