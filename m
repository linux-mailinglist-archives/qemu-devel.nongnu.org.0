Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C697484C76
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 03:28:01 +0100 (CET)
Received: from localhost ([::1]:43976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4w1w-0004v2-MF
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 21:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vx5-0001Ha-1n
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:23:01 -0500
Received: from [2607:f8b0:4864:20::1036] (port=38893
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n4vx3-0005Xs-4r
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 21:22:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so1824593pjf.3
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 18:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=myqKEKIIilGrtf+5BHRfjIFtKgmbKL8Q3XQqV6+1lbc=;
 b=B3EJxETK40jraOqTPZq98FJjmBIG9PDXOB8rXIYEoLdLEW5HyOezuxfSzE0qiar2Tw
 iLvf18FXBMo2CUQKb2czO6yLl3ffZHSIlLJIFn0GvkKBf6e2rxU5uulyraB4LBWYrj9Y
 2q96Ach/yEbkEToJUMC+pHQTu7cfV6aukdTgEnmqHt42xhW4X3HPwBJZmK8Ct5oK/mp9
 h9kbUwtUb333a6EM42ef8uRrv88UW6lLtGBV4484gjcxWGhHt+ZR+TkOyLh4bT/6O5AH
 wU28A25hNhPHEXMSUXRlPXd2pg/W3vWMXtGrlvKMXFpeN3WnDmng9iBtfyCyYsxrqkjD
 erwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myqKEKIIilGrtf+5BHRfjIFtKgmbKL8Q3XQqV6+1lbc=;
 b=p6q2pMRrX2TJnPClL87HST2eYcbLFH5fw2wdCWcZspz2fXCBxfYvmxfppYU8eM+nMY
 pD9VWz0tKFHqZWdJQpXhlVx7PyoHJVa/RabhudObv4ISqxhJmC3R8167q5RpRYMOsuRc
 bo9QKKKM4em4/uVIUhcsebi9M2X60AR4IwNKEUG/MBT0R8xFFgiVUswwSnajQrobRDDv
 KQUIZurzR/UuBLqVoD5nBNAshsEDMVo51zbEwZO7OWH9ZcoWN6pNvAg2OE/tpliY9VJB
 UU2QHKB780Z9bqSgX3tCUb1ynWYoyEALrk8Lss/QKNUYmCEIz97z/NLakBg8S72z6NkF
 ieqw==
X-Gm-Message-State: AOAM532ulzELmNHZXgATdFK3+0dvcJlwlvYEQbBTNKlbQIjrKT0AujUe
 idOAsCHY1+iDxOaP8ARDa24jLQdp9BRBqQ==
X-Google-Smtp-Source: ABdhPJzifhy90jSzKgBKIipm7n/E9mHYnUGXdlHxJjO14C5PQaQROzEo+UhoClBlcCxlH90Ih4dzxg==
X-Received: by 2002:a17:90b:8d:: with SMTP id
 bb13mr1538344pjb.156.1641349375703; 
 Tue, 04 Jan 2022 18:22:55 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id x19sm193593pgi.19.2022.01.04.18.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 18:22:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 function for widening fp insns
Date: Wed,  5 Jan 2022 10:22:44 +0800
Message-Id: <20220105022247.21131-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105022247.21131-1-frank.chang@sifive.com>
References: <20220105022247.21131-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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

Vector widening floating-point instructions should use
require_scale_rvf() instead of require_rvf() to check whether RVF/RVD is
enabled.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5e3f7fdb77..8d92243f2b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2254,7 +2254,8 @@ GEN_OPFVF_TRANS(vfrsub_vf,  opfvf_check)
 static bool opfvv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dss(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2292,7 +2293,8 @@ GEN_OPFVV_WIDEN_TRANS(vfwsub_vv, opfvv_widen_check)
 static bool opfvf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_ds(s, a->rd, a->rs2, a->vm);
 }
@@ -2321,7 +2323,8 @@ GEN_OPFVF_WIDEN_TRANS(vfwsub_vf)
 static bool opfwv_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dds(s, a->rd, a->rs1, a->rs2, a->vm);
 }
@@ -2359,7 +2362,8 @@ GEN_OPFWV_WIDEN_TRANS(vfwsub_wv)
 static bool opfwf_widen_check(DisasContext *s, arg_rmrr *a)
 {
     return require_rvv(s) &&
-           require_rvf(s) &&
+           require_scale_rvf(s) &&
+           (s->sew != MO_8) &&
            vext_check_isa_ill(s) &&
            vext_check_dd(s, a->rd, a->rs2, a->vm);
 }
-- 
2.31.1


