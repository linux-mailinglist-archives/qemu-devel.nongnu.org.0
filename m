Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D476630F5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRc-0002rU-8y; Mon, 09 Jan 2023 15:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRV-0002p2-W9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:26 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRU-0007NI-1M
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:25 -0500
Received: by mail-pl1-x630.google.com with SMTP id v23so5855519plo.1
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y8n86qpuIC2G4CMl0rkSUeRn5rOzUpELt0whRWyh6w0=;
 b=ZVacV6UMG4stUTKkuOvK+8JkgGa8GayJ58huLPpz+9/wHKH/mYD9exQ02g/uADwYov
 FIufmfuDFU8536kbua5EYKixnYkWKcyVM3mZSsWJWFvDjCbBWGZElzAG1Xft8Cyb+NMQ
 CGIv+jDbrT6rfQ4KlhJqKe2iDWPsOopJzhyCQjw6uyy0SDYMzDbQXpmpcq0ONlMbiF1H
 nFijFpqFu+cZOI1iVjlb3+fciq42+ML3ZxLZgXgoapHxuVzo9hEBW5HI1WQFRXvA798w
 8S8YYKYK1U6Drpri1aJBNvoGfmXV7CMpRvqoYVgNKnV1krl1MQgubbnNaTU/CUuNPw2V
 AjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y8n86qpuIC2G4CMl0rkSUeRn5rOzUpELt0whRWyh6w0=;
 b=pKmQllouEw8nbAaiM9O/hKpNHkAorxkF+RXWnF6MadU98+qsDrcNjR6LAZ3BDXWio+
 X3mENlhb5IzliH/wxcIKznfUy1EOZdzLdn0oauuEVwv5beUl0gE6oWoGr8kVcNtvi+vi
 9C2oeIU7azCECH4UVH4KLocu7TUSu/3GWIJJVlEMzKtZfAo8gGoX8BeJLsNi9VB8VPmE
 rlui8PrlfORAT7rr6QzW8YC6MD+ffZxqAuq5e5DonARWjDl/9Ck3pHFw8DEHBNurLi+w
 KnatdZiwpeaOxl/k7m93bymkVUPVejZ1XkDBUXhImsTQ36ZJLAfkz1l6h6WXv+N/etWE
 8C1A==
X-Gm-Message-State: AFqh2kp9qPzj4BDgOIYjHK+1U5MM+iiQ/NhqvtKbeqp1/av6/EL73ZHz
 0i02WS7639kGAad1TgVmqtSzckGYNBnuwj2A
X-Google-Smtp-Source: AMrXdXsoaSgivva8iGYd9Gf5cQUmCIvm//lvgFTx7mVKlZSPDPBX5l8/fa+o+E4Eqn2W9k0j7Smf7A==
X-Received: by 2002:a17:90a:7503:b0:226:c196:db55 with SMTP id
 q3-20020a17090a750300b00226c196db55mr19288988pjk.18.1673294901589; 
 Mon, 09 Jan 2023 12:08:21 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v3 00/27] target/s390x: pc-relative translation blocks
Date: Mon,  9 Jan 2023 12:07:52 -0800
Message-Id: <20230109200819.3916395-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

This is the S390 specific changes required to reduce the
amount of translation for address space randomization.

Changes for v3:
  * Rebase and fixup conflicts.

All patches are reviewed.


r~


Ilya Leoshkevich (4):
  tests/tcg/s390x: Add bal.S
  tests/tcg/s390x: Add sam.S
  target/s390x: Fix successful-branch PER events
  tests/tcg/s390x: Add per.S

Richard Henderson (23):
  target/s390x: Use tcg_constant_* in local contexts
  target/s390x: Use tcg_constant_* for DisasCompare
  target/s390x: Use tcg_constant_i32 for fpinst_extract_m34
  target/s390x: Use tcg_constant_* in translate_vx.c.inc
  target/s390x: Change help_goto_direct to work on displacements
  target/s390x: Introduce gen_psw_addr_disp
  target/s390x: Remove pc argument to pc_to_link_into
  target/s390x: Use gen_psw_addr_disp in pc_to_link_info
  target/s390x: Use gen_psw_addr_disp in save_link_info
  target/s390x: Use gen_psw_addr_disp in op_sam
  target/s390x: Use ilen instead in branches
  target/s390x: Assert masking of psw.addr in cpu_get_tb_cpu_state
  target/s390x: Add disp argument to update_psw_addr
  target/s390x: Don't set gbea for user-only
  target/s390x: Introduce per_enabled
  target/s390x: Disable conditional branch-to-next for PER
  target/s390x: Introduce help_goto_indirect
  target/s390x: Split per_branch
  target/s390x: Simplify help_branch
  target/s390x: Split per_breaking_event from per_branch_*
  target/s390x: Remove PER check from use_goto_tb
  target/s390x: Pass original r2 register to BCR
  target/s390x: Enable TARGET_TB_PCREL

 target/s390x/cpu-param.h                |   4 +
 target/s390x/cpu.h                      |  20 +-
 target/s390x/tcg/insn-data.h.inc        |   2 +-
 target/s390x/cpu.c                      |  12 +
 target/s390x/tcg/misc_helper.c          |   1 +
 target/s390x/tcg/translate.c            | 870 ++++++++++--------------
 target/s390x/tcg/translate_vx.c.inc     |  45 +-
 tests/tcg/s390x/Makefile.softmmu-target |   3 +
 tests/tcg/s390x/bal.S                   |  24 +
 tests/tcg/s390x/per.S                   |  55 ++
 tests/tcg/s390x/sam.S                   |  67 ++
 11 files changed, 575 insertions(+), 528 deletions(-)
 create mode 100644 tests/tcg/s390x/bal.S
 create mode 100644 tests/tcg/s390x/per.S
 create mode 100644 tests/tcg/s390x/sam.S

-- 
2.34.1


