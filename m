Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ED9484C74
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:27:26 +0100 (CET)
Received: from localhost ([::1]:42932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4w1N-0004CA-Lo
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:27:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vxG-0001Lo-NU
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:23:12 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37444
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vxF-0005YX-8D
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:23:10 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 y16-20020a17090a6c9000b001b13ffaa625so1857511pjj.2
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 18:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCr1OXLLj1AnANQae2OL1jralQRJuDCEr6CZgNDTrlY=;
 b=CPRvkwP5HdSv78oBDKFFoz9g0k7vp5ugMuVqzc1xfmTnpY2whzAwNWJn52SBTIsKAI
 /Vpm/K0vXYIXPqzUbK/hLXYI9CJSRgJGn6398O12ItjAqSwjGp0MJnemJyfi70MNPpC3
 rJYeUsw/Dez+U/d1pcouhVRXh+0k4WOKG7vmBT4CcMjol8Uv5vgpC9/bqkyDw3rjlsKX
 I7qMzQMYJG94QGOvnXMxuqnWA//q4G9HLP4skrfPCq88O52xfLaYplvdX30eEIfaasm5
 Ph0szTwPDqm/CLTSaglMJmtx0X6ghZKW3n7OqY2QxRpixCbeua05GiVQUI3bVdrY8j8d
 26xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCr1OXLLj1AnANQae2OL1jralQRJuDCEr6CZgNDTrlY=;
 b=jYzfD2wkPu7V8nCMLDgjf0xAvV3bqB0hKsZFnlTZeoHmtnc7saMCwZ616W3WkOXIZr
 ZTzMLpNuZsrOLFNEVChol/vaNjQGlQFx7mbfp6Z0vyu1G3GF+sMUmvuKM6fxuJlPdNJp
 GFQuEq85qjlvaemjgnmcjVItswbXzG0/apkPXSngyVMKnpX+KbWsGkvkR67l6GZpuLsM
 alNb2ml3YKG+8ee5rPUDNgryLG6CdgIC0UnU6wm++UIMNaTkWhZrqm0sjaVO3E+FDZKG
 JXLJOeS2JiaKt17EaXamKJkZoXKH8Ujtcq4gqWt+r027ZFsQiUxU++isc1pSzKKu5ScO
 khDQ==
X-Gm-Message-State: AOAM530H8Mng+qedo9B4Cyr/0qUoxA/OA+GK1MyuWclp386+eB31bVdn
 GRCFBiiUMlUjVF0PYao1cD8KbrmawzWAIg==
X-Google-Smtp-Source: ABdhPJwQK+WUYhQDNlkqJqJVCVzMhqXgehOQz+NY7Re9NXCs5d6iR2BdJ2O6YjYig9QFBWfS0cmPcg==
X-Received: by 2002:a17:90a:7023:: with SMTP id
 f32mr1540939pjk.226.1641349380775; 
 Tue, 04 Jan 2022 18:23:00 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x19sm193593pgi.19.2022.01.04.18.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 18:23:00 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for widening fp/int type-convert insns
Date: Wed,  5 Jan 2022 10:22:45 +0800
Message-Id: <20220105022247.21131-3-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105022247.21131-1-frank.chang@sifive.com>
References: <20220105022247.21131-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Frank Chang <frank.chang@sifive.com>
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


