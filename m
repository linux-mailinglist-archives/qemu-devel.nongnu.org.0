Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D786B6F45AE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:59:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqW1-0001De-GQ; Tue, 02 May 2023 09:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVu-0001AB-4C
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:54 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVs-0003UW-8W
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:53 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f19323259dso37791805e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035871; x=1685627871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8+IvNZJMcdLOhL9FxadBq6IK3jqw0ZHg8erBjOx+uw=;
 b=GAlIZT1NgLMja07uXJVppK40zEw2x52ILLazz+iarnn9/C0zBkTLgFrxnCpVY30LF5
 k7IZ9ivmK9ed3maEkyJ/k1aLkbyL407aprK4lnCS/PmeGe0jRUR/6ZSH5IeYSpzsBxhX
 /20zQh1ay4jK33FHRf77NsanM8GUi1/Rr6KaHDybxHKln6V+F/CTWRQFTrkan0FN/vEt
 1jOdEr10AMse2ObvS0G5TXGVFeWHfjjFwzKHW10h9pIv4MCcC3EvD282KOzNLMsw9DlL
 a4Z+u2J/9HbMK5VjXcInntCkyyR4L8fpqqxhEDE/GwHq7PgJywhMsjnjepy2sgGcoy/l
 T3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035871; x=1685627871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8+IvNZJMcdLOhL9FxadBq6IK3jqw0ZHg8erBjOx+uw=;
 b=AhlDaMZxyRk7vbTbRSSJxRWHsCrd7bvouLp4+obGY+kBm+yF9ZjvTanxFeJe9N+NAA
 HS1ri5nebw3XrphoM5ARBeyiFizvUxOoaUYap8ilRCymAC/HlVOPJs6ai0lPVS0+O2f9
 DzvOokBgDmNZ9v99BuX1HHa13hvEX2DVGS14HiugmADvFYOQrHtNe88s4U5PGsxWowpO
 XbFn+n78q4n9tPJGD/uVjFpGFsxx7i4RREgj6ck4QFyvawiGKT68U3Qf8KYCWikSVig3
 TagjTmHyrMkqzFbm5my1fULvC0NKxBaWXczOJzG61MFGNHmXd6PlUp7wBOPqmjRvSr5x
 uydA==
X-Gm-Message-State: AC+VfDx0fKCBq20bdiToGfLyt13Usz9GBUI1nztGlqTJ2jV7k05ZNHRF
 SpOtxDai0KF1Jnw3mZSQxrV2H2KE21MKyR7TgtVMaA==
X-Google-Smtp-Source: ACHHUZ5/bTdiBYSB0uM+1bGqIdx9UB+Q/nFEJPbYNHhTpMKfN6Cpzm6C5QfhLE8ysHUAtsqzR8pLAw==
X-Received: by 2002:a1c:7408:0:b0:3f1:8142:43ff with SMTP id
 p8-20020a1c7408000000b003f1814243ffmr12035358wmc.12.1683035870908; 
 Tue, 02 May 2023 06:57:50 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 9/9] tcg: Remove compatability helpers for qemu ld/st
Date: Tue,  2 May 2023 14:57:41 +0100
Message-Id: <20230502135741.1158035-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
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

Remove the old interfaces with the implicit MemOp argument.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op.h | 55 --------------------------------------------
 1 file changed, 55 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index dff17c7072..4401fa493c 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -841,61 +841,6 @@ void tcg_gen_qemu_st_i64(TCGv_i64, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_ld_i128(TCGv_i128, TCGv, TCGArg, MemOp);
 void tcg_gen_qemu_st_i128(TCGv_i128, TCGv, TCGArg, MemOp);
 
-static inline void tcg_gen_qemu_ld8u(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_UB);
-}
-
-static inline void tcg_gen_qemu_ld8s(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_SB);
-}
-
-static inline void tcg_gen_qemu_ld16u(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUW);
-}
-
-static inline void tcg_gen_qemu_ld16s(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESW);
-}
-
-static inline void tcg_gen_qemu_ld32u(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TEUL);
-}
-
-static inline void tcg_gen_qemu_ld32s(TCGv ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_tl(ret, addr, mem_index, MO_TESL);
-}
-
-static inline void tcg_gen_qemu_ld64(TCGv_i64 ret, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_ld_i64(ret, addr, mem_index, MO_TEUQ);
-}
-
-static inline void tcg_gen_qemu_st8(TCGv arg, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_UB);
-}
-
-static inline void tcg_gen_qemu_st16(TCGv arg, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUW);
-}
-
-static inline void tcg_gen_qemu_st32(TCGv arg, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_st_tl(arg, addr, mem_index, MO_TEUL);
-}
-
-static inline void tcg_gen_qemu_st64(TCGv_i64 arg, TCGv addr, int mem_index)
-{
-    tcg_gen_qemu_st_i64(arg, addr, mem_index, MO_TEUQ);
-}
-
 void tcg_gen_atomic_cmpxchg_i32(TCGv_i32, TCGv, TCGv_i32, TCGv_i32,
                                 TCGArg, MemOp);
 void tcg_gen_atomic_cmpxchg_i64(TCGv_i64, TCGv, TCGv_i64, TCGv_i64,
-- 
2.34.1


