Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7A62F0EE
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 10:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovxWx-0001EL-CO; Fri, 18 Nov 2022 04:19:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWr-00019X-EH
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:21 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ovxWl-0005ve-Iz
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 04:19:21 -0500
Received: by mail-pl1-x633.google.com with SMTP id v17so4067655plo.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 01:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=EYXq1nzkhnSFMAkxNZA600hYiCPdJRa0yJFf71kQH/A=;
 b=eJudJDf7B6UVEjoJY4rtSz68qgeuppMUI4sM4qdtGdgSGHHNWCZyB58gW+LZSXo6RQ
 tIfEYDhlcQ2Ok4yNY20flOs26R616S1cYRaXsXnzf9vrbBzIYFAA7Y7oekPteg8v11sB
 eq4ZsRdwb3iDtDQKOV+iDBwNlbDH/LIdmyVlRXdts7jR34UbXSUCXF0u6M4YLl67wbqV
 bi7aembToTV3H5nrFwSGud0UcA0SrhZtAuLZoJ9CKjPV1X/R6UrbHndi0qs2nAWBlJLu
 ywfveJyov2WzL9pmJmJ6VP1gSDeJ+Laj6xavBKEynHEkyN1RgchXxEGr3VB7eWiG1Xxp
 KGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EYXq1nzkhnSFMAkxNZA600hYiCPdJRa0yJFf71kQH/A=;
 b=OoN9zx1kknnruiZBToSYZaECoKhEIWSnUQowYKhq7/zSughZq+x8hpj37GKu8Q4Q8y
 k1pMBQA4lEAp9j1DFEYV1Q6Emrtj40KrRauy+Zoxf8nMuq9+Y0ctySSdB1Yr/G+hLrCd
 5K4TEWgWqbQQ6smPVDOiyvlMB7G9yOGy/AbUjCbCG+oGjOm9u5cWeE9jvP/5GonsBw6z
 d6QqVEJkGNoqZDYb9GVfieF6KWmKesRk6YqFVZ5J/p1UhjHrzz7SR/FkJOgAtmEekLlm
 HC6/oOU6opguvJYeqihjo4Mp2hdoDPYMAyAYtmw78iYwYZdNo4H8VSFBbjN0z3kGsgE/
 qVAQ==
X-Gm-Message-State: ANoB5pnNLHa3ZJL3gHFqlqCTs2kcKtuK5IWzPdsJqUOiPK0FMX61gamD
 ErI08GSqtId9E7smU8DxabgrFc4ipVVvSA==
X-Google-Smtp-Source: AA0mqf5Yp72yRfzcq22M5zvHLh2/WSzd+ishBXNb33HC6NlgPgnemruZ610OIFjmY54w/lLZKWjuRQ==
X-Received: by 2002:a17:90a:4ece:b0:218:7c55:47de with SMTP id
 v14-20020a17090a4ece00b002187c5547demr4540361pjl.172.1668763141069; 
 Fri, 18 Nov 2022 01:19:01 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90b2:345f:bf0a:c412])
 by smtp.gmail.com with ESMTPSA id
 a27-20020aa794bb000000b0056e8eb09d57sm2672305pfl.63.2022.11.18.01.18.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 01:18:59 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 0/7] main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
Date: Fri, 18 Nov 2022 01:18:51 -0800
Message-Id: <20221118091858.242569-1-richard.henderson@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Simplify the usage of qemu_mutex_lock_iothread.
Split out for ease of review.

Doesn't actually depend on anything, but patchew only handles a single
dependency, so I need to thread the dependency through the patch sets.

Based-on: 20221111074101.2069454-1-richard.henderson@linaro.org
("tcg: Support for Int128 with helpers")


r~


Richard Henderson (7):
  qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
  hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_mips_irq_request
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
  target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
  hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
  accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in io_readx/io_writex

 include/qemu/main-loop.h  | 29 +++++++++++++++++++++++++++++
 accel/tcg/cputlb.c        | 25 ++++++++-----------------
 hw/mips/mips_int.c        | 11 +----------
 hw/ppc/ppc.c              | 10 +---------
 target/ppc/excp_helper.c  | 11 +----------
 target/ppc/helper_regs.c  | 14 ++++----------
 target/riscv/cpu_helper.c | 10 +---------
 7 files changed, 45 insertions(+), 65 deletions(-)

-- 
2.34.1


