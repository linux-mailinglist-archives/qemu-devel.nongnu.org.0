Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6F6986BC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 22:01:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOs9-0001x8-B3; Wed, 15 Feb 2023 15:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOs7-0001wl-72
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:59:23 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pSOs4-0000Oy-Lr
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:59:22 -0500
Received: by mail-oi1-x235.google.com with SMTP id cz14so16983909oib.12
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9nltmotkBbBjqLyBx+7y+omoGJwB9b4FNY91VHcCx2o=;
 b=SvtPEKH22XW+6l+8WTAPQ/F5G5p6zvDKIhsXO8Ss6TzhwJSHaRDhiaMeuD9eId5EPT
 eIKMD1wY4wfz1+ffLqqkdXkOReE17d+6XBz4AGN2GDMgqwuH4XnPBuF5MdzYAqDQmzTu
 rcDGUh+nBdc5O8oWxbNXh2RGxboHtvVcrizHMY8fdknqk9HUQ3yLITP9dV6Wi5CnTKOl
 uowIc6xgSlEWP+77cs5oUr9uEiS/rliXTZykiarqk2H5S+oZ3LEhx+y9cfVugFFCn2+/
 xkFxSftO442UOD+NisLjsVy6tn6SeW1OKfkrNUBPgj8MlC9Cgm+dzltTJ4Mkbw4b/9c9
 BPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9nltmotkBbBjqLyBx+7y+omoGJwB9b4FNY91VHcCx2o=;
 b=6tHiDv2KlVJMS2kTICdZUCjQaiNCCgNFNrCwb0KW0zAC6p3esQPJiDj3/XbPlsB8oe
 m4/BDDZuw7P0yjg18fn9qwdeLT7XIQ70ClfTmxMAlWcaPoh07NMtEjWxLd8fx2dLrbSt
 X3s6qEPjiGjt30kmcPkZwqM3vdX5Sg5pJitJLv+bHeDh4/ZKdxEVXTmX2Askt7PTOR8X
 fvBfTr3h9aazozKA49vKDURMrDW5BWovp5WkkWPLwJbN71wE52RGKaAJX5vY30LGDy5M
 R49ch7kauDW7r6FsQ5Wyrrdi2YgevC+lZbUYlV6//akEFQwSK01nFvhIYK8rAeQ+CzJ4
 QZVw==
X-Gm-Message-State: AO0yUKXrD9ANYV71FlgNfdVo8TEIEL5J6ju8dZCtvx7zsdwjsS8LIJgw
 zQNcwGUJ6yDVdMove5ekUiSnk3yXLSdg3jAo
X-Google-Smtp-Source: AK7set9QAzm5kVFtZB13m80MVFoOq9KQlZGoEChuJ9BWk/9ddp/U206WJanzPDt7tzPGtpsyLf4iMg==
X-Received: by 2002:a05:6808:148f:b0:378:1563:20fc with SMTP id
 e15-20020a056808148f00b00378156320fcmr371933oiw.13.1676494757333; 
 Wed, 15 Feb 2023 12:59:17 -0800 (PST)
Received: from grind.dc1.ventanamicro.com ([191.19.40.109])
 by smtp.gmail.com with ESMTPSA id
 p125-20020acad883000000b003436fa2c23bsm7761563oig.7.2023.02.15.12.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 12:59:16 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 0/4] riscv: Add support for Zicbo[m,z,p] instructions
Date: Wed, 15 Feb 2023 17:59:07 -0300
Message-Id: <20230215205911.695745-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x235.google.com
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

Hi,

This is the v5 of the patch series sent by Christoph Muellner one year
ago [1]. Aside from a code rebase on top of Alistair's
riscv-to-apply.next I also tried to implement the suggestions given in
the reviews.

Patch 1 is unchanged, aside from trivial changes due to code rebasing.
Patch 2 from v4 was split in 3, one CBO extension per patch.

Patch 4 contains the placeholder for the Zicbop prefetch instructions.
Not much to be said.

Patch 2 contains the code for Zicboz. It contains common code that is
used by Zicbom later on, so adding it first makes our lives a bit
easier. Aside from a function rename (helper_zicbo_envcfg is now
check_zicbo_envcfg) and style fixes, the code is unchanged.

Patch 3 contains Zicbom. The function check_zicbom_access (renamed from
helper_zicbom_access) got changed based on review comments and spec
changes in cmobase v1.0.1. We're now not checking for MMU_INST_FETCH
faults since the access for the cache-block is determined only by a load
or a store instruction. If neither of those are permitted, meaning the
access to the cache block isn't permitted, we're raising an appropriate
exception manually. In case we got that far, rely on
probe_access_range_flags() with nonfault=false to get any other faults,
PMP related or not.

This approach allows introducing Zicbom right away since we're not
leaving any exception/faults behind. The alternative, if we would like
to check for PMP faults by hand, is to refactor riscv_cpu_tlb_fill() to
extract the PMP relevant code in a separated helper. Given that cmobase
v1.0.1 does not dictate whether a PMP fault has a higher priority than
the store page faults, and we're not skipping any faults/exceptions, I
don't think this refactor is needed right now.


Changes from v4:
- patch 1: no changes, just a rebase
- former patch 2: split into 3 patches
- patch 2:
  - renamed helper_zicbo_envcfg to check_zicbo_envcfg 
  - added an ISA_EXT_DATA_ENTRY for ext_icboz
- patch 3: 
  - renamed helper_zicbom_access to check_zicbom_access
  - do not check for MMU_INST_FETCH to avoid modelling an unspecified
    behavior
  - manually raise a store fault if load and store is not permitted
  - call probe_access_range_flags() with nonfault = false to catch any
    remaining exceptions
  - add back the "we don't emulate the cache hierarchy so we're done"
    comment in helper_cbo_clean_flush/inval 
v4 link: https://lore.kernel.org/all/20220216154839.1024927-1-cmuellner@linux.com/T/

Previous versions history:

v3: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02382.html
v2: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg04959.html
v1: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg03874.html

[1] https://lore.kernel.org/all/20220216154839.1024927-1-cmuellner@linux.com/T/

Christoph Muellner (4):
  accel/tcg: Add probe_access_range_flags interface
  target/riscv: implement Zicboz extension
  target/riscv: implement Zicbom extension
  target/riscv: add Zicbop cbo.prefetch{i,r,m} placeholder

 accel/tcg/cputlb.c                          |  19 +++
 accel/tcg/user-exec.c                       |  15 +-
 include/exec/exec-all.h                     |  24 +++
 target/riscv/cpu.c                          |   7 +
 target/riscv/cpu.h                          |   4 +
 target/riscv/helper.h                       |   5 +
 target/riscv/insn32.decode                  |  16 +-
 target/riscv/insn_trans/trans_rvzicbo.c.inc |  57 +++++++
 target/riscv/op_helper.c                    | 160 ++++++++++++++++++++
 target/riscv/translate.c                    |   1 +
 10 files changed, 304 insertions(+), 4 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzicbo.c.inc

-- 
2.39.1


