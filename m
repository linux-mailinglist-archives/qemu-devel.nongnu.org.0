Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844AE246213
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 11:10:00 +0200 (CEST)
Received: from localhost ([::1]:49288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7b9T-0002Kn-JM
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 05:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7arf-0000Sp-UI
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:51:35 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7are-00055w-Dx
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:51:35 -0400
Received: by mail-pj1-x1033.google.com with SMTP id e4so7495503pjd.0
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=99inUY6TcXre93Q9sK2twtbOOBRR6deMTZ0PhPm0qww=;
 b=Yhya67zuJcqLW0c30YPV5JtD5Xal2KXSJhCgLAMOna3p4u8rJRbMsLg9zRkql8F4hh
 A6OZoGeOrS9YbMhY9gieLeCDmiWTMoq+J465ZKQMHfjwv/9QRMNd6akRgc79sg+VMPBY
 BHiLjY5wNeQbrlOIKsKXjLpqiS7mAr3en0mSkMY4ZN9UtZ/9KRUeS3K6nxEvc5cyv1MJ
 sy4DF+rke5uvo6mgjBSv5KRUEWxayUBmd9xs1xSdFhsKXNNAFdfj5bcgDKB+3YEfkdBF
 bf0GpnOcOZMzyaHHNnVZDCmgIPaeNPgXs5gfW3G9Bn2O6j7llFpohZQxVL8trOG2yiw6
 4JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=99inUY6TcXre93Q9sK2twtbOOBRR6deMTZ0PhPm0qww=;
 b=HjPr0h3xHfyNpxtb48Omzm/OwVawWs/TF+m6YNzkIM20q0lWri4UqjDaFPi2u1aIO3
 +S8+VzMOe5JE94TMq6aKdi7E57g/dZK1Psa3Q6mFhFr2Z0eirQ2mntHVxWTqCR7Fngdr
 i/kuE2aXM3KOxY/WPue4ihK/XF0glO0ATW3zHbxzOML9WHFN9gaqBlSQrNkLMuRUbsTw
 Gxm7BNrlNlhPnsTHBRXKHFh8B//fJzt3YynlpQJAthw/pjjYleBEjl4tYW/5mIrzw65X
 kQ7h8VkKH1UI2kF+VWTrZW6uOpwFsVfpXfeYJYxGB1Nq0p4X7imHy9I6O3l0uf6YfoS4
 3SUw==
X-Gm-Message-State: AOAM532rQjFEUEPF4loW9lr+6RbPpiVfQ5qdS5m5nEb5LAHiXIf3anGZ
 PN+7L5LpI6WzhNKi+GheYlKdvA3tfjaSag==
X-Google-Smtp-Source: ABdhPJxI1PYzX5xFnla/0OrsT91ngDuzICc8vvTvjk1MwlEEGiGdM4gym8iVcv7QuwdBvc3ChDcwVw==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr11684414pjw.112.1597654292980; 
 Mon, 17 Aug 2020 01:51:32 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:51:32 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 31/70] target/riscv: rvv-1.0: iota instruction
Date: Mon, 17 Aug 2020 16:49:16 +0800
Message-Id: <20200817084955.28793-32-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
index 0992d6ac86d..7a10fc27c5f 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -596,7 +596,7 @@ vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
 vmsbf_m         010100 . ..... 00001 010 ..... 1010111 @r2_vm
 vmsif_m         010100 . ..... 00011 010 ..... 1010111 @r2_vm
 vmsof_m         010100 . ..... 00010 010 ..... 1010111 @r2_vm
-viota_m         010110 . ..... 10000 010 ..... 1010111 @r2_vm
+viota_m         010100 . ..... 10000 010 ..... 1010111 @r2_vm
 vid_v           010110 . 00000 10001 010 ..... 1010111 @r1_vm
 vext_x_v        001100 1 ..... ..... 010 ..... 1010111 @r
 vmv_s_x         001101 1 00000 ..... 110 ..... 1010111 @r2
-- 
2.17.1


