Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366B2F2D15
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:43:02 +0100 (CET)
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzH8e-0007Po-SA
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:43:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGEY-0008B8-5Q
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:45:02 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGET-0000Fs-2V
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:45:01 -0500
Received: by mail-pg1-x536.google.com with SMTP id c22so1056868pgg.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WWTMmoZUWlnaPxhtcISEFdijoQ81F6su0r3I6RoODMs=;
 b=Se3WKIn5O4o2zegzOjar5n4+EkcneC94w9WrZ6MWUjEhAaV0KXnLD4HSjBs/k5M/+e
 DVMQEInrKbl7XQZa0Cz4uMtd0GEkH+35p0oXhpgv2bD7aOvP7mCEdY+jArzpXwo4wqsu
 UbYnBO+8jUDBPPP2/gFuv3ac5tKQoXpu0+oAar7ehdJfdAxRPVF2wmvOTTmCCi0JpbTI
 m5PTb87wAz+PtV93Hhmst4QTxxy8qGFCcILTkylcCJhFFS5UjbJXHtQfJ4ua3hvk3l0O
 B6zy3OEeaVhIrohZ4rXagCHV8RXhbgF6Lj5ntQirxBJZLg8oWTEQEsMiKBIp6UNsG/UM
 9hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WWTMmoZUWlnaPxhtcISEFdijoQ81F6su0r3I6RoODMs=;
 b=cBVsJ55mAQn+vryD11j8Qo2Hx1KfBE+1A1xzYXDXHKUFg8SY3LSCMC0Jubi4jkriN6
 sMk+CyWMRCQujUfmBDHelG8XqISidEFCbXCVaLw+N3XFhVi9+7ZJ8HV54nThHD6YmRHU
 /0l4BvWnliNbCk+gBReskzPkK8YFgFMruyPS6NpDcVpBbS4D0Ol98kkVgSAgm7GBJe1q
 OclIYbW7mHc33H3u9S9277C7/HTtE+5fG/4rJ3WAHhkdrovGoHFrC+1KTOe0D0Guuv9S
 3mMs/ZnzBwOqpHkdD7dNNkL/9J13KCprq4NpN1BislonPE9tAnyvxqL+pQGhPNt+vi9P
 hJCA==
X-Gm-Message-State: AOAM532XI6k/KaL7+54xVkVI8G3YAY02q9M6sLAHbARGwI1WO8vjsXXO
 CeIdn//bWQUHb+wLE4RSrna6WftNcFOjM/68
X-Google-Smtp-Source: ABdhPJyv1d5ewOb2P3sRQh9OAGvhbXfKWirTb82jIkK3jLkKjmgp6Pwn2bABqmOqZffsB0MYs8ec9w==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr3780713pfh.33.1610444695468; 
 Tue, 12 Jan 2021 01:44:55 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:44:55 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 72/72] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Tue, 12 Jan 2021 17:39:46 +0800
Message-Id: <20210112093950.17530-73-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x536.google.com
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
 target/riscv/csr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 176010674e8..3baf5c2cf33 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -217,7 +217,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return 0;
@@ -240,7 +240,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return 0;
@@ -264,7 +264,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = (val & FSR_RD) >> FSR_RD_SHIFT;
     riscv_cpu_set_fflags(env, (val & FSR_AEXC) >> FSR_AEXC_SHIFT);
-- 
2.17.1


