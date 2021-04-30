Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FFC36F36C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 03:18:18 +0200 (CEST)
Received: from localhost ([::1]:36568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcHnM-0004k1-Hp
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 21:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHl9-0002ho-Cu
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:15:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcHkw-0007T5-D3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 21:15:58 -0400
Received: by mail-pf1-x42a.google.com with SMTP id b15so3108905pfl.4
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 18:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrdtElB814vaLEZruyiN644RWDvcacearj6l44ufE8w=;
 b=Jh8nOLYjhGRce0ruc9Ba3jNEYOaaY/VLAyX9YgolLkluBT8B022BTXPojd5iVYKWvu
 TcqSLaBbxhxbknCZMK6RZgd+WV8Wb153ozk0bRXh4KN8vwjs+TIICzs2ltZ0iJwFAyQX
 bX2hTK1e2lbpwFILx5i1oCDf2UZDJ+f96DPbpH1N7CrBLx7E9kMgccRSjrq25EZGQ2Qi
 UnnmqBD/+bmOAZf1Spj8reHa8VA4NW8LSB/jHsMXqqAh/srEMtNKzXxiISqr6tF8+djb
 p+namNSwd3ERXhA6dfN1X7//rt0xjsWF0eSPPYQ2WFzU4yUEUDrG7cZvGAKlGb3PdhcK
 fdNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GrdtElB814vaLEZruyiN644RWDvcacearj6l44ufE8w=;
 b=P1b20jX83EoJJecy9SHy+/eNMU7bXRg6DGGKio4KS5Zm0fXJs1+b9+H+cZL6zy/poi
 LRV8uVIM6ppOXwL3qDR6zhfLTfNLXrY7SHNJvaQavwTufGyZkjb3zhYfTtxBPRTdVfZh
 jw5k/hSrI/b1r4NIQ9S1+hwhC2uOT7lVN4BC5wxUCqCBFFf/zBVMc6KWXizVZ1WwQhOJ
 NqYfkkzlEChpZ4Kd3yoT6eVq/tUfMpzrv9Geitpzi+iWGCBvuRDxOFAr5dydEVSUlsZ6
 Mq5TZqi0T2J8DRIWS8RMdHcduFmTlsmxI2W8EgVLlwu5O9u1Hj+UQXl0vAWLvF4CVdFh
 CUXg==
X-Gm-Message-State: AOAM532yDOpALzmH89DYhlxIhnNkbh1PKmBHmzf0FEC4o+uhoWjhbQCw
 DDwyvKKqwknIzSYo1CCH2glzvG40FNRSBQ==
X-Google-Smtp-Source: ABdhPJzpk5WTiN2WNjTWcS5pryHO2lLP3PpwMHqsbs1axGuP1oogZCR5QgQ9EXVoVAWU1ihhiOKqTQ==
X-Received: by 2002:aa7:9108:0:b029:251:7caf:cec with SMTP id
 8-20020aa791080000b02902517caf0cecmr2690295pfh.13.1619745344706; 
 Thu, 29 Apr 2021 18:15:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 1sm161277pjx.46.2021.04.29.18.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 18:15:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/30] Base for adding PowerPC 64-bit instructions
Date: Thu, 29 Apr 2021 18:15:13 -0700
Message-Id: <20210430011543.1017113-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: f4bug@amsat.org, luis.pires@eldorado.org.br, qemu-ppc@nongnu.org,
 lagarcia@br.ibm.com, bruno.larsen@eldorado.org.br,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v3:
  * More changes for decodetree.
  * Cleanup exception/is_jmp logic to the point exception is removed.
  * Fold in Luis' isa check for prefixed insn support.
  * Share trans_* between prefixed and non-prefixed instructions.
  * Use macros to minimize the trans_* boilerplate.
  * Fix decode mistake for STHX/STHXU.


r~


Luis Fernando Fujita Pires (1):
  decodetree: Add support for 64-bit instructions

Richard Henderson (29):
  decodetree: Introduce whex and whexC helpers
  decodetree: More use of f-strings
  decodetree: Extend argument set syntax to allow types
  target/ppc: Add cia field to DisasContext
  target/ppc: Split out decode_legacy
  target/ppc: Move DISAS_NORETURN setting into gen_exception*
  target/ppc: Remove special case for POWERPC_SYSCALL
  target/ppc: Remove special case for POWERPC_EXCP_TRAP
  target/ppc: Simplify gen_debug_exception
  target/ppc: Introduce DISAS_{EXIT,CHAIN}{,_UPDATE}
  target/ppc: Replace POWERPC_EXCP_SYNC with DISAS_EXIT
  target/ppc: Remove unnecessary gen_io_end calls
  target/ppc: Introduce gen_icount_io_start
  target/ppc: Replace POWERPC_EXCP_STOP with DISAS_EXIT_UPDATE
  target/ppc: Replace POWERPC_EXCP_BRANCH with DISAS_NORETURN
  target/ppc: Remove DisasContext.exception
  target/ppc: Move single-step check to ppc_tr_tb_stop
  target/ppc: Tidy exception vs exit_tb
  target/ppc: Mark helper_raise_exception* as noreturn
  target/ppc: Use translator_loop_temp_check
  target/ppc: Introduce macros to check isa extensions
  target/ppc: Add infrastructure for prefixed insns
  target/ppc: Move page crossing check to ppc_tr_translate_insn
  target/ppc: Move ADDI, ADDIS to decodetree, implement PADDI
  target/ppc: Implement PNOP
  target/ppc: Move D/DS/X-form integer loads to decodetree
  target/ppc: Implement prefixed integer load instructions
  target/ppc: Move D/DS/X-form integer stores to decodetree
  target/ppc: Implement prefixed integer store instructions

 docs/devel/decodetree.rst                  |  11 +-
 target/ppc/cpu.h                           |   5 +-
 target/ppc/helper.h                        |   4 +-
 target/ppc/insn32.decode                   |  91 +++
 target/ppc/insn64.decode                   |  71 +++
 tests/decode/succ_argset_type1.decode      |   1 +
 linux-user/ppc/cpu_loop.c                  |   6 -
 target/ppc/translate.c                     | 672 +++++++++------------
 target/ppc/translate/fixedpoint-impl.c.inc | 200 ++++++
 target/ppc/translate_init.c.inc            | 143 +----
 scripts/decodetree.py                      | 172 +++---
 target/ppc/meson.build                     |   9 +
 12 files changed, 772 insertions(+), 613 deletions(-)
 create mode 100644 target/ppc/insn32.decode
 create mode 100644 target/ppc/insn64.decode
 create mode 100644 tests/decode/succ_argset_type1.decode
 create mode 100644 target/ppc/translate/fixedpoint-impl.c.inc

-- 
2.25.1


