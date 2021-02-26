Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D89E325C00
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:36:13 +0100 (CET)
Received: from localhost ([::1]:50012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFTvI-0003Xr-7t
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgk-0007uL-7y
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:21:10 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTgi-0001CP-HB
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:21:09 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o6so5262494pjf.5
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v2m8qaPy/NmmKGq42kwy/mAtZ9ipkCeew/eIbqSizS8=;
 b=ehQ8Rab1WyRXZYgXuEaWnEw2nlBht1IFwWGCJ0GxhSy8Npm/6y+7B7yLdv232Ncgso
 TJeWU0BdKoi5BXBa99b8+1j96g4sCD0C8EHoVOioVqyXfbgv/xm10sKi2v0428zH/Q6C
 j/JqrH9MZO/LP4dQih9N95P5dn5Ax4MMwIu7D5vmXS2QgmVqVIrh8BFSLXdgkhlBS2XJ
 MPc6IcpTrGwl70zWSrEg5+vsk2QcUIiksyuapt/PmWUvj8MiY1dwzR1Trya6Qmoq5r+T
 +vUiiRTKOrSIG1X67RLF8suxOf0kT07KQf7b+YEVOOGugNnYIHZDnhbegE3P/bz7+Obb
 vnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v2m8qaPy/NmmKGq42kwy/mAtZ9ipkCeew/eIbqSizS8=;
 b=W0z5/Kgli/WGY19he4I2W8ZO4Q6pG14c66vENrfZgW2yhdjErdJtM93K1J701zFxE0
 dDSAORymDErHDi7QTe6mQxnWS3Iaflfn9tO1/1n95FJWRzrxJehbA4Js7DqjzmZOx1i3
 8MxoOQ0mgvm7EURUUMh72PDMq1SBrFAZj9hdSs0c8VTy0Ect71+6nfRk9/rb+k4HHzi8
 y6wWgY9YG8nD+lkLKon0UxAE7UP0GQQSzyAaskxm2hg1IEBk8mchwYeAX8CWknkaszmb
 bgiL0u8grL3dzqL1vzg/r3swqAfU9EofecCzwiMJer/uAE7Z9w+nTk6Akt18s0KckYPX
 AeUA==
X-Gm-Message-State: AOAM532tFw1j+AUyJE6Fv1yvBJ8tdSqHEoaEFNdN9JpAwalO8zttPagz
 uVHTaB+PlMdZykwWBdS0AVdVo3MsL8+HZQ==
X-Google-Smtp-Source: ABdhPJwAShjJnEt5LOslyHmK1rih+Gmt70Qqnqj8LxryhywD6A9aSfylySanv9W1O+a6BENfpAelwQ==
X-Received: by 2002:a17:90a:db51:: with SMTP id
 u17mr1183761pjx.194.1614309666881; 
 Thu, 25 Feb 2021 19:21:06 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:21:06 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 20/75] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Fri, 26 Feb 2021 11:18:04 +0800
Message-Id: <20210226031902.23656-21-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1030.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


