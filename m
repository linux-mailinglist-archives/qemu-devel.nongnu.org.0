Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5856F45AD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 15:59:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptqVy-0001Ad-5W; Tue, 02 May 2023 09:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVo-00018M-Ei
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptqVm-0003TH-9I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 09:57:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso38170775e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 06:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683035865; x=1685627865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJMDCIrnLpJQVNLpV28r30ca1fSijEZH0j2GSypmOZY=;
 b=ghqRIXx0rc5PLUCCDzCOjpQQZZQrOzBC15n0J+Pl2UZ7YY3r7ZDtTCcLzva9GKKqfr
 n8JVtPEzNKbGl7O1o152Y83bwSuWkeiO98PqnZ/ivNxkcseJDcjUwOBEwIbsp48RulfR
 da9D8EeO0iAhBwvsRU5wtfnllMLOtBExGgydEZGrHZpbINGCzERX9gzizAqhUz9wTHev
 VBXQxjSG6VUlirrR0XYU14Z0Wv//nH+p9A8IDZbMlkH23XH03xiqE8br8umKZTuWnaYO
 DnSwt/IcB95336/tUOVOzqZ6lGU7RphMQJv5KCNL75bbRI4UFNVxfDrS08W07H+FfeGD
 4eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683035865; x=1685627865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vJMDCIrnLpJQVNLpV28r30ca1fSijEZH0j2GSypmOZY=;
 b=FF9M8CGNxedoTQCr1BDufTbndjFKZUaxAydUkzxRwFvQCt4z9119KfgHtC62AzYy1A
 9YQcrx5SWo9SS3Hsnm2ThL47b7whApk2Nw+ii4WQ/t9+7eSka4azIWvEvC491af82Ltt
 mlDMkQb3le1Y5breaYUGX+K66O9zFPbhbQYEs7FaZMRRrjf5A74M9ejO9dTDbAsudZf1
 AXD/Pis3suw30fpjj9SBwKfPWULYyVN9uhlpOfW8XO3LyTvUlCJfw8o8ltPdK7etpLX3
 v+WV0p/xCAo1B7KtazWdj8ID+qGxTnv028+VajW0SjQeg4lEuYy+Hf7k0AQm1oKRTIvQ
 S6Sw==
X-Gm-Message-State: AC+VfDytgUhNzv5+uzM1aKkTUxyFnO5HSlLmWTR/jNGLvf5XXuIIgZR8
 zDetzc6smDGOKPFlFfWM4PQOgFi+uzH71n7Bn3b/Jw==
X-Google-Smtp-Source: ACHHUZ5/VkPObEyL6oJKZPiYKVDWG8ZtW14YGj8XZfFdxD/mc6kem76smMknxQzbWVDfkMwZ4Dt1Cg==
X-Received: by 2002:a05:600c:228f:b0:3ed:2a41:8525 with SMTP id
 15-20020a05600c228f00b003ed2a418525mr12621160wmf.22.1683035864857; 
 Tue, 02 May 2023 06:57:44 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm39461140wms.22.2023.05.02.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 06:57:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, edgar.iglesias@gmail.com, tsimpson@quicinc.com,
 ale@rev.ng, anjo@rev.ng, laurent@vivier.eu, philmd@linaro.org,
 jiaxun.yang@flygoat.com, david@redhat.com, iii@linux.ibm.com,
 thuth@redhat.com, mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 jcmvbkbc@gmail.com
Subject: [PATCH 2/9] target/cris: Finish conversion to tcg_gen_qemu_{ld,st}_*
Date: Tue,  2 May 2023 14:57:34 +0100
Message-Id: <20230502135741.1158035-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502135741.1158035-1-richard.henderson@linaro.org>
References: <20230502135741.1158035-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
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

Convert away from the old interface with the implicit
MemOp argument.  In this case we can fold the calls
using the size bits of MemOp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate_v10.c.inc | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/target/cris/translate_v10.c.inc b/target/cris/translate_v10.c.inc
index 32338bb69b..b7b0517982 100644
--- a/target/cris/translate_v10.c.inc
+++ b/target/cris/translate_v10.c.inc
@@ -80,13 +80,9 @@ static void gen_store_v10_conditional(DisasContext *dc, TCGv addr, TCGv val,
     /* Store only if F flag isn't set */
     tcg_gen_andi_tl(t1, cpu_PR[PR_CCS], F_FLAG_V10);
     tcg_gen_brcondi_tl(TCG_COND_NE, t1, 0, l1);
-    if (size == 1) {
-        tcg_gen_qemu_st8(tval, taddr, mem_index);
-    } else if (size == 2) {
-        tcg_gen_qemu_st16(tval, taddr, mem_index);
-    } else {
-        tcg_gen_qemu_st32(tval, taddr, mem_index);
-    }
+
+    tcg_gen_qemu_st_tl(tval, taddr, mem_index, ctz32(size) | MO_TE);
+
     gen_set_label(l1);
     tcg_gen_shri_tl(t1, t1, 1);  /* shift F to P position */
     tcg_gen_or_tl(cpu_PR[PR_CCS], cpu_PR[PR_CCS], t1); /*P=F*/
@@ -109,13 +105,7 @@ static void gen_store_v10(DisasContext *dc, TCGv addr, TCGv val,
         return;
     }
 
-    if (size == 1) {
-        tcg_gen_qemu_st8(val, addr, mem_index);
-    } else if (size == 2) {
-        tcg_gen_qemu_st16(val, addr, mem_index);
-    } else {
-        tcg_gen_qemu_st32(val, addr, mem_index);
-    }
+    tcg_gen_qemu_st_tl(val, addr, mem_index, ctz32(size) | MO_TE);
 }
 
 
-- 
2.34.1


