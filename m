Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AF5480ED8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:17:00 +0100 (CET)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2OWQ-0005M5-I9
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:16:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSh-00026Q-9S
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:07 -0500
Received: from [2607:f8b0:4864:20::431] (port=41511
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSe-0001W8-H9
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:07 -0500
Received: by mail-pf1-x431.google.com with SMTP id m1so17528571pfk.8
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsGHGTeIg5V51/RNv1WbNiNM59nEQ3ZssuqWKV70IPU=;
 b=ShIWO7bIV4tirLg4t8iKJ7+O9ktl5KQ7pOGUEjwkT/IXAyVO48cqRpDBlFOYhxd0gn
 ehIsaod2VumI2LWVda7RMpSKs+6NpH7EAEK8G88tt/I6RyvzcA/MRqO2e4djjhOmYFJV
 SODLpWjjXM7ze6Yd6C1SF/9dGoDvvwZhF4vcd+JVO/4T4MbGKF8/SEm96cjj3hC5R2up
 vm0fQSVLgs7o7SuG9rmcszCn41N68yRrGDnw2DKOvGyGD6qbKNrBA5v1GYDGd4fKFHVM
 CWVOrzISdYSp4WEDHSarWCCQZfWKon4qxGBP0HWh8ydK3bHpQJ0xzXIWM0anW1ISu4vh
 Cn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsGHGTeIg5V51/RNv1WbNiNM59nEQ3ZssuqWKV70IPU=;
 b=Kfd8tHqgCyG0Syoa0iGftqjqty9cBT8cCKA0F64LUHMZ2Y6zs8GqoG6AWVmXl9xIfc
 POvVonLLe+QYiIQy08Rq01YWrykh+NjFjM3MPGBuxTFJGGZ8Jwcj+Cde6Foxlg/re3tM
 Tepd5HjFVLtJLNAtJHlxuX9JfEse2JQPOjBjkMXKHUM/eTeAMCYsgSZZHulfoNeBzt00
 vVlZ8dpLCGrAg6OaC7IQPC9594FJRiCUdxza1zIRuTuJTUXk6mc9Fk7dy5bRgTj2QiGR
 yFtx1VM6TiZafYhR8JPSvVkizMkDt2NQIrt4NxQBWB2uwpgo0yhZXz9GbH7hHedd+1hN
 F1UA==
X-Gm-Message-State: AOAM533o77Fu4fm5BooB8k+5ew0Y7WmzNl8+edCJm+lKr6KHiDvoQoCt
 bPtkrkL5JWnuDrtXXWH8W5uLtq/6Qio5ODZM
X-Google-Smtp-Source: ABdhPJyHx165h0wqM66eLzo0ccOzqbRDzAMQ3U46B5nLyGPd7VtPyWasAdw7NHULJmaA2Aq6+rMAAw==
X-Received: by 2002:a63:d446:: with SMTP id i6mr21835794pgj.479.1640743983101; 
 Tue, 28 Dec 2021 18:13:03 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:13:02 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 funtion for widening fp/int type-convert insns
Date: Wed, 29 Dec 2021 10:12:47 +0800
Message-Id: <20211229021250.29804-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229021250.29804-1-frank.chang@sifive.com>
References: <20211229021250.29804-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

vfwcvt.xu.f.v, vfwcvt.x.f.v, vfwcvt.rtz.xu.f.v and vfwcvt.rtz.x.f.v
convert single-width floating-point to double-width integer.
Therefore, should use require_rvf() to check whether RVF/RVD is enabled.

vfwcvt.f.xu.v, vfwcvt.f.x.v convert single-width integer to double-width
floating-point, and vfwcvt.f.f.v convert double-width floating-point to
single-width floating-point. Therefore, should use require_scale_rvf() to
check whether RVF/RVD is enabled.
---
 target/riscv/insn_trans/trans_rvv.c.inc | 34 ++++++++++++++++++-------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 8d92243f2b..f1b44ccad2 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2613,16 +2613,27 @@ GEN_OPFV_CVT_TRANS(vfcvt_rtz_x_f_v, vfcvt_x_f_v, RISCV_FRM_RTZ)
 static bool opfv_widen_check(DisasContext *s, arg_rmr *a)
 {
     return require_rvv(s) &&
-           require_scale_rvf(s) &&
-           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
 
-#define GEN_OPFV_WIDEN_TRANS(NAME, HELPER, FRM)                    \
+static bool opxfv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_widen_check(s, a) &&
+           require_rvf(s);
+}
+
+static bool opffv_widen_check(DisasContext *s, arg_rmr *a)
+{
+    return opfv_widen_check(s, a) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8);
+}
+
+#define GEN_OPFV_WIDEN_TRANS(NAME, CHECK, HELPER, FRM)             \
 static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
 {                                                                  \
-    if (opfv_widen_check(s, a)) {                                  \
+    if (CHECK(s, a)) {                                             \
         if (FRM != RISCV_FRM_DYN) {                                \
             gen_set_rm(s, RISCV_FRM_DYN);                          \
         }                                                          \
@@ -2649,12 +2660,17 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
     return false;                                                  \
 }
 
-GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_DYN)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, vfwcvt_x_f_v, RISCV_FRM_DYN)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, vfwcvt_f_f_v, RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v,
+                     RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
+                     RISCV_FRM_DYN)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_f_f_v, opffv_widen_check, vfwcvt_f_f_v,
+                     RISCV_FRM_DYN)
 /* Reuse the helper functions from vfwcvt.xu.f.v and vfwcvt.x.f.v */
-GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, vfwcvt_xu_f_v, RISCV_FRM_RTZ)
-GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, vfwcvt_x_f_v, RISCV_FRM_RTZ)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_xu_f_v, opxfv_widen_check, vfwcvt_xu_f_v,
+                     RISCV_FRM_RTZ)
+GEN_OPFV_WIDEN_TRANS(vfwcvt_rtz_x_f_v, opxfv_widen_check, vfwcvt_x_f_v,
+                     RISCV_FRM_RTZ)
 
 static bool opfxv_widen_check(DisasContext *s, arg_rmr *a)
 {
-- 
2.31.1


