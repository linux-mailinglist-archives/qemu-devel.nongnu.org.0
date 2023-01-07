Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED6C660CD6
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:52:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zS-0003ig-1U; Sat, 07 Jan 2023 02:51:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zM-0003gj-Cn
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:36 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zK-0004Ak-Q8
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:36 -0500
Received: by mail-pj1-x102e.google.com with SMTP id o13so210898pjg.2
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NaBpyNP86SB9+qMhyajHTpSzcVMfDZDqPcSFABJu3pg=;
 b=WEKRg7002V4qJM8+e+Q0Jzi2bdn3N49AwjznJdnYZsjZkX6Z3DE8bVOOr/yhfkEZjz
 NeNvf06B5XOeMlE1gYEEyoPy7VP/GZLsva2gv+2geOKYAxbz+/RjcF7kWX5o0HOyzdgQ
 z25zQ8VG/xNG1V0b7zp1JUr6jiwgC5ju3qAvaVLm6XI/FUHaWINC6tgsVf841u1kbvUy
 LBm1jUycMvCE09G/QFuJsPxezm3JGiPHueC7LYYQM9EkArP+EzmVSnTHjWbyHpzBV2AI
 XjLTgTztxhI9xhSBNZUUZTz3dWQP2p7JLFanwaYgb67HQRpS9GN4DsuCLaWf1typ4QkA
 a2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NaBpyNP86SB9+qMhyajHTpSzcVMfDZDqPcSFABJu3pg=;
 b=2wdnjZ95kpJ9EeOcNC8/RqDdtFbvkuk39LfK4WNOliekZRvhx9NUSNTlp3Q1DGRuj6
 yqyebcWn0Sub8WrjUzt4z+mMPuwKDt75x3wEXIHZyFTGwqKcfwIHQGaf2ZUbGlRxIG2O
 zrDG0/uosH3/Bbk6I7Cy9NqrzluqeyEN9wJFP+Q2ziLwOtCvmYjLR9pDtizBrWCJLIJe
 p6wZ/H9G1T+9yb+8jwunZRZUaBdihNZjZVasmOo4UZpuTGa+1z7EFP5BrL931sMBqR1d
 NOuygnG0oIzYuPMquYp1XQArwm3GBGt3yNcDZ3+yqRdKk2qY8VF06Gttc//OPPE+BuwV
 uwqQ==
X-Gm-Message-State: AFqh2kp7W4qlmAhKVftxpoepw32n2rPpwUSTx6Gt2lQ23v1g0LV5VmY/
 kQnafZDezRCD63LG2OGlUvc04jNsOES7upx+
X-Google-Smtp-Source: AMrXdXul4eE00exmCn8K0TRBky7FbiJZ036HuTqB/GjYJ63fwsPvc0IP2J8RV103EAlwu3bke+f79w==
X-Received: by 2002:a17:90b:520e:b0:226:ba10:14e9 with SMTP id
 sg14-20020a17090b520e00b00226ba1014e9mr11659800pjb.12.1673077894015; 
 Fri, 06 Jan 2023 23:51:34 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 15/27] tcg/s390x: Support MIE2 MGRK instruction
Date: Fri,  6 Jan 2023 23:51:06 -0800
Message-Id: <20230107075118.1814503-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


