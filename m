Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1446F5128
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:21:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6do-0004O5-Gp; Wed, 03 May 2023 03:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dN-0002tj-Rd
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:46 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6dI-00074P-63
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:10:41 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21afso31657765e9.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683097833; x=1685689833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=Cozna/z3vEy8KdOLgrqsl6EX/BGC2ZOsrTPy5wQbRqmzfmFMhPU9A6Hm76MtVqWzk6
 otQ7+GCxa12CDoihSNRlfQcd2iYEFVMEXQ6+bDDgBLUFCwzEBgEHLDWfIzIPYKvp0GJK
 fYmpDzX7A5gg6FifOmEkPpV0AystCG1rYeBNXb05oMz8Rlq6oaFIj0V38AeevM8jQ6Z9
 jV8o3pT10/5hpUnyhHe4Gqe1g8M9v7YqN+ZMPgLSP1NoyiNk8DmHBPdEmZJo6Ihr/sKL
 jRVu/lPSSpyIt1kvBQYbywITtiyC8bTNnafO85nKfdi4DYcr1p6f88xdPQc7RMq41CJu
 iuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683097833; x=1685689833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=naApWSmi65k1gRAeLMa4iVYTmTT0eNi8LAPHTVnKRRQ=;
 b=Rm/sTPI2VLg4zn9dcP5yweE3UHVsSWGFfnlUmHzAWoR0aOLTJYk171BfQl/fCGX7GJ
 OQLKtZ6gMP+7s9Hm0Ov8oP86ChANx/J6xGCSND++cj7PSt8FuEnaIBU+ixknP2d846yo
 3+jDfk4zvQwgANeK8kXt3Ca+bEW+/4O6iRT/yqO/Pb5t/wjFu5ObFrzUPuKClAVlGnga
 j9NP8Jg5e/jGetAQAmlOEfOCqsGvtgpiPRUQeyTj71FkKkvKjkiC+K8ohFLvN8z8GFhj
 oY9zCjIQkD49f9O6SycVeMl44ikSorj0qheHhYQNxFdnRPNGqsuwtUILAWJt6/MxnEfS
 8yiw==
X-Gm-Message-State: AC+VfDx0pj3yNfvH4DMmblZmGff5dWzQs/WEeWL08vlYo6qt4El5JSRG
 C9oYLSWp4RAWU+4cXyOR+2K8s63MioHoeIKoCyfm2g==
X-Google-Smtp-Source: ACHHUZ5AS0Uyzk70wzHW+mZP6uSMg4jh9IG9Ppk0bQywQS5prc/YiD5lyrJGHHSfqm1r3B5GUF4TOw==
X-Received: by 2002:a5d:4a0f:0:b0:304:6d32:d589 with SMTP id
 m15-20020a5d4a0f000000b003046d32d589mr14614726wrq.18.1683097833345; 
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c444900b003f173be2ccfsm54223673wmn.2.2023.05.03.00.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:10:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name, gaosong@loongson.cn, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org
Subject: [PATCH v4 47/57] tcg/mips: Use atom_and_align_for_opc
Date: Wed,  3 May 2023 08:06:46 +0100
Message-Id: <20230503070656.1746170-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503070656.1746170-1-richard.henderson@linaro.org>
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index cd0254a0d7..43a8ffac17 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1139,6 +1139,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 typedef struct {
     TCGReg base;
     MemOp align;
+    MemOp atom;
 } HostAddress;
 
 bool tcg_target_has_memory_bswap(MemOp memop)
@@ -1158,11 +1159,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 {
     TCGLabelQemuLdst *ldst = NULL;
     MemOp opc = get_memop(oi);
-    unsigned a_bits = get_alignment_bits(opc);
+    MemOp a_bits, atom_u;
     unsigned s_bits = opc & MO_SIZE;
-    unsigned a_mask = (1 << a_bits) - 1;
+    unsigned a_mask;
     TCGReg base;
 
+    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
+                                    MO_ATOM_IFALIGN, false);
+    h->align = a_bits;
+    a_mask = (1 << a_bits) - 1;
+
 #ifdef CONFIG_SOFTMMU
     unsigned s_mask = (1 << s_bits) - 1;
     int mem_index = get_mmuidx(oi);
@@ -1281,7 +1287,6 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
 #endif
 
     h->base = base;
-    h->align = a_bits;
     return ldst;
 }
 
-- 
2.34.1


