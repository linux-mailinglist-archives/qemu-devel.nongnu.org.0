Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9115B606349
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:38:20 +0200 (CEST)
Received: from localhost ([::1]:46538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWgc-0007M9-3x
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:38:18 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWfs-0002RZ-SU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU79-0003x2-Kr
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:35 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olU70-0000vQ-1S
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:53:31 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so3200822pjq.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=HbCzOjl9jKn7YbpYEUV42nrVgHwn6Z+TZFESyYUursk=;
 b=UrTlZAB65fANeOY9+bc8Kndp1xOte2ZgN+H97lLKxeE7AmN9yklsQZ6lE7Y3JPhytN
 Rp69IjH/7gft3t3ryPuyV6oLPpP51GDeZZ/WPLYAo9vUDxJqsAE8Cfe14+gUR88E7Kvr
 xIsaRj+UOj+8/8/eBRmCzJh8Z4OHbMNcj5NWYZ9DSNGGuEQFcmy0uCFkZ9deNkybFtlh
 GNeD865jzASvKxwtGKR3Z0zJamO3ZWvkSheKr/d0NflFLyhXv5aKPB96TmazwNE2w9/m
 s67aXx4e0I875D00VGMkzX454Fb7gGq7iZRPes9qXBhCYy4J5SQ/4iGavxbxgcF5wL7q
 0jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HbCzOjl9jKn7YbpYEUV42nrVgHwn6Z+TZFESyYUursk=;
 b=d5jld841aVQqhlGw6U0Y5tm7X+DN36C957lZyZiUzMQ59hW1YNnRxwvdYb6g8u8TMU
 HuI4tQpRyfbOkalbskbmfJcVDdNHw+9AAQfXE/2XXO4vlxd75N6rstVnbFXCxoFKmOyq
 NfdmnbG+mRPKGk2CJebZqSPyXq18mpKuyV3Jzn7gU8UAF+rHb8ODDNjmQxQEm6NKtAZT
 +CcDzGqlhJfq2RWCJjB3rMXCcXkXvXBed+lVkJt1qB0Z878ow7GKa/BU5kgLdLB15zUt
 k49D/ZS4XqKxex0kJY6uepst4XT8WQjTsR8BGJaS3O5e3ETT8cq+eUe4BHUtQMvle4Vm
 Or+g==
X-Gm-Message-State: ACrzQf1utV6NKBpfONU9WLBxt8gWHxvNOmtVE6Yb8BEqjJeC0/WNjPoj
 5w3GJJRn4/PpcWDRsUyfD5BktiVnfTbiLkot
X-Google-Smtp-Source: AMsMyM4ERo42XzrzCFzyTfxUNgVlSWSwbuHXV9hDH+SI8Sas+9/qVaYihNc/El/2GmNgEDOnP/IJtQ==
X-Received: by 2002:a17:903:40cf:b0:17f:7d7e:95b0 with SMTP id
 t15-20020a17090340cf00b0017f7d7e95b0mr13453763pld.78.1666266799514; 
 Thu, 20 Oct 2022 04:53:19 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 w206-20020a627bd7000000b0056109e15638sm13065464pfc.54.2022.10.20.04.53.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:53:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/31] tcg: Support for Int128 with helpers
Date: Thu, 20 Oct 2022 21:52:11 +1000
Message-Id: <20221020115242.2301066-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is working toward improving atomicity within TCG, especially
with respect to Arm FEAT_LSE2, which guarantees that any operation
that does not cross a 16-byte boundary is treated atomically.

That goal is somewhat down the road.  This patch set contains two
items: paired register allocation and TCGv_i128 usage with helpers.

