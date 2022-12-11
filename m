Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E728E6494E5
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:35:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OFg-0006Ay-9V; Sun, 11 Dec 2022 10:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFL-000665-Ve
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:08 -0500
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p4OFK-0007BN-9X
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:28:07 -0500
Received: by mail-oi1-x236.google.com with SMTP id k189so9060347oif.7
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rLPsXeq/1u/AnYVJTnmJ9DnF+2i3TFqaCj6Jxspe5wY=;
 b=YN42YrChmJmgedggV83joJkcwK9pLfkDNX2P2r4gPL3gCON7KA611h0grOfhlrAVkd
 4jMbFJ5w3V/t3Ou0vBAHITLk3d8x7AibjtP8Yv9VuNVUT1FHKMITGfU3m84Znb6FbDXn
 e0BgKWXODU+lf1tKtIppRK0G1UvBYF1lLCXbj6G9xx5Nd6Wh/F3sBpE9ppCoRl4l6fZb
 hhPVJULnfE9uX+GSPUtw/XVBGsGDBHf+vGoRw7UZS/gWgrxe4H0iXNlIDPw/Ov6zPaV2
 Sq0CfbYB49GhWOMCZsEy75X32i7a/6TJqVZRN9neRYr0dEGclnInv7QFewo/CJQ8GbBa
 8Siw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rLPsXeq/1u/AnYVJTnmJ9DnF+2i3TFqaCj6Jxspe5wY=;
 b=aO9qbIAMjj1logzNAk9JZogmXlwWvT+9SrA3F71otLKXbE7KN9ZJunQdbtUz3rDwrC
 hOAnq4Q5WeEhh6CCZknuS6RCW9o3SdBIxmZWlmYaXIoh61kC/ZHAALHonTRGUDRP2KgV
 Ax/ly/DpYQY/6QCu/rXwYTgpDkImi+7Tgm5IGSvrwbKbVa1CjfSTSAopmUMP5x2TlYpT
 HwoaGq1DVvtH6PHRnBSEx7GLDKa47l2Ve1CEA/d/tq0Cy4QBwJKN9Ii+/IYE51qq7G4y
 Y4da0UVI4vLO/F0c2SW52sBjf2RbdMHlShSoWSNuCjEMHeT7Hi+rexl9P3VfYorbsR9O
 N+hw==
X-Gm-Message-State: ANoB5pmYDnyoY0Hg6tluYZlvHG0IZyglK1L/TSdROEcpXL7XzZ5lYdKW
 LIsWh8HStZ5ykno+e7ptA3lAPy2+zrhBBaciEw0=
X-Google-Smtp-Source: AA0mqf6PmzqQxF3IzeILdiKasghXDJQXasIuL7BHp9yTg7KkVSTs3WxkSrszkY8NndsWr4O+tzorLQ==
X-Received: by 2002:a05:6808:1a20:b0:35e:66a2:1468 with SMTP id
 bk32-20020a0568081a2000b0035e66a21468mr4356124oib.58.1670772484482; 
 Sun, 11 Dec 2022 07:28:04 -0800 (PST)
Received: from stoup.. ([2806:102e:18:2efc:7b4f:f28b:eca6:b583])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a056830233800b006708d2cd8bcsm938140otg.65.2022.12.11.07.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Dec 2022 07:28:03 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
Subject: [PATCH v2 00/27] target/s390x: pc-relative translation blocks
Date: Sun, 11 Dec 2022 09:27:35 -0600
Message-Id: <20221211152802.923900-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
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

This is the S390 specific changes required to reduce the
amount of translation for address space randomization.

Begin with some generic cleanups, then prepare by using
displacements instead of addresses when possible, then
add some tcg infrastructure to avoid a code gen ugly,
then finalize the conversion.

Changes for v2:
  * Incorporate feedback, including test cases.


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

 target/s390x/cpu-param.h                |   1 +
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
 11 files changed, 572 insertions(+), 528 deletions(-)
 create mode 100644 tests/tcg/s390x/bal.S
 create mode 100644 tests/tcg/s390x/per.S
 create mode 100644 tests/tcg/s390x/sam.S

-- 
2.34.1


