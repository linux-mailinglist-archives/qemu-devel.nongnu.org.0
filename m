Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87B2F2C55
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:12:34 +0100 (CET)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGfB-0003Ep-Dl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCh-0005ny-4e
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:07 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGCc-00083t-UE
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:43:05 -0500
Received: by mail-pg1-x530.google.com with SMTP id 15so1076139pgx.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=S58OitlHV6OEspfrhP2ysHWRgrOp7NlF73aCIPr72PqKLmeLnacyS5JwWhvXiUrBm1
 0AVWOVczIZTPEAF3owU8wikbCM0Wt/T1NDl7UubSmflzyzIec7QLyrUQtfsIt0who61j
 IkxbD1SM5IVme6ySMfO1ptq2bulwz1+Z+GWEFmN5+SLPCZheCvsE3LOYPKp3Lq6oye7l
 AMqxxX6PctVQwtDY4htkIe+oOskgWd+aOHqhuUZTvhtiQkFZsAqjXvLPSrJpR3KQgq03
 q56+DbWa/8xp50NifOEwnbzSEnjFM4gDNk2+CbEfPQaOKEfxE+urVWPv0ZngattsywUC
 mBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=sC+LY6Z2Gux+YF1+eDjyPDwi/3Og++OQOQ/WZ01XBbu/tbQ/6P4/X/Z6DrQPttEkh4
 /ucuQUc6Po2ZBLJfX8ZZ/Rx0YIn7LgL/iUpw/6baax86J6v7HeWLpfSewKPPzQfcXeqZ
 KwYT4xkSSufSE1Z4fMEC4E6URTk6qmmv5IvB7z2Hp1C6TXUwFjktZG49YoIVWkcYASfd
 pQJzHeY6AqwAibKuNXtTxYyZowBILIZMnaVYWo65Hgm2682LZo5US4x+xaOA5iMHCwvT
 hm/E5udPIx8iheuI7Vop3DaKd4Xk85CUS/dw2lMDJ8SrZy7Q5UdBqbyNN70nJEgakC5X
 MVHA==
X-Gm-Message-State: AOAM530fMaJOIONGZg6HBXZQ3v22cbj8/t1g5rfFHt3AOG5PZNywWCNl
 PYj3YKRiP7r9gwyuy0pjpfBNGexVzNjS9ELq
X-Google-Smtp-Source: ABdhPJyrWUOjTmhfsR39fMjWddjA2a6fpB7/e4Zni3e8jCI17G9d8eKuAQvYSnv5gb+y1wOuUONkuw==
X-Received: by 2002:a63:405:: with SMTP id 5mr3947983pge.44.1610444581534;
 Tue, 12 Jan 2021 01:43:01 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:43:01 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 44/72] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Tue, 12 Jan 2021 17:39:18 +0800
Message-Id: <20210112093950.17530-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x530.google.com
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
 target/riscv/insn32.decode | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 022530697ec..8467dfc84b1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -449,9 +449,9 @@ vwmaccu_vv      111100 . ..... ..... 010 ..... 1010111 @r_vm
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
2.17.1


