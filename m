Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25C681C22
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 22:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMbGP-0000R1-TN; Mon, 30 Jan 2023 16:00:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGN-0000OT-4f
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:27 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMbGK-0005UI-US
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 16:00:26 -0500
Received: by mail-pf1-x431.google.com with SMTP id u5so8437156pfm.10
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 13:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4KRif7Wsoc/WAay8HomgguVyT4DuSPlLucVRpmBwnfo=;
 b=zmokCOA0+ofzHbOQeDkwra3ovsYQfM9XYLmMfjqDA25KzWndGY4DX7jc5Gej4rrN8I
 tFTqx+dsOvBi6Cffmw8b45FhWjstvQkHgEewAIS0p8TZT+I23OZVNvcz47FOOOh/YnQt
 QkPi3JVOdDr8Hdt6+rQ3XmMmZ3tE4nLRRgtqcby3SUnK5ZdYVP/niglGJtphY0hUywo/
 uKlurHSmQVpWSCojbnWHTMGNu8v6q2FUJ2ynViz5qp2B1gJ3YgynAE1/YV1r+h0sEOJE
 Im98IgYvICnM6pHFuDkl1Kuzqq0SdLhGp96HtdBnghDgkcBPa0wF3oCSMZOtHCpADBKr
 LWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KRif7Wsoc/WAay8HomgguVyT4DuSPlLucVRpmBwnfo=;
 b=2K7oKafpMZ9LP0rh7dP/cw4CDCWjt0tLjI6FhcTZ/6vCudHxESQiN5EaZrm6y/zqAX
 z7jELgy7WqrbtR7wuIiKmGvxell/P+Ngf1Y2sjbs2zwF+/jP2nMs9JNZTJAnNAVlb4dy
 iGsQznl6NluaE9xcMvCRJKhe7E0c8eGFVvYF8jyRSdVoOaHGRV21HkEl/z0jSSPpawm8
 M9TFujFcFle8Cf3FxA5V+TeHokAWqudBcoENHKRArMclOiAlBhACqahyh4yGcHXjbCgp
 CWKpw427x50sPKpk64ZUtqlvg0JDzkTybI66DHCL5vgUJGJ2OwNquFEaCbKGgKwfVj8Q
 jYiQ==
X-Gm-Message-State: AO0yUKU1fPxOpjHZZnKgNC1wWswbWwLmvBK78WOYnu80lgxFliL5btn8
 4EA5cKpdezyX0nGC6TVfUIrs2v7MHLk+sJC9
X-Google-Smtp-Source: AK7set/oR4bio03uQb9STxXYeyP61LeP47+6z3IGAG6EJUPaCmUmpD9UbzQd3hWh4szywXwBU8MUVg==
X-Received: by 2002:aa7:90d2:0:b0:593:c67e:e6e7 with SMTP id
 k18-20020aa790d2000000b00593c67ee6e7mr4269953pfk.24.1675112423918; 
 Mon, 30 Jan 2023 13:00:23 -0800 (PST)
