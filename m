Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB06A280B
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:03:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQI-0001t5-6R; Sat, 25 Feb 2023 04:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqQ5-00019Q-4K
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:41 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqQ0-00058d-RQ
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:38 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 m8-20020a17090a4d8800b002377bced051so5248319pjh.0
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0Gs7MFYp9V4OMwGOufU9X3i4KkVreZM38DqWd3mnOo=;
 b=INE0CyqBAmKtN4pz8KTt9DY0RGYYmSY4a2xm/+KztJihoA5lR9N1mUSLcXU1JjCa/k
 Txo3MpUgIV5LOzupFfCIa67lxPb/W+D5hIRCxuGN1kwcB2VvTKH7KzRTwQCeDOgS/gDu
 zIqtl9NHAwRP1hI9yvnLrEHvjDPM57gr5Gg0QDd2vFCSoclFlTxaGAWmCbhPCorKFMer
 OLLay+owNtfJyts4OlECvH7XmbjwBKbB1cuT2Xm8DFofq26RBKn16BAvsluY2ocWdok2
 VmRRESErnmB38a1MbPLjfoV27hoX3mF93saTi2tIOV0bTX4DI5hPhZMqn6dtMWzFcv35
 WGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0Gs7MFYp9V4OMwGOufU9X3i4KkVreZM38DqWd3mnOo=;
 b=guK7pdSiiDoEoLCEqi2ok/sA2AkQs1/tcsLKCXTbnG3yWv1WvFlsGkuuO0bTWbCOEK
 7D66O7REsXkMqGxxVL1I/SIYUXlJ8JnO6Kxc5/UfmwKylbblC2r2ez5Xy0VIOkR4wAu1
 PQUCEiwYtgj/P+ElGzIn7wimj+1UHNIL9QR9U1kUE9XVZN2bmVLH/Gydo8+3Z/lql6UQ
 9oT8p4QA7a9k873Sr6c49IZxWLLyTvsasNczhbbZmb5BD/NsdqT6w+CMWkbW1Ve3cdcn
 V13dB0YHXZMbPt0ELpMqloBfTKMMOr0laMtc/3vAEkJIkdX2107xAWUmT/KR0ydWyblr
 Lz0Q==
X-Gm-Message-State: AO0yUKXMoeDBt34DNJCuOKWOIyGalZjjD5N/ND7eZcsuycvMxNWcNc7j
 UzqHGQi31SY4imNHOGnPfJNkQ8aO44D275UoReQ=
X-Google-Smtp-Source: AK7set97McDxhDvDsUbGC5IB8J+FX6z/jeKyXV12TLiWf32RN2Xp3bUs/h8eO9zzAUNB0HzDCIeymg==
X-Received: by 2002:a05:6a20:7d92:b0:bc:8bd6:d460 with SMTP id
 v18-20020a056a207d9200b000bc8bd6d460mr22045984pzj.3.1677315633510; 
 Sat, 25 Feb 2023 01:00:33 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PATCH v3 30/30] tcg: Update docs/devel/tcg-ops.rst for temporary
 changes
Date: Fri, 24 Feb 2023 22:59:45 -1000
Message-Id: <20230225085945.1798188-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
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

Rewrite the sections which talked about 'local temporaries'.
Remove some assumptions which no longer hold.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/devel/tcg-ops.rst | 230 +++++++++++++++++++++++------------------
 1 file changed, 129 insertions(+), 101 deletions(-)

diff --git a/docs/devel/tcg-ops.rst b/docs/devel/tcg-ops.rst
index 9adc0c9b6c..561c416574 100644
--- a/docs/devel/tcg-ops.rst
+++ b/docs/devel/tcg-ops.rst
@@ -7,67 +7,51 @@ TCG Intermediate Representation
 Introduction
 ============
 
-TCG (Tiny Code Generator) began as a generic backend for a C
-compiler. It was simplified to be used in QEMU. It also has its roots
-in the QOP code generator written by Paul Brook.
+TCG (Tiny Code Generator) began as a generic backend for a C compiler.
+It was simplified to be used in QEMU.  It also has its roots in the
+QOP code generator written by Paul Brook.
 
 Definitions
 ===========
 
-TCG receives RISC-like *TCG ops* and performs some optimizations on them,
-including liveness analysis and trivial constant expression
-evaluation.  TCG ops are then implemented in the host CPU back end,
-also known as the TCG target.
-
-The TCG *target* is the architecture for which we generate the
-code. It is of course not the same as the "target" of QEMU which is
-the emulated architecture. As TCG started as a generic C backend used
-for cross compiling, it is assumed that the TCG target is different
-from the host, although it is never the case for QEMU.
+The TCG *target* is the architecture for which we generate the code.
+It is of course not the same as the "target" of QEMU which is the
+emulated architecture.  As TCG started as a generic C backend used
+for cross compiling, the assumption was that TCG target might be
+different from the host, although this is never the case for QEMU.
 
 In this document, we use *guest* to specify what architecture we are
 emulating; *target* always means the TCG target, the machine on which
 we are running QEMU.
 
