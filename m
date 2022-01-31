Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD554A42DD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 12:15:45 +0100 (CET)
Received: from localhost ([::1]:52894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEUeu-0001Zo-A4
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 06:15:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURo-0001tU-7q
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:12 -0500
Received: from [2a00:1450:4864:20::12f] (port=45869
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nEURk-00041f-Dt
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 06:02:11 -0500
Received: by mail-lf1-x12f.google.com with SMTP id o12so25964068lfg.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 03:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70mo9S1M1ulC969I9gEpfekUnbqJKBu2WQIgciURoIo=;
 b=MtR6ahRK+RrBM8Hlug1w9Xwst9o+ttFLibcxcpmmdxMko6l8iT+KEtUBCkppHeZ3X4
 o29UzHjdcoMLmPPtmGfQ2zG1a57E/WG531ONx3+w0RznQlYOktusElSpyWU95HnnKjb6
 c4VIkTaz+K5VKNUUiNqzCP0aMzr2QLLnBoVEfzM6Ui8rXhvyibYfJrDdijnoArPkTjFw
 XWyig0RkgkQL+4W/wKIvEyDMT5IgL/OCoMkRtfBG/5p9vHfhhrlVkEVWTVIOKlQdrKr4
 L55pZr0+IbUc24ge+lDGVgBfedMhOMoB04lD7h3ZSTngN1FKc7PRBD4aVeIcSEol+Lao
 Nemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=70mo9S1M1ulC969I9gEpfekUnbqJKBu2WQIgciURoIo=;
 b=xZSdjr/qyYkIvksWxv4wzzKamEu4lndmARtgYQYPZ4Qz+XhZ7EcoQgH8giFYKtjtmc
 DAAqInI9ptvdOGjYduIOn8XjmGFq3E5/1Oz+DJJ9Hh+EfRmKjH0ny0GG2m1BLm/RU8f3
 mcLqp8jlfuev1GF5iJsEVJOwznTYsyMKWOWcPF3G3BlWHJ+qui/GhNFIhB8hxXfrBhN2
 szj3Q45BKy3+nHHI16k3seQk8Jq1OygNCROY4k4Yy68SFoa7vvBkEfyk5V4v1VLC3dbq
 Mm8KwCJLtQ4ktQG3vTRSnHChaN689aZX7afBaqT3QCgLeUXQtSA2tT9CjrivKvsL4SjB
 42lw==
X-Gm-Message-State: AOAM532pP0hxuh93xA3Wc4/WeAjN8uddIwKOPAZeEnx5XfhqEasm7XSD
 gOmPLvYdbsqOnmv/MUs63udWgVp3yyiTJQJ4
X-Google-Smtp-Source: ABdhPJx4ckqtL0eUodxfD2Yo5noxcayBEIa1/C61OikfCk2qS9f5SjKJjBgvauvf/w93z7yXFHdkcQ==
X-Received: by 2002:ac2:4c52:: with SMTP id o18mr14932271lfk.102.1643626925147; 
 Mon, 31 Jan 2022 03:02:05 -0800 (PST)
Received: from ubuntu-focal.. ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u22sm1952759lfl.26.2022.01.31.03.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 03:02:04 -0800 (PST)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
Date: Mon, 31 Jan 2022 12:01:54 +0100
Message-Id: <20220131110201.2303275-1-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12f.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Greg Favor <gfavor@ventanamicro.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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


Changes in v5:
- use the typedef in DisasContext instead of the naked struct
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


