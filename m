Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA236A823
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Apr 2021 17:59:35 +0200 (CEST)
Received: from localhost ([::1]:49304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lahAT-0000n4-UD
	for lists+qemu-devel@lfdr.de; Sun, 25 Apr 2021 11:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8v-0007qk-Ei
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:57 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lah8q-00038u-BE
 for qemu-devel@nongnu.org; Sun, 25 Apr 2021 11:57:57 -0400
Received: by mail-pg1-x530.google.com with SMTP id p2so23037759pgh.4
 for <qemu-devel@nongnu.org>; Sun, 25 Apr 2021 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0uRX/mkF1vUC4TeJuAjl4hd+Sr3I/Y7Sj+ILIim3eM=;
 b=GYst0jyAmLy4VdmNRXJLbkB8c4ZOw5pDp0HByT4v1l5Q+9aMTrtftsE0+/lWSGEWUa
 RoZi+q6iXfpdORRFglV7OFZbIQ8gA76stFfgPNhqVDgaYiSIAVBPG48uoxVrgbkjRjEj
 WnYbVeOvjorjXT438X5+eoZYgs9XpBSnu+JVbaJy/OIIHIlZCE18ZwhWaMu/7yEs+zMf
 kE346pM6e6P8Onxay2fWkgLSg1kVX64uk4V+8eXUs4BILhQSNrYbRhhhunS351L9MWOW
 CgotrqSuoMMyjdSkylOcSsNshErOVsnpNg8lD1cVf0qmWmXbmNMm3mV6u/QZ3BN2X2Ss
 hw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h0uRX/mkF1vUC4TeJuAjl4hd+Sr3I/Y7Sj+ILIim3eM=;
 b=cHqVMs+prTeldObHiCV6Ahw5ExkyRi7KYW7PRej0eEr/k4POaP+MwFMyb1d3y9Q6sP
 FyAq+w8XVzbaAlX0deJ6513BN+AQdnjkds92FlSqvqeDmwJ4pn2HdpTruTQy/y5o8JgM
 x26eiX6TWKGJqpMLo3AqLLOpaw/Zd6MJtPqA5t/0sd36hoQsBgs1O5dSq2y4pyjOaMxT
 Wz7vAtzx6In5C9bJvIGeqSs+jS9mjv8A/GF+GnqovP+rA68YowrVd2XS79LsC951l1Nk
 AeHWpHCtrD9TMV5tXqmtWITMno05szDt6Kj/ZU3wAWyUtB7fcr7tWJjx+FedjS2lK/cU
 Fe3Q==
X-Gm-Message-State: AOAM532jeWw+nRVmnbQIVZkV1GyTWi+3TMcsRmnrZ01fp0H17eFHVwHQ
 kJ4P5+0iLMOpz6JRmwcjx6HhhYv0Mw7wgQ==
X-Google-Smtp-Source: ABdhPJx0KHbGWO8h2FFsj+vdbaX0x+7guJoQMnjpIEj0scHzcDPKlZB2snwztS6LQTeIqFpUOLq1GQ==
X-Received: by 2002:a62:7f84:0:b029:25f:b701:38e5 with SMTP id
 a126-20020a627f840000b029025fb70138e5mr13635216pfd.5.1619366270539; 
 Sun, 25 Apr 2021 08:57:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id u21sm8594717pfm.89.2021.04.25.08.57.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 08:57:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] linux-user/sparc64: Implement signals
Date: Sun, 25 Apr 2021 08:57:41 -0700
Message-Id: <20210425155749.896330-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We were re-using sparc32 signal handling for sparc64.
In the process, clean up the altstack handling in do_*_sigreturn.


r~


Richard Henderson (8):
  linux-user: Split out target_restore_altstack
  linux-user: Use target_restore_altstack in all sigreturn
  linux-user: Pass CPUArchState to do_sigaltstack
  linux-user: Pass CPUArchState to target_restore_altstack
  linux-user/sparc64: Move sparc64 code out of sparc32 signal.c
  linux-user/sparc: Clean up init_thread
  linux-user/sparc64: Include TARGET_STACK_BIAS in get_sp_from_cpustate
  linux-user/sparc64: Implement signals

 linux-user/qemu.h                   |   3 +-
 linux-user/signal-common.h          |   1 +
 linux-user/sparc/target_cpu.h       |   9 +-
 linux-user/sparc/target_signal.h    |   2 +
 linux-user/sparc64/target_syscall.h |  14 +-
 linux-user/aarch64/signal.c         |   6 +-
 linux-user/alpha/signal.c           |   6 +-
 linux-user/arm/signal.c             |   9 +-
 linux-user/elfload.c                |  33 +-
 linux-user/hexagon/signal.c         |   6 +-
 linux-user/hppa/signal.c            |   8 +-
 linux-user/i386/signal.c            |   5 +-
 linux-user/m68k/signal.c            |   5 +-
 linux-user/microblaze/signal.c      |   6 +-
 linux-user/mips/signal.c            |   6 +-
 linux-user/nios2/signal.c           |   8 +-
 linux-user/openrisc/signal.c        |   5 +-
 linux-user/ppc/signal.c             |   4 +-
 linux-user/riscv/signal.c           |   6 +-
 linux-user/s390x/signal.c           |   6 +-
 linux-user/sh4/signal.c             |   7 +-
 linux-user/signal.c                 | 120 ++++---
 linux-user/sparc/signal.c           | 280 ---------------
 linux-user/sparc64/signal.c         | 523 +++++++++++++++++++++++++++-
 linux-user/syscall.c                |   3 +-
 linux-user/xtensa/signal.c          |   6 +-
 26 files changed, 633 insertions(+), 454 deletions(-)

-- 
2.25.1


