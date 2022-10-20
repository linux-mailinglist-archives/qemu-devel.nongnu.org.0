Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A5E6063BC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 17:02:17 +0200 (CEST)
Received: from localhost ([::1]:37816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olX3o-0006jA-AG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 11:02:16 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWuM-00009z-Nu
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7l-00053g-ST
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:50827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU7j-00013f-PB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:54:09 -0400
Received: by mail-pj1-x102a.google.com with SMTP id h12so19586317pjk.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C7nTk6eX+kswB5wuXduCzcjy8/8M1GXHlLMqkE3JW5Q=;
 b=IlMDqCmoH3UdTzz8bpdb9Z1QOYi/McI3Wi6gxEUuOmLKv+oR9pFezQy7PBYOINMILG
 3nycxm1oBz7uN1DsoDYp4OBILQ+Uhg3NJa7YPwcOFjVIhXM6WmzFCflaRv+vBF1EBjC7
 H9x54YVxG2DMupvDcFUORUjVvQPvu/Gr3egd1MUYAJD4jLqR5eAveFxG98goBDrJiHYr
 jP2KD13VcPBP9/A9W09CUeZazuAw8cCCSBhNek44eDV/lttpI0MWOXon9oo2L31NxiMH
 SvFxpXuXu3yI/hi6PI64m2O6RuPC30mv72DEsO/pWvm7tJHofcA86jEtsCZ7B4CvwJdU
 86Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C7nTk6eX+kswB5wuXduCzcjy8/8M1GXHlLMqkE3JW5Q=;
 b=M6mGgKmOrDf5JHhxLIhevq/Vfvm/qK5N0Vw+IgWhc0NNCEHKEFWVZcuUimsLZXEc7c
 vsmhE3GrxQoPqxE59exqnxUulRt3DPUP0MF63cemUzsdLlJ95zt6jIt6IqCbbSQFLGFS
 PVbWb+vJmV+Wrxz/IRr83Ptqv0tX4nx3gR/Hb+oGc4S/kb2Cnt/mvlwSYGXe8/uZna5P
 Euasqs56gC/mUJd3oJPSP3UdcLt2ZGI2WZRpJFj4lab0Zqg21bUo5T4R3GxS3704t6VS
 x682H1mODU2KQjoy2KM8GN+5oxomeW8KjZnkfVhgTv4BUVsyW530NGfy79dt2o6v6qtL
 mrrA==
X-Gm-Message-State: ACrzQf2yNAwLi2t7WCX9Yz8fBf9hjErrRb4blIdZEKhPnk1/IK6/f1Tu
 ZLR1z1bfUf0vQuYk3ob8tkQx8/1Dh48tRTAa
X-Google-Smtp-Source: AMsMyM6DmwQYw/yTFf1i929PZhBrPvfjNqvq67vmI+bkaysqUYNx87TNaH4MNVO8tHzJCF+a0H9ipw==
X-Received: by 2002:a17:90b:4d90:b0:20d:9ded:4144 with SMTP id
 oj16-20020a17090b4d9000b0020d9ded4144mr15464566pjb.90.1666266844221; 
 Thu, 20 Oct 2022 04:54:04 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.54.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:54:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/31] tcg: Use TCG_CALL_ARG_EVEN for TCI special case
Date: Thu, 20 Oct 2022 21:52:28 +1000
Message-Id: <20221020115242.2301066-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115242.2301066-1-richard.henderson@linaro.org>
References: <20221020115242.2301066-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change 32-bit tci TCG_TARGET_CALL_ARG_I32 to TCG_CALL_ARG_EVEN, to
force 32-bit values to be aligned to 64-bit.  With a small reorg
to the argument processing loop, this neatly replaces an ifdef for
CONFIG_TCG_INTERPRETER.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.h |  3 ++-
 tcg/tcg.c            | 62 ++++++++++++++++++++++++++------------------
 2 files changed, 39 insertions(+), 26 deletions(-)

diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index d6e0450ed8..94ec541b4e 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -158,10 +158,11 @@ typedef enum {
 /* Used for function call generation. */
 #define TCG_TARGET_CALL_STACK_OFFSET    0
 #define TCG_TARGET_STACK_ALIGN          8
-#define TCG_TARGET_CALL_ARG_I32         TCG_CALL_ARG_NORMAL
 #if TCG_TARGET_REG_BITS == 32
+# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_EVEN
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_EVEN
 #else
+# define TCG_TARGET_CALL_ARG_I32        TCG_CALL_ARG_NORMAL
 # define TCG_TARGET_CALL_ARG_I64        TCG_CALL_ARG_NORMAL
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index b83bb23281..5704373d57 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1532,36 +1532,48 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     real_args = 0;
     for (i = 0; i < nargs; i++) {
         int argtype = extract32(typemask, (i + 1) * 3, 3);
-        bool is_64bit = (argtype & ~1) == dh_typecode_i64;
-        bool want_align = false;
+        TCGCallArgumentKind kind;
+        TCGType type;
 
-#if defined(CONFIG_TCG_INTERPRETER)
-        /*
-         * Align all arguments, so that they land in predictable places
-         * for passing off to ffi_call.
-         */
-        want_align = true;
-#else
-        /* Some targets want aligned 64 bit args */
-        if (is_64bit) {
-            want_align = TCG_TARGET_CALL_ARG_I64 == TCG_CALL_ARG_EVEN;
-        }
-#endif
-
-        if (TCG_TARGET_REG_BITS < 64 && want_align && (real_args & 1)) {
-            op->args[pi++] = TCG_CALL_DUMMY_ARG;
-            real_args++;
+        switch (argtype) {
+        case dh_typecode_i32:
+        case dh_typecode_s32:
+            type = TCG_TYPE_I32;
+            kind = TCG_TARGET_CALL_ARG_I32;
+            break;
+        case dh_typecode_i64:
+        case dh_typecode_s64:
+            type = TCG_TYPE_I64;
+            kind = TCG_TARGET_CALL_ARG_I64;
+            break;
+        case dh_typecode_ptr:
+            type = TCG_TYPE_PTR;
+            kind = TCG_CALL_ARG_NORMAL;
+            break;
+        default:
+            g_assert_not_reached();
         }
 
-        if (TCG_TARGET_REG_BITS < 64 && is_64bit) {
+        switch (kind) {
+        case TCG_CALL_ARG_EVEN:
+            if (real_args & 1) {
+                op->args[pi++] = TCG_CALL_DUMMY_ARG;
+                real_args++;
+            }
+            /* fall through */
+        case TCG_CALL_ARG_NORMAL:
+            if (TCG_TARGET_REG_BITS == 32 && type == TCG_TYPE_I64) {
+                op->args[pi++] = temp_arg(args[i]);
+                op->args[pi++] = temp_arg(args[i] + 1);
+                real_args += 2;
+                break;
+            }
             op->args[pi++] = temp_arg(args[i]);
-            op->args[pi++] = temp_arg(args[i] + 1);
-            real_args += 2;
-            continue;
+            real_args++;
+            break;
+        default:
+            g_assert_not_reached();
         }
-
-        op->args[pi++] = temp_arg(args[i]);
-        real_args++;
     }
     op->args[pi++] = (uintptr_t)func;
     op->args[pi++] = (uintptr_t)info;
-- 
2.34.1


