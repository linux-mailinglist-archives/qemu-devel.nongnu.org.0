Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AE3129A9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 05:14:43 +0100 (CET)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xwg-0000IY-Ky
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 23:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdx-0008B4-Bw
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:17 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:53160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdv-0001NU-Oi
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:17 -0500
Received: by mail-pj1-x102b.google.com with SMTP id q72so7415670pjq.2
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z/Pfli3ijYHnlJT4Xorth9mXRem8tBvM4t0H60tFmKU=;
 b=v2HaG7EsCrktMOJen8adWq3ajlTBFgxotqxPFjsD+QybIht/DZQoBZ/e5S3IIXKpgo
 WG/CScWAV+AwsFCtJ5rRIghfbLsB5FjFqHmYTs8c9FGiCVNeR9+Y/Di9PyTqMmPnXY1f
 gf5rVVrRwMaE/7ipYyaHR9u5JtBUdS7nGHZ+wnbXheeJX0P6GtScMW6QVNlbN2Qj1x9N
 kg2/fJ11sPvZUyJuODwijSk8FcXHOB9GjdPZ0rjX1n93k2n22fq5aQkCtpecZO7tR4up
 6tV5WGihGBr0PuQaGVEG129fJntYeG4t7/l0fWO1aLgKFggCOmdAxuTp+RaMjmi365sK
 R9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z/Pfli3ijYHnlJT4Xorth9mXRem8tBvM4t0H60tFmKU=;
 b=D3uRj6C57RU3pfWQFJRw4xd+AmRh6Sz5yVSQUz1+weAIBeffClN+i1t9XWIwpMHu/u
 fFRYHHALOztECc3WHK4t4hPz8w2gxmS0syfPpPpNrvOOXvX+1wvIKCoZkDnUFstFGNYb
 UYVLbHY/Mx9Pvn9EXDZpVX3BmSI5RG8fp5zoXBf9qOL2d+WIs6sLysWEHWUwCmqJW0Vg
 PF8Wli30twWVBHedrD5BXjdASVRbQdEdwkREHXAPzt+8D9aN3kxfOJYw5GOXapZrtV8K
 nOuXJjqOfAwNftD83JBP07pZe9x8gTrcsYsH58OkwlOPcC1HzKU/hiu09et2TlDMNWV8
 kg4g==
X-Gm-Message-State: AOAM53168AMQDAiWTkCbbmNOXh/+wr7pWp6TYQhYyFKcWNSC9mjcWPBs
 l36Ln0PUyMgmIouzTKV+ZFgTadWZRiKjXA==
X-Google-Smtp-Source: ABdhPJyRCjYzjojaguOjpg0vvPZlzwALvxmgYMeqb448Q89rnO54zlxtIzaDgGlJwh7BSrstjwAh1g==
X-Received: by 2002:a17:90a:928d:: with SMTP id
 n13mr14995824pjo.12.1612752674290; 
 Sun, 07 Feb 2021 18:51:14 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/16] tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
Date: Sun,  7 Feb 2021 18:50:55 -0800
Message-Id: <20210208025101.271726-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208025101.271726-1-richard.henderson@linaro.org>
References: <20210208025101.271726-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     | 2 +-
 tcg/s390x/tcg-target.c.inc | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index dd11972ed2..13b9918276 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -151,7 +151,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_shi_vec        0
 #define TCG_TARGET_HAS_shs_vec        0
 #define TCG_TARGET_HAS_shv_vec        0
-#define TCG_TARGET_HAS_mul_vec        0
+#define TCG_TARGET_HAS_mul_vec        1
 #define TCG_TARGET_HAS_sat_vec        0
 #define TCG_TARGET_HAS_minmax_vec     0
 #define TCG_TARGET_HAS_bitsel_vec     0
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 23c25ff619..53d86268b6 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -277,6 +277,7 @@ typedef enum S390Opcode {
     VRRc_VCEQ   = 0xe7f8,   /* we leave the m5 cs field 0 */
     VRRc_VCH    = 0xe7fb,   /* " */
     VRRc_VCHL   = 0xe7f9,   /* " */
+    VRRc_VML    = 0xe7a2,
     VRRc_VN     = 0xe768,
     VRRc_VNC    = 0xe769,
     VRRc_VNO    = 0xe76b,
@@ -2661,6 +2662,9 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_andc_vec:
         tcg_out_insn(s, VRRc, VNC, a0, a1, a2, 0);
         break;
+    case INDEX_op_mul_vec:
+        tcg_out_insn(s, VRRc, VML, a0, a1, a2, vece);
+        break;
     case INDEX_op_or_vec:
         tcg_out_insn(s, VRRc, VO, a0, a1, a2, 0);
         break;
@@ -2710,6 +2714,8 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
         return 1;
     case INDEX_op_cmp_vec:
         return -1;
+    case INDEX_op_mul_vec:
+        return vece < MO_64;
     default:
         return 0;
     }
@@ -2946,6 +2952,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
     case INDEX_op_orc_vec:
     case INDEX_op_xor_vec:
     case INDEX_op_cmp_vec:
+    case INDEX_op_mul_vec:
         return C_O1_I2(v, v, v);
 
     default:
-- 
2.25.1


