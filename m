Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFA3B78C8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:39:52 +0200 (CEST)
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJaJ-0007HO-9M
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyItD-00085V-4t
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:19 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:42858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIt0-0000t6-8l
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:55:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 ce18-20020a17090aff12b0290170a3e3eb07so3087872pjb.1
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUaGX+sm0NS0DUU+29DBSLSesa8Faq3SdPEvW0Ohij4=;
 b=UHS4IsIJwBOUMmFaHdgAnBQ9+WynlInRgIkYMA9Kq6IbBzQgL0KVV5ytjjUy3bzu61
 9s52GhpUh23Wgdh+KZopwOE4ksqvOI+rD0st6i3wWUo1MyppWkHOz5HTjQ0TaDvPkOOt
 MrC0Ol/Uv9OwdvFO8YhQKzCND98sB1OjXdDgCNKuB2507WGpg13Db+Qs1ciOOtf1C/RD
 QqvM+ffdOXGscd3JN7/goq4inwHT0VBDw9fNoHXvEfM0nilKQSUYcFIOohNsB6FUCWNX
 O948KPm/UIVRo+L9PeOcF3qCe+BTSbmn8bE3PqGyS3nPok3C07dnUjaK/x60/HgZXGG1
 TKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUaGX+sm0NS0DUU+29DBSLSesa8Faq3SdPEvW0Ohij4=;
 b=NaRWir5fopaIj4B/V1MbbCN8PO9oM66hY98aWLp8LcYyt5it46SZHdYpS5M/jdEa0V
 IXyyh0tlHn8g3LJbyuSiUwLm3y85RiTCYmwHv0+8UiZ2+Ia9C5dMpTHeVt+GniM+4bhu
 uRLgVpCAL5by2PQzvxQ8PR3Ee4yRASaArCJTFUlfEyzZCfpR4D7I8bGNVVyNiMKtlCrF
 yweYi2xCxZBfy5qvylmYgTGjBV6hasqLiIHmuocANmVRoNjd4y3J5gZFuPl/8OvDrLjV
 VMt0U8Vnk2Xamzy4UPVAIoieH1b6/dWBwAgGidOwGUZSejjaN+ASLkiME3v8GyR00InA
 Gncw==
X-Gm-Message-State: AOAM533muIkwdaBahp2y66hS0i0YZhIEEjqUgps8CisyWMddCRpOeWMP
 Td5MNJWolMQtMuPQIyYvPyEAs80ZC6UvdQ==
X-Google-Smtp-Source: ABdhPJxFlEkHHhRav6hvLpruKz5kON/UMvA9bUwsyLCFkftQECPp9ZkxRnLj/sUYx/37L9kgMxOoSQ==
X-Received: by 2002:a17:902:da84:b029:129:fdf:f929 with SMTP id
 j4-20020a170902da84b02901290fdff929mr1123503plx.53.1624992904677; 
 Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j2sm18811253pfb.53.2021.06.29.11.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:55:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 15/63] target/cris: Replace DISAS_TB_JUMP with DISAS_NORETURN
Date: Tue, 29 Jun 2021 11:54:07 -0700
Message-Id: <20210629185455.3131172-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210629185455.3131172-1-richard.henderson@linaro.org>
References: <20210629185455.3131172-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only semantic of DISAS_TB_JUMP is that we've done goto_tb,
which is the same as DISAS_NORETURN -- we've exited the tb.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 8c1bad9564..e086ff9131 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -55,7 +55,6 @@
 /* is_jmp field values */
 #define DISAS_JUMP    DISAS_TARGET_0 /* only pc was modified dynamically */
 #define DISAS_UPDATE  DISAS_TARGET_1 /* cpu state was modified dynamically */
-#define DISAS_TB_JUMP DISAS_TARGET_2 /* only pc was modified statically */
 
 /* Used by the decoder.  */
 #define EXTRACT_FIELD(src, start, end) \
@@ -3242,12 +3241,12 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                     gen_goto_tb(dc, 1, dc->jmp_pc);
                     gen_set_label(l1);
                     gen_goto_tb(dc, 0, dc->pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else if (dc->jmp == JMP_DIRECT) {
                     cris_evaluate_flags(dc);
                     gen_goto_tb(dc, 0, dc->jmp_pc);
-                    dc->base.is_jmp = DISAS_TB_JUMP;
+                    dc->base.is_jmp = DISAS_NORETURN;
                     dc->jmp = JMP_NOJMP;
                 } else {
                     TCGv c = tcg_const_tl(dc->pc);
@@ -3309,7 +3308,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
                    to find the next TB */
             tcg_gen_exit_tb(NULL, 0);
             break;
-        case DISAS_TB_JUMP:
+        case DISAS_NORETURN:
             /* nothing more to generate */
             break;
         }
-- 
2.25.1


