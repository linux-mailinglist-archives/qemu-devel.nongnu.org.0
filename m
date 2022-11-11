Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5573A62551C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:20:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgK-00070L-Ta; Fri, 11 Nov 2022 02:42:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgA-0006pm-Kn
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:23 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOg6-0000HE-V3
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:22 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 z5-20020a17090a8b8500b00210a3a2364fso7370936pjn.0
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9Jpwsf6+2qL2tkXL6kSO45vZ0jCGkW11UYFWxCwtIV0=;
 b=lU2qM7dNR1+4xpakBfuq3ZgoiSDPrl5YlXaipkyrSiwuRD4baI71swryBYPKpilltA
 6lxVBE+xDQMhaU5fofoQp6BDWngucwwQVyw52pO5IGtSSCS1Hq7NbyOL0ZYyt/YEQH72
 26RGGAYbilidsRVj7T7AG644zkusCMfi/+t5tAC1BbvGWj66DWKF+8Rj05iVsNh21oDV
 mhAOStB3HxWLShja2bvcQ9ZLtHAGxGDsJZkiG320QvSYwsiLRlIzJ+gl5W21M1cIZzsz
 Z2YUzm6rS/tRyslggb0qDPi8uNB44ajkk+yKhEbWbx1Y3BG0Croad817cUUUGYxDQXNd
 V+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Jpwsf6+2qL2tkXL6kSO45vZ0jCGkW11UYFWxCwtIV0=;
 b=RNW37tkB8uaXuSmhr4pnyqoDKkcdTsdseMt58UN7GgG13eHSiE/FkG+7/aCZPbTt6n
 GA2Y3bmWU0Q59mHT2JR1/B7G/wIqRYDqz1dFFzsDpu2CLVJCqUUyGqiw6v4uoeWe0C/8
 Qp4nh/0ZrTKLEeS39YrBJQiTRUTcDvL/BbbmxsnRRbHeuOKFicPSTeTZudoOGYpkLBu5
 kV1LKQ+qoxgVqN9HipfL1MT5mwwUtpMfW52MSV9BdWHgpcw7cVkFkjPZbWu8HwoWl3W9
 If3UiO5Amy9etI6ppLx131wwe3kstk283AsRCw/Yraw1y9jltkvzJjPoitnR3syr1rgw
 bW9Q==
X-Gm-Message-State: ANoB5pkHbEskzZkbMBcfEcKZB+S8Cky7wzag+l0yblkq0hw1+PsJcd2v
 vu/y8eO3Qdg8xSvIXqkZYR1zNnfYKw0VRABX
X-Google-Smtp-Source: AA0mqf5z8NWEo8joVCkGI4IkLECttYHroD3p87kKsbXeNqv0nfsCrjk6EHz818BRxU2EpxNIVY1AgA==
X-Received: by 2002:a17:903:3286:b0:187:a98:7eea with SMTP id
 jh6-20020a170903328600b001870a987eeamr1122854plb.109.1668152537327; 
 Thu, 10 Nov 2022 23:42:17 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 30/45] tcg: Handle dh_typecode_i128 with
 TCG_CALL_{RET, ARG}_NORMAL
Date: Fri, 11 Nov 2022 17:40:46 +1000
Message-Id: <20221111074101.2069454-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c5f8f4ac2c..11948256f2 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -685,11 +685,22 @@ static void init_call_layout(TCGHelperInfo *info)
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
@@ -736,6 +747,18 @@ static void init_call_layout(TCGHelperInfo *info)
         case dh_typecode_ptr:
             layout_arg_1(&cum, info, TCG_CALL_ARG_NORMAL);
             break;
+        case dh_typecode_i128:
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
         default:
             g_assert_not_reached();
         }
@@ -1653,11 +1676,13 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
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


