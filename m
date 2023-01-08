Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F7D661343
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 03:56:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pELZO-0004vN-G7; Sat, 07 Jan 2023 21:37:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELZM-0004uV-IP
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:56 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pELYz-0004ZY-B3
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 21:37:56 -0500
Received: by mail-pl1-x62f.google.com with SMTP id d3so5853985plr.10
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 18:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=zfcdQM4/5q2ta7iuqZJrCCSzlJEXqS0WhwPx4k2uaLccpH7A3ev/saSPpc+LYwyd0J
 AgrpsdRZIn2LzaDQb7iloaUOiQHpAtZA2+Yx5ujE8QjfSECJA1y8Ul7Fuftx36LL4UDr
 1nPYjlb50GAEO+JSU1QP4LOjqH7F+b0yu0EEiekrmaMZOX+R46lczBguI9VnwXd3hpxC
 BEzpB8Y+jHE650tRX9R7SqkvtIbUXLhh9TGPgCDk3VbExPINozRY927zKsmZc2y2DGvm
 695kj/+z4hboxGHIU6LzH/UrqmsVrfqqX3QDNCn4pa/AH59Y9M62pU1cgXtpKf4gNOv8
 chow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vaZgOeSJc5X20dDhSfYmqdZAzqI99H2R1i2kilXRvO0=;
 b=D5wTUQo6tHXwUacTs2NxjfVgNO30zpFbSVEah8potjJpXbLVIMRZrAYHNn41hamXSd
 KpmYnXTladgTeihsTXQmc1D1XtZ2mSB+4fhIhEDZd5sGY7m0gD0HZY6ttwQHQmb0Rdv8
 MJliLOTZ+cSkWsb4EE1H3MN9QHGxegfYmaFRWuQ3r+AjcL8dLaKrS4ffmyBJ9Ryyh3xL
 t/pHU183fKw6/2HHbWY4U+kYQfA3FVnw70Zqz24ZW5CLhzaQr8iwAGQEUbQWau/M9l8y
 b0vLMBofkx3eK5IGqR8T/PTl1ToP26MSRYL86a1im8HBbJgL+ml6zMyJdrAmNIqS2xh5
 xydg==
X-Gm-Message-State: AFqh2kpNfPYWPtsffb4ohhbaxCrZ/oD762XLcB8MjdtxVf1QdSFcEynQ
 128sReUOntFDsvo8I4U+eEtMwMibjCrxQIMh
X-Google-Smtp-Source: AMrXdXunXck1RbJjtxPZRS4Fns32CadcdIyHqyR4VBZfg8T+f4zdjP7ao1DXYsALrVylTfbC76QznQ==
X-Received: by 2002:a17:903:451:b0:192:820d:d1 with SMTP id
 iw17-20020a170903045100b00192820d00d1mr51051507plb.25.1673145452040; 
 Sat, 07 Jan 2023 18:37:32 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:8a2d:2011:f402:6f82])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a170902d4d100b00189d4c666c8sm3394775plg.153.2023.01.07.18.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 18:37:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net
Subject: [PATCH v4 10/36] tcg/tci: Fix big-endian return register ordering
Date: Sat,  7 Jan 2023 18:36:53 -0800
Message-Id: <20230108023719.2466341-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108023719.2466341-1-richard.henderson@linaro.org>
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


