Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E465B6348D4
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 21:59:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxaKz-0007Jj-QG; Tue, 22 Nov 2022 15:57:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKy-0007J5-BB
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxaKt-0003Su-5D
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 15:57:48 -0500
Received: by mail-pl1-x630.google.com with SMTP id j12so14815072plj.5
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 12:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X6IiKeLrSKkKTtH5uePmvRH055lhsWVNlJQ9EqcuA84=;
 b=zVpYo0Neiav1N6ftuFRcASdRPVmDlKGhBQlp14IzEX/wW5h9d4+vfrcNHEzL5gT2DE
 z9VLd0VYniIGqx5jW4bK/8fHPL/8eZ1//XjnFrjuq5v9+wxfyofHuN0WhkXZfWAOuJ6F
 OMwTSUdbkGrNMjUkXIl9ptCfbjORu9v6wvD8km5smJKzzRPw/5dVX31AlLneMpsYdlY3
 M/zwxkmE6ox58vmhF1QzQef1PQ8wObhZ+vEtyVhclmHRJG4eNYJhwoko6f0scIld5v0T
 03XyaYXOPU/j7Wt5vZvDgOdWz2pL90ZDwFZYYWHZNyK76j/lL4tGab219P107p5Ie1hP
 IrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6IiKeLrSKkKTtH5uePmvRH055lhsWVNlJQ9EqcuA84=;
 b=QkIoJX8RGuBAmoM5Idh7MZ8iNB8lZIBn/WQxNQeC1MfquHrSWHP2MWc+79kaJtOoOu
 98bsfvVwJhLuIPNh9mzO78YP9QYkKaYLx23C1xa7GwNSHf8zYmDMLrk28eO4QyjCNj4E
 6DKZnz2evB2gVL+QAzB8EoJ0QSueN6aRs+u73UpBZthKckyAmK06gc+F2ig5FxkCeFAS
 H5Ueb0ru9RcdEeB65g3UPkClwXYsnzfR1P2Da63D0If9wEDXTiBZFtzoDlGsCL6hHUwp
 LEeirtC4EKPtTlGJI4CAiC3gskG4m6PV9SYsHcz+ENGG8G79/yllLJlHExbt8nx4km3p
 wFwg==
X-Gm-Message-State: ANoB5pmD3SUQPRfR0KPLsqWt5j6QE9QLfxo+si7S4QItrtjNS47j+cGg
 T4EaTXfdS+IVpXuiAQ/amiX9HcZT7rIWeg==
X-Google-Smtp-Source: AA0mqf74b8IPc+QijBVy3xMhUKrsau+2Pm48B2JEQNWLjVwG+2mny4cvRqRM9asMsF7pn5RzXsxmdQ==
X-Received: by 2002:a17:90a:307:b0:213:dce7:e1fe with SMTP id
 7-20020a17090a030700b00213dce7e1femr33824137pje.110.1669150661529; 
 Tue, 22 Nov 2022 12:57:41 -0800 (PST)
Received: from stoup.. ([2602:47:d48a:1201:90f5:6f8b:e78a:4a0])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170903209300b00186fa988a13sm12383807plc.166.2022.11.22.12.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 12:57:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
	philmd@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v2 0/7] main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
Date: Tue, 22 Nov 2022 12:57:32 -0800
Message-Id: <20221122205739.603510-1-richard.henderson@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Changes for v2:
  * Add WITH_QEMU_IOTHREAD_LOCK and use it a couple of places.
    This re-implements patch 1, so r-b's dropped.

r~


Richard Henderson (7):
  qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD,
    WITH_QEMU_IOTHREAD_LOCK
  hw/mips: Use WITH_QEMU_IOTHREAD_LOCK in cpu_mips_irq_request
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
  target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
  hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
  target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
  accel/tcg: Use WITH_QEMU_IOTHREAD_LOCK in io_readx/io_writex

 include/qemu/main-loop.h  | 39 +++++++++++++++++++++++++++++++++++++++
 accel/tcg/cputlb.c        | 23 ++++++-----------------
 hw/mips/mips_int.c        | 37 ++++++++++++++-----------------------
 hw/ppc/ppc.c              | 10 +---------
 target/ppc/excp_helper.c  | 11 +----------
 target/ppc/helper_regs.c  | 14 ++++----------
 target/riscv/cpu_helper.c | 22 +++++++---------------
 7 files changed, 72 insertions(+), 84 deletions(-)

-- 
2.34.1


