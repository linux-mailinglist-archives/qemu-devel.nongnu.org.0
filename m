Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFB647C05
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 03:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Slw-0005zI-P3; Thu, 08 Dec 2022 21:05:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slu-0005yR-W0
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:55 -0500
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Slr-0001uu-Pl
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 21:05:54 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 p10-20020a9d76ca000000b0066d6c6bce58so1981748otl.7
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 18:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaBpyNP86SB9+qMhyajHTpSzcVMfDZDqPcSFABJu3pg=;
 b=iSb+oWAm6ZpVGdkxuo575hxDyvaEngcAasqkI9TFLnygAP7S2xCHTR4lhtCQrDN1sS
 nNVzlBL9uMne0kDQqyBmyLkPT0QfbzqVWCVSXMuPCkJ5h/uA/3wrYjVryudJUZJkl8MM
 7ds4bDNCMlOZn+AhIZ67q7lmivGI7eiJJtRCngAQ1hjH9qGQuzllW0NS8s8DZoboLccV
 SeUfvcB6ZwC4muAgXQTJ2lAw2mwp6H28GA7tx1PEIA7XH31X7NQX+NzcA4blG8Mc7iVK
 bmm2RW88J1vwdkmwivgPKBF9GheLFEckojxYfvt5S+zPjpCu2dx1fojKGI1zh2+7lPjy
 KrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaBpyNP86SB9+qMhyajHTpSzcVMfDZDqPcSFABJu3pg=;
 b=vVUHV+VZYMqzMGriMyQ8iruRPU0boxLFn712PlGIgGp1QmLh+GzOyaNLhsY6vUVdc0
 So+qN/InAXUATNay1IQsnoE/HiKreCWPDli9dbNgLDS7pOg7awkqAIsql/4T/4TQ6h1s
 eH9qr6bmiYIFq7rZPt1G/Ike5fYLMGYhzLHhSXIspBQ8kxm1LfdaTwqW7IrHMB+/dHsM
 L985egTDxRRPEyWsvpFsEdHk3xwqHOg/Jfwoor13P7kIA62pCZvPnlVpm7SNtnlCv88Q
 OJ6rxXUseHZeAqWcGrYipmGQfHGyiPZb63V9DeVqogTijoRYVVCI0B7E2Gcr10ePLf/E
 rt6Q==
X-Gm-Message-State: ANoB5pkKyQdnxMiCLvo+a8Bij4Pm7BMFDhIHMtncIGvOf63bFeZ4Lcc2
 CXH73H1aXCBCGG5PmjGTTPF2zEBO9xva4fMKQng=
X-Google-Smtp-Source: AA0mqf5PLj9v1KPFbXeGYY1tnOiUp7Wo3pLUEHwyiBvNMBWovtswYOSjeBscYf3Ckv9fsdwwD0LzoA==
X-Received: by 2002:a9d:5d18:0:b0:66d:a2:d0e with SMTP id
 b24-20020a9d5d18000000b0066d00a20d0emr1830979oti.15.1670551550190; 
 Thu, 08 Dec 2022 18:05:50 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:d298:de6f:2ed:87a4])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a05683004ce00b0066f7e1188f0sm53531otd.68.2022.12.08.18.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 18:05:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	iii@linux.ibm.com
Subject: [PATCH v4 15/27] tcg/s390x: Support MIE2 MGRK instruction
Date: Thu,  8 Dec 2022 20:05:18 -0600
Message-Id: <20221209020530.396391-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221209020530.396391-1-richard.henderson@linaro.org>
References: <20221209020530.396391-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32d.google.com
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

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
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
index 1fb7b8fb1d..03ce11a34a 100644
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
index 9634126ed1..871fcb7683 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -175,6 +175,7 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MGRK   = 0xb9ec,
     RRFa_MSRKC  = 0xb9fd,
     RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
@@ -2319,6 +2320,11 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
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
@@ -3009,6 +3015,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_mulu2_i64:
         return C_O2_I2(o, m, 0, r);
+    case INDEX_op_muls2_i64:
+        return C_O2_I2(o, m, r, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.34.1


