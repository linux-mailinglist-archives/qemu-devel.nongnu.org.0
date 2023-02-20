Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C2F69D2E2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:42:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB6k-0004YT-Ov; Mon, 20 Feb 2023 13:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6N-0004V6-Lg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:29 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6F-00044G-Gq
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:26 -0500
Received: by mail-pl1-x641.google.com with SMTP id q11so2822256plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LHPCkWh4bjfhWO1IjoAwvWCav+RQDcRNLIEGAvSYCHA=;
 b=rENhC8Rxf7a6vFYPeJvNlfAnJh4iH1ggeLz6q8HLh7YAaZd++PhZm2epudTFIjAAoV
 iEA1uIybsI9wmLlwbr9dBJCsHm9l/tNkV2a3FBBkHmHfEBwUZzRhMaSztTAgCEoZxLy3
 i2UKRvo7KqhlwqpVaa1oleKKqzLfWcXzi+wfgobUS/C/zAaobUuAW5f4dZtApzoIUjgm
 A1JGTeN9s2yaKU/1ZR572ne/hvCDOsNs3ce7aPItWb2T6dLVNdDMJwLGvXcqIClT72lQ
 EpG1DIpU/eG4c1kRpvAAsC2vD5Nv0SOKcoPMxU+NjI0mxR157HClx0o/86nILmlVvDd7
 otUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHPCkWh4bjfhWO1IjoAwvWCav+RQDcRNLIEGAvSYCHA=;
 b=J8BmaSyTboPeWi1tlpOxSOhHh8XTDC2ly+rZa2klGUeIhv3BwpUVS+SPoHUaIv19EZ
 uWECgz2A7KG1JBaWbfDF+/gaKj6OTtMYAakZDRRNrjMTeILAGaNtgZiEnGFx6a4jqljP
 pJp3F4wMjov9tZ5VjmVAElaQBQ5fDTkN75XcSlcO3viXi9jbKSe2dmBNvMUZnINUTs0h
 WAsAAnOvN8BDB1Aq4EZBAMHv+ZknwafdqGc+zHEhXh3nslvUaxkfRDa2bFZT1IjygEWh
 KwrATvxJJKrd+u03kd5iBmw16Bb3jF2tulHh2Hj1O+qhFWy3Ql2NURSJJD0lkThbhp7p
 MsXw==
X-Gm-Message-State: AO0yUKWtaDkBG9q94xlr2MJSPU1vyeoX3xxA3I9sKOl1aFiaIcUnAjiY
 EDSn8dAvZS+jKrD//1D7HeqDrYRvG5uEfZg+B2K/Nw==
X-Google-Smtp-Source: AK7set+Zib+Jcfu58YdMAeVN9zHbiwiwgVpO5ATQ3MrvJbqlLuqKWgKtY+UerjNxQHFLMCu5eHeChg==
X-Received: by 2002:a17:902:db0e:b0:19b:c14:9f4d with SMTP id
 m14-20020a170902db0e00b0019b0c149f4dmr3068667plx.38.1676918457076; 
 Mon, 20 Feb 2023 10:40:57 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:40:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v4 00/27] target/s390x: pc-relative translation blocks
Date: Mon, 20 Feb 2023 08:40:25 -1000
Message-Id: <20230220184052.163465-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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

Based-on: https://gitlab.com/thuth/qemu/-/commits/staging 

Changes for v4:
  * Rebase and fixup conflicts.


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
 target/s390x/tcg/translate.c            | 864 ++++++++++--------------
 target/s390x/tcg/translate_vx.c.inc     |  45 +-
 tests/tcg/s390x/Makefile.softmmu-target |   3 +
 tests/tcg/s390x/bal.S                   |  24 +
 tests/tcg/s390x/per.S                   |  55 ++
 tests/tcg/s390x/sam.S                   |  67 ++
 11 files changed, 573 insertions(+), 524 deletions(-)
 create mode 100644 tests/tcg/s390x/bal.S
 create mode 100644 tests/tcg/s390x/per.S
 create mode 100644 tests/tcg/s390x/sam.S

-- 
2.34.1


