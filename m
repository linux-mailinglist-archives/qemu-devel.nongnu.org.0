Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4E268AB4E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOLU1-00056P-MC; Sat, 04 Feb 2023 11:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTs-00051r-3f
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:39 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pOLTq-0002X7-9o
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:33:35 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 f15-20020a17090ac28f00b00230a32f0c9eso93661pjt.4
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 08:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hloccov+e7J/dBzNCn3XTem8GBlJxxzB07CqfLWqlQ=;
 b=DuscScxzQEW9MWg2gDboYpop5ttRz52nnTadip1LlFqIJaVXjke0iPtRocnWTa6soX
 EMrGfMdsXDuaIKwqol5NllR9k0rZsxksboy/92/Eo4iQ55bW6EEY376/RIRex/dw3I+4
 O9mEvqO8wMakBDSXfW2DrW5R5xdmpmai/tcRujPGwrX+W+/BCUgyIBE8o/bSXh6/zc0D
 xrVKflTD9YEZNWd7yXUDfv6I0GVFRcE5EPzryXxB+t2RC9v11vqerMMS4r0HyU+eoP4G
 CXEIK77Fojc9oZe4nt5PFbuOkR6d6b9Obxh9EN3zcYBP3mdegQzEXsi0KL/DeTug/cLD
 gPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8hloccov+e7J/dBzNCn3XTem8GBlJxxzB07CqfLWqlQ=;
 b=kIuuGyNaDXQvUBPmiM7g7yfzGTFzQ53BCQ+bar+JdpwNoaYDY6NaYdgoLoibNySlCI
 d8Yua3AuyX1oxkqe9yH19DJEa/0EIg22aOBgclBisD1WIhU3w/6w4DT6NowFi/lVzLqU
 VoFM6cqqm1pHDZj8wBJ7mhVWxB8HyYb7c7EI/XVUsTbEOH3AoJn1JvH2oUO+eSQy20Dp
 noccr67QOvZiZmVAfXetr/p45cWIWSvWrq6mhdRyDch/L25sR7QI0SUeKvIlMsBl91Vw
 mG2D5q4TdmGkPT2X+n3NFhjShlgdaoER97w5ewARusa2Ts7Z3Lruy/PcXahtfIdebHD6
 h2Bw==
X-Gm-Message-State: AO0yUKXmhjScYpN6JxhLxZtV6+T/bY+dn6TJxTM45Q1EnM6h1lBPP780
 hfEb0o7XD1l1kuYE34a26h9qw02D9N5mh8u5
X-Google-Smtp-Source: AK7set9CV90hpZU6XZSs45xOmcXjAJir16q0i3tgASV98MbZxLE6ztL9Yy/+0Rigq/dWgMlokEfSsg==
X-Received: by 2002:a17:903:244f:b0:196:5b76:8e6e with SMTP id
 l15-20020a170903244f00b001965b768e6emr17921368pls.1.1675528412850; 
 Sat, 04 Feb 2023 08:33:32 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a1709029a9300b00186b69157ecsm3660859plp.202.2023.02.04.08.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 08:33:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 12/40] tcg/tci: Fix big-endian return register ordering
Date: Sat,  4 Feb 2023 06:32:42 -1000
Message-Id: <20230204163310.815536-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
References: <20230204163310.815536-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

We expect the backend to require register pairs in
host-endian ordering, thus for big-endian the first
register of a pair contains the high part.
We were forcing R0 to contain the low part for calls.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


