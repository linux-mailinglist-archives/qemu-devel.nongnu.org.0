Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D390C5E6703
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:25:28 +0200 (CEST)
Received: from localhost ([::1]:40278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obO4s-00056K-Kl
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNez-0001JF-AT
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:41 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNew-0000ve-Fi
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id n10so15930491wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=F+zZe6vtaknwERE4uZ/2QI8HgWfBE9fG1am+Ti0J6hQ=;
 b=sh1B0sy7A5nR4rWv8wHAsP0I4YkNF2xLXwPDofRoKp5jR1ujiAbhUDkLrcL76HbQJ+
 zifdt052qvvY+aJrC9LZ4yVfLK0Utwf+ET1dQGuWpfHb5O2kGaStuF9HV9H/T6Re1ihw
 S8YKSgCPdka3RoflZ+84VzaDTla/oIwjHCChBDKn8VWQVbSU84hyFpyfYIlRMMHHR+0x
 pBXeCt1y9eZR435BlY4nuhYgbIWZHLTKBpW4+b3rPrzl7bkLYeEm6WKWNhPpO/wQpdfo
 r53J+NLl4J4q/SwPRu8Crh/oZdwm+jztt0IRQjG6T6zKVSCiWlYMklfHVAWbP82vpkgJ
 iOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=F+zZe6vtaknwERE4uZ/2QI8HgWfBE9fG1am+Ti0J6hQ=;
 b=U9G8SCTtTkSeG1EX4cYYbILoxqp8XpgheM4GzaBePVAGZbITRGQFNQJj5fo2oiGGMb
 2tzc7hveVTeq54Xz6DtbI3wUFUBRQlrfdBLhWDTpxtZr+XYG3sdqg64urPvwp/XuSJ2R
 47YXwc2xFwQPwpNJ5v6SqqBsq0xkFn1jDtXJpUVHkKiz9xYfntnaB/JQECC6A1NIFbnC
 Xy7uKOw0jLPpvplri3soEaHmSszKz9l0OyV2HP88wEgqhvrn2LhlwOTtnsIQXSvr6YRK
 u6SMY9f0Z+KTsheRWqHoZWqENAFrWnYtrGoL3lrQecB0Z9CUBUCs5YUr3EzgwtE7nHID
 2jzg==
X-Gm-Message-State: ACrzQf2VM8eKhBFrytFgloMgWvke61gV0B+JTzgFcihHQFssIRJWQajt
 lRSfdaujM83Cp0Oib+Od6mwlGg==
X-Google-Smtp-Source: AMsMyM6nFZhEaW7c+sBjKo2Mtjd24JrfA3rNg1JIK4UDk0mRHkm02W3v8APRGyA+C2oPaqILGZI5Ug==
X-Received: by 2002:adf:fa88:0:b0:228:6237:d46c with SMTP id
 h8-20020adffa88000000b002286237d46cmr2382382wrr.571.1663858716904; 
 Thu, 22 Sep 2022 07:58:36 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a0560001b8e00b0022afcc11f65sm5203305wru.47.2022.09.22.07.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CF8C1FFBB;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM cores)
Subject: [PATCH  v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
Date: Thu, 22 Sep 2022 15:58:26 +0100
Message-Id: <20220922145832.1934429-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
v2
  - update for new field
  - bool asserts
---
 hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
index 492b2421ab..b58d3c4a95 100644
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
+    g_assert(attrs.requester_is_cpu);
+    g_assert(attrs.cpu_index < s->num_cpu);
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