Received: from stoup.. (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 x10-20020aa79a4a000000b00593eb3a5e44sm102933pfj.37.2023.01.30.13.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 13:00:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	cota@braap.org
Subject: [PATCH 27/27] tcg: Update docs/devel/tcg-ops.rst for temporary changes
Date: Mon, 30 Jan 2023 10:59:35 -1000
Message-Id: <20230130205935.1157347-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130205935.1157347-1-richard.henderson@linaro.org>
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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

Rewrite the sections which talked about 'local temporaries'.
Remove some assumptions which no longer hold.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst | 103 +++++++++++++++++++++--------------------
 1 file changed, 54 insertions(+), 49 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 9adc0c9b6c..53b7b6c93b 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -29,21 +29,42 @@ In this document, we use *guest* to specify what architecture we are
 emulating; *target* always means the TCG target, the machine on which
 we are running QEMU.
 
-A TCG *function* corresponds to a QEMU Translated Block (TB).
+A TCG *basic block* is a single entry, multiple exit region which
+corresponds to a list of instructions terminated by a label, or
+any branch instruction.
 
-A TCG *temporary* is a variable only live in a basic block. Temporaries are allocated explicitly in each function.
+A TCG *extended basic block* is a single entry, multiple exit region
+which corresponds to a list of instructions terminated by a label or
+an unconditional branch.  Specifically, an extended basic block is
+a sequence of basic blocks connected by the fall-through paths of
+zero or more conditional branch instructions.
 
-A TCG *local temporary* is a variable only live in a function. Local temporaries are allocated explicitly in each function.
+There is one TCG *fixed global* (``TEMP_FIXED``) variable, ``cpu_env``
+which is live in all translation blocks, and holds a pointer to ``CPUArchState``.
+This fixed global is held in a host cpu register at all times in all
+translation blocks.
 
-A TCG *global* is a variable which is live in all the functions
-(equivalent of a C global variable). They are defined before the
-functions defined. A TCG global can be a memory location (e.g. a QEMU
-CPU register), a fixed host register (e.g. the QEMU CPU state pointer)
-or a memory location which is stored in a register outside QEMU TBs
-(not implemented yet).
+A TCG *global* (``TEMP_GLOBAL``) is a variable which is live in all
+translation blocks, and correspond to memory locations that are within
+``CPUArchState``.  These may be specified as an offset from ``cpu_env``,
+in which case they are called *direct globals*, or may be specified as
+an offset from a direct global, in which case they are called
+*indirect globals*.  Even indirect globals should still reference memory
+within ``CPUArchState``.  All TCG globals are defined during
+``TCGCPUOps.initialize``, before any translation blocks are generated.
 
-A TCG *basic block* corresponds to a list of instructions terminated
-by a branch instruction.
+A TCG *constant* (``TEMP_CONST``) is a variable which is live throughout
+the entire translation block, and contains a constant value.
+These temporaries are allocated explicitly during translation and are
+hashed so that there is exactly one variable holding a given value.
+
+A TCG *translation block temporary* (``TEMP_TB``) is a variable which is
+live throughout the entire translation block, but dies on any exit.
+These temporaries are allocated explicitly during translation.
+
+A TCG *extended basic block temporary* (``TEMP_EBB``) is a variable which
+is live throughout an extended basic block, but dies on any exit.
+These temporaries are allocated explicitly during translation.
 
 An operation with *undefined behavior* may result in a crash.
 
@@ -57,11 +78,11 @@ Intermediate representation
 Introduction
 ------------
 
-TCG instructions operate on variables which are temporaries, local
-temporaries or globals. TCG instructions and variables are strongly
-typed. Two types are supported: 32 bit integers and 64 bit
-integers. Pointers are defined as an alias to 32 bit or 64 bit
-integers depending on the TCG target word size.
+TCG instructions operate on variables which are temporaries.
+TCG instructions and variables are strongly typed.
+Two types are supported: 32 bit integers and 64 bit integers.
+Pointers are defined as an alias to 32 bit or 64 bit integers
+depending on the TCG target word size.
 
 Each instruction has a fixed number of output variable operands, input
 variable operands and always constant operands.
@@ -81,17 +102,19 @@ included in the instruction name. Constants are prefixed with a '$'.
 Assumptions
 -----------
 
-Basic blocks
+Basic Blocks
 ^^^^^^^^^^^^
 
-* Basic blocks end after branches (e.g. brcond_i32 instruction),
-  goto_tb and exit_tb instructions.
+* Basic blocks end after conditional branches (e.g. brcond_i32),
+  br, goto_tb, exit_tb, goto_ptr, set_label instructions,
+  and calls that are defined to not return (``TCG_CALL_NO_RETURN``).
 
-* Basic blocks start after the end of a previous basic block, or at a
-  set_label instruction.
+* Basic blocks start after the end of a previous basic block,
+  or at a set_label instruction.
 
-After the end of a basic block, the content of temporaries is
-destroyed, but local temporaries and globals are preserved.
+* Extended basic blocks are a sequence of basic blocks that are
+  connected by the fall through of conditional branches.  Thus they end
+  at br, goto_tb, exit_tb, goto_ptr, set_label, and noreturn calls.
 
 Floating point types
 ^^^^^^^^^^^^^^^^^^^^
@@ -120,18 +143,15 @@ Helpers
     either directly or via an exception. They will not be saved to their
     canonical locations before calling the helper.
 
-  - ``TCG_CALL_NO_WRITE_GLOBALS`` means that the helper does not modify any globals.
-    They will only be saved to their canonical location before calling helpers,
-    but they won't be reloaded afterwards.
+  - ``TCG_CALL_NO_WRITE_GLOBALS`` means that the helper does not modify
+    any globals, but may read them.  Globals will be saved to their canonical
+    location before calling helpers, but won't be reloaded afterwards.
 
-  - ``TCG_CALL_NO_SIDE_EFFECTS`` means that the call to the function is removed if
-    the return value is not used.
+  - ``TCG_CALL_NO_SIDE_EFFECTS`` means that the call to the function is
+    removed if the return value is not used.
 
   Note that ``TCG_CALL_NO_READ_GLOBALS`` implies ``TCG_CALL_NO_WRITE_GLOBALS``.
 
-  On some TCG targets (e.g. x86), several calling conventions are
-  supported.
-
 Branches
 ^^^^^^^^
 
@@ -908,20 +928,9 @@ Recommended coding rules for best performance
   often modified, e.g. the integer registers and the condition
   codes. TCG will be able to use host registers to store them.
 
-- Avoid globals stored in fixed registers. They must be used only to
-  store the pointer to the CPU state and possibly to store a pointer
-  to a register window.
-
-- Use temporaries. Use local temporaries only when really needed,
-  e.g. when you need to use a value after a jump. Local temporaries
-  introduce a performance hit in the current TCG implementation: their
-  content is saved to memory at end of each basic block.
-
-- Free temporaries and local temporaries when they are no longer used
-  (tcg_temp_free). Since tcg_const_x() also creates a temporary, you
-  should free it after it is used. Freeing temporaries does not yield
-  a better generated code, but it reduces the memory usage of TCG and
-  the speed of the translation.
+- Free temporaries when they are no longer used (``tcg_temp_free``).
+  Since ``tcg_const_x`` also creates a temporary, you should free it
+  after it is used.
 
 - Don't hesitate to use helpers for complicated or seldom used guest
   instructions. There is little performance advantage in using TCG to
@@ -932,10 +941,6 @@ Recommended coding rules for best performance
   the instruction is mostly doing loads and stores, and in those cases
   inline TCG may still be faster for longer sequences.
 
-- The hard limit on the number of TCG instructions you can generate
-  per guest instruction is set by ``MAX_OP_PER_INSTR`` in ``exec-all.h`` --
-  you cannot exceed this without risking a buffer overrun.
-
 - Use the 'discard' instruction if you know that TCG won't be able to
   prove that a given global is "dead" at a given program point. The
   x86 guest uses it to improve the condition codes optimisation.
-- 
2.34.1


