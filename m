Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EF931E0FD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:04:39 +0100 (CET)
Received: from localhost ([::1]:60922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCTzy-0006mY-K5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMi-0001aP-7x
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:04 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTMg-0007gU-Cw
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:04 -0500
Received: by mail-pf1-x432.google.com with SMTP id c11so9143656pfp.10
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=I06pMo94sz0CYmA/RKHLRjBzExP9HBEsEXXfKFyPqrF2dYGnxFfwcGHcCYXfvw/pVU
 MtVO4VX5VYjMKB/bRQa9CPco4G89eGvj/WmmTw1gFh4iEUE39Mf6PZugHYtSJ8IN1zhA
 RQcqELfTfY5D2Yk2i1nl2kdnskRJTNM8rcHg45MZ3yqDDdd3p2YR2CqQCIp02FkJEh+u
 W0mdcIgy4JTycKChMy83nekYqCDAGPb3V50PMDLRt6rbKJ6qbHgvxIuaULVENF+N9Cf5
 cZNnecYyTzQysKEPj8NMsvQ98W+1jqzLtSFVlgknT/110IqzIrG+kIDrGfZ7twgSPhih
 qgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FuCnYTOQyWEVo9ZyllKi/tHo7oVf70VfVQ0xN8tYC5M=;
 b=f8ZRio9D4AuPSxue71i2O/nXAfgjNTxcPVGvy+VKS1kBnem20g50FzkTf7cc3tD68q
 1ZkvJx6pkhXWyPwFkjQ3lIhpQReV8Oscxh4V9J2X2pIn0nspyzsa7NII+b+FZ/MV+RKP
 u9Sa1pq7kjDqozLM4xQQie/cusCwXia9Fb/Yuvhe4XeG2xxNTfiTIT9c6NF69jwsMPjy
 znVZNBCbTXo7mfEtbQby5QMXu9g7Sdnb07ELpO2zzo3e2LQJ1ABSvh5ez+NrZ2GzRPZn
 vEIBfhLmVaSZHYycPkaOSgX39GtH6EjKTLuzKOnPb86W/Gb9Uiy/Bn21C569I8K/G4+c
 95zA==
X-Gm-Message-State: AOAM533AFZTkB+4zbGGVBCOen0xGOTbKRpx94jobQYoqiQvWvujJTnUY
 L46u5eyH7j/vjVj+yq+yBDYW9AV5reof5A==
X-Google-Smtp-Source: ABdhPJy3/PnbcYb45gVu4ItONPhGbR+WeDxE4oMZGJx/bQ53oEX/TKpiEAXxti0YWWl8EMwcoUGu5Q==
X-Received: by 2002:a05:6a00:894:b029:1dc:2f68:5f0 with SMTP id
 q20-20020a056a000894b02901dc2f6805f0mr981579pfj.23.1613593441121; 
 Wed, 17 Feb 2021 12:24:01 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 53/71] tcg/tci: Split out tcg_out_op_rrrrcl
Date: Wed, 17 Feb 2021 12:20:18 -0800
Message-Id: <20210217202036.1724901-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index c2bbd85130..fb4aacaca3 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -399,6 +399,23 @@ static void tcg_out_op_rrrr(TCGContext *s, TCGOpcode op,
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_rrrrcl(TCGContext *s, TCGOpcode op,
+                              TCGReg r0, TCGReg r1, TCGReg r2, TCGReg r3,
+                              TCGCond c4, TCGLabel *l5)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tcg_out_r(s, r0);
+    tcg_out_r(s, r1);
+    tcg_out_r(s, r2);
+    tcg_out_r(s, r3);
+    tcg_out8(s, c4);
+    tci_out_label(s, l5);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrrrrc(TCGContext *s, TCGOpcode op,
                               TCGReg r0, TCGReg r1, TCGReg r2,
                               TCGReg r3, TCGReg r4, TCGCond c5)
@@ -636,14 +653,8 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                           args[3], args[4], args[5]);
         break;
     case INDEX_op_brcond2_i32:
-        tcg_out_op_t(s, opc);
-        tcg_out_r(s, args[0]);
-        tcg_out_r(s, args[1]);
-        tcg_out_r(s, args[2]);
-        tcg_out_r(s, args[3]);
-        tcg_out8(s, args[4]);           /* condition */
-        tci_out_label(s, arg_label(args[5]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_rrrrcl(s, opc, args[0], args[1], args[2],
+                          args[3], args[4], arg_label(args[5]));
         break;
     case INDEX_op_mulu2_i32:
         tcg_out_op_rrrr(s, opc, args[0], args[1], args[2], args[3]);
-- 
2.25.1


