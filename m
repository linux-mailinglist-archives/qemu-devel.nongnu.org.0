Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 253904A3C0A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 01:02:18 +0100 (CET)
Received: from localhost ([::1]:52084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEK9B-0008JU-75
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 19:02:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK5A-0005aj-2c
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:11 -0500
Received: from [2a00:1450:4864:20::135] (port=43908
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEK58-0006tK-4h
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 18:58:07 -0500
Received: by mail-lf1-x135.google.com with SMTP id u6so23317870lfm.10
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 15:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5wnr8mD2vNwUdg90xSeiB0q6AxRI18Y+T5FZ9k3ShN4=;
 b=YrDiQmbGUZntB9sKuTRjMOQ8acdIzZwxN5QRiFoeU/tkNlZ/YYLbnEBQn4n3Nhairo
 U74jsz4vmkbPxdlpcK0C9CEioOs0rZG7p6gcPnMfTU2M3XTcnnVjoxUlFeLx5FcLzgeW
 j093YMX9FAwaHLx+a2EOaQnVXuqA/e2WAOOaIREhYy/8v3Pc+zK7RObZOu91J6eC9yI9
 3NUoPRAQC0KTBEHsViSwzGBK8ZfvLYSp6/EoTcvsCf/IcMilGkY99I3rSvdd3MukxSTW
 lpC16acmq4K73f/pVbSoTNyf0kP/yJz46hD5pqibxS+Bf2+rRuD8kTeJkbTqZvH06qV/
 /cNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5wnr8mD2vNwUdg90xSeiB0q6AxRI18Y+T5FZ9k3ShN4=;
 b=AHi/Sz3BnF3NgtBvaXaVio42V+amLJ+rw32U2ZIA8SzJXOaWiMnCZ8IeuNxYVbgi2F
 tJE4KyXV7e0T9CdSlkVN4ivjXPAGgBxw2kLNU8PubLXDwulIVw0dSTebn39chXIZnHYV
 DTtL12LisXrd4h6YjnE12tmgHp3g1Irfg9FmCjj3L/XL1uBo1Puh54mVtVlOwZkhxKfl
 BNnoB92LIeKv5tefE7Y/1su7lKlSpo9uUgpv+rD5LvDmPh1vFr3v+1oLUzoxPIXyIlhJ
 R973q8GGAUDP5IZ0cnw2K7R0I/C6GFful/QpdXhbVP0e7anwnGfBRWgCNZrK/hdBpDqD
 U+ow==
X-Gm-Message-State: AOAM530N9Lq/Ida2DMVpj8wOzZxyt+rPy/Q9lBOI11slmMIkzIdvG1c2
 aqUER9EobLZbtMNCWfY4v1JAvkSkTP/ISjeN
X-Google-Smtp-Source: ABdhPJy6XNLFvY3FPvupme7kvqQfHvGyvJWO4lKq0e4iZUmg1JjHRzsyGVzQ72kZRdptyvdgy94trg==
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr13663192lfs.90.1643587082719; 
 Sun, 30 Jan 2022 15:58:02 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id 8sm2132159lfq.200.2022.01.30.15.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:58:02 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
Date: Mon, 31 Jan 2022 00:57:52 +0100
Message-Id: <20220130235759.1378871-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x135.google.com
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


