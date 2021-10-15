Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD142EAB8
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:55:39 +0200 (CEST)
Received: from localhost ([::1]:47102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbI42-0003GS-Ht
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHvh-0005PS-LR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:01 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHve-00020W-CY
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:47:01 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6681585pjb.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asnFVqohY2FyGlF3P6o96WBMucxqcyN+cjtf/VcPTk0=;
 b=DLnG8I51aEZ7N+Q6SeThXZJCeYiHEqkoXEecE14fgcVvpZpQuoDAq08QjDR7c8/Dwq
 71zTtcsNmdJb2of5jxFmGXUFfRptSLtXGWPt4m8+p865SGwi23mv5b2aU5X3k4niO4ve
 0S03V9spAqWEpO+aP4A4gyaV466Q2WCX7+/y5fBEh8/6P9/SsHjph1tRgTH2kmB5z+rb
 pOltBEVmcCGElKFkngq5CX7M5SjFvlLxIooob0W6lL9NzSQzwhfUgYbPwf1qUOZM6q9P
 JlBGH1As35HBqQignXLbhm/gv252big2HoYPfu060iztfPWGThySh67C+6h9xVNbhYt4
 oMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asnFVqohY2FyGlF3P6o96WBMucxqcyN+cjtf/VcPTk0=;
 b=0Vr7ajd81JirHQDT/w73NqNlokjGNL1wi53Z+n7cSUrLOIHWzD/8j44iepmYycQUdo
 ULTdOJux1LDkuSMtv2PhhxE1++KWkfNPgqnLSpw2EUAx+pajN2xMcoOi84yVRwBeARvS
 1t1qaGqz7ogFIYXkAc6v0hBaTr2KM8Xi5NRPEVbq6nlT8Myr1WexZa63bT3fWntD1I3d
 sLuF17+pB/q0f3OAjjK/QTeC67X0v6SoT4m9r6Pli1fsp/l9C6ZrLkm871wB6k/Cok3r
 EOHHOEYgYWMKhRc9w2DWjy0CNzMnZtd7bQikiNFVxBVIahLOrqedixcTl/TpQbT69wyK
 9x8A==
X-Gm-Message-State: AOAM5318WqhPCLbw3K+3ryFUEdVMz5EkKkkhcbsaq3oOa3rg0NKPkbhR
 ixRhRsNB5aIxL+OZo9obqDZlh4frqR+DfPqa
X-Google-Smtp-Source: ABdhPJyEVVPWgJa3lAjevBmCYErVub3BLc4H4D4OPL0d0l4IXu1HQ075xOMoO1nPHywot2JOq2g+lg==
X-Received: by 2002:a17:902:dacb:b0:13e:f6c3:57dd with SMTP id
 q11-20020a170902dacb00b0013ef6c357ddmr9607310plx.45.1634284016737; 
 Fri, 15 Oct 2021 00:46:56 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:46:56 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 05/78] target/riscv: rvv-1.0: add sstatus VS field
Date: Fri, 15 Oct 2021 15:45:06 +0800
Message-Id: <20211015074627.3957162-6-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8c2fd35d2ef..ca3ddd313b0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -375,6 +375,7 @@
 #define SSTATUS_UPIE        0x00000010
 #define SSTATUS_SPIE        0x00000020
 #define SSTATUS_SPP         0x00000100
+#define SSTATUS_VS          0x00000600
 #define SSTATUS_FS          0x00006000
 #define SSTATUS_XS          0x00018000
 #define SSTATUS_SUM         0x00040000 /* since: priv-1.10 */
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index cc0131d7962..d8a3010140e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -465,7 +465,7 @@ static const target_ulong vs_delegable_excps = DELEGABLE_EXCPS &
       (1ULL << (RISCV_EXCP_STORE_GUEST_AMO_ACCESS_FAULT)));
 static const target_ulong sstatus_v1_10_mask = SSTATUS_SIE | SSTATUS_SPIE |
     SSTATUS_UIE | SSTATUS_UPIE | SSTATUS_SPP | SSTATUS_FS | SSTATUS_XS |
-    SSTATUS_SUM | SSTATUS_MXR;
+    SSTATUS_SUM | SSTATUS_MXR | SSTATUS_VS;
 static const target_ulong sip_writable_mask = SIP_SSIP | MIP_USIP | MIP_UEIP;
 static const target_ulong hip_writable_mask = MIP_VSSIP;
 static const target_ulong hvip_writable_mask = MIP_VSSIP | MIP_VSTIP | MIP_VSEIP;
-- 
2.25.1