-A TCG *function* corresponds to a QEMU Translated Block (TB).
-
-A TCG *temporary* is a variable only live in a basic block. Temporaries are allocated explicitly in each function.
-
-A TCG *local temporary* is a variable only live in a function. Local temporaries are allocated explicitly in each function.
-
-A TCG *global* is a variable which is live in all the functions
-(equivalent of a C global variable). They are defined before the
-functions defined. A TCG global can be a memory location (e.g. a QEMU
-CPU register), a fixed host register (e.g. the QEMU CPU state pointer)
-or a memory location which is stored in a register outside QEMU TBs
-(not implemented yet).
-
-A TCG *basic block* corresponds to a list of instructions terminated
-by a branch instruction.
-
 An operation with *undefined behavior* may result in a crash.
 
 An operation with *unspecified behavior* shall not crash.  However,
 the result may be one of several possibilities so may be considered
 an *undefined result*.
 
-Intermediate representation
-===========================
+Basic Blocks
+============
 
-Introduction
-------------
+A TCG *basic block* is a single entry, multiple exit region which
+corresponds to a list of instructions terminated by a label, or
+any branch instruction.
 
-TCG instructions operate on variables which are temporaries, local
-temporaries or globals. TCG instructions and variables are strongly
-typed. Two types are supported: 32 bit integers and 64 bit
-integers. Pointers are defined as an alias to 32 bit or 64 bit
-integers depending on the TCG target word size.
+A TCG *extended basic block* is a single entry, multiple exit region
+which corresponds to a list of instructions terminated by a label or
+an unconditional branch.  Specifically, an extended basic block is
+a sequence of basic blocks connected by the fall-through paths of
+zero or more conditional branch instructions.
 
-Each instruction has a fixed number of output variable operands, input
-variable operands and always constant operands.
+Operations
+==========
 
-The notable exception is the call instruction which has a variable
-number of outputs and inputs.
+TCG instructions or *ops* operate on TCG *variables*, both of which
+are strongly typed.  Each instruction has a fixed number of output
+variable operands, input variable operands and constant operands.
+Vector instructions have a field specifying the element size within
+the vector.  The notable exception is the call instruction which has
+a variable number of outputs and inputs.
 
 In the textual form, output operands usually come first, followed by
 input operands, followed by constant operands. The output type is
@@ -77,68 +61,127 @@ included in the instruction name. Constants are prefixed with a '$'.
 
    add_i32 t0, t1, t2    /* (t0 <- t1 + t2) */
 
+Variables
+=========
 
-Assumptions
------------
+* ``TEMP_FIXED``
 
-Basic blocks
-^^^^^^^^^^^^
+  There is one TCG *fixed global* variable, ``cpu_env``, which is
+  live in all translation blocks, and holds a pointer to ``CPUArchState``.
+  This variable is held in a host cpu register at all times in all
+  translation blocks.
 
-* Basic blocks end after branches (e.g. brcond_i32 instruction),
-  goto_tb and exit_tb instructions.
+* ``TEMP_GLOBAL``
 
-* Basic blocks start after the end of a previous basic block, or at a
-  set_label instruction.
+  A TCG *global* is a variable which is live in all translation blocks,
+  and corresponds to memory location that is within ``CPUArchState``.
+  These may be specified as an offset from ``cpu_env``, in which case
+  they are called *direct globals*, or may be specified as an offset
+  from a direct global, in which case they are called *indirect globals*.
+  Even indirect globals should still reference memory within
+  ``CPUArchState``.  All TCG globals are defined during
+  ``TCGCPUOps.initialize``, before any translation blocks are generated.
 
-After the end of a basic block, the content of temporaries is
-destroyed, but local temporaries and globals are preserved.
+* ``TEMP_CONST``
 
-Floating point types
-^^^^^^^^^^^^^^^^^^^^
+  A TCG *constant* is a variable which is live throughout the entire
+  translation block, and contains a constant value.  These variables
+  are allocated on demand during translation and are hashed so that
+  there is exactly one variable holding a given value.
 
-* Floating point types are not supported yet
+* ``TEMP_TB``
 
-Pointers
-^^^^^^^^
+  A TCG *translation block temporary* is a variable which is live
+  throughout the entire translation block, but dies on any exit.
+  These temporaries are allocated explicitly during translation.
 
