Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222856D67E3
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:52:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjixV-0007Es-68; Tue, 04 Apr 2023 11:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixN-0006uz-3H
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pjixL-0004ue-Br
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 11:52:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id kq3so31683115plb.13
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 08:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FItYxtCDLOgEqNivlDiUEXfITxK3TkId6XSIdirVbXA=;
 b=m+t591v41C/rntxsRRNATGqEtZa4VFaWmxfegyXPqHNWXv88znQw0SrJ3SpYuGojxJ
 ckzN4Mu9Lo7XeKwEobZF3ULfWRP1HRch7n+mdIXN3u8kore0JHkMqP4PsTBaFhxccFNp
 3sFdCUuCTzlrDUZW5FSw1zC/CjKq64xrFc07MlVCbewlPnwcXYD3nQrOa2SJx3DOHVPo
 qElHvyNU88Gthwp+wEfJn21F1GoCivGIvmtRJvSMpErLuQ1qdiH1yrcl+5w2Z0jB3DaF
 DR8F/zo+0lHuccGVlT1/Gbmf1jxCdhPrzTrY8QUVjG5r7mOWzxD83lBBmLqYDXyx0GBO
 mC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623542;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FItYxtCDLOgEqNivlDiUEXfITxK3TkId6XSIdirVbXA=;
 b=4arcU0LboW/A4BLMwrQNXoOJ3xxtsaDsUaSwFHn0NEos9GKxiaLYMBzd6PILYhXT+r
 wk2Qaw77L0yvCJRmwgBYFL/YQqSMxW/UWj0Gdz4hpRU9V6RZyRUzk5mDBN5iEpGQnMTD
 CYvyFuwsEm7aRJVEd76wPqxQUwVQCDVjsA4Hz6MTgiNxkOb2V1DH97DdTozLuR3bJbwS
 Xk4phZOUu9OgN32wgVyt1CnphsutpRM3HpIFo9T0gu8izrbz4oijL2R10wAGp+3YY6YS
 K2wu+3WcyELdY73vT9OWc41mijqi+xND5SrVpcNHw12KQ+BDPTIcU/eVWaFbO4FXOYjo
 3qQw==
X-Gm-Message-State: AAQBX9eLyCsufPOqUK3xf75fE1yfu0vlj1wuVarE6VdDnJjJq7/5mcZl
 wgdBk0Hd15MY978IFiB9Iq2nZtxT+7rH9cWr47o=
X-Google-Smtp-Source: AKy350ZefflSWugQScdZD6V00moh7fFZWCIeFsO6C4Js6ryXTQrvbEq/rJbhUn2cNAENZwWU3XPcOw==
X-Received: by 2002:a17:903:41c1:b0:19a:839f:435 with SMTP id
 u1-20020a17090341c100b0019a839f0435mr24340881ple.3.1680623541779; 
 Tue, 04 Apr 2023 08:52:21 -0700 (PDT)
Received: from stoup.. ([2602:ae:1541:f901:1d41:7730:d7dd:6f41])
 by smtp.gmail.com with ESMTPSA id
 nl5-20020a17090b384500b00233ccd04a15sm11562013pjb.24.2023.04.04.08.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 08:52:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/4] last minute tcg fixes
Date: Tue,  4 Apr 2023 08:52:16 -0700
Message-Id: <20230404155220.1572650-1-richard.henderson@linaro.org>
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

The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54f8:

  Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230404

for you to fetch changes up to 1ffbe5d681b06ea95b1728fc556899f63834553a:

  tcg/sparc64: Disable direct linking for goto_tb (2023-04-04 08:43:04 -0700)

----------------------------------------------------------------
Revert "linux-user/arm: Take more care allocating commpage"
accel/tcg: Fix jump cache set in cpu_exec_loop
accel/tcg: Fix initialization of CF_PCREL in tcg_cflags
tcg/sparc64: Disable direct jumps from goto_tb

----------------------------------------------------------------
Richard Henderson (3):
      Revert "linux-user/arm: Take more care allocating commpage"
      accel/tcg: Fix jump cache set in cpu_exec_loop
      tcg/sparc64: Disable direct linking for goto_tb

Weiwei Li (1):
      accel/tcg: Fix overwrite problems of tcg_cflags

 accel/tcg/cpu-exec.c         | 17 +++++++++++++----
 accel/tcg/tcg-accel-ops.c    |  2 +-
 linux-user/elfload.c         | 37 ++++++++++---------------------------
 tcg/sparc64/tcg-target.c.inc | 30 ++++--------------------------
 4 files changed, 28 insertions(+), 58 deletions(-)

