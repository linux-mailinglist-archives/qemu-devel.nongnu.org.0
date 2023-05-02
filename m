Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82116F4293
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:21:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto3f-0000dX-9I; Tue, 02 May 2023 07:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3d-0000cU-0w
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pto3a-0003DB-5e
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:20:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f199696149so22194655e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683026426; x=1685618426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lK51qYTnNnXJZN0e/9Jj4Bv1cCHWx7/0IfdphjJpI60=;
 b=L95KvQ6rBgD+qvawWChW8rAILSp8WVgzuGzmQSyi1Uk6UCsT1LttKIuoHxklZJ+trd
 xGv+NRi9+5Wa16J1D9k+42+WsvkkjH1jM2/vVxo/vUaq5nPrGMqNCUnUj+jV5c1aiBDr
 tXzvnm5zY0Bvr4F9v5dQ81Q8uQFGZ3+KE/Rppz9/+3l8AKnBChj+fUa9MFHZpZQdUKJv
 jlL0I22Qxg92yAqmSeAL1fmvnK274v50nu34aIvIkpaVTGg1A+Mjq5fA1YV94bBVZdQz
 Ahk9bSN6IOyFNdFPa3IlBmrgFPBVMoyimrk8YX2Ex4LUBFw6IWwM0HrSYYq4c53cYHNf
 f8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026426; x=1685618426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lK51qYTnNnXJZN0e/9Jj4Bv1cCHWx7/0IfdphjJpI60=;
 b=JX8Czp9EQ3Pfa2TqC8V292zB9K1Ssx6mGdHvqnM32wSVvihZLiaCCCvlpuHcSVgLAr
 fuJEOy4NJq9mJtpD6wzcQaVhD0hslKj4oQP5U5v90SujzUdEuLt1i2W18cLX9zuGNuxc
 886/g4vHSd080VZubsQ7XX03wY16efmAuWZZosCeTkvVu+HN5BZpmYXY4WyF8dSdVaWH
 FMaUbtbUQ/ZCdXcRl4DViQ4JtU8OyqYzVVwDlyN4wsmxA3HrElK1DOl4P1tPK/llWD0a
 b2m/dKrv2N30uqDCFX2vY9yplodeGFy/k7RB+2GXxMSOcEBnfWdihTMJhzjGhoHppc2A
 8SBw==
X-Gm-Message-State: AC+VfDwHbu6ECVo+J/dWFatk7eEJfNTrPpF+c5qN7Q1GZ4Bs4qiYqxm2
 RF1qKhnGrhSwRVRwbYyhPGLpv4d8orW/BDX2J8H6vA==
X-Google-Smtp-Source: ACHHUZ7EFNhQdLy7GGZmGoTXCdrL8gWL5tCWtZe5oKXfYLlfO5JREu6q8SDntNT23necnF0Ni0NpRA==
X-Received: by 2002:a1c:7502:0:b0:3ed:af6b:7fb3 with SMTP id
 o2-20020a1c7502000000b003edaf6b7fb3mr11664221wmc.2.1683026426025; 
 Tue, 02 May 2023 04:20:26 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm35182623wml.11.2023.05.02.04.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:20:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 02/12] accel/tcg: Uncache the host address for instruction
 fetch when tlb size < 1
Date: Tue,  2 May 2023 12:20:13 +0100
Message-Id: <20230502112023.776823-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502112023.776823-1-richard.henderson@linaro.org>
References: <20230502112023.776823-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Weiwei Li <liweiwei@iscas.ac.cn>

When PMP entry overlap part of the page, we'll set the tlb_size to 1, which
will make the address in tlb entry set with TLB_INVALID_MASK, and the next
access will again go through tlb_fill.However, this way will not work in
tb_gen_code() => get_page_addr_code_hostp(): the TLB host address will be
cached, and the following instructions can use this host address directly
which may lead to the bypass of PMP related check.
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1542.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230422130329.23555-6-liweiwei@iscas.ac.cn>
---
 accel/tcg/cputlb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index e984a98dc4..efa0cb67c9 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1696,6 +1696,11 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
     if (p == NULL) {
         return -1;
     }
+
+    if (full->lg_page_size < TARGET_PAGE_BITS) {
+        return -1;
+    }
+
     if (hostp) {
         *hostp = p;
     }
-- 
2.34.1


