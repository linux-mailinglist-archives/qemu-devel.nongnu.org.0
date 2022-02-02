Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6214A6AC1
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 05:10:25 +0100 (CET)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6yI-0001CJ-Gh
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 23:10:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tL-0000cO-Sm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:53:00 -0500
Received: from [2a00:1450:4864:20::231] (port=45831
 helo=mail-lj1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nF3tI-0003DI-N3
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 19:52:59 -0500
Received: by mail-lj1-x231.google.com with SMTP id t9so26522687lji.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 16:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2BoMvhLTnJEafHl4MHGo5h8JU627Oo0i/1ru96c3ktE=;
 b=pzv+2fnQzs9Rwik8olA+5kmk48ETU3cPlgUlKRdX8skV75zqQaJNY25kEr+bf+7qNN
 TadDnZo2BqakD5cScCtcKHZ1kZ/K/uR+eLX/8Yxg0l48kiQy4F8f8SIt+8pgfVMcJmk4
 5LuAtLeIZI71RGcuhBgMlu0M7g15IfVbhGN+pieMn31WPkQfHG0eddLOo2QYXqmAOhdd
 E7E7xNJVqT3zj2HKiK6a9NNXYqCm7v/Me/GFWWshS8EBoKWPJmb7KATcEDX6u4eeehOQ
 eOc3qvJMzSZ2BdANSN3o0aBuGr0W9BZgW1LYfzayeEZzYS1BfGKK5o3Yv0s7XeWdnpZg
 1HRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2BoMvhLTnJEafHl4MHGo5h8JU627Oo0i/1ru96c3ktE=;
 b=JUsZYhSt+SlU0UEdsgcQvwf14plI4T05ejC0t4LeKnASv+kwbRW96GBseFj2tGoy8x
 /j6KZboQwdh9UGXJeXTzt34B8I9rgfcL4m1icFlQufXNt45OZxy/4mQ+j7I7lrVwWcGg
 poUPLAGoROITQ7Ip1pq8KaQw2fw/8SYO1fonqOtKT0qYJp0TBmQjE/+T2F+f+6xkIsrS
 /fWTb0Nzaf0SwLd9Ir86yn43CCdI0ERQ+3t6+iH0JUrbjLQJgByzBfTVQ3mAFjIpiOzU
 OKqu5K1mpzOdibegdTpg+erRJuE2aYCs8jHOk5z3hKp/c6a9vrFM2uesliCb6zVhpl2V
 sNsA==
X-Gm-Message-State: AOAM53223GNS8U6CAeeWmBEmvHe12dItwDDDFk1K59OlfBLDBtu4qP/T
 Ayk/CqoHKpfrEVNSirX87/jX+XIrM99FynDT
X-Google-Smtp-Source: ABdhPJyKkCYq19DMGYlpeuTpn+l9UIl76PJloCiHU4ENISTWc8Kg+WrW5r9TY1zUf/uEF3/k5LVeqg==
X-Received: by 2002:a2e:8789:: with SMTP id n9mr17898269lji.277.1643763173286; 
 Tue, 01 Feb 2022 16:52:53 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id bt22sm4305297lfb.262.2022.02.01.16.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 16:52:52 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
Date: Wed,  2 Feb 2022 01:52:42 +0100
Message-Id: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::231
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x231.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


In adding our first X-extension (i.e., vendor-defined) on RISC-V with
XVentanaCondOps, we need to add a few instructure improvements to make
it easier to add similar vendor-defined extensions in the future:
- refactor access to the cfg->ext_* fields by making a pointer to the
  cfg structure (as cfg_ptr) available via DisasContext
- add a table-based list of decoders to invoke, each being guarded by
  a guard/predicate-function, that can be used to either add vendor
  extensions, large extensions or override (by listing the decoder
  before the one for standard extensions) patterns to handle errata


Changes in v6:
- add the 'vt' prefix to gen_condmask, renaming it to gen_vt_condmask

Changes in v5:
- use the typedef in DisasContext instead of the nakes struct
  for RISCVCPUConfig
- manually picked up those Reviewed-by tags from Richard that patman
  missed

Changes in v4:
- use a typedef into 'RISCVCPUConfig' (instead of the explicit
  'struct RISCVCPUConfig') to comply with the coding standard
  (as suggested in Richard's review of v3)
- add braces to comply with coding standard (as suggested by Richard)
- merge the two if-statements to reduce clutter after (now that the
  braces have been added)

Changes in v3:
- (new patch) refactor 'struct RISCVCPUConfig'
- (new patch) copy pointer to element cfg into DisasContext
- (new patch) test extension-availability through cfg_ptr in
  DisasContext, removing the fields that have been copied into
  DisasContext directly
- (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
  into DisasContext) instead of going throuhg RISCV_CPU
- expose only the DisasContext* to predicate functions
- mark the table of decoder functions as static
- drop the inline from always_true_p, until the need arises (i.e.,
  someone finds a use for it and calls it directly)
- rewrite to drop the 'handled' temporary in iterating over the
  decoder table, removing the assignment in the condition of the if
- rename to trans_xventanacondops.c.inc (i.e. with the '.c')
- (in MATERIALISE_EXT_PREDICATE) don't annotate the predicate function
  for testing the availability of individual extensions as 'inline'
  and don't make CPURISCVState* visible to these predicate functions
- add a MAINTAINERS entry for XVentanaCondOps

Changes in v2:
- (new patch) iterate over a table of guarded decoder functions
- Split off decode table into XVentanaCondOps.decode
- Wire up XVentanaCondOps in the decoder-table

Philipp Tomsich (7):
  target/riscv: refactor (anonymous struct) RISCVCPU.cfg into 'struct
    RISCVCPUConfig'
  target/riscv: riscv_tr_init_disas_context: copy pointer-to-cfg into
    cfg_ptr
  target/riscv: access configuration through cfg_ptr in DisasContext
  target/riscv: access cfg structure through DisasContext
  target/riscv: iterate over a table of decoders
  target/riscv: Add XVentanaCondOps custom extension
  target/riscv: add a MAINTAINERS entry for XVentanaCondOps

 MAINTAINERS                                   |   7 ++
 target/riscv/XVentanaCondOps.decode           |  25 +++++
 target/riscv/cpu.c                            |   3 +
 target/riscv/cpu.h                            |  81 +++++++-------
 target/riscv/insn_trans/trans_rvb.c.inc       |   8 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc       | 104 +++++++++---------
 target/riscv/insn_trans/trans_rvzfh.c.inc     |   4 +-
 .../insn_trans/trans_xventanacondops.c.inc    |  39 +++++++
 target/riscv/meson.build                      |   1 +
 target/riscv/translate.c                      |  60 ++++++----
 11 files changed, 219 insertions(+), 115 deletions(-)
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

-- 
2.33.1


