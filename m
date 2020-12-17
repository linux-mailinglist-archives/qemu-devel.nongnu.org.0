Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F02DD35B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 15:58:07 +0100 (CET)
Received: from localhost ([::1]:59310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpujF-0000F0-EK
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 09:58:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudo-0003Lm-Go
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:30 -0500
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:41191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudh-0004qc-8t
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:27 -0500
Received: by mail-ot1-x336.google.com with SMTP id x13so27541895oto.8
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OC1ZOy4QC0O45qatXv2ctsW/wDGz7JTMDxUHGGLMD1M=;
 b=V2U0ZVHDaVqIQqGa0S9pRXMlnqyJ98P0GEFhif+qUlNmpKY8bnDfdzMZxJy0yLEdho
 eq61kqbZS7p0MF8pv38OKSUmiFi5wb0JRs/eHqktSUrROW1iiWeajQMQwZz/m4U7yRnT
 4y31nthgd8xVotwaevo/OzfeALEar/tZB7ask6ZeG6U30F/y9UC0vN/bjwJJmbi4WQrf
 9bWxE7KhJwAQm04klSJC4zI8wplziDsX+7KROuYBTRIWSBRKp/yf0tEgXRLPVK8SB2CJ
 CGM8/KwdJVwzmzKXy5YvJzfGOt+Gfvi92pq99WgolIR7/sNEILgQUw026GaZhwX9YQzP
 7ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OC1ZOy4QC0O45qatXv2ctsW/wDGz7JTMDxUHGGLMD1M=;
 b=pex7ZaIDV+a9gtTmSWa5buObY+byv7p2kIMegmeOq1z+NCGXOtdGLr/YC1x52iNobw
 qz9Vy2xE6XtV0V8c+UMhMo5croYUFALwUCQr24A4R1upewQ+smFkZhNzo/TFF+gNcKHT
 R1eYS/TWLMv1X2HgOpIazfFr4ZZtchsCsYq26oo/UEPH61djME60EfVD2cZqz0TXwSM5
 4pTOxOZaTcZbRmB9lk0zqq46WExND1iiHP+WA9rhuIwDgzpHWxS9SajYtfnZkDCiHo9l
 8wQTJMvhHu7Ff1k0e3hNGBfjerUcA2G3z++vutBUmqc66HlxQbxXa6nC7KMwr0eEH7i6
 DH7w==
X-Gm-Message-State: AOAM531w2SlXu4snuqCiFYW8RMY+ryXDpLKILdDK0/lC78Ipbk9nDHFg
 rfxPstGpVg2XnVF4nifdI5m58LJd5bE1NDZS
X-Google-Smtp-Source: ABdhPJz73snD7iSclMs+/7/huw9pZhA+0Q9y+1USu70EIaNTtGwhfWZnrNN0xRj/9FeOPkfAE7n1aw==
X-Received: by 2002:a05:6830:114:: with SMTP id
 i20mr29175901otp.20.1608216737093; 
 Thu, 17 Dec 2020 06:52:17 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/23] tcg: Better handling of constants
Date: Thu, 17 Dec 2020 08:51:52 -0600
Message-Id: <20201217145215.534637-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
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

Changes for v5:

Moved the clearing of the hash table from the end of compilation
to the beginning of compilation.  We skip the former when we long
jump out of the translator loop, e.g. touching a code page that
is unmapped.

Version 4 was back in May:
https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg02152.html

Version 1 blurb:

This promotes constants to full-fledged temporaries, which are then
hashed so we have only a single copy across the TB.  If an opcode
requires forcing one into a register, then we will only do this
once -- at least until the register is killed, e.g. by a function call.

While this is probably an modest improvement for integer code, it is
significant for SVE vector code.  In particular, where a generator function
loads a constant for the operation, and then the generator function is
called N times for the N x 128-bit vector.  Previously we'd be loading
up the same constant N times and now we do so only once.

The existing tcg_const_{type}() functions are unchanged, allocating
a new temporary and initializing it.  The constant propagation pass
of the optimizer will generally remove the temporary when it turns
out not to be modified further.

This adds new tcg_constant_{type}() functions which produce a read-only
temporary containing the constant which need not be freed.  I have
updated the generic expanders to take advantage of this, but have not
touched the target front ends.

This also, in the end, allows the complete removal of the tcg opcodes
that create a constant: INDEX_op_movi_{i32,i64} and INDEX_op_dupi_vec.
Loading of constants into hard registers is completely controlled by
the register allocator.


r~


Richard Henderson (23):
  tcg: Use tcg_out_dupi_vec from temp_load
  tcg: Increase tcg_out_dupi_vec immediate to int64_t
  tcg: Consolidate 3 bits into enum TCGTempKind
  tcg: Add temp_readonly
  tcg: Expand TCGTemp.val to 64-bits
  tcg: Rename struct tcg_temp_info to TempOptInfo
  tcg: Expand TempOptInfo to 64-bits
  tcg: Introduce TYPE_CONST temporaries
  tcg/optimize: Improve find_better_copy
  tcg/optimize: Adjust TempOptInfo allocation
  tcg/optimize: Use tcg_constant_internal with constant folding
  tcg: Convert tcg_gen_dupi_vec to TCG_CONST
  tcg: Use tcg_constant_i32 with icount expander
  tcg: Use tcg_constant_{i32,i64} with tcg int expanders
  tcg: Use tcg_constant_{i32,i64} with tcg plugins
  tcg: Use tcg_constant_{i32,i64,vec} with gvec expanders
  tcg/tci: Add special tci_movi_{i32,i64} opcodes
  tcg: Remove movi and dupi opcodes
  tcg: Add tcg_reg_alloc_dup2
  tcg/i386: Use tcg_constant_vec with tcg vec expanders
  tcg: Remove tcg_gen_dup{8,16,32,64}i_vec
  tcg/ppc: Use tcg_constant_vec with tcg vec expanders
  tcg/aarch64: Use tcg_constant_vec with tcg vec expanders

 include/exec/gen-icount.h    |  25 +-
 include/tcg/tcg-op.h         |  17 +-
 include/tcg/tcg-opc.h        |  11 +-
 include/tcg/tcg.h            |  50 +++-
 accel/tcg/plugin-gen.c       |  49 ++--
 tcg/optimize.c               | 249 +++++++++---------
 tcg/tcg-op-gvec.c            | 125 ++++-----
 tcg/tcg-op-vec.c             |  52 +---
 tcg/tcg-op.c                 | 227 ++++++++--------
 tcg/tcg.c                    | 488 +++++++++++++++++++++++++++--------
 tcg/tci.c                    |   4 +-
 tcg/aarch64/tcg-target.c.inc |  32 +--
 tcg/arm/tcg-target.c.inc     |   1 -
 tcg/i386/tcg-target.c.inc    | 112 ++++----
 tcg/mips/tcg-target.c.inc    |   2 -
 tcg/ppc/tcg-target.c.inc     |  90 ++++---
 tcg/riscv/tcg-target.c.inc   |   2 -
 tcg/s390/tcg-target.c.inc    |   2 -
 tcg/sparc/tcg-target.c.inc   |   2 -
 tcg/tci/tcg-target.c.inc     |   6 +-
 20 files changed, 882 insertions(+), 664 deletions(-)

-- 
2.25.1


