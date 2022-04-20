Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22737508338
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:16:34 +0200 (CEST)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5Vn-0004zW-TF
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:16:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Ok-0001s1-8j
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nh5Oi-0001Ki-Ky
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:09:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id 2so1241245pjw.2
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 01:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=OGz734JfLRBJyg73PF0Cs61co4UhumCC0eqYB+o9jA6DOvQN5r/LcMdXVS79l4nqNo
 voHxyXFPvctKPm5iLrjx/n6g2GMJWQ+qbvwMq5P9OBiY/5dAmjgb46K2iGcmHkhNQDqv
 lxr30iC92L3nbksYsm1L4PFqLnHm8n0w8zeITGFctuBhsA/ywyoWpgyHwZgoGO+LrO6A
 ElynctgE/oRxD8n82lCfbt5l7/uMC6Dw6w+/xJe8jqCyXw+Ii0t2imOGYCxF3X+1yKwZ
 rp0LY6bjdd4rzk5jG1ib89RSra/QlBLJzS5h8gCjFlRIqR8lG49Ks/mm5eEgtsXw78LI
 4JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ovHygBMPOfLfcmuDDEiWLW9vnyb/lzx3CqcZGXCXoQg=;
 b=Qn3dKQxUHxa/bltoRZhwzF+a77MmhSKGanCbcQZF/xbHp0nQ/IrNVMl8duhLJMHkp7
 SCQVrRZNSAoNkLel+GL8vjZBTZfgAwV8gkWpEcZ8dRjbF3GqvEXHtc31Ji4zbAAM1QaG
 5xbBU3Ki93nUYdYxXe0KqU3TLqkpoHrZ6/9fx63c8uZjqJKtoMaUUadGLuqrIbWbkk9s
 lnATdbQ2ewoSvpEEPBqoBSnJvJpNJiSenyeOX1Gvm2r5wQDswA6s/ndBVXch2Mmcw9fQ
 VupvwZk5xrNC9EU2jHL6iuaO1QWfcDjNn0NG2x6AyfzE+qfsQZjyqQggdoaHC0FSEMtX
 UN9g==
X-Gm-Message-State: AOAM533pBMJIoerg1KmjHAAWUB8o+rgrm8qvT6XRI7RGpzsBzY1vbhoB
 lL9oJk8rvg5mAgS8q/QYFYA+7AckF5KmGDx4
X-Google-Smtp-Source: ABdhPJxuWBD+EgjLXomTuoB0YUwMYajcg5zpVl/EXzE4Rs9ow2K+tZzTwqhHdueD8UEubX0sJhkgHw==
X-Received: by 2002:a17:90b:4d88:b0:1d2:a753:479d with SMTP id
 oj8-20020a17090b4d8800b001d2a753479dmr3097722pjb.12.1650442150980; 
 Wed, 20 Apr 2022 01:09:10 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g15-20020aa7818f000000b00505ce2e4640sm18554898pfi.100.2022.04.20.01.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:09:10 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] hw/intc: Add .impl.[min|max]_access_size declaration
 in RISC-V ACLINT
Date: Wed, 20 Apr 2022 16:08:57 +0800
Message-Id: <20220420080901.14655-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420080901.14655-1-frank.chang@sifive.com>
References: <20220420080901.14655-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Anup Patel <anup.patel@wdc.com>, Jim Shu <jim.shu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

If device's MemoryRegion doesn't have .impl.[min|max]_access_size
declaration, the default access_size_min would be 1 byte and
access_size_max would be 4 bytes (see: softmmu/memory.c).
This will cause a 64-bit memory access to ACLINT to be splitted into
two 32-bit memory accesses.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
---
 hw/intc/riscv_aclint.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/riscv_aclint.c b/hw/intc/riscv_aclint.c
index e43b050e92..37e9ace801 100644
--- a/hw/intc/riscv_aclint.c
+++ b/hw/intc/riscv_aclint.c
@@ -208,6 +208,10 @@ static const MemoryRegionOps riscv_aclint_mtimer_ops = {
     .valid = {
         .min_access_size = 4,
         .max_access_size = 8
+    },
+    .impl = {
+        .min_access_size = 4,
+        .max_access_size = 8,
     }
 };
 
-- 
2.35.1


