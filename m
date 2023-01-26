Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25967C3E0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 05:40:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKu2B-0000Ak-UO; Wed, 25 Jan 2023 23:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu2A-00009c-Ae
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:46 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pKu28-0004Rg-Pb
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 23:38:46 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 z1-20020a17090a66c100b00226f05b9595so756540pjl.0
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 20:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFQ2aG+VnTqrFSc5ewVcTvqiqhyOxzsEeJCA6dzv8VM=;
 b=BkLKeQO0oYsSeC6knVpG1IG77MXOVvALgjfEkIQFFp/0mDGmx8HqiB9Se6GohpkjXA
 DzIyqRz6en1gnhqWOEOouXieCd9ALUPtd4aQlfQ85kC2Gh418DWoGvmwEHiY3/2cvd0v
 zFQ2SICXNUNRbM8FGj08SQg0dYbiFyE4mn44M92Ctb6xLCYCR1OoFv2M039kShWZ8iuB
 lk8l4s70P3fHk4Xgq2GuGWlfKHJrYWJuyQWZW81gYyXDVphRy7d8ZaR9jekS17I1EG3Q
 N4/LQH6gVh7/iYc7erWBm+znxyae6dcxG1bjYI6ca8YxzoUlo21ONS6nXcbLf7n9BTqs
 nbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFQ2aG+VnTqrFSc5ewVcTvqiqhyOxzsEeJCA6dzv8VM=;
 b=fBps2MjuQCQpbbXQiVtI7CWPkAMCAnqYGB2q9WcxeEo62YoSfx/qvS0bokIQI2Iwqc
 ZBu/qhirnWYnoulJ70c6c7XkSWdVWMV6BTNXYmUsSdJGIw1H0YKwerpOyvCrPQ8B327R
 vKLmJtp4PzAe+K2EEahoUUI2ndPnfDmyTWvioZ7SncioXWieNJ0jSnJ2nUGyiS29Rqnh
 jhGUGJRFnQyLVKIQFPfjUlH14CrnYwG8ARylyXb4FoXIweCPkGNdy94H0Tg9zRWFKTvr
 8nHP4c7tnEXbjR8Dz+wnp/ou/+SzX5uI1v7q7DTI0GOGHVf2Rt+8I95PUBVpbCPUy7D0
 M7Kg==
X-Gm-Message-State: AO0yUKW1x0uEAEnIcg7sEsn8bsIe/Y7wfWRBcbrjwpX2GaQDS2zuSp4I
 V1GgRS+gg+3l+D9oDabXCB6tdmtneSYnRH1zdLk=
X-Google-Smtp-Source: AK7set8OuS8+sHHSkyT7Z6L2ofs5AUMIFKdKRdU4ULacmN5xTY7EfQ3q0I+A+tRftcsqrtEnXL6FGw==
X-Received: by 2002:a17:90b:1d91:b0:22b:ed4a:c46e with SMTP id
 pf17-20020a17090b1d9100b0022bed4ac46emr8942662pjb.30.1674707923426; 
 Wed, 25 Jan 2023 20:38:43 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s62-20020a17090a69c400b00228e56d375asm233376pjj.33.2023.01.25.20.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 20:38:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 10/36] tcg/tci: Fix big-endian return register ordering
Date: Wed, 25 Jan 2023 18:37:58 -1000
Message-Id: <20230126043824.54819-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126043824.54819-1-richard.henderson@linaro.org>
References: <20230126043824.54819-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


