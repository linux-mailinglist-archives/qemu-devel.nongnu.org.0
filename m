Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1F6DCED3
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 03:12:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm2TG-0006pt-Vb; Mon, 10 Apr 2023 21:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T5-0005yQ-OV
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:43 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2T2-0000y8-GA
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 21:06:43 -0400
Received: by mail-pj1-x102d.google.com with SMTP id g3so7597681pja.2
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 18:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBraNCXMNPQDFnAbumlMKWK8ry0vOaeywT8gEg7w4f0=;
 b=N2ZG14QOuOgwZHv+K/gORu7NCp/i5bGDwf86PQHiZ3wlddEopYRNVu4uwSailBLaiq
 WdTN3u9HjUFHuIkTgmQfSI4jx+jxjxK8TH2pLBA87+AYAgcG+IA1iogj/B5CzZW/oSRK
 LbXyM/MWgYrSaNqvZv1vXqyEyfJ4vhpQaA0rPWpBgMIhM0pN5ZneK4BE0DMkTyNq61x+
 iCcIMw76J+vcueqRbcaO0Ka5RIGtWY+/yj6uQA41VYJNt/IffTHtJ0DGkEcEJ2HlNBLo
 Cjo/LP///QGBSsjajwbPydalrzs+dqH5BSxlnlocBYE5sczO0U6juzIJFGcNiqgMkTDC
 eTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175199;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBraNCXMNPQDFnAbumlMKWK8ry0vOaeywT8gEg7w4f0=;
 b=o/zAnEowuRkBlhSfKtIGgfnbSITdLMnuDzs3v9I3xz1pQJXLHwazWScX0g3pGR+rRO
 /fALnPL4Kn/d+rVjTkE0DnYeJ8pBunFYKFS2FtA/KFH7hTOanwF80m6+Bro5w7Zqmji2
 f0YlIYYGaGGmaurFXwK3AvPyJO0TtGc4iSFXIFeZpngjeY9ZZqWRilJPRZsGf9pegavv
 STepcRKp7/g3wtFEzOh0wfje7GskrD187GFKB1Mv3ZKm9sluvsZN3RMbX618Lu/OOcqT
 Qpq0m0KDrk5ty5DsCU1Y3sq8D56a4gBV6uHmP0pYduA1W4weHOFvBaLYTbutd3mWwIl6
 zYDw==
X-Gm-Message-State: AAQBX9e4wfm1jsMW2SfV1aP/9tRxZEzUp7xv+IJ3URnqwljOrj119qNp
 wrTeLUUipcqPTV50zHF2DV3SMOHEtB0ptg3LPb3dGg==
X-Google-Smtp-Source: AKy350aZJmI9omURyIihlggqdTdtX9S4fltlf7/RoNCNbDq66f0AexM5iTsnKBf6vNzSYxw6wW0CUA==
X-Received: by 2002:a05:6a20:6d09:b0:da:5084:2764 with SMTP id
 fv9-20020a056a206d0900b000da50842764mr11823300pzb.24.1681175199152; 
 Mon, 10 Apr 2023 18:06:39 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:06:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 30/54] tcg/sparc64: Pass TCGType to tcg_out_qemu_{ld,st}
Date: Mon, 10 Apr 2023 18:04:48 -0700
Message-Id: <20230411010512.5375-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

We need to set this in TCGLabelQemuLdst, so plumb this
all the way through from tcg_out_op.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index f3e5e856d6..7e6466d3b6 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1178,7 +1178,7 @@ static const int qemu_st_opc[(MO_SIZE | MO_BSWAP) + 1] = {
 };
 
 static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is_64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1324,7 +1324,7 @@ static void tcg_out_qemu_ld(TCGContext *s, TCGReg data, TCGReg addr,
 }
 
 static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
-                            MemOpIdx oi, bool is64)
+                            MemOpIdx oi, TCGType data_type)
 {
     MemOp memop = get_memop(oi);
     tcg_insn_unit *label_ptr;
@@ -1351,8 +1351,7 @@ static void tcg_out_qemu_st(TCGContext *s, TCGReg data, TCGReg addr,
 
     tcg_out_mov(s, TCG_TYPE_REG, TCG_REG_O1, addrz);
     tcg_out_movext(s, (memop & MO_SIZE) == MO_64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   TCG_REG_O2, is64 ? TCG_TYPE_I64 : TCG_TYPE_I32,
-                   memop & MO_SIZE, data);
+                   TCG_REG_O2, data_type, memop & MO_SIZE, data);
 
     func = qemu_st_trampoline[memop & (MO_BSWAP | MO_SIZE)];
     tcg_debug_assert(func != NULL);
@@ -1637,16 +1636,16 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         break;
 
     case INDEX_op_qemu_ld_i32:
-        tcg_out_qemu_ld(s, a0, a1, a2, false);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_ld_i64:
-        tcg_out_qemu_ld(s, a0, a1, a2, true);
+        tcg_out_qemu_ld(s, a0, a1, a2, TCG_TYPE_I64);
         break;
     case INDEX_op_qemu_st_i32:
-        tcg_out_qemu_st(s, a0, a1, a2, false);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I32);
         break;
     case INDEX_op_qemu_st_i64:
-        tcg_out_qemu_st(s, a0, a1, a2, true);
+        tcg_out_qemu_st(s, a0, a1, a2, TCG_TYPE_I64);
         break;
 
     case INDEX_op_ld32s_i64:
-- 
2.34.1


