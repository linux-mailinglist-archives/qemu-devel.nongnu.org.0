Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D59968AB4F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU1-00056Q-MD; Sat, 04 Feb 2023 11:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTh-00050z-IU
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTd-0002UR-VY
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:23 -0500
Received: by mail-pl1-x62a.google.com with SMTP id v23so8176232plo.1
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zz1VWcY0293bxJOPbeamWp29qOz9R/oc/fcxOfF+yDc=;
 b=N0zGTNXzxMTBEr90sw1a7zgp5oWLbUg+vf9aaMMgmYu/JOI7fZJHwovBTxqqhDPy1v
 Dt84A5rKX73C+CyJsj8FGBMilW9r+/uq+Oydr2x/x8jGjMm1FgU9aHc9+t1aX5vIk0JX
 rZoAxd0TSkXAx15VvSVZZK4tj53y1/Ogs+Tyqmum00Gti++HmzGFDoZ3Y7YdJutdDtOL
 zunPS3StEmscl/UgI9HI6N5ItrPvxsS8q5qtb+veiH58mdCBfivKLVeP4LOf+hIQn7P6
 u6TgsrC4XVum8SlCJnkMG2oP/YTbed4d8Z9hUtcyTkFWmoYAjnJh+Kiv/VAhXhbb8Di9
 nMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zz1VWcY0293bxJOPbeamWp29qOz9R/oc/fcxOfF+yDc=;
 b=f4eoDW6jAS0/denjUPyxmpqQXNcEPxLaK6ZF7elSiWLARBgq4prId2T2fHFt7IIAqh
 71BSk+iOyaxBnl3xq5e2KUXms1Z+qhvwUtUpyM8YN5oACROz97i74tykOZY0uq5NITxa
 5MW3ZIyLlb3gjhtmZ7XkCqWCIgvHV/1HfLgpGO4ArAbvBP4Zm721/bulYVkb/6GBPDLl
 bMOBDz71P6MIDChsQFWTIkkxps8wfNL3ANssYzeOlRG93vlbBM3DACGAkGxXkegLp8X5
 +v2TmQHRM0LJfjmaXrvypM00V7/tZruQMZBhLxOQ6YJWiLYAUV5ccn6jr6iYaFCH3O6L
 DaUA==
X-Gm-Message-State: AO0yUKWwvhpzA3EVpn4awaEix2+D6ohy65axtXfdP2mvxjyW5zsRMPDc
 80nBw9g1fNkVAISPX2zBoB7LqTF8FHub+DIX
X-Google-Smtp-Source: AK7set8Vjoe8aFCGBKJkXzKJot58K5zumCGNZaFFi4TKXpvKZK2QBwaD+g6vku3BegSHQm89CfAr7g==
X-Received: by 2002:a17:902:f20c:b0:198:c6d1:cc03 with SMTP id
 m12-20020a170902f20c00b00198c6d1cc03mr6942843plc.24.1675528400234; 
 Sat, 04 Feb 2023 08:33:20 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 04/40] tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,
 ARG}_NORMAL
Date: Sat,  4 Feb 2023 06:32:34 -1000
Message-Id: <20230204163310.815536-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Many hosts pass and return 128-bit quantities like sequential
64-bit quantities.  Treat this just like we currently break
down 64-bit quantities for a 32-bit host.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index bc60fd0fe8..bc7198e5d0 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -707,11 +707,22 @@ static void init_call_layout(TCGHelperInfo *info)
     case dh_typecode_s64:
         info->nr_out = 64 / TCG_TARGET_REG_BITS;
         info->out_kind = TCG_CALL_RET_NORMAL;
+        assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+        break;
+    case dh_typecode_i128:
+        info->nr_out = 128 / TCG_TARGET_REG_BITS;
+        info->out_kind = TCG_CALL_RET_NORMAL; /* TODO */
+        switch (/* TODO */ TCG_CALL_RET_NORMAL) {
+        case TCG_CALL_RET_NORMAL:
+            assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
+            break;
+        default:
+            qemu_build_not_reached();
+        }
         break;
     default:
         g_assert_not_reached();
     }
-    assert(info->nr_out <= ARRAY_SIZE(tcg_target_call_oarg_regs));
 
     /*
      * Parse and place function arguments.
@@ -733,6 +744,9 @@ static void init_call_layout(TCGHelperInfo *info)
         case dh_typecode_ptr:
             type = TCG_TYPE_PTR;
             break;
+        case dh_typecode_i128:
+            type = TCG_TYPE_I128;
+            break;
         default:
             g_assert_not_reached();
         }
@@ -772,6 +786,19 @@ static void init_call_layout(TCGHelperInfo *info)
             }
             break;
 
+        case TCG_TYPE_I128:
+            switch (/* TODO */ TCG_CALL_ARG_NORMAL) {
+            case TCG_CALL_ARG_EVEN:
+                layout_arg_even(&cum);
+                /* fall through */
+            case TCG_CALL_ARG_NORMAL:
+                layout_arg_normal_n(&cum, info, 128 / TCG_TARGET_REG_BITS);
+                break;
+            default:
+                qemu_build_not_reached();
+            }
+            break;
+
         default:
             g_assert_not_reached();
         }
@@ -1692,11 +1719,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         op->args[pi++] = temp_arg(ret);
         break;
     case 2:
+    case 4:
         tcg_debug_assert(ret != NULL);
-        tcg_debug_assert(ret->base_type == ret->type + 1);
+        tcg_debug_assert(ret->base_type == ret->type + ctz32(n));
         tcg_debug_assert(ret->temp_subindex == 0);
-        op->args[pi++] = temp_arg(ret);
-        op->args[pi++] = temp_arg(ret + 1);
+        for (i = 0; i < n; ++i) {
+            op->args[pi++] = temp_arg(ret + i);
+        }
         break;
     default:
         g_assert_not_reached();
-- 
2.34.1


