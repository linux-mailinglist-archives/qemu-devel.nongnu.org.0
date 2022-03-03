Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2214CC74B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:48:52 +0100 (CET)
Received: from localhost ([::1]:57336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsNW-00045D-SN
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:48:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLY-0001Vg-At
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:48 -0500
Received: from [2607:f8b0:4864:20::1033] (port=33120
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLE-0000vv-Uw
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:30 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 v1-20020a17090a088100b001bf25f97c6eso74560pjc.0
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbjAT2z0mu8Ef3SnlHp9EbZyx7FbAnKNN3D96xxVK7A=;
 b=B1gbSaYlm3SYBzcfAkeW05aDZPZB8KCCCeEBfJcEaXAZdrH7gmrVcPIPTxfumzco0g
 3Jj2sgaWSWtdoEo7GvjuTLGEzocYcpFhdiBRfkwB04xHMe46CyZf16EjpaSUyTx27gz8
 2eOEyXhPSWYrbTR/C/WWxDWSTN2JNyFtoD+Qvus87kPk458LcTAaYbcdygglLOUATXX3
 S6PQwWlPiohPBxSnjNzFWGSa7I8p7PkoNmQXPfc6fIhpR4oT4tBpC8xrPck7d1Ep4s1I
 Hq6vRANnwPgBabS0vkLRMKGFsC46eci1Lz+I+qLoWR3Ya2tAzI3e5OvCe2O0QLGxt5I1
 Nzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lbjAT2z0mu8Ef3SnlHp9EbZyx7FbAnKNN3D96xxVK7A=;
 b=chAqH6sh3FDygVbjStZsPr2rhR59WC20mEdknAB9e2aMC6+Vu8urTb8suQ4vM6dVWa
 u4lXBx6edK9C08LqIPeznU3hd6c+RtRwhBobU5D8O5UaI88o7Nl3MSvkYuQikFrFl/Y6
 8efmd/O5HJSeMXReK+RzC4lcaWDDwjgzbs2Ayd2FSmsEGTKnNZ4NwxYSAuXIDWlN2C8F
 JZ3wvyU8NK7xJCKsw0YJGFHkKjCIo86/EEkCC9z3mRVy0Ob9mPO0LZjVO0F/D/ivGBzs
 ilxIe/c3NIEhruXpox0owTiq6rDFvFVGQfMK+TDA/qDV22vdmSdDmujctv612gi3EZ9P
 Y87A==
X-Gm-Message-State: AOAM5305xc8cawr8UNO9uDSsC+tTEPm/RsS0g8W0YPzxS2OUSToS9B7Y
 7bwkG9QXdf+1zXl3dVk1ggn533AILZrVxg==
X-Google-Smtp-Source: ABdhPJwrEmgonUyTSJYkIIk5SJKd4AfHXbFWhYnU/yDr3QQzK28UZtpsp7q6C4sa/FuLmZMKG9jL2A==
X-Received: by 2002:a17:90b:ed4:b0:1bc:5dee:f350 with SMTP id
 gz20-20020a17090b0ed400b001bc5deef350mr7198065pjb.234.1646340387409; 
 Thu, 03 Mar 2022 12:46:27 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] target/nios2: Rewrite interrupt handling
Date: Thu,  3 Mar 2022 10:46:17 -1000
Message-Id: <20220303204624.468786-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 36eae3a732a1f2aa81391e871ac0e9bb3233e7d7:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20220302b' into staging (2022-03-02 20:55:48 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-nios-20220303

for you to fetch changes up to b72c9d5951f1dfa047f545408dd9e35597e6b9d3:

  target/nios2: Rewrite interrupt handling (2022-03-03 09:51:59 -1000)

----------------------------------------------------------------
Rewrite nios2 interrupt handling

----------------------------------------------------------------
Richard Henderson (7):
      target/nios2: Remove mmu_read_debug
      target/nios2: Replace MMU_LOG with tracepoints
      target/nios2: Only build mmu.c for system mode
      target/nios2: Hoist R_ZERO check in rdctl
      target/nios2: Split mmu_write
      target/nios2: Special case ipending in rdctl and wrctl
      target/nios2: Rewrite interrupt handling

 meson.build               |   1 +
 target/nios2/cpu.h        |   1 -
 target/nios2/helper.h     |   6 +-
 target/nios2/mmu.h        |   1 -
 target/nios2/cpu.c        |  10 +-
 target/nios2/mmu.c        | 265 +++++++++++++++++-----------------------------
 target/nios2/op_helper.c  |  29 -----
 target/nios2/translate.c  |  73 ++++++-------
 target/nios2/meson.build  |   3 +-
 target/nios2/trace-events |  10 ++
 10 files changed, 152 insertions(+), 247 deletions(-)
 create mode 100644 target/nios2/trace-events

