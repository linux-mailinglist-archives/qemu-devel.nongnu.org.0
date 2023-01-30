Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48567681D41
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMc1V-0001wT-Nh; Mon, 30 Jan 2023 16:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1U-0001w3-5O
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:08 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMc1S-0005cc-Hv
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:49:07 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 rm7-20020a17090b3ec700b0022c05558d22so12467436pjb.5
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8hloccov+e7J/dBzNCn3XTem8GBlJxxzB07CqfLWqlQ=;
 b=gxbiZ5gy5RaJOwJ+LKygsjJZF8Ra940PSMHSapHMNcoW8eZrUbboZKwvRWnVtkCHNV
 q2x4Y+oH3wJi5j8SEMsNYto7HP/V1paLeTOsQQtQrwX7G8RHqzLu+Wp0qjzDNdJGsUsU
 qpe1Tw7Ru9lkDuuigWOxQtjRM3v1PvqHC1x2HsOKhiGKEOO4f9GB+O1jje11kUOZARwS
 vkjffd11paFqJpyrcHV/4x2bnVQkzHLyQYUGbIkzAzd0J+5APmfFfH5miE0CpeWTIle2
 LKPh2b631CyCa0pibLsyN98UyjKgMrAJLKDdCSjqbjBIZXvN5OldtgV/84sLfv0/GMaY
 nEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8hloccov+e7J/dBzNCn3XTem8GBlJxxzB07CqfLWqlQ=;
 b=66ktCfrWGHHzc1Mvph6dOqLwjT8DnPfcbQcASUa3OVeSFXIv47FSIQf4/PEPcOF1cu
 yXdchWLId9M3ECdo9DFyEFSix9bquHIVF+djwuXxpFM6qg+Dro8g3wJY1FECkxEAm8P+
 NT4wsYOEqbAEUBD501MvYk4JKVF8VH8shi/600xPJ3chuISSIjna3ZJ7NboMlEBsVsMm
 MsGz+64XFviGADN47iiERsiSd3DXzPm2+riYsDYKkVAjZ+2J3oiO58Vxca7ctjd6J05x
 Gt1S7zN4E/SDyppHF4GexeIoqTClJrLuNVQJADBv1peo52jioY4qe8vew5s+Pu5hB8eF
 6aBQ==
X-Gm-Message-State: AO0yUKVsnApkWt78+dS4Yg4JY54h4zciAo8t1dIUdWh/3drSBMgLgwNe
 hqAyaiFbSUwTenZSN+rwCx0Wbk1WtRoNanI3
X-Google-Smtp-Source: AK7set9oAhkYWKzqQMAQhANNS9nm1KNKgpAXfPN+Zi5/Xbi7+g1ZDNK3DIP2U1eM9m3osOz0/U4Atg==
X-Received: by 2002:a17:90a:1a15:b0:22c:912:b80d with SMTP id
 21-20020a17090a1a1500b0022c0912b80dmr22987327pjk.33.1675115345096; 
 Mon, 30 Jan 2023 13:49:05 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a17090ad14400b00219220edf0dsm7451215pjw.48.2023.01.30.13.49.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:49:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	philmd@linaro.org
Subject: [PATCH v6 10/36] tcg/tci: Fix big-endian return register ordering
Date: Mon, 30 Jan 2023 11:48:18 -1000
Message-Id: <20230130214844.1158612-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130214844.1158612-1-richard.henderson@linaro.org>
References: <20230130214844.1158612-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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


