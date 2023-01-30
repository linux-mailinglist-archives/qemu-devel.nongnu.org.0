Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36342681D39
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:50:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1L-0001sD-3G; Mon, 30 Jan 2023 16:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1I-0001rQ-0z
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:56 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1G-0005a1-85
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:48:55 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso16975198pjj.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sAayCS/0n8o12l1+Nu9dY41aCtQpJmApolHzbMbLL8=;
 b=tUh80N8uFJZClUMRZfqZukluYyq8gN4eLL3YXKy0ksYbFzfXSSN6JNsVEZvmOdMMCV
 cQpN83guKaTLOJuY1kK0iRrCkwSYXo4xI4mUUsFVl98jo3owyGyGaMrxXKpWJlvIRyEu
 Cw61FN/+vEWaskhsF6BgeBDUmAFbF7Gha9E+abXamKVM9P8eh1eN0mRXTCv553/P9vB5
 rg12Z075FGkG4RBwzT46CoFGP86C22Ih205cC1Tp29P6xLuY3wSPDzVWKHvnWemwFnGQ
 lkpTNHT4OD2t246oODPkwhpOcGEfGe9QueavKWJGedZiRZYKVITPivuli7T7J6YYdWet
 bqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sAayCS/0n8o12l1+Nu9dY41aCtQpJmApolHzbMbLL8=;
 b=BDQp6bld6vMazqotZYKyeaFNPu8FpQKkoMoCZg0fzxuEc2oS1AKKoF5IPJKZciNOY9
 wip/Pt/5I0viU/xnWdUta5Kk8NSevrC5EaIsNrJQ9fxa4x22fuF8ILklvzqDkWqnCpc+
 MRMbvwbe668RTGCUOGc9dnr38Tq8Hqa5c0cDrgHU1tqKgGOMosOUpdCwbAv85p7PV3PQ
 FTyBzx5mSyXt9LhRZfVt3bakUJbpF+Pb/iCkGz7NmU59pHAD4+DGUbJCfF7x2AIXair9
 cJBP/8VCcWFe6GDDhsQIYb+TqF4gkG4ZHlPsYZPQqWgZmfcLVUwNNgsQ3G8xglwq9y5n
 0QKA==
X-Gm-Message-State: AO0yUKVKMK9tTvR0T8ocZ/1fB0KsNp2+9f0nxtPEbShRF7mRl7/ZhkzE
 HvotiyOrc9pQauAs7oWB6BsNIw6ief/vYnZH
X-Google-Smtp-Source: AK7set+2z9sFpP/yjprCLfrTr/xkreWXP9DdajN4FulmJ+4vdonL2RaJbjG/UNeMtN0OfPqjTV26bQ==
X-Received: by 2002:a17:90b:33ce:b0:22b:ec81:c36c with SMTP id
 lk14-20020a17090b33ce00b0022bec81c36cmr26846711pjb.45.1675115332671; 
 Mon, 30 Jan 2023 13:48:52 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:48:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 02/36] tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,
 ARG}_NORMAL
Date: Mon, 30 Jan 2023 11:48:10 -1000
Message-Id: <20230130214844.1158612-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
index d502327be2..ffddda96ed 100644
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
@@ -1690,11 +1717,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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


