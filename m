Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8F2F2C0E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 10:59:26 +0100 (CET)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzGST-0004qQ-Hw
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 04:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGB6-0003mI-Ul
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:30 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:46490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzGAz-0007W1-9Y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:41:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id v3so1088860plz.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 01:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9thnu29aSy99YUg/so9eSCfEpK9kCKrFxV7BaONEJHU=;
 b=joiCAkoxb2/1vWc7PF3k7r9i15OiDUU2axmvnU/X+78ouRTRgL+V+LkmErfGA5rs9x
 SoFz0i6SHWR7rCTb4bJWFBNga4oW5+gvjRXy5mu9F4OYbF7wbXS17kE4Iao/FO6hJDa5
 PkTR2SrIkBGUPnOeyHvJmF9CR8If4gOp9b7ch/vlQOV5ERUJqVhjnsgeBMl77hnorE4y
 2GNPV/KkL4JLdBjMpsnPxzeZmoSZmF3AIZXv98ft/gx5ONqEbV4VCKvI9jCHX1e57O5w
 h5Lr9dslqho9/lHFaDStfwUmroWvzww8nPf1A35wwhw0vpJQXxZZZCtHz1Wn9dPeH6jj
 UYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9thnu29aSy99YUg/so9eSCfEpK9kCKrFxV7BaONEJHU=;
 b=jn4+RrkiZfYg/H76v2EFAZBa1LM8IgPn3r8nPbK3UThKo1lhKns+DEjYXMFceBzVT1
 1+tXLEO6D4vvZTzyzMoCtV95qSvoS2G5R/3PagJEbGYZFIyk2XkWIeLFkMMQZgYF40Qq
 H//3RVRrbPX///eBNlpXIqv0RwJ7e5GnvFiiNLiGj9zjs3N007EGrP3RYz6Srt1IAkjn
 j3pGdkIkoqtdHWGwojd/vqbPVzrZ0hzgsK+UDvUfT/jOBapSG+GUo70SBuTp6J+eluzR
 5cUU8Wat0b6+V7wQc31MK1IQ0n8DcFqI0yuBVqR37F2SYSsky1FwILDOVeLS7x7v4ElU
 5nBg==
X-Gm-Message-State: AOAM5305wCv38MInvsG7qXTbfL5g2nC6EMEZiOBGXi1o075cujz1G0CG
 LXxW5RlfSHnbs85dbzMZeRL/sex7NiFIRNpC
X-Google-Smtp-Source: ABdhPJwYztYXPmBg9u5u8yd4nfNiHrc+a7hFNa7yZfwN8XLu3/ErDPQwRSYF+y0vnErwtPjiHYNykQ==
X-Received: by 2002:a17:90b:352:: with SMTP id
 fh18mr3681742pjb.170.1610444479368; 
 Tue, 12 Jan 2021 01:41:19 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id h16sm2865664pgd.62.2021.01.12.01.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 01:41:18 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v6 20/72] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Tue, 12 Jan 2021 17:38:54 +0800
Message-Id: <20210112093950.17530-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210112093950.17530-1-frank.chang@sifive.com>
References: <20210112093950.17530-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x635.google.com
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

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 368259f75a0..9349a36b41b 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -361,10 +361,10 @@ static target_ulong NAME(target_ulong base,            \
     return (base + *((ETYPE *)vs2 + H(idx)));          \
 }
 
-GEN_VEXT_GET_INDEX_ADDR(idx_b, int8_t,  H1)
-GEN_VEXT_GET_INDEX_ADDR(idx_h, int16_t, H2)
-GEN_VEXT_GET_INDEX_ADDR(idx_w, int32_t, H4)
-GEN_VEXT_GET_INDEX_ADDR(idx_d, int64_t, H8)
+GEN_VEXT_GET_INDEX_ADDR(idx_b, uint8_t,  H1)
+GEN_VEXT_GET_INDEX_ADDR(idx_h, uint16_t, H2)
+GEN_VEXT_GET_INDEX_ADDR(idx_w, uint32_t, H4)
+GEN_VEXT_GET_INDEX_ADDR(idx_d, uint64_t, H8)
 
 static inline void
 vext_ldst_index(void *vd, void *v0, target_ulong base,
-- 
2.17.1