-* Depending on the TCG target, pointer size is 32 bit or 64
-  bit. The type ``TCG_TYPE_PTR`` is an alias to ``TCG_TYPE_I32`` or
-  ``TCG_TYPE_I64``.
+* ``TEMP_EBB``
+
+  A TCG *extended basic block temporary* is a variable which is live
+  throughout an extended basic block, but dies on any exit.
+  These temporaries are allocated explicitly during translation.
+
+Types
+=====
+
+* ``TCG_TYPE_I32``
+
+  A 32-bit integer.
+
+* ``TCG_TYPE_I64``
+
+  A 64-bit integer.  For 32-bit hosts, such variables are split into a pair
+  of variables with ``type=TCG_TYPE_I32`` and ``base_type=TCG_TYPE_I64``.
+  The ``temp_subindex`` for each indicates where it falls within the
+  host-endian representation.
+
+* ``TCG_TYPE_PTR``
+
+  An alias for ``TCG_TYPE_I32`` or ``TCG_TYPE_I64``, depending on the size
+  of a pointer for the host.
+
+* ``TCG_TYPE_REG``
+
+  An alias for ``TCG_TYPE_I32`` or ``TCG_TYPE_I64``, depending on the size
+  of the integer registers for the host.  This may be larger
+  than ``TCG_TYPE_PTR`` depending on the host ABI.
+
+* ``TCG_TYPE_I128``
+
+  A 128-bit integer.  For all hosts, such variables are split into a number
+  of variables with ``type=TCG_TYPE_REG`` and ``base_type=TCG_TYPE_I128``.
+  The ``temp_subindex`` for each indicates where it falls within the
+  host-endian representation.
+
+* ``TCG_TYPE_V64``
+
+  A 64-bit vector.  This type is valid only if the TCG target
+  sets ``TCG_TARGET_HAS_v64``.
+
+* ``TCG_TYPE_V128``
+
+  A 128-bit vector.  This type is valid only if the TCG target
+  sets ``TCG_TARGET_HAS_v128``.
+
+* ``TCG_TYPE_V256``
+
+  A 256-bit vector.  This type is valid only if the TCG target
+  sets ``TCG_TARGET_HAS_v256``.
 
 Helpers
-^^^^^^^
+=======
 
-* Using the tcg_gen_helper_x_y it is possible to call any function
-  taking i32, i64 or pointer types. By default, before calling a helper,
-  all globals are stored at their canonical location and it is assumed
-  that the function can modify them. By default, the helper is allowed to
-  modify the CPU state or raise an exception.
+Helpers are registered in a guest-specific ``helper.h``,
+which is processed to generate ``tcg_gen_helper_*`` functions.
+With these functions it is possible to call a function taking
+i32, i64, i128 or pointer types.
 
-  This can be overridden using the following function modifiers:
+By default, before calling a helper, all globals are stored at their
+canonical location.  By default, the helper is allowed to modify the
+CPU state (including the state represented by tcg globals)
+or may raise an exception.  This default can be overridden using the
+following function modifiers:
 
-  - ``TCG_CALL_NO_READ_GLOBALS`` means that the helper does not read globals,
-    either directly or via an exception. They will not be saved to their
-    canonical locations before calling the helper.
+* ``TCG_CALL_NO_WRITE_GLOBALS``
 
-  - ``TCG_CALL_NO_WRITE_GLOBALS`` means that the helper does not modify any globals.
-    They will only be saved to their canonical location before calling helpers,
-    but they won't be reloaded afterwards.
+  The helper does not modify any globals, but may read them.
+  Globals will be saved to their canonical location before calling helpers,
+  but need not be reloaded afterwards.
 
-  - ``TCG_CALL_NO_SIDE_EFFECTS`` means that the call to the function is removed if
-    the return value is not used.
+* ``TCG_CALL_NO_READ_GLOBALS``
 
-  Note that ``TCG_CALL_NO_READ_GLOBALS`` implies ``TCG_CALL_NO_WRITE_GLOBALS``.
+  The helper does not read globals, either directly or via an exception.
+  They will not be saved to their canonical locations before calling
+  the helper.  This implies ``TCG_CALL_NO_WRITE_GLOBALS``.
 
-  On some TCG targets (e.g. x86), several calling conventions are
-  supported.
+* ``TCG_CALL_NO_SIDE_EFFECTS``
 
-Branches
-^^^^^^^^
-
-* Use the instruction 'br' to jump to a label.
+  The call to the helper function may be removed if the return value is
+  not used.  This means that it may not modify any CPU state nor may it
+  raise an exception.
 
 Code Optimizations
-------------------
+==================
 
 When generating instructions, you can count on at least the following
 optimizations:
@@ -908,20 +951,9 @@ Recommended coding rules for best performance
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
@@ -932,10 +964,6 @@ Recommended coding rules for best performance
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


