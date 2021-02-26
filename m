Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB7325C26
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:51:54 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUAT-0007Ia-A2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiz-0001Mq-KL
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:29 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiw-000296-Sx
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:29 -0500
Received: by mail-pl1-x62d.google.com with SMTP id g20so4568215plo.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=G+MjfgbcVGZEU09Qo1YdLL0PtmmJVKb6/1naoO9gUnVJHNlExFJpH8FmO3MQ209ucY
 nbZZYSwJ/0NwwRZVdYkbKE1FR69rb4yVJ05yOkakr8zlwUtus2sATIlo9GORV8eyceIf
 D8tP5tB7Na/tmM74SYkAq33K+WVz0REKoF8Bja+Ns3XlTduAc/x9vcmuzye5CiQ3qlkp
 m7tQo7uA6HYy+SMB2xRZGkkm+HCODvcCu57AkfIPDlZhDs/dh6ri4e+vrwCvDbNJ55se
 fQlw8Eu82CmKasMZ3xlGLUy36BP+2Z2f10iKQxArnt9UaiL6QofuifsJlQye+c0nIzTD
 dxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CelpfpPjyrLTQlU7ri4/gFD6IDah3h0oYiOyuEn8YG0=;
 b=Afe7GQbpilAhL9a54oDNDtSaw2R79Mf3RqmgAg/9URHWzwC+2mefwt2AGRRLrQck3x
 YF1aJtf40bvidE/UxfJPRIiAIHIlEaMMsNKFVZiFYC1M/6D9HzJ5PbboUNcoJRaMEETe
 XcqVOOaLi6NYWPAFgkNZm6dewU2GFDnwvj4YAtDwNSFXjVI83hU6fme66PWh5y5z91mr
 Ee4mlYiJj7x5adfCpawH4G00Sni1Q+55XDo3Hw0TC+hAHjDa3HWN12uI8fCLOursBpRm
 Xrtap0ze5wcm/hAkXaPD7D1ANyuSshzTO0GGhJ5zM9I5Y7BH10nY+Xlq3umtOA1seqG1
 a1yQ==
X-Gm-Message-State: AOAM5305LA+0O1fK/Em5G5+xKvANZRfxieIRtPNAO0pFRS8LIVpUnc+u
 0EFYivFMrWgNBgRIYA26zYEDk04aY7Vj4Q==
X-Google-Smtp-Source: ABdhPJyuD/zCVsV8jKWgxHEiXdPX44TpC47li25sQqHZf/tVZL78VK/SR/QdKzeMWETUFiyr2SYxPQ==
X-Received: by 2002:a17:902:8501:b029:e2:d953:212c with SMTP id
 bj1-20020a1709028501b02900e2d953212cmr1212967plb.49.1614309802321; 
 Thu, 25 Feb 2021 19:23:22 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:22 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 44/75] target/riscv: rvv-1.0: widening integer multiply-add
 instructions
Date: Fri, 26 Feb 2021 11:18:28 +0800
Message-Id: <20210226031902.23656-45-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x62d.google.com
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


