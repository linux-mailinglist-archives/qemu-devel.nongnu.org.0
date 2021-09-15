Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80440CEFA
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 23:47:00 +0200 (CEST)
Received: from localhost ([::1]:34710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQck7-0004Qx-Ke
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 17:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcVA-0003p1-PV
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:32 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQcV7-0003PC-9N
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 17:31:32 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so3212870pji.2
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 14:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mfePQXj2iXr+Dra4mph7NTf9IcqJ7MxeNSx/JTfeSw4=;
 b=M9bDHa7j2fG9Px8SLFLVCFtWm3X0FnybrJYa7EtvYke01yQpPSvAKs5ChoR3Pbs4v6
 M+cIlyfkdQsmwJSJFDVI7THMs8n6qT3tVmJfQ7kp0YtMDE7YsWU6tmwwh8EgTXlHUkXR
 Orws94rg0hhIiS+yByv1a/htNDAc8IXuKkEwvAyS44Avzvvhr0gvZBRhVUPEsUllCJeD
 YBymcziQVGB3o6B72J7LEm5HUZR8zlR6wuwE5Vs+Qg5VLz1gxvKkgMy/sM7b+s7UmyY7
 GxQrQpguZb5mH5iNlS7ObAUJxMwqBZquGSvaMYHeS46r+em/3Op55etBKXU7PLnodhjv
 7j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mfePQXj2iXr+Dra4mph7NTf9IcqJ7MxeNSx/JTfeSw4=;
 b=GMkhjgDaaS5ayGFNP4oXvpU4wPQ2R0I1Ld14R56iO6H6GHuHDSawkEQTdxED7HhgXZ
 p7Mdmtmn91Y2z5IMRcTCCBQwvMB17bEdIjxLsZKuvtjCyomstVImaPm1DWkvqzuWZUcb
 Fn95ZMq23FduesHKwvcdqqsatcVrnk2A3LNf06Wsc9D5LedCHlckCalEH98TRO/mzRrq
 LZNHom4KyKySUuAcxeM6O7ue93JRnhDvotMqVyHGxlxuqbKZb71va7DIltpVJxlF91Da
 Ut14SaY4GLLw0R4OtWT6+KXNE/Gjx+m9wXw2Q/eO6zpZWM8Ggqp8hpIxsX216IANnNW+
 GGPA==
X-Gm-Message-State: AOAM531WiKztgSHNpUp9Z4myntbuPFzvKd9j3D4klL1OxBfdwyrov8PX
 bWk/uKfTnDeBQ8gKbuYls4NjtK8kEY2eTg==
X-Google-Smtp-Source: ABdhPJwnyFIJvCupjKKCip5qJWDGasE8FIK/ThbV2hxdKt5ujbthvKDBV/qWGa0Y70IupLTNsZLORw==
X-Received: by 2002:a17:902:d508:b0:13a:8c8:dbc4 with SMTP id
 b8-20020a170902d50800b0013a08c8dbc4mr1559020plg.87.1631741487973; 
 Wed, 15 Sep 2021 14:31:27 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q20sm837879pgu.31.2021.09.15.14.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 14:31:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/16] tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
Date: Wed, 15 Sep 2021 14:31:11 -0700
Message-Id: <20210915213114.1923776-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915213114.1923776-1-richard.henderson@linaro.org>
References: <20210915213114.1923776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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
Cc: david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  2 +-
 tcg/s390x/tcg-target.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index d7d204b782..a79f4f187a 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -156,7 +156,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shv_vec        1
 #define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
-#define TCG_TARGET_HAS_minmax_vec     0
+#define TCG_TARGET_HAS_minmax_vec     1
 #define TCG_TARGET_HAS_bitsel_vec     0
 #define TCG_TARGET_HAS_cmpsel_vec     0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index a56733e09a..c3bd22b116 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -282,6 +282,10 @@ typedef enum S390Opcode {
     VRRc_VESRAV = 0xe77a,
     VRRc_VESRLV = 0xe778,
     VRRc_VML    = 0xe7a2,
+    VRRc_VMN    = 0xe7fe,
+    VRRc_VMNL   = 0xe7fc,
+    VRRc_VMX    = 0xe7ff,
+    VRRc_VMXL   = 0xe7fd,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2767,6 +2771,19 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         tcg_out_insn(s, VRRc, VERLLV, a0, a1, a2, vece);
         break;
 
+    case INDEX_op_smin_vec:
+        tcg_out_insn(s, VRRc, VMN, a0, a1, a2, vece);
+        break;
+    case INDEX_op_smax_vec:
+        tcg_out_insn(s, VRRc, VMX, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umin_vec:
+        tcg_out_insn(s, VRRc, VMNL, a0, a1, a2, vece);
+        break;
+    case INDEX_op_umax_vec:
+        tcg_out_insn(s, VRRc, VMXL, a0, a1, a2, vece);
+        break;
+
     case INDEX_op_cmp_vec:
         switch ((TCGCond)args[3]) {
         case TCG_COND_EQ:
@@ -2813,7 +2830,11 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shri_vec:
     case INDEX_op_shrs_vec:
     case INDEX_op_shrv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
     case INDEX_op_sub_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
     case INDEX_op_xor_vec:
         return 1;
     case INDEX_op_cmp_vec:
@@ -3074,6 +3095,10 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_shlv_vec:
     case INDEX_op_shrv_vec:
     case INDEX_op_sarv_vec:
+    case INDEX_op_smax_vec:
+    case INDEX_op_smin_vec:
+    case INDEX_op_umax_vec:
+    case INDEX_op_umin_vec:
         return C_O1_I2(v, v, v);
     case INDEX_op_rotls_vec:
     case INDEX_op_shls_vec:
-- 
2.25.1


