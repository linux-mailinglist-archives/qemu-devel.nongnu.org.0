Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE716B9C32
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 17:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc7qa-0005Im-7c; Tue, 14 Mar 2023 12:50:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qY-0005IE-0L
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:49:58 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pc7qW-0002bQ-2M
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 12:49:57 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 w21-20020a9d6755000000b00698853a52c7so767939otm.11
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 09:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1678812594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lv1P8RRF2d6TniGaBD/uvpiJ6BHnH7ePzeDrnHmMyKE=;
 b=TKftU8jIssIgfOz8CX+M3DaRSk+xR3lgPmr6NYQMN061c+qh3GhM904VyG3hKZ7rmO
 hOxEvjlP5sRuFGWlzU2uIQAmajsLsHvmxO45pXFWfnbVOfTWwWPfmregMUzUbeyRiMtI
 08m4N/AHRAmTqpUnSW2UuY0pWziqfbv7NbuzrIAI1iXxXvtWk1Gq0aoomc2QJB8JsBqZ
 zEcTq6QfLRIksMn4sB0kTPuHW2MTE7hCrJ3vrfMzlMuEQWWvij4l56Rgtz8pqLvQnrzz
 8r7F15H4ZtWOulzWImzuaWnG7dqBWKXQcC1Kmn9mXuUW06fVGhBSEfKGGxwLctEfnOGo
 VVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678812594;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lv1P8RRF2d6TniGaBD/uvpiJ6BHnH7ePzeDrnHmMyKE=;
 b=BhZP4WjbrUJf48GE9GGJsXgHU149+brHAmxa2OLq7IunNDelUvUwK4585JFEuO6Oir
 q/WzzJohnDKtvL5cu7D2Hveza9iueoNQHSA/ULcXF5fDEOs8zFt9GZOVWB1hfeFPxJRl
 M/qCZXt8IEFql10e9BzVStJMZIk/IZ+sX9JyWB0y6RMXP2B60FM4TpNi7hcQuA9ws20o
 ZhCsfKVZVYkyBHYhIx0M8Ru0l1WrLk2ZAck8vYBC02q6WY2vkEjdmgzBFKyj6Pqozhvd
 TfdGuEzLcpUvF4f4c2jGHYTwDpJPVlO8CgOb5xxHTtpqFOwaBnkR4PDiHjRTWEpLSq13
 sObg==
X-Gm-Message-State: AO0yUKXoM1h489rHCwWy3Ip1qVy6o9AYhvtPegYMu2d0AJxAx0wA3t4q
 CU8FGn5VQHZFvfwkCWxtInHO1DoeOf5u4GW4QQo=
X-Google-Smtp-Source: AK7set8YGsZhzd1GZeja0y4zwOSvfBTQrRUxsalZ+xi8YbU+NBhos2AcEucDMiqINEi9cGSIinbQng==
X-Received: by 2002:a05:6830:3112:b0:690:d5bd:7a45 with SMTP id
 b18-20020a056830311200b00690d5bd7a45mr24891665ots.9.1678812594045; 
 Tue, 14 Mar 2023 09:49:54 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([177.95.89.231])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d04e9000000b0069451a9274bsm348689otm.28.2023.03.14.09.49.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 09:49:53 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com, palmer@rivosinc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH for-8.1 v2 00/26] target/riscv: rework CPU extensions
 validation
Date: Tue, 14 Mar 2023 13:49:22 -0300
Message-Id: <20230314164948.539135-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x331.google.com
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

Hello,

In this v2 the most notable changes were done after Liu Zhiwei review in
[1], in particular the comments made in patch 17. To allow for
write_misa() validation, without the need to store and restore cpu->cfg
state, more design changes were required in the existing validation
logic.

The validation code was split in three stages: validate misa_ext,
validate cpu config and commit cpu config. riscv_cpu_validate_misa_ext()
handles all validations related exclusively to env->misa_ext bits.
riscv_cpu_validate_extensions() does the remaining validations with the
named extensions we have. riscv_cpu_commit_cpu_cfg() is the last step,
only executed after all the previous validations were ok.

All validations are done using a tentative misa_ext val, instead of
env->misa_ext or cpu->cfg.ext_N props. write_misa() is then able to
validate a misa_ext without having to change cpu->cfg needlesly. 

Another change is that now we're forcing a sync between env->misa_ext
and cpu->cfg. This was needed to allow for the validation split
mentioned above. It'll also give more consistency throughout the code,
granting that we're always getting the same information whether we're
using cpu->cfg or an API such as riscv_has_ext().

All other premises from v1 are kept. All code changes suggested in v1
were implemented.

Patches are based on Alistair's riscv-to-apply.next.


Changes from v1:
- patch 14 ("target/riscv/cpu.c: do not allow RVE to be set"): dropped 
- patch 4:
  - PRIV_VERSION_LATEST is now an enum value instead of a macro
- patch 5:
  - merged env->priv_ver cond assignment to the previous if clause
- a handful of patches added to allow for validate_set_extensions() to
  be split in three functions
- validation in write_misa() does not require commit changes to cpu->cfg
  beforehand
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03219.html

[1] https://lists.gnu.org/archive/html/qemu-devel/2023-03/msg03219.html

Daniel Henrique Barboza (26):
  target/riscv/cpu.c: add riscv_cpu_validate_v()
  target/riscv/cpu.c: remove set_vext_version()
  target/riscv/cpu.c: remove set_priv_version()
  target/riscv: add PRIV_VERSION_LATEST
  target/riscv/cpu.c: add priv_spec validate/disable_exts helpers
  target/riscv/cpu.c: add riscv_cpu_validate_misa_mxl()
  target/riscv: move pmp and epmp validations to
    validate_set_extensions()
  target/riscv/cpu.c: validate extensions before riscv_timer_init()
  target/riscv/cpu.c: remove cfg setup from riscv_cpu_init()
  target/riscv/cpu.c: avoid set_misa() in validate_set_extensions()
  target/riscv/cpu.c: set cpu config in set_misa()
  target/riscv/cpu.c: redesign register_cpu_props()
  target/riscv: put env->misa_ext <-> cpu->cfg code into helpers
  target/riscv: add RVG
  target/riscv: do not allow RVG in write_misa()
  target/riscv/cpu.c: split RVG code from validate_set_extensions()
  target/riscv: write env->misa_ext* in register_generic_cpu_props()
  target/risc/cpu.c: add riscv_cpu_validate_misa_ext()
  target/riscv/cpu:c add misa_ext V-> D & F dependency
  target/riscv: move riscv_cpu_validate_v() to validate_misa_ext()
  target/riscv: validate_misa_ext() now validates a misa_ext val
  target/riscv: error out on priv failure for RVH
  target/riscv: split riscv_cpu_validate_set_extensions()
  target/riscv: use misa_ext val in riscv_cpu_validate_extensions()
  target/riscv: rework write_misa()
  target/riscv: update cpu->cfg misa bits in commit_cpu_cfg()

 target/riscv/cpu.c | 661 ++++++++++++++++++++++++++++-----------------
 target/riscv/cpu.h |  14 +-
 target/riscv/csr.c |  47 ++--
 3 files changed, 448 insertions(+), 274 deletions(-)

-- 
2.39.2


