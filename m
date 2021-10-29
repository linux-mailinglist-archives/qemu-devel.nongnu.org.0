Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF4D43FA37
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:48:17 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOUi-0000eF-Fn
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmO-0006wr-9f
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmM-0006BD-Ad
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:02:28 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so6904772pjb.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=CVBeAUV/mhBadxyBda2pyCnwxmqItbc7HjeVDwQQeQ5LZLExcd78y/LNIZaE1VvnwP
 GTsh3z11gXunqYPjjeqCqjSnao7mi2SMuNWLharbMTEtRBorNHHSNNj5rpZ9SqjpYtmh
 fgEPqw6vZxKUkwivo2LX1jmwISTm6pmKh3bR9RI3yP+PcVTX4kENLD59aG2C5bJn0IaX
 GbaQ2YG7nf8Bl0/S2Yw8s5XNlfzr/kzp4L2Q34oQhgMr7tgeUYDlD1PjJiBrOuUUJrR3
 Aaw08TjTlz1WoEpmA08Z3F86TOu9EIuUlyvBDD9Id2/G/Vf9gQ6CnZFbb3C3pJEjTyDf
 JAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ua5QPNKI3+mtdWrr6duWB6GbsCIKbt2CcILxnbVK4gk=;
 b=OgsFcPq0bBgioy0ypSj/yLjou+ZLQ1zNaN+yYF0aChu2E1iWF51cyeSOZzLF+aw4rW
 FbUrPjBcfIDjpOnj6e5siojSAh7ShWHckj1IvtwNU/fRAidx8nnutzK4MFAnAvZqctgB
 +WjzeNN3Ae+0XdXdfO+5X9SgBima4JZQ3N22RbSCPemGYw36wL7b1qNLzfiapepNuZ11
 fedw3g2xBmKrXajGemD2sLfgpXd9xbjS5SRAr2tMRXotMcFozgHbmTXji/AMtFoqPNpo
 zlH4m6uK0XuLg9pERCJaJM+MbCw1zHeis5/nlj57QOxlYOgvu3H7jCbspZYhVdWxg69N
 Gcpg==
X-Gm-Message-State: AOAM531mKjBdNgYO56f/JPVm7PLY+O25g1Y6FFltHaRSnqzei+CII9Lk
 cJj34VzSOA6YpRWIw8PwAmqlKgVrggsX6zSi
X-Google-Smtp-Source: ABdhPJzXquO5u1sIM59yekI83ZKLt9IawdJUSwclNnYv075TCBA4J1NIayB8P4DGHq+kjW0f2qjjEw==
X-Received: by 2002:a17:90a:4e42:: with SMTP id
 t2mr10220412pjl.108.1635498144427; 
 Fri, 29 Oct 2021 02:02:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:02:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 45/76] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Fri, 29 Oct 2021 16:58:50 +0800
Message-Id: <20211029085922.255197-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index a3f1101cd63..7548b71efdb 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -474,9 +474,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
 vwmaccu_vx      111100 . ..... ..... 110 ..... 1010111 @r_vm
 vwmacc_vv       111101 . ..... ..... 010 ..... 1010111 @r_vm
 vwmacc_vx       111101 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccsu_vv     111110 . ..... ..... 010 ..... 1010111 @r_vm
-vwmaccsu_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
-vwmaccus_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccsu_vv     111111 . ..... ..... 010 ..... 1010111 @r_vm
+vwmaccsu_vx     111111 . ..... ..... 110 ..... 1010111 @r_vm
+vwmaccus_vx     111110 . ..... ..... 110 ..... 1010111 @r_vm
 vmv_v_v         010111 1 00000 ..... 000 ..... 1010111 @r2
 vmv_v_x         010111 1 00000 ..... 100 ..... 1010111 @r2
 vmv_v_i         010111 1 00000 ..... 011 ..... 1010111 @r2
-- 
2.25.1