The next step will be putting these two together to provide atomic
128-bit load/store operations within tcg.  Via, e.g. Arm lse2 ldp,
Power ldq, or S390x lpq -- all of which require allocating a pair
of registers.  (Intel will require that I go through AVX, which is
a bit of a complication, but I'll figure that out.)  And then of
course separately via the helpers used by the slow path.

I have additional patches to target/s390x to test Int128, but that
should be posted separately.  Anyway, this patch set is large enough.


r~


Based-on: 20221017062445.563431-1-richard.henderson@linaro.org
("[PATCH 0/3] tcg/sparc: Remove support for sparc32plus")


Richard Henderson (31):
  tcg: Tidy tcg_reg_alloc_op
  tcg: Introduce paired register allocation
  tcg/s390x: Use register pair allocation for div and mulu2
  tcg/arm: Use register pair allocation for qemu_{ld,st}_i64
  meson: Move CONFIG_TCG_INTERPRETER to config_host
  tcg: Remove TCG_TARGET_STACK_GROWSUP
  accel/tcg: Set cflags_next_tb in cpu_common_initfn
  target/sparc: Avoid TCGV_{LOW,HIGH}
  tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
  tcg: Add temp_subindex to TCGTemp
  tcg: Allocate TCGTemp pairs in host memory order
  tcg: Move TCG_TYPE_COUNT outside enum
  tcg: Introduce tcg_type_size
  tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
  tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
  tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
  tcg: Use TCG_CALL_ARG_EVEN for TCI special case
  tcg: Reorg function calls
  tcg: Move ffi_cif pointer into TCGHelperInfo
  tcg: Add TCGHelperInfo argument to tcg_out_call
  tcg: Define TCG_TYPE_I128 and related helper macros
  tcg: Add TCG_CALL_{RET,ARG}_NORMAL_4
  tcg: Allocate objects contiguously in temp_allocate_frame
  tcg: Introduce tcg_out_addi_ptr
  tcg: Add TCG_CALL_{RET,ARG}_BY_REF
  tcg: Introduce tcg_target_call_oarg_reg
  tcg: Add TCG_CALL_RET_BY_VEC
  include/qemu/int128: Use Int128 structure for TCI
  tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128
  tcg: Add temp allocation for TCGv_i128
  tcg: Add tcg_gen_extr_i128_i64, tcg_gen_concat_i64_i128

 meson.build                      |    4 +-
 include/exec/helper-head.h       |    7 +
 include/qemu/atomic128.h         |   34 +-
 include/qemu/int128.h            |   18 +-
 include/tcg/tcg-op.h             |    3 +
 include/tcg/tcg-opc.h            |    4 +
 include/tcg/tcg.h                |   93 +-
 tcg/aarch64/tcg-target.h         |    6 +-
 tcg/arm/tcg-target-con-set.h     |    7 +-
 tcg/arm/tcg-target-con-str.h     |    2 +
 tcg/arm/tcg-target.h             |    6 +-
 tcg/i386/tcg-target.h            |   12 +
 tcg/loongarch64/tcg-target.h     |    5 +-
 tcg/mips/tcg-target.h            |    6 +-
 tcg/riscv/tcg-target.h           |    5 +-
 tcg/s390x/tcg-target-con-set.h   |    4 +-
 tcg/s390x/tcg-target-con-str.h   |    8 +-
 tcg/s390x/tcg-target.h           |    5 +-
 tcg/sparc64/tcg-target.h         |    5 +-
 tcg/tcg-internal.h               |   72 +-
 tcg/tci/tcg-target.h             |   10 +
 hw/core/cpu-common.c             |    1 +
 target/sparc/translate.c         |   21 +-
 tcg/tcg-op.c                     |   45 +-
 tcg/tcg.c                        | 1753 ++++++++++++++++++++++--------
 util/int128.c                    |   42 +
 tcg/aarch64/tcg-target.c.inc     |   36 +-
 tcg/arm/tcg-target.c.inc         |   67 +-
 tcg/i386/tcg-target.c.inc        |   74 +-
 tcg/loongarch64/tcg-target.c.inc |   24 +-
 tcg/mips/tcg-target.c.inc        |   20 +-
 tcg/ppc/tcg-target.c.inc         |   56 +-
 tcg/riscv/tcg-target.c.inc       |   24 +-
 tcg/s390x/tcg-target.c.inc       |   71 +-
 tcg/sparc64/tcg-target.c.inc     |   22 +-
 tcg/tci/tcg-target.c.inc         |   23 +-
 36 files changed, 1933 insertions(+), 662 deletions(-)

-- 
2.34.1


