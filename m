Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFFA4C3055
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 16:51:01 +0100 (CET)
Received: from localhost ([::1]:60312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNGOS-0004Tb-I3
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 10:51:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHR-0003Ri-6o
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:45 -0500
Received: from [2607:f8b0:4864:20::102c] (port=40627
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNGHP-0008Jd-7K
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 10:43:44 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so6028946pjb.5
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 07:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rw7noX7hkRmKWwEJz110SR/xkzfBNvcGBycnjOCOe+U=;
 b=NmKkaEiqatjQ5RQzfdVYKhL0hhXm8ews/phrZkvH7nIztIwCa38rRRP0e+iZfL6OQH
 LRbkusUo3egsVwov5yEEz/umkzMgmUAsrOrsqolfwhJW/GcMmCIw5yxggSZ78AD/5FBS
 NvtdZ2ZVE2BDgUayutXsC91WHpLJhekHh1OFTXn7ki4nIoChjKn6J0y4lQirGh3sBH+m
 Da0s/42kTBarzGCt4SIIHWSapb44fdeF8LQCaQddO02QG16IMlxn8YMgwGbsc8YHYomP
 mrF06LbjLyZXAPAWUXFY+8T4yGMRBXpMxpev22rVWQI3GM0Z5pNZmvYr3n/Rk6yVVu9Y
 I8pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rw7noX7hkRmKWwEJz110SR/xkzfBNvcGBycnjOCOe+U=;
 b=h349/YXl+S9MNMKmhzDLahPAwIfhUvmXJYkHX8kGcPuJSucA4hxbciGzAgmCNEVBkL
 Hakj2XdXS9dvbxgCi31hmEHxAPR3tffE6JxZ8UnDf2cUiIe+Y75f3/CQMBnDxNiGvkhv
 y30YQBtpNwgKHOlwin+tbcHFxwwdjOpF+tOwtFoJTR7er+RdHInooN88CdOeGQnk6Szf
 MZ1b+Lm5zi0mc83bmp41Guw9O0o0BCUaETPXlo8vragg6yIPhrQ4pkam0oXt8JiCwaNV
 8ZeppedlrLnyZh4AuRFdraIesLgoDRHJ9CSsXmP31yVPS8LVdwqGjayDi0yxlaQj3Dbs
 5hWg==
X-Gm-Message-State: AOAM532tSuyJYv+CaZrNkOD9IDr8nnQ+ltnOWhz2bcRLHeVIU9GEXZJH
 9Mzn+2V28r3iEFUx2NA6K0KtuErCJ0rdGA==
X-Google-Smtp-Source: ABdhPJwCQ3XM+OPSW/cWwiyljJJy5y4g7c9YfEH+NDV4SWS8vEbyOQq6p+l6vY+OlsrtIr4THDUgZA==
X-Received: by 2002:a17:902:e747:b0:150:2a7:735e with SMTP id
 p7-20020a170902e74700b0015002a7735emr3405611plf.32.1645717421873; 
 Thu, 24 Feb 2022 07:43:41 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v20sm3198062pju.9.2022.02.24.07.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:43:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] tcg/s390x: Support MIE2 MGRK instruction
Date: Thu, 24 Feb 2022 05:43:27 -1000
Message-Id: <20220224154333.125185-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224154333.125185-1-richard.henderson@linaro.org>
References: <20220224154333.125185-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: qemu-s390x@nongnu.org, david@redhat.com, dmiller423@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MIE2 facility adds a 3-operand signed 64x64->128 multiply.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target-con-set.h | 1 +
 tcg/s390x/tcg-target.h         | 2 +-
 tcg/s390x/tcg-target.c.inc     | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tcg/s390x/tcg-target-con-set.h b/tcg/s390x/tcg-target-con-set.h
index 685739329e..fea73b6ed0 100644
--- a/tcg/s390x/tcg-target-con-set.h
+++ b/tcg/s390x/tcg-target-con-set.h
@@ -31,6 +31,7 @@ C_O1_I3(v, v, v, v)
 C_O1_I4(r, r, ri, r, 0)
 C_O1_I4(r, r, ri, rI, 0)
 C_O2_I2(b, a, 0, r)
+C_O2_I2(b, a, r, r)
 C_O2_I3(b, a, 0, 1, r)
 C_O2_I4(r, r, 0, 1, rA, r)
 C_O2_I4(r, r, 0, 1, ri, r)
diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index a625ef63ac..280e752d94 100644
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
index ab92a2a82c..77d7bb6cf5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -186,6 +186,7 @@ typedef enum S390Opcode {
     RRE_SLBGR   = 0xb989,
     RRE_XGR     = 0xb982,
 
+    RRFa_MGRK   = 0xb9ec,
     RRFa_MSRKC  = 0xb9fd,
     RRFa_MSGRKC = 0xb9ed,
     RRFa_NRK    = 0xb9f4,
@@ -2547,6 +2548,9 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_mulu2_i64:
         tcg_out_insn(s, RRE, MLGR, TCG_REG_R2, args[3]);
         break;
+    case INDEX_op_muls2_i64:
+        tcg_out_insn(s, RRFa, MGRK, TCG_REG_R2, args[2], args[3]);
+        break;
 
     case INDEX_op_shl_i64:
         op = RSY_SLLG;
@@ -3235,6 +3239,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 
     case INDEX_op_mulu2_i64:
         return C_O2_I2(b, a, 0, r);
+    case INDEX_op_muls2_i64:
+        return C_O2_I2(b, a, r, r);
 
     case INDEX_op_add2_i32:
     case INDEX_op_sub2_i32:
-- 
2.25.1


