Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C228325C2C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:54:14 +0100 (CET)
Received: from localhost ([::1]:51930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUCj-0002YP-1s
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjB-0001Yx-LG
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:41 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjA-0002EC-5g
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:41 -0500
Received: by mail-pj1-x102c.google.com with SMTP id b15so5195597pjb.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=VBxQgvJ25FGw5sgX3NKQetq3Fz1iHVWZcRR/NFtbzRrrxvRAan9JHuJNgWnLEW7TM2
 hFu8C9brm4EKtPMPcSBm5pQzmUeLaXpieLqtj9mzu4tOb+0lve9THZwCy8jC0tZwbYgP
 mH/7tm1oZZT/AMG2Y6PqpsWqAe71ltDg95MS0n4GBy7fgsuMdVFdLBEJo90ISQUJ34Ju
 bw1ulOEH+qHOdP14cKdHs2jvwfgavdSW3qDrsdF3xuNmlUQXmuNNfXuILejr+tOa2kMM
 nWQgTEY6Rfkwt4HhhY72lnbgYQzXrFDJ8+4NyKN/pkTDoI/ypAfbR0+VNuqlp8+IT8f8
 EqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gykx41DpV2pVnOdp84JCzzJ8Ntv56iQ412atWoTAuT0=;
 b=sk8vtSdVsDbzeqJU74Z8jc8GmdsFivuvNm/uHlpdQe6UiVVQ43LjBGxeZFDQDfujwH
 hH2eyZX9eLxIni3FObhq5s2jNr8SV08ALDuedYcTQFqqkZK5VlmxZFFGzXRMnktItj7M
 bIu+6SN4iS5mlrc0Tm52g+fFhHcUL+QCb421P8RVhgoEbJ5Kl9GVnHZVkMaAiOuSUCiu
 sWWxB/m0QDa3qHGs1WXi+//D7bM7aKBzeyaAL/stcHRQL9ADdZFqAVPYn25YGSORHEvT
 spzvPeeyjbZM6WVTTGws+/6K/rzJi6mAFincmJcql6WJx5/VQYiHVeeJD6/Wv1CQ0OoR
 fGDg==
X-Gm-Message-State: AOAM532+7c/j7UVDxQ6YkquNzW81B0Ry7c39RDMBqq3rdTkBKWwBhyn7
 Za4gnRmCV23no8MkMCZfAR5mHwbvdPgqwQ==
X-Google-Smtp-Source: ABdhPJx0tjmaqkt5laJi35uuo11e31vcu41U86b7GDBB+dWCEbBy9XZD+wFkDONbeSq78T4G8aI9IA==
X-Received: by 2002:a17:902:8209:b029:e3:2c17:73a9 with SMTP id
 x9-20020a1709028209b02900e32c1773a9mr1004106pln.23.1614309818740; 
 Thu, 25 Feb 2021 19:23:38 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:38 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 47/75] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Fri, 26 Feb 2021 11:18:31 +0800
Message-Id: <20210226031902.23656-48-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


