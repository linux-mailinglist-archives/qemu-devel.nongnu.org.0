Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F81143FA47
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:53:58 +0200 (CEST)
Received: from localhost ([::1]:34578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOaD-0002uB-5F
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNma-0007JK-Cu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:40 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:45804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmX-0006DE-TP
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:40 -0400
Received: by mail-pl1-x62a.google.com with SMTP id f8so6390564plo.12
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=WA+hg3r15Z0oweJOpcJKOk1j3itsdTfxkPw8MbKbR1I+X6M7A9S01aCcMlp6H26Kv5
 BFjOJk0SN2m1pc/AZEKG3XQuxuRFmY2Ddnlrcw2WrjGsLGy343HrIejrgAkTfLJLUIK5
 2M8RfpOoaYhDE1qtuRXfXtGydM4ntLkcWTR2BLywQQw9/nz8CsggEx1PHp8YkJl32L9x
 TSTlyvNL4CoCCz89Utl4VleWM3lXrlYdNLZk8EQ/5W/EqeUAJUK05py8mLjtetJyuEja
 oaC31rBahxw7qagv5S6D+TohgnEy/0yKYO8jzH3eG8oNrx79hdlh0zCFqIGfJgSbp4GI
 JWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YE6GU3EgdqLfh6XtDoPgH6ClC3r3aGQSWUDP080hnKE=;
 b=TPG9rpvPFBJorwgorfcbmKZs/cxMbl4Nw7EttJsGp38haRixrOoGvgrBkJg9+KatxP
 TlAEoBMUg++4Y9P+IHWdIe8gKdep3kLhOEnD/wO5zMyDFqyYgRtEtsLomNTJQmO640EP
 ghFItjqwtSqvv1XmF5+Pln4V6amC4iwQ3F2JJCsf0rMV9deFqutYzO3W7OSmfp0sBF9N
 rshc9Hoan9Ww26g6Ydffoj2HWN5seWcLDUE+8cqYcKh28EuJ0CNubINiMYlYXkpBXYVd
 PZaOxaTVEG+scCNLMz9WmC2N70uvl1QKz3hgVNCM34TIITOyjbW9WR81FKK+AAynLTdb
 gwng==
X-Gm-Message-State: AOAM533yExam2tsEh5ihm6MZ8RekcEsc9MMNtj9xRJFRb6VstzgMbX+E
 EnkD1TVuXzXqR3t4q18SPglip6GGe0I0dkG8
X-Google-Smtp-Source: ABdhPJzfhVdWPKr8w6dNp2pvFUGH4NsIQAe6lmsi1GuP0BQmRIentXaYWl2YDbmWFL1VttPdGj08pQ==
X-Received: by 2002:a17:90b:4ad0:: with SMTP id
 mh16mr10201017pjb.2.1635498156477; 
 Fri, 29 Oct 2021 02:02:36 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:36 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 48/76] target/riscv: rvv-1.0: floating-point compare
 instructions
Date: Fri, 29 Oct 2021 16:58:53 +0800
Message-Id: <20211029085922.255197-49-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62a.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 277a5e4120a..71d7b1e8796 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3710,8 +3710,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
 {                                                             \
     uint32_t vm = vext_vm(desc);                              \
     uint32_t vl = env->vl;                                    \
-    uint32_t vlmax = vext_max_elems(desc,                     \
-                                    ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                               \
                                                               \
     for (i = 0; i < vl; i++) {                                \
@@ -3723,9 +3721,6 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
         vext_set_elem_mask(vd, i,                             \
                            DO_OP(s2, s1, &env->fp_status));   \
     }                                                         \
-    for (; i < vlmax; i++) {                                  \
-        vext_set_elem_mask(vd, i, 0);                         \
-    }                                                         \
 }
 
 GEN_VEXT_CMP_VV_ENV(vmfeq_vv_h, uint16_t, H2, float16_eq_quiet)
@@ -3738,7 +3733,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
 {                                                                   \
     uint32_t vm = vext_vm(desc);                                    \
     uint32_t vl = env->vl;                                          \
-    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));     \
     uint32_t i;                                                     \
                                                                     \
     for (i = 0; i < vl; i++) {                                      \
@@ -3749,9 +3743,6 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
         vext_set_elem_mask(vd, i,                                   \
                            DO_OP(s2, (ETYPE)s1, &env->fp_status));  \
     }                                                               \
-    for (; i < vlmax; i++) {                                        \
-        vext_set_elem_mask(vd, i, 0);                               \
-    }                                                               \
 }
 
 GEN_VEXT_CMP_VF(vmfeq_vf_h, uint16_t, H2, float16_eq_quiet)
-- 
2.25.1


