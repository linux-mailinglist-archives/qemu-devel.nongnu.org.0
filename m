Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E902325C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:08:46 +0100 (CET)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUQn-0003yT-6u
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTlB-0003ob-7Z
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:45 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:38385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTl8-0003BF-So
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:25:44 -0500
Received: by mail-pf1-x433.google.com with SMTP id 201so5331694pfw.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=bJ+S3ap95F74JbPgQCZTsjNjQ93ImQ1CF2ZRHxOkewg=;
 b=WgebFkyjNSa44QBKNnBTJVzUjLoiq2wxVA31M9X9uvkJQeaMmy7wL7DJsEUfYtNeHr
 jFAGoCeZQnFbK4mOLsyDi+b4c8Nc7g7eZKVCRt4unp+MzHrpVWqkcEg3Oue+z9Z9Ek/c
 gzvohOYX0pnti20PrD+7dPsj0yr7xIoLC5anovugvwdN1gYA6tAIHntpkY4hnZeLsSz7
 oEgZyl3LKio7BOXtGmkYmeA431IRiayf8uSLUYPZkWoV5mrk3IpZZ0bRhkyz8gLLjRw4
 MKAz1fgSotrbV/yM5x4wfK/bB5Y5xX9ZmpO5EPk5NkAYWHI7p/7LZbM8UKKiyBXUwOCH
 Qb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=bJ+S3ap95F74JbPgQCZTsjNjQ93ImQ1CF2ZRHxOkewg=;
 b=Pzr9GBXclRL8UZ9xUwI1bgawaUCsXY3qT/psscoQgb0iEGJDbBr5ggzsVCg28wZgTc
 DWo3gTzkjikblQwqQo2nyezqDvjoP0I2OptdpFjKmbwb2CkEV6lhUfOE62ms94dlNi8Q
 9RYc864/1ihfiue1MX8XZd0sk2IKqW8546tQSzR5WdSwMIQaB6pwCpTyG7WhtG0Em1NP
 hMB3F5afYHZKaec9DL5SbjCKQNCabAyZXB8R6elzOFCN5g1V7skIBRljZOFEN3TXiEgg
 FBr2qGv3ZG2To2ZVqwOtBEaQY+DwYfXHa2kpoQAj8FHlkXEuv4Cu0JavkF5x+yBWSxn0
 yeqg==
X-Gm-Message-State: AOAM531bWNLg2xfJJIJEzYkYLC/BxZ3jKum3fmnBih6oORaurZ2Lxvo2
 UO9/4pZ09OeP117goqWk1KaPR4Ur3IzfnA==
X-Google-Smtp-Source: ABdhPJzCpvueHqcp1IJB38FFtyAchRYg/TcwpZpR48ofS/xbEJzWiyE/xJBQjtz66a6bUEBRy9xYJw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr1064508pgp.68.1614309941436;
 Thu, 25 Feb 2021 19:25:41 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:25:41 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 71/75] target/riscv: set mstatus.SD bit when writing fp CSRs
Date: Fri, 26 Feb 2021 11:18:55 +0800
Message-Id: <20210226031902.23656-72-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
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
index e0f1106d909..0082db9cc0c 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -209,7 +209,7 @@ static int write_fflags(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     riscv_cpu_set_fflags(env, val & (FSR_AEXC >> FSR_AEXC_SHIFT));
     return 0;
@@ -232,7 +232,7 @@ static int write_frm(CPURISCVState *env, int csrno, target_ulong val)
     if (!env->debugger && !riscv_cpu_fp_enabled(env)) {
         return -RISCV_EXCP_ILLEGAL_INST;
     }
-    env->mstatus |= MSTATUS_FS;
+    env->mstatus |= MSTATUS_FS | MSTATUS_SD;
 #endif
     env->frm = val & (FSR_RD >> FSR_RD_SHIFT);
     return 0;
@@ -256,7 +256,7 @@ static int write_fcsr(CPURISCVState *env, int csrno, target_ulong val)
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


