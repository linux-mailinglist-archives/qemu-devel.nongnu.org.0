Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD17B69ECA7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 03:02:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUeQs-00032E-6c; Tue, 21 Feb 2023 21:00:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQn-00031n-Tt
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:29 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUeQl-00012z-WF
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 21:00:29 -0500
Received: by mail-pl1-x643.google.com with SMTP id z10so4019882ple.6
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 18:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MqYU95NN8Xf4YS/MJyjfopSwYd7y9AJ0N6L5EktbsfY=;
 b=HGU4moAlpXBL/SH9v2qkT7SAv2Db1J5uJ7lZxQMdejGtQUCS9g0KSV+/l5cGUVHeae
 cp6asUK7rEJfILBOTQL48wmnviutbPkJr4AjmLP9IOvFd75B14cZG7CxvLgak+EbN0se
 t2iDmgXNiGwW41fccwKf2uWqkGpmwriznOsDBrfKbsUuLwtRluRDXNxz0hMK6B2M7wx1
 V10u3R+qdBfIg0hdF7tc01RPst1Dv2bqAO6fQ+0rdUtE68XolkEHGlUDNm0vm6Qesyvs
 53AuTb2LUYm01UFlAnJG6MeiXeYdPbJlKQSjR2+aukAtDz3QBEz8e1qP/qTfYHbqctDd
 jxsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MqYU95NN8Xf4YS/MJyjfopSwYd7y9AJ0N6L5EktbsfY=;
 b=Iw62qy0mOnAca/Sj79WzGsLW63OSCFCmL9bvDfBZVP97ZBTTlcKu5ntmzxMa7bLi3w
 Lzj5dxEs64jQnzOvNUBQvN/nQBMO1TJsIzaDJi8gydnKToWGprwwwCzfgK6FGEo8vpd5
 q4GzzDiTXtKj9APhkzYFbx/X8VPzjgEghtndZdKEaN6/C5HpswhAmoganw3ajYUkWGHo
 v8VhTgFvCIJLCdiIjIiC3evKCxo7mp7lzihjgJjr+g0IhQbHIXFaaWSVh8w9YLcexO0M
 RyfJ2EYt83O7/dq7lPGy5wdL9R1UN4I2+Q+zVBrtIHZkxIboVKZZkQ4C4WzXjDXguQ6w
 CoYw==
X-Gm-Message-State: AO0yUKUCb8PUYokoOq0OAI4O+zrMevQNCs1etG8YOaPcWuL7sYCyDkyF
 R0GtmHspn+efsov+2BZQyua0RptEUepKx8gVMIdKqQ==
X-Google-Smtp-Source: AK7set8/vZW8U/ZZLCk9/tL695Ix/1jteHzAL8iJV+9fYUuKY4nA7rUTjs2umkq7N/5Ufdbz7iSkDQ==
X-Received: by 2002:a17:902:f547:b0:19a:81c1:e743 with SMTP id
 h7-20020a170902f54700b0019a81c1e743mr7943166plf.2.1677031226265; 
 Tue, 21 Feb 2023 18:00:26 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c10200b00189743ed3b6sm91468pli.64.2023.02.21.18.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:00:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 0/8] tcg patch queue
Date: Tue, 21 Feb 2023 16:00:15 -1000
Message-Id: <20230222020023.904232-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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

The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230221

for you to fetch changes up to dbd672c87f19949bb62bfb1fb3a97b9729fd7560:

  sysemu/os-win32: fix setjmp/longjmp on windows-arm64 (2023-02-21 13:45:48 -1000)

----------------------------------------------------------------
tcg: Allow first half of insn in ram, and second half in mmio
linux-user/sparc: SIGILL for unknown trap vectors
linux-user/microblaze: SIGILL for privileged insns
linux-user: Fix deadlock while exiting due to signal
target/microblaze: Add gdbstub xml
util: Adjust cacheflush for windows-arm64
include/sysemu/os-win32: Adjust setjmp/longjmp for windows-arm64

----------------------------------------------------------------
Ilya Leoshkevich (3):
      linux-user: Always exit from exclusive state in fork_end()
      cpus: Make {start,end}_exclusive() recursive
      linux-user/microblaze: Handle privileged exception

Pierrick Bouvier (2):
      util/cacheflush: fix cache on windows-arm64
      sysemu/os-win32: fix setjmp/longjmp on windows-arm64

Richard Henderson (3):
      accel/tcg: Allow the second page of an instruction to be MMIO
      linux-user/sparc: Raise SIGILL for all unhandled software traps
      target/microblaze: Add gdbstub xml

 include/hw/core/cpu.h                       |  4 +-
 include/sysemu/os-win32.h                   | 28 ++++++++++--
 target/microblaze/cpu.h                     |  2 +
 accel/tcg/translator.c                      | 12 +++++-
 cpus-common.c                               | 12 +++++-
 linux-user/main.c                           | 10 +++--
 linux-user/microblaze/cpu_loop.c            | 10 ++++-
 linux-user/sparc/cpu_loop.c                 |  8 ++++
 linux-user/syscall.c                        |  1 +
 target/microblaze/cpu.c                     |  7 ++-
 target/microblaze/gdbstub.c                 | 51 ++++++++++++++++------
 util/cacheflush.c                           | 14 ++++--
 configs/targets/microblaze-linux-user.mak   |  1 +
 configs/targets/microblaze-softmmu.mak      |  1 +
 configs/targets/microblazeel-linux-user.mak |  1 +
 configs/targets/microblazeel-softmmu.mak    |  1 +
 gdb-xml/microblaze-core.xml                 | 67 +++++++++++++++++++++++++++++
 gdb-xml/microblaze-stack-protect.xml        | 12 ++++++
 meson.build                                 | 21 +++++++++
 19 files changed, 229 insertions(+), 34 deletions(-)
 create mode 100644 gdb-xml/microblaze-core.xml
 create mode 100644 gdb-xml/microblaze-stack-protect.xml

