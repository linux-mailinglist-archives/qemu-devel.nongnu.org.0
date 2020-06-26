Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8477520B478
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 17:25:48 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joqEd-0003sX-He
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 11:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq49-0002Ur-0F
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:57 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1joq47-0006Qb-D5
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 11:14:56 -0400
Received: by mail-wm1-x331.google.com with SMTP id 17so9710624wmo.1
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 08:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=r2U9TX5zsESTYEbNur8CMT5Z/34UaA4R85ndNdp1sTE=;
 b=YG0gHB02VYDuPPhpmE+0h5lVl06Fs9B3r3itF5NGmruW3B71nisjRTfs8yej6GqTki
 H5NN5bfm0lTsMEoA8mBgDtXs6akXYKir6iKakfPfFBq1jGvc7+GwxEL+hyU6w5Il1tT7
 30UEbyNTegiooVvQEYvwRnutcunTy0VPXUE67s8u3a9FZgKs5R9hstmP0LTJkewXeTZ6
 0dLRu5HvKSLkW03lhIQrmL3S6lpRIMTdKhOA2vrrpQQ2qq3jUfajLrt7cwYLuCDI9cA0
 3bzPK6w+M6EXlqvNEETenMIotWNa19QuWXgDGhhQx/gXxeRbRhaEnIIQ3fqWVtgfpMit
 tDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r2U9TX5zsESTYEbNur8CMT5Z/34UaA4R85ndNdp1sTE=;
 b=pwggyOdq9e90GrH7FPUdPppBpScJvAPsnTSFMLH9jceqQcSSto37APdvYZgeBDeBpP
 LiSLsjv1ibmJbyI8hr7x8G31HjPDRZfQnxeZ0w2fByfBPG6BZSvCHYMyTyj3XvfDq5VQ
 UQE/2FsmtHX20ztOlt2yAKB/yP8IOwlIF/ANuSD5v7bO7NjAYo1Lsa20aWomdIdeDtCf
 Xmrq9S2Wli0XwlNF4dPSahvKIgacy18oDONXi+1LsjHDECkLz5E6jei5cKYWpTjwrZo3
 TY00/X6csfZs9RDGyYxYALliJXVSwouY2S7SjWi5xKoqeHgmPYEIJtyztYBgirUyZISV
 WALg==
X-Gm-Message-State: AOAM53170PoaXhNupyRMtmL5b0/YpcnOm1HlnPr6PM/4ChvESIQKNytu
 KyBKWnq8WHNrwF8l0gzgzna37JCOcxTOdQ==
X-Google-Smtp-Source: ABdhPJxCN51B3o6M1MbJI7NggTpZ1L4XiZJ6SJYt1uxO7uidOUE8h9jN2OIfcoEZiM0jWz27VUcQ/Q==
X-Received: by 2002:a1c:4185:: with SMTP id o127mr3928795wma.8.1593184493791; 
 Fri, 26 Jun 2020 08:14:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w13sm37838852wrr.67.2020.06.26.08.14.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 08:14:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/57] target/arm: Implement the GMI instruction
Date: Fri, 26 Jun 2020 16:13:51 +0100
Message-Id: <20200626151424.30117-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626151424.30117-1-peter.maydell@linaro.org>
References: <20200626151424.30117-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200626033144.790098-13-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ec02c8a5f3..ee9dfa8e439 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5346,6 +5346,21 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
                                              cpu_reg_sp(s, rn));
         }
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 t1 = tcg_const_i64(1);
+            TCGv_i64 t2 = tcg_temp_new_i64();
+
+            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t1, t1, t2);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+
+            tcg_temp_free_i64(t1);
+            tcg_temp_free_i64(t2);
+        }
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.20.1


