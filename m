Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF26860F46E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:05:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzjX-0006wP-FK; Thu, 27 Oct 2022 06:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzj8-0006d7-VV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:07 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzj5-0004ET-2p
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:05 -0400
Received: by mail-pl1-x633.google.com with SMTP id c24so902376pls.9
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TIvPxNP4acoBtX9zI3+xorcBxuDVvosATyUgmRkRuuk=;
 b=U5Us5kqO3EAyyFEonHUjC1Jxh3fvh4F/NhVveRW89Kpe9cmJA+nHzpbwaMYk2dRiWI
 j6GtOiiM7dQh5I1l/ARe1WdXYo+TJEs8OuOYC6pQJvqJculXWsCdLMVZoI0v9u5LeeOR
 61WgHOcLaAErzWCZgpAH8FyBg2dwkaYhvt/RyK6WdoCjEqqqKj4PnH14itJVPfr9RX1W
 yBDKcgbxekcbQwYC/K/QXrgF1aoLPmdBXO//ZmaiQ3pWUj8af1iwfeliiAt26XpVn91h
 0KdrEhrkZjP9t3AwnsQXOzEf68GiVf8cz0MMwdJdz12BjaQKlX+uZ1P3q+UlQ7Ukj2Lb
 P19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TIvPxNP4acoBtX9zI3+xorcBxuDVvosATyUgmRkRuuk=;
 b=TIHNhRiIV5ppDyFYZErBG4qGCKt1cGF/K+N0xP7XwZG8P15277DlLvjfcH4AdDDXcb
 TPQJunwGwILSv1vX9ZMSYJGvyc93FOM0xYj3MW8hv5wa5zLuYc5Pj8Fnc90WvCkPREne
 dC6809lkO5oWmpAY30FTa8/+i2E1NFChrc/hA/cXrlujg926y02QPUa+fUc1X6br5oMd
 6gSuPBGODBWcDo1EnlArNbXNniV9pCD1I3JTVJt2k2ud0gsPqK1Fwov4nr3emuYY8i9w
 TT5AXKcGjHWgLW6XF6mgcyQJ65ir78MdnJxzipWOKMDfvq5ITo+81uiQiFXzthrEi+S9
 brkg==
X-Gm-Message-State: ACrzQf3weLFq9DA8uKPmCP7LbP0GPMiTMxFb/wIb6V57uLrTpsINU9T7
 Z2hHikPt2Ggw1q9e3WIN2snYNkUjnn6BP3hg
X-Google-Smtp-Source: AMsMyM5Erh8kxWu0L5Z5rYAXpdDnM787TZ+mzXFQfulPl9mCiokngeZBYBx+9mO6kScJRBmJQRACuQ==
X-Received: by 2002:a17:902:e851:b0:186:96fe:56c7 with SMTP id
 t17-20020a170902e85100b0018696fe56c7mr25206690plg.110.1666864981190; 
 Thu, 27 Oct 2022 03:03:01 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 0/6] tcg: Fix x86 TARGET_TB_PCREL (#1269)
Date: Thu, 27 Oct 2022 21:02:48 +1100
Message-Id: <20221027100254.215253-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per #1269, this affects NetBSD installer boot.

The problem is that one of the x86 acpi callbacks modifies
env->eip during an mmio store, which means that the tracking
that translate.c does is thrown out of whack.

Introduce a method to extract unwind data without the
writeback to env.  This isn't a perfect abstraction, but I
couldn't think of anything better.  There's a couple of lines
of code duplication, but probably less than any abstration
that we might put on top

Changes for v2:
  * Rebase on master, 23 patches merged.
  * Comments adjusted per review (claudio)


r~


Richard Henderson (6):
  accel/tcg: Introduce cpu_unwind_state_data
  target/i386: Use cpu_unwind_state_data for tpr access
  target/openrisc: Always exit after mtspr npc
  target/openrisc: Use cpu_unwind_state_data for mfspr
  accel/tcg: Remove will_exit argument from cpu_restore_state
  accel/tcg: Remove reset_icount argument from cpu_restore_state_from_tb

 accel/tcg/internal.h                |  4 +-
 include/exec/exec-all.h             | 24 +++++---
 accel/tcg/cpu-exec-common.c         |  2 +-
 accel/tcg/tb-maint.c                |  4 +-
 accel/tcg/translate-all.c           | 91 +++++++++++++++++------------
 target/alpha/helper.c               |  2 +-
 target/alpha/mem_helper.c           |  2 +-
 target/arm/op_helper.c              |  2 +-
 target/arm/tlb_helper.c             |  8 +--
 target/cris/helper.c                |  2 +-
 target/i386/helper.c                | 21 ++++++-
 target/i386/tcg/sysemu/svm_helper.c |  2 +-
 target/m68k/op_helper.c             |  4 +-
 target/microblaze/helper.c          |  2 +-
 target/nios2/op_helper.c            |  2 +-
 target/openrisc/sys_helper.c        | 17 ++++--
 target/ppc/excp_helper.c            |  2 +-
 target/s390x/tcg/excp_helper.c      |  2 +-
 target/tricore/op_helper.c          |  2 +-
 target/xtensa/helper.c              |  6 +-
 20 files changed, 125 insertions(+), 76 deletions(-)

-- 
2.34.1


