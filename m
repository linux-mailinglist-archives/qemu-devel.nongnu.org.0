Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D4A2F2C2B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:05:55 +0100 (CET)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGYk-0002oC-U8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBX-0003xT-Fy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:55 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:36860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBV-0007fH-O8
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:55 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l23so1311314pjg.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YBwtcYDn0OZ4VpML5GbVnXvhvm7p0Lm6u4cPISfe0yE=;
 b=VlxJaELIK4Ebmq4KYF7XF+J6rZEeYW1+2gIj8T45d8/UXjA8PNSJmhU4xC+dvFI22y
 xNgsLOE78W9nHbGVHFk2cv0/1WNxfbEIR7yY+YwkEfjqhMEPO0uF4gW+hPejkXHUoDNP
 QP6ypwHPh1sE1pyYV4beGjmZqM5tJNKaMIFVzDOLkiPydqFk+cRdK+ibC6k9WcOG0OLe
 2HwcSlHXU0xpTMOJR2BOWUtPkyeA95FmgQDytT1Z1hK7t/FD7Z/taD2vayKyNejqbVKs
 i/vGu+E2vuU4PNdr4dAJhHHdCk7MoJgg8EqWsYqiEN2VPPrg+bEIHP8JrzVukx1xi25r
 Sf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YBwtcYDn0OZ4VpML5GbVnXvhvm7p0Lm6u4cPISfe0yE=;
 b=aJOF9m7pYuafSjzw3oSEvIoTiOLE/nbWrNBlmM7vv1qMWkooStmcXLj0tgrIkL3qCc
 HNOADvxdBJkpSmLUyLdsDwcu20Z5nihOyKDDUV/EuLly9LBWRFHH02gkJSPgcCg5XKQD
 P9AgdctmvJVlT4diryQu7KJcgymzmkenyWQ836F2M/MvFYQU7RQOl9dwE61MZtehKlXd
 x61/WaEQQeN+ex/Ts/iZrDVyKPN7DAO3g56Y9/rxtraHX49WW5neKXV1SpnBCV+aJ+p5
 DnVmRdLesJGa9qSFuHS08GumlsC2FwCgNETfqmLfrEng+JrnhZz8UxMFIuph5ViIq/gC
 VB/w==
X-Gm-Message-State: AOAM530fyOSrhgG9wHkc7Cm8/uzOg0fq8J7QDS3PnR8DMRp78MRxJyMW
 XqYV3h92F61Bm4LVwh1hQEb1lRVG60rN7PQd
X-Google-Smtp-Source: ABdhPJxxW7tZ8mjT5f7scZBwxa0r8R2Ut2RfxQlzKu239z57T69D5oOW8U3CQ2vnmsP2H+hiGie7qA==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr3619104pjb.148.1610444512298; 
 Tue, 12 Jan 2021 01:41:52 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:51 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 27/72] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Tue, 12 Jan 2021 17:39:01 +0800
Message-Id: <20210112093950.17530-28-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102e.google.com
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
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index c0053cfb828..a0a47dbceb3 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -561,7 +561,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 1010111 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
-- 
2.17.1


