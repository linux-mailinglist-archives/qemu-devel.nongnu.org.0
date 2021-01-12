Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28262F2C4B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:09:51 +0100 (CET)
Received: from localhost ([::1]:52730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGcY-0007YZ-TJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:09:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBs-0004lA-VX
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGBq-0007mY-3C
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:42:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b5so1315942pjl.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=m3jqMLBi2SOXfTyXye6aR/V4xkTu7nhLilWyJarkPheJZbmJXvcLD4zInJ8KyWsGks
 5zktN60qmPUzl+TSJt4BNcEtno4nYWqpanVpQ4CTRe7e34mcNx9RqxXHDb12bYctpmlC
 SIFGi0o0gDTSO8yHcaEp86ezc+1KFx3WdGpLAcSLcNGuL9m64oTNu1tc2WSPcEDjPLW8
 3WLcSeI/5714DrYENdUpTeBfIGcC7XzqAFvSzTUpmLqYKoYrHADDnzMYIycRd+kNuuJu
 rbOEsFgAezsqUSdmNZEMeZ5aVtsNPlFRorZLKIr8Tnqb01estMnQTmME9peOM3UxDEzW
 8yiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=AB1tvM8qt57zZmqlyA9Dh/OdO8KK6/wgzcjk6zXkxcg=;
 b=Alg5yP+kPBSCj4DT9xOfXiVPzjXEM22PrO7E7ARGp/xPXVPW8ArggUVpyw4hIYtxHD
 7/Q9Vx9GUeVATwZM9QUdA26lpuKJmzzjShHQ4Ia/1fDZXRwtHxAKQO8zs07hB3GHOtjW
 2r4hKqBhnQo4xMgx0lVf2cJO0RyF3KT45A5QLz30jDkHo9JbGd/wngn8HuLOdwKME7B0
 GU8t4YvUL+9L3WoD5uBxzbqxfI3ajahG70yUuo2f6Diqe9RsY9lz3YLHhgrppJJJjDwI
 EmVdgP+SbhyKuDnXwqCVB1ugzYXb2orF9UMYFtp1mTKkEXjHghnzufMVF6A7ibC1c2bQ
 JV5A==
X-Gm-Message-State: AOAM533sAsjipPlGwg7oI3MCZCYWWabndeNMcdKVgoMuRBh4gVYc78f7
 snEbOjIK77Zu6yLR72jeGkMDJK9iHvga5tqK
X-Google-Smtp-Source: ABdhPJx7Odf7/aaK//qFhXKUZjDUKa81nIhtMzAGGwYLHiE0ArHEj/A7RSsZblrsOKGL+5Joamwifg==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr3664631pjd.147.1610444532686; 
 Tue, 12 Jan 2021 01:42:12 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:42:12 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 32/72] target/riscv: rvv-1.0: element index instruction
Date: Tue, 12 Jan 2021 17:39:06 +0800
Message-Id: <20210112093950.17530-33-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102a.google.com
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


