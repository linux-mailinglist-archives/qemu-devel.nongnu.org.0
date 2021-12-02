Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D28F466B2E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:51:12 +0100 (CET)
Received: from localhost ([::1]:37940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst2s-0002lu-Rh
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:51:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0r-0008WS-HQ
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:05 -0500
Received: from [2607:f8b0:4864:20::1033] (port=38814
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0o-0005Sk-Tf
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:04 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so3443460pju.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJ7lm6WwvBwHeqDADc4s3SHx7PUZVUnnPMwzz7gSRKc=;
 b=EykfMrfu0MHbWb0P2OIvTaQ0/mk2Y2Uq7UR9KO/a+5fc8QCqH8fPFLidvAkh1QrE+g
 w/dovLAOKHj3MbsZjdK9FgYEto9hsxAXJAa4SL2KLvTahT/6GcSrzENC1zTwGBnnlSD9
 y6h5F7NzfGksIQ9fcYYfuEpeFPKaCjiV73fZox3Vwh+/fcFmirXUaP7nn+0BzXK1dwpx
 gWiWnVLKenfmOaC7hRCahwX+hJgg60SUUZK85xDgvInNAVHqgBD3ygMa370pWcju64B5
 dVtmSiIHc7o6I/6QcST+hGXpw0SHRDBKYorDZzvkkKGE+XovZqX0kN21PIh5hoTWdnjf
 eIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AJ7lm6WwvBwHeqDADc4s3SHx7PUZVUnnPMwzz7gSRKc=;
 b=6ao2i37fNSqucnXjH/bbQMzeKTddHl2dFGHEtHO8KQpambdkgSi706bDCtXavH+nmT
 qJcjGD3z03kxkzJ5vQolvfB0OsFjZQfKixFG/VUun3564qT/EcOB5sDK2BbYbSMwv2zi
 Nomgc/rKWRWvKPeS5OqtG0iP2Q8BQBLXoJOZ6ZPC0X8Kj/SMUHRm1NCSHr0hyFj9EYfR
 usWNvH3OXsuhsO2PKmvASMwAeB+THb7Tsfo/Xa6c7zg5qFqM86uITG7RmHdkp2iIUS1u
 aOgqsdAtcBXynlKkAqG03G8YgLs691ApYvckQLyyS1sOOU2SmuVRDWQQCTNEQQQJ/62R
 Bw/A==
X-Gm-Message-State: AOAM531JqHJAksMP+2GeAAS+thNvRbdQoNjOB1NmgauF9Qtgc/ii7PFS
 NWi2kB5CfeohdZq5eWnsA/MevkMqb3sQCg==
X-Google-Smtp-Source: ABdhPJy6bxUWYpiXJCVgvMvWFem0KU5PG19ivxuhTFQJxAo5YLNKZPKsdlSbvsehnl54wCvkd7WTJQ==
X-Received: by 2002:a17:902:9a09:b0:142:82e1:6cff with SMTP id
 v9-20020a1709029a0900b0014282e16cffmr18041066plp.47.1638478141445; 
 Thu, 02 Dec 2021 12:49:01 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/15] target/m68k: Conditional traps + trap cleanup
Date: Thu,  2 Dec 2021 12:48:45 -0800
Message-Id: <20211202204900.50973-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: <20211130103752.72099-1-richard.henderson@linaro.org>

Reviewing v1, Laurent rightly noticed that there were changes
required in m68k_interrupt_all.  Matching sysemu, there were
changes needed in the linux-user cpu_loop.

In the process, I found a number of other trap related bugs,
and some strace problems.  I cherry-picked the linux-user/m68k
patch from my outstanding force_sig_fault patch set, to avoid
conflicts with that one.


r~


Richard Henderson (15):
  target/m68k: Raise the TRAPn exception with the correct pc
  target/m68k: Switch over exception type in m68k_interrupt_all
  linux-user/m68k: Use force_sig_fault
  linux-user/m68k: Handle EXCP_TRAP1 through EXCP_TRAP15
  target/m68k: Remove retaddr in m68k_interrupt_all
  target/m68k: Fix address argument for EXCP_CHK
  target/m68k: Fix pc, c flag, and address argument for EXCP_DIV0
  target/m68k: Fix address argument for EXCP_TRACE
  target/m68k: Implement TRAPcc
  target/m68k: Implement TRAPV
  target/m68k: Implement FTRAPcc
  target/m68k: Fix stack frame for EXCP_ILLEGAL
  tests/tcg/m68k: Add trap.c
  linux-user/strace: Fix print_syscall_err
  linux-user/strace: Adjust get_thread_area for m68k

 target/m68k/cpu.h              |   2 +
 target/m68k/helper.h           |  12 +--
 linux-user/m68k/cpu_loop.c     |  31 ++-----
 linux-user/strace.c            |   4 +-
 target/m68k/cpu.c              |   1 +
 target/m68k/op_helper.c        | 164 ++++++++++++++++++---------------
 target/m68k/translate.c        | 142 ++++++++++++++++++++++------
 tests/tcg/m68k/trap.c          | 129 ++++++++++++++++++++++++++
 linux-user/strace.list         |   5 +
 tests/tcg/m68k/Makefile.target |   3 +
 10 files changed, 361 insertions(+), 132 deletions(-)
 create mode 100644 tests/tcg/m68k/trap.c

-- 
2.25.1


