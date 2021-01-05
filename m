Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67F2EB1EE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 19:04:18 +0100 (CET)
Received: from localhost ([::1]:40210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqgr-0005Q1-3E
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 13:04:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0k-0002Ye-UN
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:47 -0500
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0i-0006e0-NZ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:46 -0500
Received: by mail-pf1-x42f.google.com with SMTP id t8so114645pfg.8
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=GCObIqW7cA1P+k87n7bLESf18Szye8tDkfwF8xF5qsw8hcZCVI/FwOCbvBTEm6EIxM
 bcr35oTasqCFghSDbvtepThgk65hTTCxxTpdLRdT0bl15e2WYx9Sm9PVVnawl1vugMK5
 OURa1Td3uluRNYtrHlHjSg0Yr7YoDPPDNhpt/dVHWc1mpa1Tl/hT8H3rTg6DTd3OGlSB
 qYeTeC6ccgvPx9z062jAFM8WH9cHBFc1nqUJLLFWjNHXeGeaPYCfEqkPc7Wi+cVmHjye
 bAMKKvRcqcs/zSQ77ABn9zAfYhw+DRQpmXX24f9mVME7cXXrTA8iMF6YQJ8erAbqxYwb
 grnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ASquR/6BxZoSVQzDtOnOXOHE8jLTrkcyVCDT0iJkP14=;
 b=lsDygsOrCu8JitRikhN/Wv9a3llbd2TVoqsKRaf5SdWLOvfEuc8V+6qavUVJi0ncSG
 0WPcz/NVqA65gRPz6msI4/FKL45rMqMo6z1lxIMGp90dbFRQ7ZzPI8R+IkyQbxJZWA8R
 JWPgqk6FtwGfEnmYi7KqazaFcifpi/X27SBbiexgN84O4Gxqj33zcwWiPqGlr2Jo7VV/
 sLJUoVnmvc+9tqRXCV75otdkfbKW/XY5vK2kpZ6yh4deUdb7fEP+C8GqZQvVnI9/uDbs
 4o57rDlswuI0vF9qA7w0rxcLuMS1IBR2LyNqdDj7aMkNb1bI9CXN6rH40g5BO1YkfkfE
 /mgg==
X-Gm-Message-State: AOAM531dSjEzCv+NDi2q2wEsqxqDzSMJmrnVo+MBTyyWTTOgu9sLIAeg
 L6Cpy/RUm7DmjYlzTvYbfk3DF4XkcSdT8Q==
X-Google-Smtp-Source: ABdhPJyTjYyuCGg6pH27OlxPRm/C53bMZnXqq3ekEX7GkzG1kXzvJIs0/0HsKQBGBE0jv1wmzS8Lmw==
X-Received: by 2002:a63:d446:: with SMTP id i6mr352490pgj.446.1609867242980;
 Tue, 05 Jan 2021 09:20:42 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/43] tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
Date: Tue,  5 Jan 2021 07:19:35 -1000
Message-Id: <20210105171950.415486-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The maximum TB code gen size is UINT16_MAX, which the current
code does not support.  Use our utility function to optimally
add an arbitrary constant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target.c.inc | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index ed7a201578..1f8a446b90 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2392,9 +2392,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         set_jmp_reset_offset(s, args[0]);
         if (USE_REG_TB) {
             /* For the unlinked case, need to reset TCG_REG_TB.  */
-            c = -tcg_current_code_size(s);
-            assert(c == (int16_t)c);
-            tcg_out32(s, ADDI | TAI(TCG_REG_TB, TCG_REG_TB, c));
+            tcg_out_mem_long(s, ADDI, ADD, TCG_REG_TB, TCG_REG_TB,
+                             -tcg_current_code_size(s));
         }
         break;
     case INDEX_op_goto_ptr:
-- 
2.25.1


