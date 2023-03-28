Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1E6CC964
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 19:36:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phDEj-00085f-R7; Tue, 28 Mar 2023 13:35:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEh-00085A-VI
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:35:55 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1phDEg-0005I9-1i
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 13:35:55 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 cm7-20020a056830650700b006a11f365d13so5477124otb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 10:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1680024952;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=izKMd87bELByZfMFAUYo/bTqKJuGML3PEhempsXy+M0=;
 b=jY74xvnDc+Ivyge9mCvXbvoXciPTQ+oQboiWpa6OxtUoIZNIjcgFPxomn1PVCtsLZV
 u6aW0jTaMc3LolcOqT8hzWsOJSS4Sl5fPOZDbYBVL/6upjlE/kECETq//j+kFZizIESp
 rziQJB+EOVT2Vt6GQ6zfMZtAYapDB1sXJCEyuHyVc/z//p+aCSq9/KjPV/CGDEL0Qc+a
 gKj+9A/bZ3B9PsiLugvc4F5CqAHk9WeaNC4CZUbQn10a7vbffY3+sYeWxZ69z1xHOH3v
 50xKS+vyQrlaCAYhfOiwSHS5cMDs9Zy0aYeLlZcoLyYbgQEFMolumisuZWFkFcleEsaF
 f2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024952;
 h=content-transfer-encoding:based-on:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izKMd87bELByZfMFAUYo/bTqKJuGML3PEhempsXy+M0=;
 b=5EvIhn2UNCcfxCaQTNlNoPVb9rOgAW3zbcd8MHeq4ZyY6hBNxQs9s96ElzvdHjGzHW
 s9Z5sn8v0/58JtQ2e9RPUhIuZJsKaUBFtkwUx7s/Lu6TL19HClc931mT8uvFUVacqRW2
 zRnppHzT4iLmH9HlGQNZN1PG86NAwMM4wKv/Vxt/Yo7iyjYYQKHtBaKcrtgd6Xgeuu61
 DQo8pb2VAkCuaBc++Nela5jsCzM3SBazCLswZ0GjQH2BGJnU6czVtIFhS3eaui/gIdzl
 jFUTEG4h3VqVLdtn05eSjVghYpLAJTp4zJhLnI4MXZeYq0zdX7DyQnXwYYplZSAcCAOI
 DHgg==
X-Gm-Message-State: AAQBX9edlSTq4L+wPz25HSA0MTqRbnrompyQ2q5KX5jxQ8WxNUFqGv8R
 liCpejJx9c72WcPpW+wShCaUlAl+bo8u5ayrJsE=
X-Google-Smtp-Source: AKy350Zo0xT04RIgmcC69pmAmO0EDfgkZwTU9PMMWJgQgwnfpNKMQHHIOK4ZhgbkLt+5o6LZ7/NTuA==
X-Received: by 2002:a9d:7d13:0:b0:69a:c5d8:1e4a with SMTP id
 v19-20020a9d7d13000000b0069ac5d81e4amr9184041otn.16.1680024952234; 
 Tue, 28 Mar 2023 10:35:52 -0700 (PDT)
Received: from grind.. ([177.95.89.231]) by smtp.gmail.com with ESMTPSA id
 m2-20020a9d6442000000b0069f0a85fa36sm11635654otl.57.2023.03.28.10.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 10:35:51 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v5 0/9] target/riscv: rework CPU extensions validation
Date: Tue, 28 Mar 2023 14:35:34 -0300
Message-Id: <20230328173543.431342-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Based-on: 20230327224934.363314-1-dbarboza@ventanamicro.com
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This v5 is based on top of:

"[PATCH v2 00/19] remove MISA ext_N flags from cpu->cfg"

We went from 25 patches to 9 because we no longer need to mirror changes
from env->misa_ext to cpu->cfg.ext_N back and forth. A lot of patches
got cut because of it.

write_misa() now uses the validate function as is, without the need to
changing it to use an 'ext' value. Rolling back env->misa_ext on
validation failure is trivial enough to not justify the extra effort of
making the validate functions use an 'ext' var. 

I also decided to dropped the patches that were splitting MISA
validation from the regular validation. A small change was done in
riscv_cpu_validate_set_extensions() to prevent it from writing
env->misa_ext_mask during write_misa(). Fragmenting the validation at
this point would just make us call 2 validate functions instead of just
one, without any tangible benefits. 

Another notable change is that we're not handling RVE and RVG in
separate. The only special handling done is when disabling extensions
that disables RVG.


Patches missing acks: patch 9. 


Changes from v4:
- the following patches were dropped:
  - target/riscv: move pmp and epmp validations to validate_set_extensions()
  - target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
  - target/riscv/cpu.c: set cpu config in set_misa()
  - target/riscv/cpu.c: redesign register_cpu_props()
  - target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
  - target/riscv: add RVG
  - target/riscv/cpu.c: split RVG code from validate_set_extensions()
  - target/riscv/cpu.c: add riscv_cpu_validate_misa_ext()
  - target/riscv: move riscv_cpu_validate_v() to validate_misa_ext()
  - target/riscv: error out on priv failure for RVH
  - target/riscv: write env->misa_ext* in register_generic_cpu_props()
  - target/riscv: make validate_misa_ext() use a misa_ext val
  - target/riscv: split riscv_cpu_validate_set_extensions()
  - target/riscv: use misa_ext val in riscv_cpu_validate_extensions()
  - target/riscv: update cpu->cfg misa bits in commit_cpu_cfg()
  - target/riscv: handle RVG updates in write_misa()
- patch 9:
  - use riscv_cpu_validate_set_extensions() directly
  - do not handle RVE and RVG separately
  - handle RVG disable if any of its dependencies are disabled
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg05785.html

Daniel Henrique Barboza (9):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv: rework write_misa()

 target/riscv/cpu.c | 331 +++++++++++++++++++++++++++------------------
 target/riscv/cpu.h |   3 +
 target/riscv/csr.c |  47 +++----
 3 files changed, 222 insertions(+), 159 deletions(-)

-- 
2.39.2


