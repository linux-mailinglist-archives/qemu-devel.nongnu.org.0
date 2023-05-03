Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC3F6F515F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:27:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6qt-0003gL-Pk; Wed, 03 May 2023 03:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q9-0001y7-4W
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu6q5-0001hi-Ee
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:23:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4443778f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683098628; x=1685690628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hWaMVeRBZL5JLxGATUTsv5CJLUxOm6iqMCkrQNduh8g=;
 b=QmV93evgMjzZM86hxQ/LRBwtnUWSfMPrS1GPvEXi8wiM95V1sLFrwo/VxO3oPQQMtu
 U8Jcp/SSQWRVMQlHmy8GCbi3xYpGg7zzKBb+7VHEwI02NVzac5Gt+gYVGE9loN6i9h7m
 rUl4kAGiIFwc+jxqPXfwI1dHWn06Huz98Z3483W2QgrgVMK3w9r+hup7CY8+TGQ72myT
 zS6P6aPUBVYbK7aemwIAW5UB33CABAH6unnPrA6uu0pFoPIf7F/nJbwq5DuasEO+/Rn7
 O2x/AzKbh3guBQu4i+OSSXiv+9xixurmlXVozMW4rJShLgX6Sirrj0TSTaHweFtBGYqs
 ozjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683098628; x=1685690628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hWaMVeRBZL5JLxGATUTsv5CJLUxOm6iqMCkrQNduh8g=;
 b=Xhh7iFdBhi24u3Nby+2a2feN7W0kECN5hxxUN62tuBtNmbHo1Dk/ylIHYqSk/0RYEZ
 BCu2tPPvg3Edy8Jp80bjnt4ioFLSmHyFbUsY5KJO1pWjrxMWziuVEKivz8XVZXuTjO71
 jjQvAQHvTK1+1QfaWFsKbQU7OnnRoT+feO1DR44gISGaDacvvEQ2gfLz7ZzSZCXLafgD
 YEw6kmf2nlWahTuWEJmmrExY5eLXiwmZXu3KgCfrJBzooBsUk9niAoELStwMaIqV9w2R
 X8LyhPz+Mf7hxaoeAsMNt/U8HI7Ku+DRvc2tnMBQJZ9b0lym1lYGxqUHwBXBdCKIzDab
 cqaw==
X-Gm-Message-State: AC+VfDw1R4idTulyXz8Lg9cgnvY8LLBASdjOHhBJ03rJlM4scK7Q9H9o
 z+5pbtg3n8pKmbg8DIwHxKu6uExee4TsezHUfBimjA==
X-Google-Smtp-Source: ACHHUZ5c1C3c7AkApMkkCxB/OIHX/GFygSMV1/1TsQWVb3dU84mO0ntoflHw3EScIrowESMd8lbD3g==
X-Received: by 2002:adf:f5cc:0:b0:306:334a:7ccb with SMTP id
 k12-20020adff5cc000000b00306334a7ccbmr3981420wrp.20.1683098628011; 
 Wed, 03 May 2023 00:23:48 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9586745wrx.25.2023.05.03.00.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 00:23:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, philmd@linaro.org, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, anjo@rev.ng
Subject: [PATCH 18/84] tcg/i386: Adjust type of tlb_mask
Date: Wed,  3 May 2023 08:22:25 +0100
Message-Id: <20230503072331.1747057-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230503072331.1747057-1-richard.henderson@linaro.org>
References: <20230503072331.1747057-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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

Because of its use on tgen_arithi, this value must be a signed
32-bit quantity, as that is what may be encoded in the insn.
The truncation of the value to unsigned for 32-bit guests is
done via the REX bit via 'trexw'.

Removes the only uses of target_ulong from this tcg backend.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index f8e7325a8b..430240de12 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -1962,7 +1962,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
     int trexw = 0, hrexw = 0, tlbrexw = 0;
     unsigned mem_index = get_mmuidx(oi);
     unsigned s_mask = (1 << s_bits) - 1;
-    target_ulong tlb_mask;
+    int tlb_mask;
 
     ldst = new_ldst_label(s);
     ldst->is_ld = is_ld;
@@ -2007,7 +2007,7 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
         tcg_out_modrm_offset(s, OPC_LEA + trexw, TCG_REG_L1,
                              addrlo, s_mask - a_mask);
     }
-    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
+    tlb_mask = TARGET_PAGE_MASK | a_mask;
     tgen_arithi(s, ARITH_AND + trexw, TCG_REG_L1, tlb_mask, 0);
 
     /* cmp 0(TCG_REG_L0), TCG_REG_L1 */
-- 
2.34.1


