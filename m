Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9223DE55A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:30:02 +0200 (CEST)
Received: from localhost ([::1]:51790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAm41-0003mS-QY
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpv-0003qL-Jq
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:27 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlps-0002Td-Kx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:27 -0400
Received: by mail-pl1-x635.google.com with SMTP id t3so20041911plg.9
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K/7Y1V5oBIIfdjY20lpJpKxfET+Clwy5MMgM5y1dWLw=;
 b=CD6wsUVxO9fdAt2f9/G6dZ3yTbWANvbkrV72ToZ9OPo2bTHjFhwRsX/7DgMFR4XKyH
 05szZqyBEBMv9XBUbtmMPgtTDHrbt3RZzPMqYJD3CNnMcc2iy7xFnCo9c63Ru3Od5fJo
 v6SA+k2LngcHoiktjHTHj9wz37zKHTSOyzFmEqac+iOsjduq5wG6yujIpCSe5raZOGIU
 +eNPj9FccqohYsSR2NZuVk9zaJT0FR/w6ymd7M4UDd12ImFXrESJ7pxRHEw1Lpi+AS6G
 yos35yzORlzikZYMtlGutM2RbRGo6OjM1cUOId4y293eUHL/u8Yi/nnFQY39E64YKuSi
 e+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K/7Y1V5oBIIfdjY20lpJpKxfET+Clwy5MMgM5y1dWLw=;
 b=prLqX8cxl2biJ0Vq64G38+Ju8tvoY1J1Q6DNf6K9i3sBYm22hnJHK+kZXaXBXe7n8/
 fk7pIOXW3abyaunm7o0WsqEfzAXOR1gy2ewTAztdrMcIcLfTdAcZkZIQp0zYAJTYG2fn
 ghiP/kNDkkqHW+vLBW1Y4/JSRzOWNmwSph33H59fb23F9r3eX7qAVap8PxzZSxY75a2h
 Kh5IaZH+hnUAOKPoi/7DBEqOgJPI+L14EiTeX57udw+980a1N942KtUVDyTeIMV99bJl
 Ypka7kohgvaU94ZbGuQTX0fp7s+gnDqkxNn+s48iXkaLjYnVVWcJcUvHsAVOUdZgbXxc
 UFuw==
X-Gm-Message-State: AOAM530uB+C7aqzVGZ5sBPTTT9w+WR+On+F9ro3qluYVn616DM8lY1JJ
 LZn8Mrr3ADCbXwbNnowFs84RiEs2DsvUpQ==
X-Google-Smtp-Source: ABdhPJyXMRIEpP4DEfLEJ8kNCNMeulXm+CCcGaw2AnKAxvcyL/6Ao21s6PyLE28652seVxX6WaXR8w==
X-Received: by 2002:a17:90a:eb0c:: with SMTP id
 j12mr2392334pjz.116.1627964123475; 
 Mon, 02 Aug 2021 21:15:23 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 32/55] target/s390x: Use MO_128 for 16 byte atomics
Date: Mon,  2 Aug 2021 18:14:20 -1000
Message-Id: <20210803041443.55452-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
index ec88f5dbb0..3782c1c098 100644
--- a/target/s390x/tcg/mem_helper.c
+++ b/target/s390x/tcg/mem_helper.c
@@ -1810,7 +1810,7 @@ void HELPER(cdsg_parallel)(CPUS390XState *env, uint64_t addr,
     assert(HAVE_CMPXCHG128);
 
     mem_idx = cpu_mmu_index(env, false);
-    oi = make_memop_idx(MO_TEQ | MO_ALIGN_16, mem_idx);
+    oi = make_memop_idx(MO_TE | MO_128 | MO_ALIGN, mem_idx);
     oldv = cpu_atomic_cmpxchgo_be_mmu(env, addr, cmpv, newv, oi, ra);
     fail = !int128_eq(oldv, cmpv);
 
@@ -1939,7 +1939,7 @@ static uint32_t do_csst(CPUS390XState *env, uint32_t r3, uint64_t a1,
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


