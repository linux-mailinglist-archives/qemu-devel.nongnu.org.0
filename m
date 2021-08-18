Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14D3F0CB9
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:36 +0200 (CEST)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGS9v-0005oq-U6
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 16:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2O-0008Cc-RY
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:48 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGS2N-0006Jk-9P
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 16:19:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id w6so2527179plg.9
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 13:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WMobBd21hxhBtnfxmCHTdmsDMrlUXdir7Qqr9MLBdJc=;
 b=FzLfKJcXPtz5DzBZ6cwBKUWM6Eh9YID/+rWBWrjxtGHmcDeTrickWj+m8dck6L3BQA
 n1GMg0OUrT42qI2t49dTzsvr3dfoi6wMy6S+iGIkcuyEzn41g3ks/7G00m1yLL8YtpYd
 gwimOa4IpSDTXXq1bxiA9X2gzjTth7Ju1NvpVaBv2WN+pyX7Bf3Pkw2wcwXmTujfI0/k
 3C6BRJ3bzjXXSM2ZZDko+2T/PUcb3enWkSa6GIWjwIl/FgCdZ8g8emrqR5qy1KYJhGHW
 5lj8SFWcHx1qYkh9DfmKEWgtX6qgNrvl3KHZF2Wazr6hPKFNFBGQytrOt7ulc5lVeXcb
 J2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMobBd21hxhBtnfxmCHTdmsDMrlUXdir7Qqr9MLBdJc=;
 b=Jj2Uzqv+JhzDjDWDXNeoaVgLCj+OiL9ukT4XAdbI45DPMqOtdIXdFlak5LRblFWB+b
 3cGdAl3CQnzqC+G/gZ+bAmFMzetg7fmY3CZI8cshLDZATseQRN9bmRYY1DDg1Os1qobJ
 0F3lmabqyUJTxQVVLk2F70mvC91eEc1rCpOjUqA5YXw0ZRvjVLpnwXm/V507zv3CrJNF
 3SU1ax834nWwFKIeZp3WLn1pZfJk8rxiZ4xsAbx3/dePIlPt1s6pulGCO9UfbeFi9K/l
 nrlw1o+d2ebr86SN3E9sPO1fqsR41+/yu04NRMohyig/MB9JU4oKbesS8R8Zb1+cnCdp
 yRfA==
X-Gm-Message-State: AOAM530l1xsB0Ao2P9U56xjXIV4tcoGjqNTqsm7+E7bXd/qOIYE+O8mU
 KRqDIiaYctZGwjAlfo4mdSjEiMbheAK8qA==
X-Google-Smtp-Source: ABdhPJxfYDfaWj5q0qFw7A7IeYD0AZB4yQh7fIwNuz7RNQDXuCNqIxAmT/HKtoXJAS8AWKWiT3hIBA==
X-Received: by 2002:a17:902:bcc6:b0:12d:bd30:bc4d with SMTP id
 o6-20020a170902bcc600b0012dbd30bc4dmr8575902pls.18.1629317985921; 
 Wed, 18 Aug 2021 13:19:45 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id x13sm619621pjh.30.2021.08.18.13.19.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 13:19:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/16] tcg/mips: Split out tcg_out_movi_two
Date: Wed, 18 Aug 2021 10:19:27 -1000
Message-Id: <20210818201931.393394-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818201931.393394-1-richard.henderson@linaro.org>
References: <20210818201931.393394-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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

Emit all 32-bit signed constants, which can be loaded in two insns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/mips/tcg-target.c.inc | 35 ++++++++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index b32edd5a7a..d351d53a7b 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -541,6 +541,22 @@ static bool tcg_out_movi_one(TCGContext *s, TCGReg ret, tcg_target_long arg)
     return false;
 }
 
+static bool tcg_out_movi_two(TCGContext *s, TCGReg ret, tcg_target_long arg)
+{
+    /*
+     * All signed 32-bit constants are loadable with two immediates,
+     * and everything else requires more work.
+     */
+    if (arg == (int32_t)arg) {
+        if (!tcg_out_movi_one(s, ret, arg)) {
+            tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
+        }
+        return true;
+    }
+    return false;
+}
+
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
@@ -548,21 +564,18 @@ static void tcg_out_movi(TCGContext *s, TCGType type,
         arg = (int32_t)arg;
     }
 
-    if (tcg_out_movi_one(s, ret, arg)) {
+    /* Load all 32-bit constants. */
+    if (tcg_out_movi_two(s, ret, arg)) {
         return;
     }
 
-    if (TCG_TARGET_REG_BITS == 32 || arg == (int32_t)arg) {
-        tcg_out_opc_imm(s, OPC_LUI, ret, TCG_REG_ZERO, arg >> 16);
+    tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
+    if (arg & 0xffff0000ull) {
+        tcg_out_dsll(s, ret, ret, 16);
+        tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
+        tcg_out_dsll(s, ret, ret, 16);
     } else {
-        tcg_out_movi(s, TCG_TYPE_I32, ret, arg >> 31 >> 1);
-        if (arg & 0xffff0000ull) {
-            tcg_out_dsll(s, ret, ret, 16);
-            tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg >> 16);
-            tcg_out_dsll(s, ret, ret, 16);
-        } else {
-            tcg_out_dsll(s, ret, ret, 32);
-        }
+        tcg_out_dsll(s, ret, ret, 32);
     }
     if (arg & 0xffff) {
         tcg_out_opc_imm(s, OPC_ORI, ret, ret, arg & 0xffff);
-- 
2.25.1


