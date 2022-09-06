Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4C5AE4C5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:51:21 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVEm-0003yU-6Z
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:51:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcH-0007U1-9s
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcF-0002eO-B0
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:32 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so9162883wme.1
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=1Q+AAxSY6vLDBEmZV0jZhoFnJR53nnlesokQMLG1TEQ=;
 b=YimaFsDfTkohtShceturtaMk/Pr8JYjjlm/XnIwc/BhQrAt9H+AaAAekaJYVMmPj1m
 IVDP53SZTqufSCq22I8XVWv9TtLGWuMOri0A6dGf3+yWbpupAfHs/c+zT7SxklzjAjf8
 CrWNHIVfm/WpX/lIcbl8RFZEB+Fd6RBbodIdsxs2rvS0FrbLnbgtWfJIgEZP0/IR1EqA
 5029OPHy8MzfWr7kb5By0ewbJqvSTzXOQf8dzW6N1KBOLrQLxAnltOSBYVcqiTcp29pS
 Xxupnx05zjR5AMrstBCjzRouaetZsnLkJjjaixmhXBQr1fu6bv0FBVSPlaAFpPttNlHY
 2ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=1Q+AAxSY6vLDBEmZV0jZhoFnJR53nnlesokQMLG1TEQ=;
 b=kjd33HBPigAWTECuByOoLdGvtu2HZJ8RrdXQGmzlItwks6eimCz3+K7bSZOjrZlQ9j
 otTLgk1mAyhxxW+y6eT7j0nZNErHKYXbUue/nWnl7dJcRfWos3kzqoMfjFMjuGwXCBZR
 FTyVEG0jMzoxT+F6WdTxDiKD+QYJ7YDjP1CaeN5kLxOlT3ruTkBX/9m9+mOo3RdQfMbo
 cXghsbKmm9R6YAsADiCrWR7b9iLxq734EsgD3Ccu700jcOswcYfkVxI9ZKGeczBaRclO
 26SxiNBDV7rsJkxnv+Tkdl+M2FGIWy0PWSLqyFWOil7DHF6aMRtofz8BgrFCjFO4dk6T
 6SbQ==
X-Gm-Message-State: ACgBeo3B7hPt4fTD7D8IBsA3O/wlgfAA6tWv8bgIT4uvBii5A07hgT2F
 wxmHnmhPSf/vZHOiASJC1Djl//zKR2q0pUGi
X-Google-Smtp-Source: AA6agR7JlZd1ELbc4n+hP+s3S6a02uQdmgCs3NFQjU4iFzPaLyA0zRDYcr4F2xJfFKwXXQ1t7lZPhA==
X-Received: by 2002:a05:600c:34d3:b0:3a5:fea5:1be8 with SMTP id
 d19-20020a05600c34d300b003a5fea51be8mr12871006wmq.106.1662455489518; 
 Tue, 06 Sep 2022 02:11:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20094193wmm.33.2022.09.06.02.11.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:11:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] tcg: pc-relative translation blocks
Date: Tue,  6 Sep 2022 10:11:19 +0100
Message-Id: <20220906091126.298041-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The goal here is to reduce the amount of code generation when the
guest kernel enables address space randomization.  This requires
extensive changes to each target, so opt-in with TARGET_TB_PCREL.

This is split out of v3, which also contained target/arm changes,
as I now have patches for x86 and s390x as well.


r~


Based-on: 20220905202259.189852-1-richard.henderson@linaro.org
("[PATCH v3 0/6] tcg: Introduce CPUTLBEntryFull")

v2: https://lore.kernel.org/qemu-devel/20220816203400.161187-1-richard.henderson@linaro.org/
v3: https://lore.kernel.org/qemu-devel/20220822232338.1727934-1-richard.henderson@linaro.org/

branch: https://gitlab.com/rth7680/qemu/-/tree/tcg-pcrel


Richard Henderson (7):
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  include/hw/core: Create struct CPUJumpCache
  accel/tcg: Introduce tb_pc and tb_pc_log
  accel/tcg: Introduce TARGET_TB_PCREL
  accel/tcg: Split log_cpu_exec into inline and slow path

 include/exec/cpu-defs.h                 |   3 +
 include/exec/exec-all.h                 |  51 ++++++++++-
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |   9 +-
 accel/tcg/cpu-exec.c                    | 108 ++++++++++++++++--------
 accel/tcg/cputlb.c                      |   5 +-
 accel/tcg/plugin-gen.c                  |  22 ++---
 accel/tcg/translate-all.c               |  90 ++++++++++++--------
 accel/tcg/translator.c                  |   2 +-
 target/arm/cpu.c                        |   4 +-
 target/avr/cpu.c                        |   2 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hppa/cpu.c                       |   4 +-
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |   2 +-
 target/microblaze/cpu.c                 |   2 +-
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/openrisc/cpu.c                   |   2 +-
 target/riscv/cpu.c                      |   4 +-
 target/rx/cpu.c                         |   2 +-
 target/sh4/cpu.c                        |   4 +-
 target/sparc/cpu.c                      |   2 +-
 target/tricore/cpu.c                    |   2 +-
 tcg/tcg.c                               |   6 +-
 25 files changed, 226 insertions(+), 115 deletions(-)

-- 
2.34.1


