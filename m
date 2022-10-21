Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC21D607412
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:30:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloMK-0006wc-EW
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:30:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmIB-0003aB-1g
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHw-0003Or-87
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:55 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHp-0005to-MR
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i3so1786490pfk.9
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=75+xsYOAtaVg4plBJLa7rmgReN2/m1syY7D3SMY10mk=;
 b=en7DZ46n7+VDSX6OmK4TJjT6CN6NAoaJ1/nzueUdUTE2VVqjCacCQ4hsIsXUiSXVvx
 0AbGqvRAnUdXjDxv12Ga05HRxMgkvNh1FMdZMwiiH90lw9xCD/id56mhtLsTanNK5M0e
 A9hCqArpkfH04Eh24VZDTeQN2kzOxttMhubohiHgO6/3OMhRf+osrfGYuyb1mqOn9dno
 2GdtVqdziPAaWz4LyVaow7hxvepmK/g1bAI62Mk3L3PWWVyAVuwKwpUqeTSZTKTXeAQu
 EPdAy7hTuZV2LQkkAMR4U48+9BuwzxXqWf0AV3c0T01BjVJCz3pCuhKphIuUUESVo3sR
 cSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=75+xsYOAtaVg4plBJLa7rmgReN2/m1syY7D3SMY10mk=;
 b=cUYH5md9VstYvaM8kLJmArB8SYSVFFCelMDmr6wL4Ko+oVVXUiyxUTxXChXKdNpvB9
 KFHt/XPzTv75wezwgxOO7dvrGXF6CCi+HZdgO54W49mm+2+aDucbuXoAvhVGEJ/vhEWa
 HDIzvYOkLG9vnbMH68+AZwgc5TRi/Z1YsEd/vBOKjfeKEN9XLSLBsxaqBU6epBLMjdh7
 KkuMZDEnTt01gZEkZmwKXV6GxWuPDdlacbE0AfxogQKNcP1xQCcJjT9dRrhTlvJniwlv
 UVsyJGszQI1HTPV/Z7+k8U7DNk11B6Pc/LxMHnxZ4QzvBgcSRLAtX1+l/CqgftXIF5QH
 RUDg==
X-Gm-Message-State: ACrzQf3z/W0I/w7XEIpIrbvg/6v6SFhR2amT671mYaz9P34aHNXaZT1K
 ka9XePMbeyh/2xN77gbCpv64Rv9wrRMmmqjJ
X-Google-Smtp-Source: AMsMyM5bzNT96xpxlRFAGKPk5+690XR0OOpgbVX/JbZ9ajcjfqHmgObO4I6htf6Xc9nrqPQx6/a3gA==
X-Received: by 2002:a63:5a0c:0:b0:46a:fcba:862c with SMTP id
 o12-20020a635a0c000000b0046afcba862cmr15020890pgb.187.1666336664381; 
 Fri, 21 Oct 2022 00:17:44 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 29/36] tcg: Add TCG_CALL_RET_BY_VEC
Date: Fri, 21 Oct 2022 17:15:42 +1000
Message-Id: <20221021071549.2398137-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be used by _WIN64 to return i128.  Not yet used,
because allocation is not yet enabled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h |  1 +
 tcg/tcg.c          | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 1fe7bd7d5d..44ef51ca30 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -38,6 +38,7 @@ typedef enum {
     TCG_CALL_RET_NORMAL,         /* by registers */
     TCG_CALL_RET_NORMAL_4,       /* for i128, by 4 registers */
     TCG_CALL_RET_BY_REF,         /* for i128, by reference as first arg */
+    TCG_CALL_RET_BY_VEC,         /* for i128, by vector register */
 } TCGCallReturnKind;
 
 typedef enum {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 25dc3c9f8f..9ec5b85f44 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -768,6 +768,8 @@ static void init_call_layout(TCGHelperInfo *info)
                 cum.reg_slot = 1;
             }
             break;
+        case TCG_CALL_RET_BY_VEC:
+            break;
         default:
             g_assert_not_reached();
         }
@@ -4685,6 +4687,21 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
         }
         break;
 
+    case TCG_CALL_RET_BY_VEC:
+        {
+            TCGTemp *ts = arg_temp(op->args[0]);
+
+            tcg_debug_assert(ts->type == TCG_TYPE_I128);
+            if (!ts->mem_allocated) {
+                temp_allocate_frame(s, ts);
+            }
+            tcg_out_st(s, TCG_TYPE_V128,
+                       tcg_target_call_oarg_reg(TCG_CALL_RET_BY_VEC, 0),
+                       ts->mem_base->reg, ts->mem_offset + i * 4);
+            ts->val_type = TEMP_VAL_MEM;
+        }
+        break;
+
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


