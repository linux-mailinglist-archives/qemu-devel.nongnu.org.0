Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A78493E07
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:11:42 +0100 (CET)
Received: from localhost ([::1]:35666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADYj-0004Jx-6P
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:11:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrQ-0006Jc-5p
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:56 -0500
Received: from [2607:f8b0:4864:20::530] (port=46862
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nACrO-0000P3-TS
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 10:26:55 -0500
Received: by mail-pg1-x530.google.com with SMTP id i8so2899363pgt.13
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GVP1+tizrJyU2/+6CbvcCVlYw+KyTfPxuHOE4U9bx8=;
 b=WtdJo2P9G9DfNuVDwLK5TJjkOOmOe4NdN6WoNsO3Av5RmhRAnBVnlcYaD5oeszIXot
 AX6whr433lECLJcGQdt2YLMI9lzsTookJ1AKD+McmpFdQVgxAwGmXQC4YSTu2cc0wMuT
 KrJD7TpZCzv8WscSowUEi/2dpolwsc9ZYuxbkF6Yb+b/W/IjUV+mG1wq7bv/ZvZe5z3h
 fxRiRCR2GHKboZMiDGB/Uo3PKjc4bSFdp4yQTXcXUSx3yVG+4Va7+F9WnKb1cWDGo+qm
 pJBpCy0DVoTtyxLGwh1aC9mkBQB7ufa8Jb22ISLQQsr0FKmjmRxuOsryZtgysJtUver+
 XsAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GVP1+tizrJyU2/+6CbvcCVlYw+KyTfPxuHOE4U9bx8=;
 b=RVnUvZ1LbUAJgqG7IXFsWi42UqnBg7Hsey4CCWX4GqVFwHMzn78fIAgNEh+gN3ZARP
 ueFQwn4kok561Kb8tqrFkq1g7ycy5UsHoXTsssQgGCYgAAP7q+btI5Jq0qB6gYhs6rZr
 u8rK/n/RZMy9ZlUP3Rx0cFRy0MvNhDnSjvo9TMpy9FTsbL2Az3YpTs3/zaEMEkQ7jIb+
 oVdO23lJotEoe661oyVUi4V+rjdGBdDwZQKFD7H+MoK+GD29H8OGa48MfiGlhvjeCAiS
 XE7MAXT2Lzw39Xia03G6CyLHLtaN9d6wBsXQX6dKtls3av2p8sHGk9CxQ6CjGooZ2bso
 nUTA==
X-Gm-Message-State: AOAM532LpccmKyuf5frMbZGnn6fVEQYP9x9NC7P7pNRNjiDZ3110kpX5
 FZMJWz9ayWJj7uYrvtb9UjbnxQ==
X-Google-Smtp-Source: ABdhPJxCdtMkkN1kSUzAnOSEqSRZbWxjIUOnqLlpILuvJEYyvCk9jJY+oxNifguyW9wE77+Wr/ol/Q==
X-Received: by 2002:a63:3e02:: with SMTP id l2mr27516737pga.412.1642606012267; 
 Wed, 19 Jan 2022 07:26:52 -0800 (PST)
Received: from localhost.localdomain ([122.179.40.245])
 by smtp.gmail.com with ESMTPSA id 187sm26791pfv.157.2022.01.19.07.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 07:26:51 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v8 06/23] target/riscv: Add AIA cpu feature
Date: Wed, 19 Jan 2022 20:55:57 +0530
Message-Id: <20220119152614.27548-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220119152614.27548-1-anup@brainfault.org>
References: <20220119152614.27548-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=anup@brainfault.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index f24b6963b0..070d741297 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


