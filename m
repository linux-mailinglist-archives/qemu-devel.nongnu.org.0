Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D622949FCCD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:29:14 +0100 (CET)
Received: from localhost ([::1]:56150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTBZ-0007dJ-G9
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:29:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgF-0008Ut-GM
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:51 -0500
Received: from [2a00:1450:4864:20::22d] (port=43609
 helo=mail-lj1-x22d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nDSgD-0000uK-Al
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 09:56:51 -0500
Received: by mail-lj1-x22d.google.com with SMTP id t7so9342504ljc.10
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WknLWefck3HCDavwSU0bZ6BGcdDTEHpHlJ0uNgkRTD0=;
 b=SkCbo7H5zgcKlv+vnqNu7/3otD0hDcvnMGCZie3NA/e4pKuWMxnGr14M8ATyoO27Vl
 u/JawwQpN2MfNpOAPHWBqQ1f0YQw6t6fRsRRMQMlu+McrOneYzFjA5fSwFj4/HknFsmC
 2b484D0LlFAmpfuaT61QmN2UKu+2wsdevLpg6njW68svBIYysfyvOwJ0mjOSWQSp3nRT
 LDYEIwSMVNnSl4jJC3B4w+jTnSHsyPsChavjX6h3TTBV/AoCbhsW6IAPvtuz7G9ha2ns
 0hN0YXoVcLDNA2ybecPn0/IKNrB42JU1J6rY1f+9i8D1ieuZjiKKLryD+HruDFP+BoH3
 JpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WknLWefck3HCDavwSU0bZ6BGcdDTEHpHlJ0uNgkRTD0=;
 b=F16thpgRflQjuTCm45CZs9YTGiDZe9YzIpFPYeCpZQL+Zg/lZmA1pkr6IQR8hm7PfL
 ARQmwmPXb5LvTm8JVuW6wFC+cwgvVVDH2SamO/aJ3bqxVVcHytM2Q1uLFKTdg7TvNVlx
 T6/6//QA+gtQzsGwym9wssUxF0c/rE90aBusGvE28xqi0DwYCSTAWdzW7hii2bEJFjn4
 X96JFG8Sg6AbOLyBGPSUJOfIfWhgiQLVfqXxn0VVp87fbVQMxb6wm4D7IRr7pS5izFCN
 KEjzp5Hz/0bWa0p+4Xsl7AzMLHyYZzl1sUM2KxLa4w6Q6SnPEZ/HzbVnpKK3JI2QvjTP
 OFRA==
X-Gm-Message-State: AOAM530lOuaJ/sYPr3gn4DruXuyifNk01gxaE9Kbtrhju1sdnRsfRDd1
 VWHFeuqNXyi4xIo+4z0QDMDmX60/aSpaRsPD
X-Google-Smtp-Source: ABdhPJynibbBt7fHGyBDKc9E7gDsENM/Au/bjG57+ZDOxY5JV/ByaYk/ISNlpihDsh3XgZASUKX3QQ==
X-Received: by 2002:a2e:9084:: with SMTP id l4mr6048179ljg.123.1643381805559; 
 Fri, 28 Jan 2022 06:56:45 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id b20sm1031234lfb.51.2022.01.28.06.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 06:56:45 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
Date: Fri, 28 Jan 2022 15:56:35 +0100
Message-Id: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22d.google.com
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
 Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
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
 target/riscv/cpu.h                            |  79 ++++++-------
 target/riscv/insn_trans/trans_rvb.c.inc       |   8 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |   2 +-
 target/riscv/insn_trans/trans_rvv.c.inc       | 104 +++++++++---------
 target/riscv/insn_trans/trans_rvzfh.c.inc     |   4 +-
 .../insn_trans/trans_xventanacondops.c.inc    |  39 +++++++
 target/riscv/meson.build                      |   1 +
 target/riscv/translate.c                      |  62 +++++++----
 11 files changed, 218 insertions(+), 116 deletions(-)
 create mode 100644 target/riscv/XVentanaCondOps.decode
 create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc

-- 
2.33.1


