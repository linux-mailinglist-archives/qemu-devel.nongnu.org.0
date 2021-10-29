Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ECE43FA17
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 11:40:48 +0200 (CEST)
Received: from localhost ([::1]:55660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgONT-0003Y4-7h
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 05:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNkw-0005tJ-UH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:01:00 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNks-0005t7-IE
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:00:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id l203so8677955pfd.2
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=aytTRQIkNvBda52U1wsfyM/hEbVWO+nzuD0ukDm1RDZsNaAUgrlXxUjSDHK9p3OEb2
 nbXFsnzTIyQ3s7gdbR6YaQ25WxcoovDN6VBngeQ7T1IAbcmzqo09mmk+a1Wtszk1uRn0
 vN37CVcrl5IkN/mUftoeBMeqjtjYND7pFk97pixQaQvQZMJbXN+MhjfgeRXbM0/m4TY/
 KFeBBZpJ8dgtRFVF6vGJxrPhIEotm5ab4Xj+BvmZ2mppra6j/iVoQW6EtsV/WVDVeLk4
 apzqEk6SChkm9iH7fnr/kMYfrxHiaX9cSVKN76XWX0wc0qLbw/YBZShW0864gP+MP7ED
 hAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cn/fxJxDqtzMg2Nd2Dj4Np4DlvU0muGWQbxObyTGqag=;
 b=YOOhA53r725VO8c74nDVckYHWg0GLyV2IJLn5Y8Zzjn3ParbwW+PibpAVF334gblf9
 Jsp7aDSrz5DhTxmbLc5rAF+4jKsbRh0/QsQwp/4lEJTOzp1QliHfW/Yo91AYrdWovMdq
 xLcrkt+dyRwVZI89Zx+AiMnak/TinapdnzjXwz7mXs1ov87Q7iCQmir9o4jvxjcseGQx
 4CK8TL/QfytbJU+q3kSii05TulumDyeUW7rg34J5bZ9VjQ12schhjM6FvBmhyLGyYpme
 ycILLdyq0HnKeMVDXo7fB9FMZ8n7NzX8aWIW2dGwZzICBn7xr7gkLMR29TFqw29jvhyj
 RlyQ==
X-Gm-Message-State: AOAM530POvlPDbSFb4RrhMnds82FUNNkPzETmjG1mCnuS85qQiqyYMGV
 yttL6kt4cQ/APrB+hnWNRV3ZYeXM0oexBlbK
X-Google-Smtp-Source: ABdhPJwyymotyz/HFNgqsiVVik+9CPqAuKa6yr504HSamwdh3AYRWMu9j3tvD5UCSfBEPQhr/QCe8g==
X-Received: by 2002:a05:6a00:2486:b0:47e:4baf:edda with SMTP id
 c6-20020a056a00248600b0047e4bafeddamr8202164pfv.66.1635498052850; 
 Fri, 29 Oct 2021 02:00:52 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:00:52 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 22/76] target/riscv: rvv-1.0: fix address index overflow
 bug of indexed load/store insns
Date: Fri, 29 Oct 2021 16:58:27 +0800
Message-Id: <20211029085922.255197-23-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42a.google.com
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
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
index df45c1620c1..3da4f3b1e62 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -374,10 +374,10 @@ static target_ulong NAME(target_ulong base,            \
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


