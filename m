Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D042B2FC
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:57:55 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUSo-0005ln-TB
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHr-0004on-H1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:36 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHn-0004zG-EF
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:35 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so1137911pji.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EJcVcVJs6vw71VO7NFgJLijh3PCAnbE5c1+5lp6vnOM=;
 b=cNKLG9ajI492qtkyFAZbEynCB/1yYuZD3X234u5V85apI6Cw9O02qjTizawm3SkeUK
 aQ/r79Jpv5GkjRe+8byshLdjnp3MZQiJNEqKM9VAsA8PFJGhW9F9LzDdmgBzOO1eN6vJ
 XaXLWVzBklt5czAE8rkCELKkiVIycjAOtk3/7479bmxjTzOsboSazSD0YFpg0WKPKh3W
 +/Vcadr7MH09r3IoH+RYsI61XgmitJNt+Ib1zT1JlSj7runGeg+v0RX+jx/8v1Ul3ejy
 PYd8kIVs2Qy7KeKwbsR/Ctt7Y8Jr0ixem5Xh+KgMzpPO88MbcirNAKlsL8NohnAPngWX
 lupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EJcVcVJs6vw71VO7NFgJLijh3PCAnbE5c1+5lp6vnOM=;
 b=jY20WLmdQI5eAwLOEV0pRESGiCdA3QoRZlX/gt94XrVbsQgwxVv4ouxn4DW/H4QKYp
 R2Tss7P0fDiCBcnhDcMyHtqwNhVtWEHbEZS7e+WGP0nVMC+hviSPQvP7sR7juPxciF9O
 DvrQd9y/2N4cr7Ctc1Lw5I5Qr76GX4i2NDEb8kb2qd6wLRvd6LPDcSp3qAypLC04NcND
 srt+qnQ3gjXt6PqePJwBr+zBIjsyhKBrhs55laVuCOlDHQyC9fv3hvzyFwRa7ISN7Eaj
 7V1GPoeckYSNKPCW/dP5Gsu2Ki9SQY1bK1mIVO3mrLWkXpIEToQnaBPlRtewwlOyyJM+
 6aEw==
X-Gm-Message-State: AOAM532UYXfF5YUi34PSHm5rRPrKaoPbkAEchMK3Ekdgz1XL18kIy6lg
 cD7heY6fNPedmzIAzwni614zrNYKgle0YQ==
X-Google-Smtp-Source: ABdhPJz1AwiNEs+l3jw7IvCLMPkYx5bXKdeC6QhIZTTYBR/gh7COsM38PI/ipjlof4IYaXXsesVPgw==
X-Received: by 2002:a17:90b:3581:: with SMTP id
 mm1mr10272803pjb.93.1634093190025; 
 Tue, 12 Oct 2021 19:46:30 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/48] target/s390x: Use MO_128 for 16 byte atomics
Date: Tue, 12 Oct 2021 19:45:39 -0700
Message-Id: <20211013024607.731881-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/mem_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/mem_helper.c b/target/s390x/tcg/mem_helper.c
index 4accffe68f..8624385fe1 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1803,7 +1803,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
     oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
@@ -1932,7 +1932,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
                 cpu_stq_data_ra(env, a1 + 0, int128_gethi(nv), ra);
                 cpu_stq_data_ra(env, a1 + 8, int128_getlo(nv), ra);
             } else if (HAVE_CMPXCHG128) {
-                MemOpIdx oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+                MemOpIdx oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
                 ov = cpu_atomic_cmpxchgo_be_mmu(env, a1, cv, nv, oi, ra);
                 cc = !int128_eq(ov, cv);
             } else {
-- 
2.25.1


