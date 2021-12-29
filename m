Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62348480ED5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Dec 2021 03:16:44 +0100 (CET)
Received: from localhost ([::1]:46764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2OWB-00052y-FG
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 21:16:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSe-000240-2r
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:04 -0500
Received: from [2607:f8b0:4864:20::42d] (port=38858
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n2OSc-0001UP-1P
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 21:13:03 -0500
Received: by mail-pf1-x42d.google.com with SMTP id b22so17520133pfb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Dec 2021 18:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6QmhziBsG5pFpMldyIeZwYZC1awxwL5wfWwunsysBLg=;
 b=AULAP8cXv0+NHR1o83OvIQhwBygfaCuT+9lgt9nC5kXF5pmO0VfmEQEphjvIXaOtVh
 3sNXPZOgX5bC0PS7/HjvOrgQ6pN6Esu9M4mcjfesD6IS+4Vj1XZgdfLb/+QkAEq7SxAj
 hJJOHatxOHUgefE9nf6ZgUBmkoo9uvsj3feT84U7QwXZCeHUjxI162kgZYyu0vQK7zHP
 KRLiztgcI/lge47gnd59656yrLhjBJhH3SCRP/178vLpfp0jpmzuxJHbH6m2675TOfQx
 7yIP2TAnPmtvNUY7nAObAED57JvNKv6cVpMBssVn8ciVHa8WukT114Q6YHZXY4WC+pf7
 WqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6QmhziBsG5pFpMldyIeZwYZC1awxwL5wfWwunsysBLg=;
 b=6kyHGxHwA1YtSTNiutwiIMt8dD2PV/sNGFkIGyDuTyM7h1Gn+vJ+6axNxh+uahhl3N
 SOUZ+z3q4vPmHnbBVofGtfC+QkL8UAdJuWfAIJEppKFNiJwFOhnLiKm4vWvsmYbxJ9bl
 o/abCtaRgIseO9n+QcDqux/ygvE6NngVQ+hdd3vB8vNZgsADmVaNI5dKGy39+84KCZF1
 nTpwgz/E2EgDygAnuoOeQ6e2d9J3DDtZBRT1E5g7styHQ/Sq9eqpgrt8ExzNm1sI2YbS
 55Sh0vOHEhBx/HqCL5xSwJXHdcxB3gz5Ih4Hg7OWJOn+puOtuamZA60BlnG2zRDMHpcK
 yI+g==
X-Gm-Message-State: AOAM532aZZW0oNrgqYzb2aCZyqIN0GcJv/fl9IEOSG1HdTBUCDKyO/g+
 L1Ni/nXx4F8rMIruk2EGm0wun6FEWDvhACJo
X-Google-Smtp-Source: ABdhPJzILEo0z8Ar3oP4qNQQz3wddmWm21XKAl6YFJZ/wjPXPf/ooxFA3eFsVsXRVTfwLIjVrkaN5w==
X-Received: by 2002:a05:6a00:1310:b0:4b9:f9b8:1f47 with SMTP id
 j16-20020a056a00131000b004b9f9b81f47mr24629372pfu.25.1640743979473; 
 Tue, 28 Dec 2021 18:12:59 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id k8sm15693975pjs.53.2021.12.28.18.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 18:12:59 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/riscv: rvv-1.0: Call the correct RVF/RVD check
 funtion for widening fp insns
Date: Wed, 29 Dec 2021 10:12:46 +0800
Message-Id: <20211229021250.29804-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211229021250.29804-1-frank.chang@sifive.com>
References: <20211229021250.29804-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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


