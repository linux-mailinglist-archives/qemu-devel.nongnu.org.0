Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAA655367
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 19:01:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8mLX-000805-Rj; Fri, 23 Dec 2022 13:00:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLJ-0007yk-3f
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:26 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christoph.muellner@vrull.eu>)
 id 1p8mLG-0003F5-TJ
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 13:00:24 -0500
Received: by mail-ed1-x534.google.com with SMTP id i15so8040835edf.2
 for <qemu-devel@nongnu.org>; Fri, 23 Dec 2022 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uzkLgP/DtF9RnyaYNIZ+UYApZnmXp812jOFPd8iyDiY=;
 b=k7RN8mIkLWAAFNvPKTz8bqLe19ntvwdSuL+7p5Nu3YEAIy+CvUDRzA3Ld/ql9i9Nlx
 gr6SA3B/IP47wD7nRWM8ZMdgxQNPT83npj16se0eQeooZqSxm42C9NDS1aj4KSSTBGHg
 Y2UBoSJRPiuq8zybyF+n3L888zGZID7pvnuRiZvJgal9QIS9Mw7yi4W3XWjT7L/hclxO
 Msw78u8XatDsmqwIXQ0IoMb6uAettVYSnH/b+fCPhorG7zIUotWND//edh0el9LR8hfK
 cBNb8uf6SNZepVi64XDchvppkZyphLw3cW554fuz5Nq9BEqEX4fucQRM1C+S6oGPbSv+
 6Aeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uzkLgP/DtF9RnyaYNIZ+UYApZnmXp812jOFPd8iyDiY=;
 b=XgwUarRF3oQd+ljSBdlS87SaDyqbvxc+z8pjAcjEigSdxWbO4V4+SacyCz9PurviqO
 hwyrHpC4k2wjn99P2jJWmq0dRZ8zdXijvIGtgtICd9G9khjRz9fSjiu9n3ThfO6m3bSK
 PB1/2MmkBIkZwPU23IByWYFUrVVBmqp5oYaOS8dUW8MUSbrta4e/lSEPza80FdsuidlA
 KsXAD0FSbrl+thc2ZYDiBtWyVzCNaNmrKt2yElC/MPkyFIdWH36Ey29RMM7lzyigk2rK
 TlKw/gdAxckd7B2J6fg4i8YWiuJY2x2mcZ+LAHH8DSVSbI9mYSe12c7Zo/eXSY/AOFag
 1jrA==
X-Gm-Message-State: AFqh2krXj/icKSSqOIbLvbsnGY+j3BLngqPGvuKxF3HlOhNrlydA4ARC
 MTc8elADEmiROD81ER3ez56oNg==
X-Google-Smtp-Source: AMrXdXvQqMnSZHalWxI5nYuvb3IzgLv5vzzlmRuxkWgEcj6VFGYShzTr5gmjGi9OcMfQxbckS+PthQ==
X-Received: by 2002:a50:ff0f:0:b0:47f:5c62:310f with SMTP id
 a15-20020a50ff0f000000b0047f5c62310fmr4932321edu.35.1671818419964; 
 Fri, 23 Dec 2022 10:00:19 -0800 (PST)
Received: from beast.fritz.box (62-178-148-172.cable.dynamic.surfer.at.
 [62.178.148.172]) by smtp.gmail.com with ESMTPSA id
 p14-20020a056402154e00b0047d4685878esm1734937edx.51.2022.12.23.10.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Dec 2022 10:00:19 -0800 (PST)
From: Christoph Muellner <christoph.muellner@vrull.eu>
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nelson Chu <nelson@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 Cooper Qu <cooper.qu@linux.alibaba.com>,
 Lifang Xia <lifang_xia@linux.alibaba.com>,
 Yunhai Shang <yunhai@linux.alibaba.com>,
 Zhiwei Liu <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>
Subject: [PATCH v2 00/15] Add support for the T-Head vendor extensions
Date: Fri, 23 Dec 2022 19:00:00 +0100
Message-Id: <20221223180016.2068508-1-christoph.muellner@vrull.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=christoph.muellner@vrull.eu; helo=mail-ed1-x534.google.com
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

From: Christoph Müllner <christoph.muellner@vrull.eu>

This series introduces support for the T-Head vendor extensions,
which are implemented e.g. in the XuanTie C906 and XuanTie C910:
* XTheadBa
* XTheadBb
* XTheadBs
* XTheadCmo
* XTheadCondMov
* XTheadFMemIdx
* XTheadFmv
* XTheadMac
* XTheadMemIdx
* XTheadMemPair
* XTheadSync

The xthead* extensions are documented here:
  https://github.com/T-head-Semi/thead-extension-spec/releases/latest

The "th." instruction prefix prevents future conflicts with standard
extensions and has been documentented in the RISC-V toolchain conventions:
  https://github.com/riscv-non-isa/riscv-toolchain-conventions

Note, that the T-Head vendor extensions do not contain all
vendor-specific functionality of the T-Head SoCs
(e.g. no vendor-specific CSRs are included).
Instead the extensions cover coherent functionality,
that is exposed to S and U mode.

To enable the extensions above, the following two methods are possible:
* add the extension to the arch string
  E.g. QEMU_CPU="any,xtheadcmo=true,xtheadsync=true"
* implicitly select the extensions via CPU selection
  E.g. QEMU_CPU="thead-c906"

Major changes in v2:
- Add ISA_EXT_DATA_ENTRY()s
- Use single decoder for XThead extensions
- Simplify a lot of translation functions
- Fix RV32 behaviour
- Added XTheadFmv
- Addressed all comments of v1

Christoph Müllner (15):
  RISC-V: Adding XTheadCmo ISA extension
  RISC-V: Adding XTheadSync ISA extension
  RISC-V: Adding XTheadBa ISA extension
  RISC-V: Adding XTheadBb ISA extension
  RISC-V: Adding XTheadBs ISA extension
  RISC-V: Adding XTheadCondMov ISA extension
  RISC-V: Adding T-Head multiply-accumulate instructions
  RISC-V: Adding T-Head MemPair extension
  RISC-V: Adding T-Head MemIdx extension
  RISC-V: Adding T-Head FMemIdx extension
  RISC-V: Adding T-Head XMAE support
  RISC-V: Set minimum priv version for Zfh to 1.11
  RISC-V: Add initial support for T-Head C906
  RISC-V: Adding XTheadFmv ISA extension
  target/riscv: add a MAINTAINERS entry for XThead* extension support

 MAINTAINERS                                |    8 +
 target/riscv/cpu.c                         |   57 +-
 target/riscv/cpu.h                         |   14 +
 target/riscv/cpu_helper.c                  |    6 +-
 target/riscv/cpu_vendorid.h                |    6 +
 target/riscv/helper.h                      |    1 +
 target/riscv/insn_trans/trans_xthead.c.inc | 1089 ++++++++++++++++++++
 target/riscv/meson.build                   |    1 +
 target/riscv/op_helper.c                   |    6 +
 target/riscv/translate.c                   |   38 +-
 target/riscv/xthead.decode                 |  185 ++++
 11 files changed, 1405 insertions(+), 6 deletions(-)
 create mode 100644 target/riscv/cpu_vendorid.h
 create mode 100644 target/riscv/insn_trans/trans_xthead.c.inc
 create mode 100644 target/riscv/xthead.decode

-- 
2.38.1


