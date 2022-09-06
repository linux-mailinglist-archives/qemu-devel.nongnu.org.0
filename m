Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7945AE577
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:37:38 +0200 (CEST)
Received: from localhost ([::1]:48056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVxZ-0006cS-Bb
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWU-00008m-IL
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWR-0003YD-TM
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:37 -0400
Received: by mail-wr1-x433.google.com with SMTP id bq9so1754211wrb.4
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=wtGyGiaIDUuPk8pdoR3gaSixybR0rPlWbYrtsheehh0=;
 b=clCN6sjUKAWTFRjinesEU8+T3jkCspsg+6yO2bhYJzaAqIiKSp3EPWa4qO4JcBokXY
 3Au0n4NOohSg9AH3ux3l+qauCJELtc6TG3wtSRADMcJKKn1mCz368pJdcN/Pvu+zEGve
 Fvl1M5KcRRQcq9/lU4vqK0S8N2IqjSp0UbuwXQqstxp9PxosA2T3zjTciE5Res1H4Cig
 6IQglnEt3xNa61xkPHVLWYJGm6Emy73CbYu+8+eZs29loBNVKArnZx2q8mSZ9p/DxrY8
 Qskf0y64g1A3I5Biq0r9Rz8b2sWdpIV6fWv475R93xUBgtOQgygk3PUcNLOyGgQFgznU
 yIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wtGyGiaIDUuPk8pdoR3gaSixybR0rPlWbYrtsheehh0=;
 b=Q05XZXRt0XYYlVbIe42IvPVj994R8AZKfr+Eut2ghijfdCDmWN/+R22Cz9k8KXMR1D
 y3QyIMZFTM8tuX56WBwm+ghd4HY67EpQ6H0P8ZxGMXyp5GafvzJYXQrds9OhjPX5kLwB
 Lfp9X1DiEJa3mMRptkiRfKy4l7zqIyGA/0ZzoMlguHwpl+bIPKpbEqFDgdgEpBK+3ljt
 nZtm/yQ2R2ixUc1PdJGEXZRz7lfXcEiaf/lV4lqeCZpV5PdxlSdA6kO0d1UaVRzeqiNV
 hsKcW4fRuhztuXKFaji6LqTQXN52mivzFbNvGbP+YqUkNi+hDhYRzd8tgzfiR8hHBnuQ
 ZzGA==
X-Gm-Message-State: ACgBeo1Uset5tIKWdgQus4gxq/Mb30HLYX22IJf46ZIP/EQF2UFXC3yq
 itY1pZYr9Wj+VOZI2GgpDMWnW9ZWQUcDOOOa
X-Google-Smtp-Source: AA6agR6XnFPpXhbSlaEBGqT/g5oU/p4GnDiEsObaGR4ebRNHDys6KzB+fgmX1uZ2/TsOzAW80baKaw==
X-Received: by 2002:a5d:59a6:0:b0:228:ac72:3c27 with SMTP id
 p6-20020a5d59a6000000b00228ac723c27mr4336997wrr.73.1662458974370; 
 Tue, 06 Sep 2022 03:09:34 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 00/23] target/i386: pc-relative translation blocks
Date: Tue,  6 Sep 2022 11:09:09 +0100
Message-Id: <20220906100932.343523-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the x86 specific changes required to reduce the
amount of translation for address space randomization.
This is a re-base, with no other significant changes over v1.


r~


Based-on: 20220906091126.298041-1-richard.henderson@linaro.org
("[PATCH v4 0/7] tcg: pc-relative translation blocks")

branch: https://gitlab.com/rth7680/qemu/-/tree/tgt-x86-pcrel


Richard Henderson (23):
  target/i386: Remove pc_start
  target/i386: Return bool from disas_insn
  target/i386: Remove cur_eip argument to gen_exception
  target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
  target/i386: Create gen_update_eip_cur
  target/i386: Create gen_update_eip_next
  target/i386: Introduce DISAS_EOB*
  target/i386: Use DISAS_EOB* in gen_movl_seg_T0
  target/i386: Use DISAS_EOB_NEXT
  target/i386: USe DISAS_EOB_ONLY
  target/i386: Create cur_insn_len, cur_insn_len_i32
  target/i386: Remove cur_eip, next_eip arguments to gen_repz*
  target/i386: Introduce DISAS_JUMP
  target/i386: Truncate values for lcall_real to i32
  target/i386: Create eip_next_*
  target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
  target/i386: Create gen_jmp_rel
  target/i386: Use gen_jmp_rel for loop and jecxz insns
  target/i386: Use gen_jmp_rel for gen_jcc
  target/i386: Use gen_jmp_rel for gen_repz*
  target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
  target/i386: Create gen_eip_cur
  target/i386: Enable TARGET_TB_PCREL

 target/i386/cpu-param.h      |   1 +
 target/i386/helper.h         |   2 +-
 target/i386/tcg/seg_helper.c |   6 +-
 target/i386/tcg/tcg-cpu.c    |   8 +-
 target/i386/tcg/translate.c  | 712 ++++++++++++++++++-----------------
 5 files changed, 369 insertions(+), 360 deletions(-)

-- 
2.34.1


