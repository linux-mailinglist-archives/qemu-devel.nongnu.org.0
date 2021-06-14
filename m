Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B45E93A5EA0
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:53:14 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsiLJ-0004rZ-Nx
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6x-0002Se-CA
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:23 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:41667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lsi6l-0003ZN-6Q
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:38:23 -0400
Received: by mail-pg1-x532.google.com with SMTP id l184so8051364pgd.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9DRzzMJ2NyGbyRHOk5FDpkj407KEfEqhUdHXH7B5Y3g=;
 b=RlGSYyTpGaBG9fXYtoFtU+SIcEYa+xarVTkWYoGuYeZ7ZrUIlLjkyZKQF2v0r34g30
 gU/FVuMXSpJAd0xXfdKfD20isrg1mScqRg0QmbTTJAUN81Gp8C8JSUrRRTd815hEpFWM
 4f2kJm/62gklF4iUar8/9lxEL+j9Nkqm5hTeg3CUIosgPp9kMT7gaA2TjspHsnvUuzqM
 cGCz8xECypfYyP89oMbntmihvoMjAsEuXDW6NbJasKl6BUHvG8Rlp78xu/jH4fg2wBX6
 DncLtRuKbS16LDvgU3w8gR52RbXHjKUnBqCWEfJhimJPygndSY1lHH/fz4jtSt6LKV6q
 pMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9DRzzMJ2NyGbyRHOk5FDpkj407KEfEqhUdHXH7B5Y3g=;
 b=QGz4Tfk2mPnEUrtGIasRMhG6YOeyvS4u+PcskRdYDfr2H0Bw+OZITqY8doNjIVl1Qw
 MDDTypjyhl8Rm2TW4iKpbLOWaEVeax/fExUviq1Uc43JQCIWQhRixuL8vOFtjiki4pGC
 vr2LkW9cmDsDomneV8fLCuZeoDXVwHkHZOUT+k0IyrHsBHhBxNyhDd23/KflwB4Dsqip
 HrePgAYEcFqEppPhmu62faMOUGNSqxkhHp67BFkV1Vfca5NVKNPmQ8SWp0DF2MmZ/xNO
 l1PLH+km+FkAwg7RF/doGuAsjqvrvXjhJIzTKHeHQfZxVmjFlRpJu19LB+/zvwKoR0fB
 aLgw==
X-Gm-Message-State: AOAM531mSxjGE/Pgj8BAfx/wwFG9+EnIoJ2fa2DeBZEGX53wj8M9TE9Q
 75tu9RmvOXuN6LIu3SIZH7Mf4acmX+g7tA==
X-Google-Smtp-Source: ABdhPJywmMZvvZ+kUrQ8QIQP7LTtQLjl1eFa210+27KHaGloFBq6AQJm1g+V2XD0iLgbpccYG9SiUg==
X-Received: by 2002:a62:84d4:0:b029:2e9:c639:5452 with SMTP id
 k203-20020a6284d40000b02902e9c6395452mr20757757pfd.61.1623659888742; 
 Mon, 14 Jun 2021 01:38:08 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id h20sm2242022pfh.24.2021.06.14.01.38.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 01:38:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/28] tcg/s390: Support bswap flags
Date: Mon, 14 Jun 2021 01:37:44 -0700
Message-Id: <20210614083800.1166166-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614083800.1166166-1-richard.henderson@linaro.org>
References: <20210614083800.1166166-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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

For INDEX_op_bswap16_i64, use 64-bit instructions so that we can
easily provide the extension to 64-bits.  Drop the special case,
previously used, where the input is already zero-extended -- the
minor code size savings is not worth the complication.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390/tcg-target.c.inc | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tcg/s390/tcg-target.c.inc b/tcg/s390/tcg-target.c.inc
index 5fe073f09a..b82cf19f09 100644
--- a/tcg/s390/tcg-target.c.inc
+++ b/tcg/s390/tcg-target.c.inc
@@ -1951,15 +1951,37 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tgen_ext16u(s, TCG_TYPE_I32, args[0], args[1]);
         break;
 
-    OP_32_64(bswap16):
-        /* The TCG bswap definition requires bits 0-47 already be zero.
-           Thus we don't need the G-type insns to implement bswap16_i64.  */
-        tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
-        tcg_out_sh32(s, RS_SRL, args[0], TCG_REG_NONE, 16);
+    case INDEX_op_bswap16_i32:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh32(s, RS_SRA, a0, TCG_REG_NONE, 16);
+        } else {
+            tcg_out_sh32(s, RS_SRL, a0, TCG_REG_NONE, 16);
+        }
         break;
-    OP_32_64(bswap32):
+    case INDEX_op_bswap16_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVGR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tcg_out_sh64(s, RSY_SRAG, a0, a0, TCG_REG_NONE, 48);
+        } else {
+            tcg_out_sh64(s, RSY_SRLG, a0, a0, TCG_REG_NONE, 48);
+        }
+        break;
+
+    case INDEX_op_bswap32_i32:
         tcg_out_insn(s, RRE, LRVR, args[0], args[1]);
         break;
+    case INDEX_op_bswap32_i64:
+        a0 = args[0], a1 = args[1], a2 = args[2];
+        tcg_out_insn(s, RRE, LRVR, a0, a1);
+        if (a2 & TCG_BSWAP_OS) {
+            tgen_ext32s(s, a0, a0);
+        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == TCG_BSWAP_OZ) {
+            tgen_ext32u(s, a0, a0);
+        }
+        break;
 
     case INDEX_op_add2_i32:
         if (const_args[4]) {
-- 
2.25.1


