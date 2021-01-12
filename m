Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA572F2CE5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:32:39 +0100 (CET)
Received: from localhost ([::1]:34304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGyc-0002jl-5S
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:32:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCp-0005s5-NV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:17 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCh-000857-0i
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:12 -0500
Received: by mail-pg1-x535.google.com with SMTP id z21so1082397pgj.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2kXd7BkSecgi1sQstKw8lugNbrgP0rsKfdX8qw3qJaw=;
 b=cR6qoomWHej5GHMzr5eBahqyzTYIHXdF38CJ4kIS4eciNvEYJX9WgTdfhg5CwzPjSJ
 0cU9tC6J0z9BN+DDObJn2zxlts/YpF0S0AS30lnCCv89FXXwNMMZvl6q3Cmd+ynYw+9j
 prefe3s8vnB39AALUd+o65txIn2esmyFsZHl4E8JeUWvXZHEqluTix/sNPgjHUM74R0w
 Q7lO+B1M8DO8k2nUlxTdqoK2X5SM05fM1EXyvIeBr3F9wsUMLawawMeRmNXTRpubK4sf
 073DH+ke+dphAoNmpyYzOCJNUK5cnGsi4Y1LF9bQzDaosaUhCjxLlbHGbRYemvs5uLna
 /X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2kXd7BkSecgi1sQstKw8lugNbrgP0rsKfdX8qw3qJaw=;
 b=jw9qaWDQWz2cX6b0fxCy8jWzsn3KDODwQU95Q24DKj8QVwGX5bTxILIwO5XaIUDskO
 tBWU29e7gSiGj6lhTKvDHJ8iUSrWlAVmG2Y9y7fnOore+ZJ0eLRpNXlJ6PBH0otKLL8z
 roMkpYYlXl5ixUFPZKf4UG24kzADuecrXgwdDqa9dMAwrXzsAfmRpP5TgxJX7lpSxifh
 jfttYdpDsn9vIa/Dg+A6jsq3GIedhfG+w7S9rkXGUqkanig4aborA18SvKCpALzNu2M2
 0Et8zEGHW5fxkz7dYsF6gm1mZgbh/azvWE/Y8J76l04qI9kayMJT591PAjjP0UIu9MI6
 +3CQ==
X-Gm-Message-State: AOAM531nDQr6eqC9sIdiGK35sMRrcp/EHZ+Pf8a7KZSJxfwE4NLXogry
 I32CfdS95t+EcQ4jf9AEUjuFhKeQOHttqcvd
X-Google-Smtp-Source: ABdhPJzUBct05pe1ywHGRZgBHapCQWf86ve3lITKm1z4hB2RLGmpR/L0A7uYF5Ldln3bdFHs4bWHag==
X-Received: by 2002:a63:66c3:: with SMTP id a186mr3959028pgc.198.1610444585748; 
 Tue, 12 Jan 2021 01:43:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:05 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 45/72] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Tue, 12 Jan 2021 17:39:19 +0800
Message-Id: <20210112093950.17530-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x535.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 113a20af4d7..39e2d21da5e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2232,7 +2232,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


