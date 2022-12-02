Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA66400B2
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 07:53:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0zuC-0007b4-5Z; Fri, 02 Dec 2022 01:52:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu7-0007Zo-BP
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:14 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0zu5-0003ge-N4
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 01:52:11 -0500
Received: by mail-pg1-x529.google.com with SMTP id q1so3641613pgl.11
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 22:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q81nlbrOY0/jS8UUTYcxCThqSVtNPQMY+4Mx529BC3o=;
 b=iDhjqUN54CStq6t1HNNRH35y8F5nXksPKzPtro03e0DfpdXMVvoBSXNaD/3xFflgYA
 8lygD5I4CKni2gaNHr4QVPFAAzcBz0YcbwUGCa6WvSUYDUu+nvfcrsuE1M0bnZLqVqJ/
 5q5yyLtGLQro4FzF5dcLbOjD6HZgriTb+QoNmMSBAnyvy2aU0K7GFWEV8N+LLHLbqRYq
 F2+k9LIn//v5JBFXrx1owolwG3mmN9+3uDxUYLW3PVVpiwdJIgqL8u0fjA6Z3/bxwsdK
 p4g8k/Qsh+uxMWphPvmrksvWpeobZl2F6EDJLTv1PE+jiJmkvHKRSYNthLFqQzAxnVo8
 r/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q81nlbrOY0/jS8UUTYcxCThqSVtNPQMY+4Mx529BC3o=;
 b=IkcZMCxHFOJnI7Fj0gExLbntaUGLXXSPMQZmb0/qNeLp9eHCAJDnlsXAfi7+wedTjS
 inSicb3VS1t68anShksTu+eo+OvbFOPNGhFHyfypAJm9JRT2L7rJxnSJKPFBWqgirIu9
 wLG/ywYiXYllrt3nkoqz8cD494aoqb/dF3eKWrVv8F0JHkOTXpobr3OqIj7VzpRXppq/
 mKeYdPa2Ky3vXUjsAq3XrsnyyHU0s9mqWQ9lUzoj4itFW7jQmgShY+/Rv+SvKC8/GKD8
 fzVAg3x4SZjtxTN4ua+chLYnUtGRPtPmuiLuNXGRofxmC7MqmVH0iSG5sLIMKaNO+rix
 AmJA==
X-Gm-Message-State: ANoB5pkDNxNf6j5TVTOV/h/5j9O13ABtoy01vxGaWpIZ70offP+0RfKo
 1SjY5U35oC2ICQPoosPU5P8F7q57S+esKhe6
X-Google-Smtp-Source: AA0mqf6wYCHaiSYsLj6TdZKcxEdcsTkXCocnQEBZsFF3bF7DRlP/iVav+FiKRw/BNHdijrwN8jbTKA==
X-Received: by 2002:aa7:810e:0:b0:56b:f23a:7854 with SMTP id
 b14-20020aa7810e000000b0056bf23a7854mr56128081pfi.66.1669963928411; 
 Thu, 01 Dec 2022 22:52:08 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:e3cc:2e37:17d4:f1d5])
 by smtp.gmail.com with ESMTPSA id
 q61-20020a17090a17c300b00218d894fac3sm6056649pja.3.2022.12.01.22.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 22:52:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v3 07/13] tcg/s390x: Support MIE2 MGRK instruction
Date: Thu,  1 Dec 2022 22:51:54 -0800
Message-Id: <20221202065200.224537-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202065200.224537-1-richard.henderson@linaro.org>
References: <20221202065200.224537-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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

The MIE2 facility adds a 3-operand signed 64x64->128 multiply.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h | 1 +
 tcg/s390x/tcg-target.h         | 2 +-
 tcg/s390x/tcg-target.c.inc     | 8 ++++++++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 33a82e3286..b1a89a88ba 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -31,6 +31,7 @@ C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(o, m, 0, r)
+C_O2_I2(o, m, r, r)
 C_O2_I3(o, m, 0, 1, r)
 C_O2_I4(r, r, 0, 1, rA, r)
 C_O2_I4(r, r, 0, 1, ri, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index bfd623a639..09cf6e60fc 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -136,7 +136,7 @@ extern uint64_t s390_facilities[3];
 #define TCG_TARGET_HAS_add2_i64       1
 #define TCG_TARGET_HAS_sub2_i64       1
 #define TCG_TARGET_HAS_mulu2_i64      1
-#define TCG_TARGET_HAS_muls2_i64      0
+#define TCG_TARGET_HAS_muls2_i64      HAVE_FACILITY(MISC_INSN_EXT2)
 #define TCG_TARGET_HAS_muluh_i64      0
 #define TCG_TARGET_HAS_mulsh_i64      0
 
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index cd39b2a208..7315602331 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -180,6 +180,7 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MGRK   = 0xb9ec,
     RRFa_MSRKC  = 0xb9fd,
     RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
@@ -2452,6 +2453,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_debug_assert(args[0] == args[1] + 1);
         tcg_out_insn(s, RRE, MLGR, args[1], args[3]);
         break;
+    case INDEX_op_muls2_i64:
+        tcg_debug_assert((args[1] & 1) == 0);
+        tcg_debug_assert(args[0] == args[1] + 1);
+        tcg_out_insn(s, RRFa, MGRK, args[1], args[2], args[3]);
+        break;
 
     case INDEX_op_shl_i64:
         op = RSY_SLLG;
@@ -3153,6 +3159,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_mulu2_i64:
         return C_O2_I2(o, m, 0, r);
+    case INDEX_op_muls2_i64:
+        return C_O2_I2(o, m, r, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.34.1


