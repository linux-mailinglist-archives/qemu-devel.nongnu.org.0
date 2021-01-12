Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4922F2C75
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:18:38 +0100 (CET)
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGl3-0002FF-G6
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCS-0005Xg-9d
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:52 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:45258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCQ-000804-OI
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:52 -0500
Received: by mail-pg1-x532.google.com with SMTP id v19so1060552pgj.12
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=cVW9HbTK+vMMRythuyJKBt04W7Am8EAe0EyogrK2JfYqzX1ghNRkqJCyKgj3zjfDGv
 KyrmeE+5VP++8Iwm/PYFvq8hhIn/NqMYA4ASC0OwfGUSRfta7uOhUb8qiKH/VG3B2IDN
 nY1VCH4/IlRu3d7aEWnVgAYANsIRfx0lNkpHad05JLKwIkfxI6mrHREIItzhFmcqYBO0
 NYY7waBh/fO0pb5y4H8yAXJCpjXgor6Gt8Q/ru3LJO5crpFIvuqetWX0vmqyNhCwZogU
 GrItuLC3CtAYTPvYMH53FJLBxJ+h/somn8qLpeH0lwohPClYN5pWq/UvQMZdO724vSED
 sUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=Zq+4jtmZUTYzdlFd4X+u7OgZ0ZEA0YB8ngesJWXpmYRq6n8ZCmLOJYtwo037PBNoNv
 aXyxqkubSZcTTldSx1XnrMHsLN5tsiAy2iUFgFkKG6ONaGw2bScP1QfeErlQY7iKVC+x
 2y/QAIB3SVlhp0SHTT+976ELHe1H/Z/e/n5zZw5FTU02+btq5Anl+HiBRL1jUDEVns0u
 bsSf20V8l9+jIGKWgCR863XGiVN5svLBNC+4DZjYAoGiAU2RjycfWN6i0wjvqdWv23Aw
 MeG8zGcq+LhWA1WtFIw2KyH3t/YFxclMHmK6RclYVBpeaZy5YuBuWiYGB9VJ5lGHzxdi
 maxg==
X-Gm-Message-State: AOAM5317104rfUUX+ZLBj9qsF63sL0zWPQ4lHsR83qRPJHjitfcpRnTj
 PHyA27YNepwNXjlWOExFHxTIwXqDH9bNbNc9
X-Google-Smtp-Source: ABdhPJzRRNa9eDKv74VKe2wyjEQl+BYEP7/VAzfWoTJgrPEhfhkwol43CGEH9TgQaWlioLFF3v2QKQ==
X-Received: by 2002:a62:e314:0:b029:19e:4cc:dc6f with SMTP id
 g20-20020a62e3140000b029019e04ccdc6fmr3774684pfh.33.1610444569415; 
 Tue, 12 Jan 2021 01:42:49 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:48 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 41/72] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Tue, 12 Jan 2021 17:39:15 +0800
Message-Id: <20210112093950.17530-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x532.google.com
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

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 308c9fa44be..91936ec464a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1915,9 +1915,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


