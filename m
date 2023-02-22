Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5252269FF8B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:31:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWy-00014n-DU; Wed, 22 Feb 2023 18:28:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWl-0000m5-Ft
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:59 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWj-0005Lf-B4
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:59 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso10542516pjb.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4KRif7Wsoc/WAay8HomgguVyT4DuSPlLucVRpmBwnfo=;
 b=SQZGfDIzIbMybUoswv0MelFpw+WJfk65rvq9skLX4OuZzfqJLbG/5A4IRa4jkh6ZI5
 RZL6x514FD8UESTprENn+01+HN/xN/+bZBqbkzC+SdovNHYdS4O6KH58oceqdMgLvPoD
 0o51DV9HFH67wtUwnzsOt/Z9X9IAW7P1VDFy4I8v7Jf6haCv2Fkg1lLriIZ4RY3uhBeB
 +eUS/gcPRwYx1Ao9VV4kyqGeh6UiwBO0R6wKqDZLd50bo+kSbcwKXWvNNVIbWraiXn1c
 9Inuu+xJ6boA8qlcJ0Ne5iOAgIqvXMXZJ+LPoh6v6S0GC+ZolbPmEA/tYPDf2DVsrzIW
 rvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4KRif7Wsoc/WAay8HomgguVyT4DuSPlLucVRpmBwnfo=;
 b=oHjWgLm0CV9ebI4cCx63De7OZrv1chJeLfZjsC+sWWUi6tCqOC7jV+Qr0gth7Ffp8C
 mRK6SI/rEalwjbMgxlVZQcBpWg4QZtcEH2YDBBFGEyfB//FOsaMHBh0U3hodioDkCdBD
 oFJY5dWuFPOj/Dluyo612Ir2ZtNENEFKMmnEFLlvybOQjOJ3a26tU7mTrj/LKqlBdWLy
 8yzyW4jhip64R/cplXs9r4GLzkXG5XfN+/OoPq1lw9SUat9H1uyWeIRutoePY7YomNtv
 tFLNa0zYb9iwsP4dnlnWYEADq5h1NMv8Bc8P0vOAiP8UXW11qWTPsKK4hUIFOfuWj7oC
 pUJQ==
X-Gm-Message-State: AO0yUKVpipbcGEakMk6fZytCejGrrNsTyJ0mbtt1TaknIf6YxIuFUqnt
 UjX6FxuAKK72tUReCeAZ9JaBBI2IcsPWOsFMmo0=
X-Google-Smtp-Source: AK7set9ewMwHhwuzkLx3pkKvWhXvcmRGwMZhw47ZMYihEoqt60hGJlplErf9bM19alUTQ0fOzGm/Iw==
X-Received: by 2002:a17:90b:4b4c:b0:233:d657:2c7e with SMTP id
 mi12-20020a17090b4b4c00b00233d6572c7emr12173839pjb.8.1677108476347; 
 Wed, 22 Feb 2023 15:27:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:55 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/28] tcg: Update docs/devel/tcg-ops.rst for temporary
 changes
Date: Wed, 22 Feb 2023 13:27:14 -1000
Message-Id: <20230222232715.15034-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


