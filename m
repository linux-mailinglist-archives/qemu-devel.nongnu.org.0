Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C87DF2F2CE6
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:32:40 +0100 (CET)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGyd-0002n5-S6
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:32:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEH-0007iq-Tu
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:44:46 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:38260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGE8-00008G-Cj
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:44:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id j13so1312854pjz.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=rTUYJ57I+T88FoPrNwc3za/XkjTvEcN7a7OWqN6Yw/4=;
 b=G9kWNElbLk+4ZnEbLb0SK9HdJRlAJNwBsKcOvHj4iz+xd/Vc8zCHVJmu6id1JyT4Qi
 SDDsZTWOA4iR5VrLa2dDsbDhcsjrBqAerMbSUdVvXTXQFqkg472ooYrtb996QiQoGLBG
 DUpNtHtNaQ0iGoLbrfKlgvY5bKn9XmxqBSlYsMNM8GfAmAodAxXCcJTaBRzicPvT1UuJ
 WcEqqVL80b7WjjWY9XfVQqzExdtC//EBMlQQoYAI2UmRI6sMlZtwop50D7hgNq85fjZy
 VuJazs56EZDwnucmpMa0/+XLZWgF8Z1euf+Lv1A1bT8jCMccggnvZ0N8npYZDRYSgeLu
 Bo0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=rTUYJ57I+T88FoPrNwc3za/XkjTvEcN7a7OWqN6Yw/4=;
 b=pHPu1D37vw9WrHZGqDjBTOuOmeGJeIsMzHkilBo19Thf+KpyqCwAZx+FKXW52FPxP5
 62y+DWhVge8BtWDFblX+xacrsBGPproqlIiUimQiBmfee8kJbMJ7auCXKfK5oAy8l3ly
 gPCBOH4xqt4jQiR5/ILFBtHJbcN8kqYehdgTqEBZzLp4Up57rzG5qCsv+/Vu/B2DH11m
 5sp4MdsDUgIZMP2t9Yo4wCMNSJ+mtTE2Mv5icmSFBQ3glJhMUMN6AFoscMuLc/czPDlC
 PMjh8LWvBrWpfSkHdvn78U4378MP8jXuA/icNdRf9shhLNXWZUxA2fDy9+P2yTDzFsEo
 z9rA==
X-Gm-Message-State: AOAM532aZ8MBxtud6L1Vjq8iNb1FPg2+a+PszS9U0oL2E2O3s0FhtkJx
 Kp3RiZtcN/4GSxN+NdeVaBSoKCLLt+LNfIBp
X-Google-Smtp-Source: ABdhPJyPPGQo7M3CFuJ2R8flALdCMtI1oUncOs91nOQL7Q3Xy0eXVHrt9ofruFBA7TrDbwQruQkSlA==
X-Received: by 2002:a17:90a:1bc7:: with SMTP id
 r7mr3806991pjr.33.1610444675018; 
 Tue, 12 Jan 2021 01:44:35 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:34 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 67/72] target/riscv: rvv-1.0: set mstatus.SD bit when
 writing vector CSRs
Date: Tue, 12 Jan 2021 17:39:41 +0800
Message-Id: <20210112093950.17530-68-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
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
---
 target/riscv/csr.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 28c1ce7928a..176010674e8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -301,7 +301,7 @@ static int write_vxrm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = val;
@@ -320,7 +320,7 @@ static int write_vxsat(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxsat = val;
@@ -339,7 +339,7 @@ static int write_vstart(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     /*
@@ -362,7 +362,7 @@ static int write_vcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_vector_enabled(env)) {
         return -1;
     }
-    env->mstatus |= MSTATUS_VS;
+    env->mstatus |= MSTATUS_VS | MSTATUS_SD;
 #endif
 
     env->vxrm = (val & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
-- 
2.17.1


