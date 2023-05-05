Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1242E6F8AD7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:26:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vE-0000eB-4z; Fri, 05 May 2023 17:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0000dL-LM
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:58 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vA-0004P4-2M
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:58 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so23070775e9.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321894; x=1685913894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bOXqUcEIKY7lYB4B2J+FOo94uyYip8zFUIfwUoelhLc=;
 b=N8XbGOn3jryyqdBF+LSeNzvGmLZhb12N8iNx1K9pHJI0odgUrgb3QyVLJVoNN3LPbB
 D0CtxOX83zjUhe1Z55h0RDfqaisbjI1ghtH3kXgWuHuiwlVgQQy0xz2j445IHMxXO7y+
 ioR4NxRRZ28mO4SxY6fYasjpqznUkd9GmQ4/BZEURLg+4/Ppuf4BTVjW6kOgk5vLjYJ/
 AkDE4Vxt0bwrEJHgBdMNBK7k9ktsvxmdm0LOZkUqnjQOL9tgEb6MHAH2X6orFgBcFQtQ
 W32nHlK2OmfIvSCLDE373ARKBLIsTESTX6GK1KN84Bm33xN3Ez/PL4TuhQtblUnQ/zfR
 Qo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321894; x=1685913894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bOXqUcEIKY7lYB4B2J+FOo94uyYip8zFUIfwUoelhLc=;
 b=fHhI1RAlnW5bLR7E4G2Rc0AKhF3+VNd9sT5REzD4Uh3KiK3X8KSp4I28k/eh2zJi85
 ajkOKcn3zp6Z4GonhBughYd+Nm/VG5WDy8i4jdI5hbBeXM+iqUZ7o0oP/eP5rYdZyPta
 8OD6QTbVnscMx2k662806WbWhXpQT4j0IL0qs81a2h2VOK6dnC+LK0Lqx7PfiW8A7oNW
 4C7iAVI+Pg2LsB2KOHlcbrRUt+8f6um8sT8jV+EcfnFcvSODUMKEw+5D5+yeaJNOQR+v
 kTcQUEFvoiMzJ/+JMLjL8WxE8djgPn6+IVz2qEsf0BWTnSKj3/GR6K97XUPRTIFdAwLQ
 rduQ==
X-Gm-Message-State: AC+VfDyEA3YK62NSmFmXZ49n1uz9ZP0rZuWDkJM2Mdhqh57pldhFt2/4
 v2zWSTm280b5qYgGwMLtNu/KtMdWDuqM6kaZoF2HPA==
X-Google-Smtp-Source: ACHHUZ7p9FQOSAiTO9VD1hvDZ4+jt8dYm4H3B5k+Z11J2xbwRSmxvKuj1XC9YBvJNxk7T3wgxbQX4g==
X-Received: by 2002:a5d:4570:0:b0:306:44a9:76a1 with SMTP id
 a16-20020a5d4570000000b0030644a976a1mr2040826wrc.17.1683321894682; 
 Fri, 05 May 2023 14:24:54 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>
Subject: [PULL 10/42] tcg: Remove compatability helpers for qemu ld/st
Date: Fri,  5 May 2023 22:24:15 +0100
Message-Id: <20230505212447.374546-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
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
Acked-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230502135741.1158035-10-richard.henderson@linaro.org>
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


