Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C132B2F2CF0
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:35:38 +0100 (CET)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzH1V-0006GC-PM
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:35:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCv-0005ve-M7
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:21 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCp-00087N-GW
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:19 -0500
Received: by mail-pj1-x1036.google.com with SMTP id iq13so1255790pjb.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=g4Yls9WlZWytmjrs6WK5pK2relced9exxP+C+DIiR3ydvQP/AFmJQs/Q1FxBmT8Wvb
 KCRnkR4+8oI+AoNH635irpmtZoLJe0w/WTeGc7rSxRjDw8/akfsXkD+BPO+BHz50+Mem
 6GHxgq7GrEw7gMqxkJNqt/Puwh4H4whym2l/1hXpwDaymJRiPP40tw3ni5t+SPYjqLyW
 CBII8dbYu+CbzpDObgn+IvJIfI96pKdN9jMKY4+HNO+zaWTyw5Th8xae+0sA9vxbYcDR
 2+JO6Va0ATcnuS304BuoI1eq8bakSxJyG+vEeedxNWIGsQ27oLGn6DkzWiXGepd51HHV
 X/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=EdpoATOfRLImAVi/HFHKoWQ3O8pIvVDA22vVgQy4DTHl8d1rk4TVJrHjVQQqNo8+4P
 JG4gn+1byA67o58pvqBTwu03XDTuNAN9z0lhdl3mFqAM46aj1YWamkkDjDRiZiwnrJkH
 IQ+g6fAPb12h2Ea+Xe+7H9FGiflOw3spPZrgBBkeAwVfoIlLTOvxoRIrNT4gdOSqttmx
 LU6HDPU2wOBhxBkJwJCLKZCMfsxEkDp/M9TK/hyU3Sy0QB3Qu6R/a+pB8JKbOAiRwgVS
 eyHjDzFr/zYhhcgm8og7dH+TReqKOGY7m2p6vygNEU3ftq4ONSLZkroH52OhXmdcrzJE
 xlTQ==
X-Gm-Message-State: AOAM530M0Xcx4twL4PrrV5uJeZDRTZKVd6JJ7SJwmrAw4eR67lhdcSEF
 bb5AC/K3Nrep+K9ZELmkLisuTZ+gIID/rBp0
X-Google-Smtp-Source: ABdhPJyzKknNlUzYrK9SUo4X+EItWnzTh0ZrNAEfs2lH7ImCdku2ZkynQmwi/r8JQusxaV8uorRraA==
X-Received: by 2002:a17:902:ff0a:b029:de:1d1f:8558 with SMTP id
 f10-20020a170902ff0ab02900de1d1f8558mr1777966plj.85.1610444593615; 
 Tue, 12 Jan 2021 01:43:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 47/72] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Tue, 12 Jan 2021 17:39:21 +0800
Message-Id: <20210112093950.17530-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1036.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 5622fb23f85..93ed6f54e99 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3919,7 +3919,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3931,9 +3930,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3946,7 +3942,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3957,9 +3952,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.17.1


