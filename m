Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8979325C55
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:07:32 +0100 (CET)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUPb-0001e3-S2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:07:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThq-0000XA-0z
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:18 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:52523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFThn-0001h4-Fr
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:22:17 -0500
Received: by mail-pj1-x102b.google.com with SMTP id e9so2519056pjs.2
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=TPKvCuZBIcdrJuuZ+Lwy48xWaATXsXJcpOhC9TU9iOj5EKnnH2626kvoPM0DAeD2go
 FHb8s9ZM6VBiJ+Yb8NHv3jpJPeHobu2MSYtWvH4ISbl5Xu4tsbuSuuoyMXiQPdHPfd86
 sfv86ntSes5k3CajcDmdkLKheK6iMDtkAhMifg05h9NUNzyZEZ8jfhiA1xlTdX7u4p4f
 6THFPURUFZRkRaqpxoTYpZuNVkZy5zEqe2qLRXgX7tboO/UQ1qoZv7OS8XYjx7zX/Buk
 /m0i7TPUEP5fBdZ0VzWK7zIRobusRcqkZTj3s1oZdP9Gm6O3vNPq7NXCnW3q1CY1hN5k
 O6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=QS381mC3nn1JaqxDvuEu04vE2NtzlnZ+GRbIuamFz6kfrbHV7Py0BqLss0U5xf/iwr
 a0VrVon/DweIKHzCjiy/k6Vi1mARqUtpCE6XNtMDhJtprTPcReMOaH1MfvgSjMMQOJbi
 o8POPUFG3v7Dw0dtqshlVRJaeOsaoo7VrXsVQZ/4xHM+5s9WwUbwVm/UiANKwEeznlfN
 EPRVAdcmlAcC6VRWeKKLw1z8XeF4WzULgnJmRE2vmeVOOKj6QabdjDUCpklb7xSvidFO
 nb1N5ff+zSeyI0fXdeFMcws/TFKBQdPhaid7H8dReNCXKKH6uEXYeXBbB1txRenOBVBA
 a+Rg==
X-Gm-Message-State: AOAM5325ScxAzgld3QRp8Nd68ku/l6jYQVvuwEMkYd7Yv0g7a1Uc+liT
 TCtsRnnwEwmMN4VlfxJpMXYoWxqXFiyX0A==
X-Google-Smtp-Source: ABdhPJw031L330Zqg1YEXLiyfBs1B/36hUX5f2rwbYXc/hq3fLnDDtKhgdYJMZcepXaLJSguogJ99Q==
X-Received: by 2002:a17:902:7481:b029:e4:5e6e:75f7 with SMTP id
 h1-20020a1709027481b02900e45e6e75f7mr993089pll.3.1614309733747; 
 Thu, 25 Feb 2021 19:22:13 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:22:13 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 32/75] target/riscv: rvv-1.0: element index instruction
Date: Fri, 26 Feb 2021 11:18:16 +0800
Message-Id: <20210226031902.23656-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102b.google.com
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
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index fae5ea3fa63..a593938e5c8 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -608,7 +608,7 @@ vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
 viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
-vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
+vid_v           010100 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
 vfmv_f_s        001100 1 ..... 00000 001 ..... 1010111 @r2rd
-- 
2.17.1


