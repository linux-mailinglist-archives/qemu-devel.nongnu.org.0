Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8E6B2E1C
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:07:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWf-0004FL-Qs; Thu, 09 Mar 2023 15:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWd-00044I-5b
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:07 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWb-0000if-EL
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 h11-20020a17090a2ecb00b00237c740335cso2993421pjs.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfCafz6je9YMB7RCxVqwooZkMjeDhfgC8yEpA0iVQDE=;
 b=VbvO4ZVbkB0ZivQwzwaVjfdrj0+7IGNUUkKXlh7w5hSlzagpDXqbb4G2j7HQlMpRXA
 elaavboZCC6cDLcmkIKFldhtYBdXCcNtDyA7rS1OUbLYxTcCJaXLjheAMRKVQJ5ioJ/L
 n3TEoLG7JHZHoOXV05DD7BdOnst0vnP3d+OzzVq25NF/Bp29ytWBYOKFfj7E5xkpxS+w
 q4WBStULVQlDBNm1btPwnC7XkryjLlLWIxim/XJbaN0dxHyD7FQXCdSf2n/DdmTzX6v2
 b2KqHcwn9EaVbA+3E9vIES1VNImNd3I3Kso1+yQaO6eb6Hjk5/MjGKrwuQ5Usguvx9vd
 5Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfCafz6je9YMB7RCxVqwooZkMjeDhfgC8yEpA0iVQDE=;
 b=QV15TNL/ELX+KUznfhNICDMu/2TT4fHDXsILmAo3DI7y9xtkg1j2synp5Ep9LPkfDx
 u8Y9gsXBGYgWS33cFEWojROm4QAE35vAFTvp9BV7lFtNQ6AVMjeFyUp3F0F6SO8pMZLz
 Af+i+CaDL9NGEvKX+kFPfC9labjQCk1WIbtNhoIkniQmuPDnU/VuWOnlLM/r763a7p8S
 Q5vmN2RkML2ucOXHXt1lPPKPoqSd4Rx1dvODGdcUY7kFMB5QECeXBGxRLfGgeQ8yR0q9
 GJLJCgE27uG+vPP1eH6EjNbXV++m9Pp221Vz4oV5KR+M7cYzjDsRZQMlr3VMgxKNYiDV
 BAEw==
X-Gm-Message-State: AO0yUKXzCBw6TjCbyj++tHDHIANH30YMQdNFLH+SkBF2uDY1Ewz1PLQA
 R+Yh4qE/jiW2A3g0kmdLpCL2eYTjVHUNRE82TPQ=
X-Google-Smtp-Source: AK7set/28QzXNLig8O8QVnSFPzf8tOZJvzK9J9XqMmAYbNmt20HZju0CTdb59SG/Yyh3azkk3zSDlA==
X-Received: by 2002:a17:90b:4aca:b0:235:9d0c:6e3f with SMTP id
 mh10-20020a17090b4aca00b002359d0c6e3fmr23170108pjb.31.1678392363741; 
 Thu, 09 Mar 2023 12:06:03 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 13/91] target/s390x: Remove assert vs g_in2
Date: Thu,  9 Mar 2023 12:04:32 -0800
Message-Id: <20230309200550.3878088-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

These were trying to determine if o->in2 was available for
use as a temporary.  It's better to just allocate a new one.

Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 954a1edd10..9ad6e75434 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1428,11 +1428,11 @@ static DisasJumpType op_andi(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_ori_i64(o->in2, o->in2, ~mask);
-    tcg_gen_and_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_ori_i64(t, t, ~mask);
+    tcg_gen_and_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -3520,10 +3520,10 @@ static DisasJumpType op_ori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_or_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_or_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
@@ -4832,10 +4832,10 @@ static DisasJumpType op_xori(DisasContext *s, DisasOps *o)
     int shift = s->insn->data & 0xff;
     int size = s->insn->data >> 8;
     uint64_t mask = ((1ull << size) - 1) << shift;
+    TCGv_i64 t = tcg_temp_new_i64();
 
-    assert(!o->g_in2);
-    tcg_gen_shli_i64(o->in2, o->in2, shift);
-    tcg_gen_xor_i64(o->out, o->in1, o->in2);
+    tcg_gen_shli_i64(t, o->in2, shift);
+    tcg_gen_xor_i64(o->out, o->in1, t);
 
     /* Produce the CC from only the bits manipulated.  */
     tcg_gen_andi_i64(cc_dst, o->out, mask);
-- 
2.34.1


