Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F96F8AD1
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:25:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vD-0000cw-82; Fri, 05 May 2023 17:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v8-0000aW-Hr
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2v6-0004Np-5m
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30639daee76so1558176f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321890; x=1685913890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRV8Cx+YlPo92Hwls/dIiJIZvxAoW7WnNpj6EC6C0nA=;
 b=nMEdyNZr8J2zalF2AC/biAderraInxqmsecXzXHMJXTPfrPDbtCjjGQhH83Jz21C0R
 En6JOfS8FUd25DaYya3LABgLmDdtqjYDcyHyr8bIvr2oHi/ZKKeboUWWJSAMewWQT/er
 qfsPTDEDcF9P0H3HNcAfg2J10boaa4Rs95cJMjoJH0ak7NUw4H8UX4zLuR8DirM6/zPo
 aZQ8UY75B3xTmRlZSa6YIbF1TH2vHrymBAQk+EZA7asWgXwiQXF5/eYXN5l5/roxgb01
 3tLIio687XNddyC8yFQeeOF/7NpNHwockAOVEtMgSGmwxrpGzSQzoVtgNAYs7thmbXKd
 EhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321890; x=1685913890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRV8Cx+YlPo92Hwls/dIiJIZvxAoW7WnNpj6EC6C0nA=;
 b=lfD8diWwaT0bapbHQrEakxEHkbgJeU+vRinZna7I66yQ3wh8T8KlGKp8uRxADehdAv
 yGp9laYN7KbMSDc+BMNVKMiyVBxckoBYHOJrkv9RQxfXiZOyLxSX7Xjp10aMK2jNjLqV
 QwHVy6rSCRRVTbPXPlQlwiPJJs8yiM67ZYvl3KBqWuSK6Se+1ZbQ8warcxS67j3abdRc
 OLWg+gg/LtcbNS97XVrwk7V5l9W32mSZrh2FwRPVVo/iF2xCpshPr9ehOnd3I60TfhIj
 PJwmZaZmZlLNp35pFo6B4ZYJKRtUGZdz6IiHKQhlpMpomtHFI+sTNMHdb3ZzZQpmzr88
 /HOw==
X-Gm-Message-State: AC+VfDxlWHfVXNbeVu1dceDW4GJ2YqrJN7rLaoj0gMaSmnxrSxBJCE9e
 VCu5aNa9doMpidIE7yDN2lKro6J8eI2zb28zEKGxng==
X-Google-Smtp-Source: ACHHUZ6SgWfnKHF3tEdO8zqmSprvFOGvpPywvooQcwK2zyV0RQ1X/yhQ01k09kcRQr5yTHSEV8m7Cw==
X-Received: by 2002:a5d:6803:0:b0:306:4586:28c7 with SMTP id
 w3-20020a5d6803000000b00306458628c7mr2003654wru.39.1683321890581; 
 Fri, 05 May 2023 14:24:50 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>
Subject: [PULL 03/42] target/cris: Finish conversion to tcg_gen_qemu_{ld, st}_*
Date: Fri,  5 May 2023 22:24:08 +0100
Message-Id: <20230505212447.374546-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
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
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20230502135741.1158035-3-richard.henderson@linaro.org>
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


