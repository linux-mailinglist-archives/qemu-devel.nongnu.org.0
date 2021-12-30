Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F07481C24
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Dec 2021 13:38:51 +0100 (CET)
Received: from localhost ([::1]:34080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2uhl-00056u-9E
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 07:38:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufE-0001x4-3z
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:12 -0500
Received: from [2607:f8b0:4864:20::636] (port=44864
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n2ufC-0003GU-1a
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 07:36:11 -0500
Received: by mail-pl1-x636.google.com with SMTP id h1so14948701pls.11
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 04:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uEC+nT7GSuMs5k2atfg2OTN8B+1uoC15pio9zVoZPtc=;
 b=12xUuyWmkFP/GtDW5uFyI7LdSvBfGAbaeJY3e/rWgs2OUg2y8tq+iKuXYqf89ckORJ
 OLk9EFRcUj2qGDCM6v2soyOrRabZbqgQ1DW01O6tNbVE/zkCSZgQ1Z1deCf997Xkqc1e
 Pi18zjEFgo9zynYZPJ0H0hPPbVM2e9sXD1jR0aeYpdf7HIiNQFBUV4M0lU1qpb1SSg5i
 cIKDwoRWhEwNzMGr2Jj4KyKG9dgJrMyMPOo31KtDq4y07HEAid649sJJGvftf3A/FpTf
 Gt83rcLJSHGvJhMOwxwWYIHGmpf1knvRGf72mkDe3Ime3ASz/dZraxM8+vdFapp7dGhY
 eMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEC+nT7GSuMs5k2atfg2OTN8B+1uoC15pio9zVoZPtc=;
 b=SF/I63Dd1tDpFA2aKZOgvosEErfhfxvmmJbs2JOorV0+x/m2WOW4gE3kHbBcE9G3uN
 DiBN0l5b/1ycLtk0zhoec7AUs14thgeiThvqxk5/7HKibPOp2dlHeQsUDlFhXVFWwMQy
 YtB7kH4oOSo9cjwzjjtn8v99oQkod+cl4bhiwXNciNg0WTWKsYFspLdFzS+erdzzD3+7
 8x1VCA3LtIkhXyVm8RW2ukc+gvQWXafCNubZ0iX8lmjTGebTKChrdSYJ9mhBrC4VnbI/
 p9XTpRc7+vHi2q6DRquLFaUUhCqNdd8T46Xd4MRq1ws8uQGe0HypMWRYXVdrwY3ma1Pf
 kt1A==
X-Gm-Message-State: AOAM530cQ43F/mrDOCjORow+hNCy0OehyqSzUFa6UnuWd5ga2oMebjwr
 QHgNKUDDNFbZY2e948QUxegAmQ==
X-Google-Smtp-Source: ABdhPJx9bptPt6emeyG0ysriNmJHc3F2fc+X9vk4vLsBPL++F5yfUo/VwLxwki8w1twMabYVtkvzJA==
X-Received: by 2002:a17:902:7c09:b0:148:e02f:176b with SMTP id
 x9-20020a1709027c0900b00148e02f176bmr17383296pll.130.1640867768784; 
 Thu, 30 Dec 2021 04:36:08 -0800 (PST)
Received: from localhost.localdomain ([171.61.71.9])
 by smtp.gmail.com with ESMTPSA id a3sm28588348pfv.47.2021.12.30.04.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 04:36:08 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v6 06/23] target/riscv: Add AIA cpu feature
Date: Thu, 30 Dec 2021 18:05:22 +0530
Message-Id: <20211230123539.52786-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211230123539.52786-1-anup@brainfault.org>
References: <20211230123539.52786-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::636;
 envelope-from=anup@brainfault.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Anup Patel <anup@brainfault.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
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
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 1bdd03731f..d0c1725eaf 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -75,7 +75,8 @@ enum {
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


