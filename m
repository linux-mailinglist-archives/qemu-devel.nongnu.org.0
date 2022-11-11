Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D96254AB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:53:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOgv-0007KY-Ta; Fri, 11 Nov 2022 02:43:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgT-00077X-Va
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:49 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1otOgO-0000KM-2a
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:42:40 -0500
Received: by mail-pf1-x436.google.com with SMTP id y13so4236348pfp.7
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=RnjdarfdiOjiNjCqjvcklpMvGDKm2lRgC50AnUNu4IWC3Z1Rm596Ddo4kyOJVWA68f
 HQZPIAEtRLeAn+0SFxzYMthdysw5s3cuCrziWTLCpEY9Y2PmRKcjhVxwImr8qKGqoN26
 VP07uT95stoxIm6Jed1dDSKogS4LswZZ4HLyxNYfQftaLqzSxZ/MpDS80TMMWXMFAS9+
 qh29Ur+xFDm2TxtGaDTpIjrO44HsupotZrkglm7Xy3QeQifr4aQVYplNEHQ5yrXy59oO
 du2o7RlXsO8lQEkueizX5dkdWrhL+FMetf61PV+XUHOjuwmujPYxCAmIo3H/OXpQTexN
 3aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=tvyuzV89GKUkvTRxsFoY27X7b4O/ygoOMtqktck59P3u2uaPWJwRflIAUQQe0BBBgg
 iaXRnD0hBsbZqtvfxyrJ5X0AT2/mWXFVr30JlIZI8/dSOp6HIMD9oEfaSJUfey/sNQnf
 TcowKmKXrnPQyywQO0Xs4M5N0RR0jIBppJ3wgVgFkZ6DiNsoZh3sp4hp/BPI1fJjB5uT
 ka/CR06RHuvR6CvS2bBd4MHLFOaHUSrFERQDhBECOLoAuiFwFlAUiSHzN3PXg17U8sMa
 VFN9uzx44LBMauxeztWEQ97dvfihrslcDuCAVr/ta2F4yT8neetfR5Vi5oEKP1SpSYGr
 S4DQ==
X-Gm-Message-State: ANoB5pkpSJMR6+DD1gnv5uGH/wgDL0/o9p0N5wxT+NWUDoRLzarT5fSH
 dJoV5+PcaTtQr/oVG6LTaIQFAyy/N8iTlFme
X-Google-Smtp-Source: AA0mqf4zoVdLK68oTm3N7/alj7hW0E6mFr+NNV9K5qDc3+MOid6k7eVMNPX1JHGE7rpyynMhgoKkzA==
X-Received: by 2002:a05:6a00:1c86:b0:56b:d027:214 with SMTP id
 y6-20020a056a001c8600b0056bd0270214mr1373977pfw.79.1668152554581; 
 Thu, 10 Nov 2022 23:42:34 -0800 (PST)
Received: from stoup.lan
 (2001-44b8-2176-c800-0aef-59aa-1faf-7e61.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:aef:59aa:1faf:7e61])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001754fa42065sm976069plg.143.2022.11.10.23.42.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 23:42:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 v3 38/45] tcg/tci: Fix big-endian return register
 ordering
Date: Fri, 11 Nov 2022 17:40:54 +1000
Message-Id: <20221111074101.2069454-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111074101.2069454-1-richard.henderson@linaro.org>
References: <20221111074101.2069454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We expect the backend to require register pairs in
host-endian ordering, thus for big-endian the first
register of a pair contains the high part.
We were forcing R0 to contain the low part for calls.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/tcg/tci.c b/tcg/tci.c
index 05a24163d3..eeccdde8bc 100644
--- a/tcg/tci.c
+++ b/tcg/tci.c
@@ -520,27 +520,28 @@ uintptr_t QEMU_DISABLE_CFI tcg_qemu_tb_exec(CPUArchState *env,
                 ffi_call(pptr[1], pptr[0], stack, call_slots);
             }
 
-            /* Any result winds up "left-aligned" in the stack[0] slot. */
             switch (len) {
             case 0: /* void */
                 break;
             case 1: /* uint32_t */
                 /*
+                 * The result winds up "left-aligned" in the stack[0] slot.
                  * Note that libffi has an odd special case in that it will
                  * always widen an integral result to ffi_arg.
                  */
-                if (sizeof(ffi_arg) == 4) {
-                    regs[TCG_REG_R0] = *(uint32_t *)stack;
-                    break;
-                }
-                /* fall through */
-            case 2: /* uint64_t */
-                if (TCG_TARGET_REG_BITS == 32) {
-                    tci_write_reg64(regs, TCG_REG_R1, TCG_REG_R0, stack[0]);
+                if (sizeof(ffi_arg) == 8) {
+                    regs[TCG_REG_R0] = (uint32_t)stack[0];
                 } else {
-                    regs[TCG_REG_R0] = stack[0];
+                    regs[TCG_REG_R0] = *(uint32_t *)stack;
                 }
                 break;
+            case 2: /* uint64_t */
+                /*
+                 * For TCG_TARGET_REG_BITS == 32, the register pair
+                 * must stay in host memory order.
+                 */
+                memcpy(&regs[TCG_REG_R0], stack, 8);
+                break;
             default:
                 g_assert_not_reached();
             }
-- 
2.34.1


