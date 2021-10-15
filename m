Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428D242EB38
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:39 +0200 (CEST)
Received: from localhost ([::1]:40794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbILS-0004Qo-9S
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwj-0007Iw-Cj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:05 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:33593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHwh-0002uA-6W
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:05 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 q10-20020a17090a1b0a00b001a076a59640so6926499pjq.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8qNypBx+XCd04Rc1mPlj3m8bp+fngd8P2AeAFf31H0=;
 b=JjglIMc7D/5sYzA9oh8GJhNjQlhWqZHeTbB1hjeMqdQMwPEYMkKCigaDtttVUAN2D2
 w4g5VpCshmgF6XjhW8vIVJWYmQQPrQPZ5wGkjsv/vMHAvpedt6MHzyQBtolhDUxSn0RZ
 9fFchQwYypeQMeizlzK9zm1kNWmQxXRW8Tv7mrsjk5rQZaiKk+hoC73fAwcrMqlAN7qx
 7MVGQzd0jNIevl2G8ayeH+LF/dgbm8e9eDSufMr3oZ7WLUmAGQ2mma8UqE9I1AoIhYHg
 VCQETGeQxqGOoRZ2oaPPK3hhG0JeV3xY94je+36kHFOUPsohyvXnOidFDo61xOdUYUkp
 GK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8qNypBx+XCd04Rc1mPlj3m8bp+fngd8P2AeAFf31H0=;
 b=2GkWoGj5+ayI7j8t/aCjyk/OvlO4ZLIP8mMpbt3hajq5gmKZiXPWgWKebo5dSyYacn
 QEq8PB5xsSyidicY8vZuYuTiURLq/DBIuZsN5RaDUjZWLI7wJH/SFEmauMTWhce2L5uS
 beoSK1lGqkW9E0R03HcFg7vf5SkH1pfD1+kMSv/QWUaESB3FNae6E5s1epTYQ6LiiNSk
 u8EnB5H/rYX9Ljmbih6N1tjc5zUokredRJDz2hAboWc8Ib4/+2vyxRaokBeTJr5Jncpn
 MUrrvcjehcctq3Dt6bD+MQLjjwiZT0Ug0B9yYoI9zWW/ad36MGDaV8kDww3AL0RmeeQm
 tAZw==
X-Gm-Message-State: AOAM531Hq2oumkpOQz1EMneVIRn4fT2fHQryXlGhNcCrWNk4PTksIf7J
 k273/OZ4U1mycdgT39ni5r7c03egBBywww==
X-Google-Smtp-Source: ABdhPJyUgTXUYpousdinOMottSHGnjDFSZPIHcOaaYBjS/EWmrZ3/GUjD64JjBVkneRsTCeLXrrmZw==
X-Received: by 2002:a17:90b:4b03:: with SMTP id
 lx3mr11707742pjb.162.1634284081764; 
 Fri, 15 Oct 2021 00:48:01 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:01 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 21/76] target/riscv: rvv-1.0: fix address index overflow bug
 of indexed load/store insns
Date: Fri, 15 Oct 2021 15:45:25 +0800
Message-Id: <20211015074627.3957162-25-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Replace ETYPE from signed int to unsigned int to prevent index overflow
issue, which would lead to wrong index address.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d0c4be2ecc9..366a4476916 100644
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
2.25.1


