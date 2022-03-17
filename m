Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A8D4DBDFB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:08:58 +0100 (CET)
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiNd-0003Cy-GX
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:08:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKW-0000Ip-G6
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:44 -0400
Received: from [2607:f8b0:4864:20::631] (port=39425
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKU-0002Bs-LZ
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:44 -0400
Received: by mail-pl1-x631.google.com with SMTP id d18so3558555plr.6
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=usBGdU69HnTg1ydjW8JNew56t92jp2FL4YFsAVLWtpc=;
 b=xz2O1rjB8ob2xnlrLPRolq4r0J6kggBWpmum7atF/6zdLshSsbrelkcyoVX3vR/F7v
 VWfaWdw+AQLuGnCNhkRz/384t3docLuaed0zmH5SZAZm8u5I0oUaHRFsEp/AmaNolCM5
 XuY2rr/ByoEYqZzcSC3MpKAeTnYJwl9T2PvM/IKasGyhfWAMCWh2TSLI8sMS8ZwO9srm
 Ukp5d3ssw+qkQ3rraBTCVJSO72WOcqp15NMdzxK6aokl8fd06hCIusjwpGPO4OzFHLY6
 0VOsMExZPfxNT2vI5jAzay6dT+woJt3fnqd/yWjCnEgXQWQj62mw2UNAOLZh7E/zsB94
 hY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=usBGdU69HnTg1ydjW8JNew56t92jp2FL4YFsAVLWtpc=;
 b=ifQ4ZMZIw+yvp76UhlBG09Tz8+nxI3pq9oKp/P97NVw+A8nfkc5+H65QX3LV7tUli6
 13chr1skwX4XUGN85i/rDP9w4vf8b9AUld2nFdndlJ8md4/ho9VzfPuresgdnIFmbjbp
 Pq/NS6BlxQzqCMphqcupWmqYVFQ8CNUR95O2xSbd1P8iE8/k7aT00CYOspcFDqNBrUid
 5YSjt+0d4ZJzIh3EDqu/J0NeNymvrRXWVRBAzR2VQSUyS8WvF9JNyIvlRKkZvttB+vUk
 l9wUcULX+gMtDLgggcqD/PuTiTQQ2u+MTA0Q3dEBnIT90hxNFTJxFaNXIpP17P7AtyyT
 iVvg==
X-Gm-Message-State: AOAM530fKM4IgYiE6YkaTeOEjgjUmuywP2jVM8/NsPs4X2o3WkArhFo3
 pe+R9jwsycgqIPZVMmcy/PrjeU0pHq1GoA==
X-Google-Smtp-Source: ABdhPJwaJFzXkuiFUCRWYFB6C/G/gCHKBdq1b9JksxUCYd5MXV1agMDgJPAq0PXLcCAEFTlE/aXaaQ==
X-Received: by 2002:a17:90a:c984:b0:1bf:aee2:3503 with SMTP id
 w4-20020a17090ac98400b001bfaee23503mr3287461pjt.28.1647493541249; 
 Wed, 16 Mar 2022 22:05:41 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 01/51] tcg: Fix indirect lowering vs
 TCG_OPF_COND_BRANCH
Date: Wed, 16 Mar 2022 22:04:48 -0700
Message-Id: <20220317050538.924111-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With TCG_OPF_COND_BRANCH, we extended the lifetimes of
globals across extended basic blocks.  This means that
the liveness computed in pass 1 does not kill globals
in the same way as normal temps.

Introduce TYPE_EBB to match this lifetime, so that we
get correct register allocation for the temps that we
introduce during the indirect lowering pass.

Fixes: b4cb76e6208 ("tcg: Do not kill globals at conditional branches")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h |  2 ++
 tcg/tcg.c         | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 73869fd9d0..27de13fae0 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -433,6 +433,8 @@ typedef enum TCGTempVal {
 typedef enum TCGTempKind {
     /* Temp is dead at the end of all basic blocks. */
     TEMP_NORMAL,
+    /* Temp is live across conditional branch, but dead otherwise. */
+    TEMP_EBB,
     /* Temp is saved across basic blocks but dead at the end of TBs. */
     TEMP_LOCAL,
     /* Temp is saved across both basic blocks and translation blocks. */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 33a97eabdb..45030e88fd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1674,6 +1674,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_GLOBAL:
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
         case TEMP_LOCAL:
@@ -1701,6 +1702,9 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_LOCAL:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
+    case TEMP_EBB:
+        snprintf(buf, buf_size, "ebb%d", idx - s->nb_globals);
+        break;
     case TEMP_NORMAL:
         snprintf(buf, buf_size, "tmp%d", idx - s->nb_globals);
         break;
@@ -2378,6 +2382,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
         case TEMP_CONST:
             state = TS_DEAD;
             break;
@@ -2427,6 +2432,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         case TEMP_NORMAL:
             s->temps[i].state = TS_DEAD;
             break;
+        case TEMP_EBB:
         case TEMP_CONST:
             continue;
         default:
@@ -2797,6 +2803,7 @@ static bool liveness_pass_2(TCGContext *s)
             TCGTemp *dts = tcg_temp_alloc(s);
             dts->type = its->type;
             dts->base_type = its->base_type;
+            dts->kind = TEMP_EBB;
             its->state_ptr = dts;
         } else {
             its->state_ptr = NULL;
@@ -3107,6 +3114,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
+    case TEMP_EBB:
         new_type = free_or_dead < 0 ? TEMP_VAL_MEM : TEMP_VAL_DEAD;
         break;
     case TEMP_CONST:
@@ -3353,6 +3361,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
+        case TEMP_EBB:
             /* The liveness analysis already ensures that temps are dead.
                Keep an tcg_debug_assert for safety. */
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
@@ -3390,6 +3399,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
         case TEMP_NORMAL:
             tcg_debug_assert(ts->val_type == TEMP_VAL_DEAD);
             break;
+        case TEMP_EBB:
         case TEMP_CONST:
             break;
         default:
-- 
2.25.1


