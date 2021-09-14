Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5640A2A7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 03:40:18 +0200 (CEST)
Received: from localhost ([::1]:43800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPxQn-0002EV-Dy
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 21:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxOI-0000fT-5i
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:37:42 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mPxOG-0003Hj-I7
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 21:37:41 -0400
Received: by mail-pg1-x535.google.com with SMTP id t1so11181168pgv.3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 18:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=roW543BBRKwyDSK74Fh0URInsf5V8zJVUSaALAYhsdE=;
 b=me1kSbNNo+8UW6AZlcZncXlvCmJhVkNWKAS6/7/bTzgOHoGhJ5Fj2gkDxwTdzYxqir
 El/9OsfTn4LKLs+m17a1MaQcSq3qzYDiTX5Zv16k4aew39qrcHmCAXZQNPpatMbHHa3U
 DYzIeU6lwGBzaix6C4T4/OT9n08vIJ3gw6zGLXZgx4B3abH3YBFjYvdevdVZLi4DfB+w
 ut4sYBcBNhVi+vSkr5rAJP162Vy8CowM6XOfiwhN+SRcka6T/5aeSGaJpPtu6mzKNyLS
 fyl1d5HJBKHRRSku0czxKEsx53KxEQ9RAzdBi5iD6wwn5B4yJcJYyJISMKWyVULmk18D
 1vug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=roW543BBRKwyDSK74Fh0URInsf5V8zJVUSaALAYhsdE=;
 b=XHPegDF6HFSceN6Gj/BqqaBJp6G9wCi03Lh8h0ZZCmqk9cAJ4LbXCRevLy2ChKFl1Y
 05roEsm8sLDDCiv7R9dOaXRTTNrRB5kgGn0U/9EnoAAy2LNWoe6m6k13qBg9crVV+8/V
 2gMCWILgWUWC8vleACcSKOcgQ9rmXktOZpQJFf8IM4EWrzgcKJoCrRV8XJX7fAhhAEQU
 F8jUV9AtXmhKsX0DgklzjQVVWhsBK5wHQLYogAB//D3dUIRpzfODUPqG5JM/ivmFwxGb
 OpJlZWUbX/3hur2PFjxY0oo/PI5KfQATuSSu2DAOFmsu/czZNihp81DTG8GJ47Dlrbn5
 XkIQ==
X-Gm-Message-State: AOAM531lh5haSqjBQOwVLm9Bc5t/7JdAPje+9kMrFM8TvjDay+Mh9OkM
 a+A5rxhnZ9u3Pw2rzEQeTOvjIYji31QMIg==
X-Google-Smtp-Source: ABdhPJw4MtNt8InmYr6ENgM+icXjvzNf7bqgyzhkU3shJDTDJ5ZjPuWX7dgfuuA5N/Am78js1x8OsA==
X-Received: by 2002:a63:535f:: with SMTP id t31mr13629434pgl.270.1631583458905; 
 Mon, 13 Sep 2021 18:37:38 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id m1sm8390316pfc.30.2021.09.13.18.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 18:37:38 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Force to set mstatus_hs.[SD|FS] bits in
 mark_fs_dirty()
Date: Tue, 14 Sep 2021 09:37:31 +0800
Message-Id: <20210914013732.881754-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
 Vincent Chen <vincent.chen@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

When V=1, both vsstauts.FS and HS-level sstatus.FS are in effect.
Modifying the floating-point state when V=1 causes both fields to
be set to 3 (Dirty).

However, it's possible that HS-level sstatus.FS is Clean and VS-level
vsstatus.FS is Dirty at the time mark_fs_dirty() is called when V=1.
We can't early return for this case because we still need to set
sstatus.FS to Dirty according to spec.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
Tested-by: Vincent Chen <vincent.chen@sifive.com>
---
 target/riscv/translate.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index e356fc6c46c..0096b098738 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -280,26 +280,27 @@ static void gen_jal(DisasContext *ctx, int rd, target_ulong imm)
 static void mark_fs_dirty(DisasContext *ctx)
 {
     TCGv tmp;
-    target_ulong sd;
+    target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
+
+    if (ctx->virt_enabled) {
+        tmp = tcg_temp_new();
+        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
+        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
+        tcg_temp_free(tmp);
+    }
 
     if (ctx->mstatus_fs == MSTATUS_FS) {
         return;
     }
+
     /* Remember the state change for the rest of the TB.  */
     ctx->mstatus_fs = MSTATUS_FS;
 
     tmp = tcg_temp_new();
-    sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
-
     tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
     tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
     tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus));
-
-    if (ctx->virt_enabled) {
-        tcg_gen_ld_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-        tcg_gen_ori_tl(tmp, tmp, MSTATUS_FS | sd);
-        tcg_gen_st_tl(tmp, cpu_env, offsetof(CPURISCVState, mstatus_hs));
-    }
     tcg_temp_free(tmp);
 }
 #else
-- 
2.25.1


