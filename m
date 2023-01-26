Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112367C3F9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:43:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu27-00007W-GT; Wed, 25 Jan 2023 23:38:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu25-00006h-5r
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu21-0004ON-Tq
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:40 -0500
Received: by mail-pj1-x1031.google.com with SMTP id o13so538635pjg.2
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+sAayCS/0n8o12l1+Nu9dY41aCtQpJmApolHzbMbLL8=;
 b=NeYD11B0N8/wIy7wpHawxSplemFxpN57G8mMXJCwRdpTVg1rn/af4aTTh3i//6UDLl
 epD4E22y5l/Rr2cHGAY/+Sb1UhL/fKF/PBW5gXmIOWzQ9Okt/pvVUktKkte96GjMmDYI
 s+cZcL8wCw8k5o/jhP/Moub+bYdOcg69Hws5CDmBLngMh6aGgV7/0Xe6/hIFL/vObNvR
 4PoDNV2RFkFLoy28WShcNvH1p59PoPOrMHdVd0ptor1a3rFVUmLYPo/1EObSdemTmD+o
 JndqK7yjAFnRrmq1TUm+8kVmTChxzBda3vrYmfxpvSvTvVnXm0nI997BeAGU7EMeAiaU
 1nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+sAayCS/0n8o12l1+Nu9dY41aCtQpJmApolHzbMbLL8=;
 b=unznZcPwb6UkB09v9LzJGN0rCBmNtjyqNuTjnv0Dzo4FS0oeOT/zLVIZMsWKyGLx3m
 RoxkRtncJ7hNXik58XPr+Z0uzigL9t4GDdjhuJt2h7kmGpZ+BSxwYalZcQnJqqeJ7N5M
 ScUD+eUtpX+LFgftT3ruagCNRAwunoMJViP1/Qj7jzUahNLLAZ3k+Qt3OSufONBUn4uV
 B4whyKKRW3r91613R8KcxcZLNeNib+ijG5PAj5gRZwqXrtCJgvFGyaim8Vbs5z9bPpQU
 rFT/dlCzu2HbJZ73+p+ps9EAswhvfh5XYXF0FJjCPUF6oQtchNtABZIHmA41NKItJ6q7
 Fq5Q==
X-Gm-Message-State: AFqh2kpbV/RQmwAMLtOfwek4coTbi+1J/JcSonfJK98Fj3lYysahPu02
 ZbfGtSA9fz+ItqPaND7cU4oXF00vsrawFwjCJfI=
X-Google-Smtp-Source: AMrXdXs0RzvCIKTV8Ag1u9a2KDTnreQ55d2KV2JR0EPrmu9aZ45VQj/xwSLEwjxP2LM3T9+wnuTm8w==
X-Received: by 2002:a17:90a:d344:b0:229:ef6c:4139 with SMTP id
 i4-20020a17090ad34400b00229ef6c4139mr25572738pjx.22.1674707910921; 
 Wed, 25 Jan 2023 20:38:30 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH v5 02/36] tcg: Handle dh_typecode_i128 with TCG_CALL_{RET,
 ARG}_NORMAL
Date: Wed, 25 Jan 2023 18:37:50 -1000
Message-Id: <20230126043824.54819-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


