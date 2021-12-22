Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA3E47D32D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 14:49:33 +0100 (CET)
Received: from localhost ([::1]:40900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n01zo-0002sZ-Cm
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 08:49:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01wB-0008JQ-Kn; Wed, 22 Dec 2021 08:45:47 -0500
Received: from [2607:f8b0:4864:20::f33] (port=34454
 helo=mail-qv1-xf33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n01w7-0004ZV-7X; Wed, 22 Dec 2021 08:45:47 -0500
Received: by mail-qv1-xf33.google.com with SMTP id ke6so2360070qvb.1;
 Wed, 22 Dec 2021 05:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0g9s8OIvW2H4zuUtWZ1YgJgVS6lgCrt9UibX5UBJFs=;
 b=OkRWoMOlBkOAQ3KLfcWcBcZk68G7XU8MXpA4hmIgXP2B8ygeEmtxjAQMzKxZP++M8A
 Xt4YNYAYFnSMjA+uZP+UAFYiE9Wbh72YEwywok01nqkXeIuLOlqKbFxIXBkapqo7An52
 /ttscboLquCw7/BopFW9fonEbn2Ef2HHSrVPL4vHIU/Oq+I69kuTlxZWJxRIOoh9Oc5R
 suisUdPFAl4qy50myWG/ROURjxdfhi7N1QvjPfQUBhl2qsWllwYrA9nK2FMwRlR42MRb
 YNIq/UTPI3vLUoEidzVCpG53Zu3nPxX/amzMMznpfwBZm4WOM0rWZjxZPwymg7BBes8M
 /0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/0g9s8OIvW2H4zuUtWZ1YgJgVS6lgCrt9UibX5UBJFs=;
 b=INizTBdWX5zYFBg1HzJAP49T0SPr/eJwhXv03AVM/7+KYxs4Cs+o1YoLm6KTTLJ1W3
 55GGNwQ4M5hfepfLT2cvqhB+upfGn/G1mD2mOTfuABIA52x8vb6K3puWc2Vp0D59Mq6Z
 Q3xmAvadFjgTwzR/SkxmIv192kLk23kq1Ell/zQOvWb3I5t4J5axR8YFJ3IuyTPvZToZ
 i2K6qWLpcTV5fSPrKV/NPyI439JMVdXkMKsQ7f3yI71APa0qpVcSqa+5w58uob55+yIq
 iUH5VKnkf8vYsXkmDn9pZsRsnAMHOWdDTC+xMGQrQnWNa8/ftif+V7rKb2RAAmW8fdY7
 6XYw==
X-Gm-Message-State: AOAM532AnFzQzXJ8EW3QBy5/jAGC68TtuBo1s8/rgcCVddkkcueqQNMI
 vKdoepPgeEkbn/lYAtDYHRjWRgfTGW0=
X-Google-Smtp-Source: ABdhPJyu+snMkGKyFA4dR9l0kAAMrcclNYca13Wfn8AIvSXulGrFsarPgGgEDPF56EE0Bsu0fra1oA==
X-Received: by 2002:a05:6214:e43:: with SMTP id o3mr2420621qvc.1.1640180741508; 
 Wed, 22 Dec 2021 05:45:41 -0800 (PST)
Received: from rekt.ibmuc.com ([170.239.133.233])
 by smtp.gmail.com with ESMTPSA id j16sm1757054qtx.92.2021.12.22.05.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 05:45:41 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/8] Re-write PPC64 PMU instruction count using TCG Ops
Date: Wed, 22 Dec 2021 10:45:12 -0300
Message-Id: <20211222134520.587877-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Two days ago Richard Henderson reported test failures with Avocado and
powernv8/9 due to timeouts [1]. The culprit ended up to be commit , a
commit where I introduced PMU instruction counting for TCG PPC64.

For a reason that is still unclear to me these Avocado powernv tests are
suffering a huge performance impact after that patch, something that I
didn't verify in any other scenario I've tested. So one alternative to
fix the situation is to understand this difference and try to solve it,
which can take some time. 
 
Another alternative is to optimize the code introduced by that commit.
Today the instruction count is done by a TCG helper that is called after
each TB exit. I was aware that calling a helper frequently isn't
optimal, but that got the job done and didn't  hindered the use of
pSeries and powernv machines.  Well, until [1] at least.

This series rewrites the PMU instruction counting using TCG Ops instead
of a TCG helper. To do that we needed to write in TCG Ops not only the
logic for increment the counters but also the logic to detect counter
overflows.

A lot of code was added but the performance improvement is noticeable.
Using my local machine I did some test runs with the 2 Avocado powernv
tests that are timing out at this moment:

- failing Avocado powernv tests with current master:

 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.17 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.90 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (70.81 s)
 
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (75.62 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (69.79 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (72.33 s)

- after this series:

 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (39.90 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (38.25 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv8: PASS (37.99 s)

 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (43.17 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (43.64 s)
 (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_ppc_powernv9: PASS (44.21 s)


I've also tested this code with the EBB exception patch that is pending
re-send [2]. The EBB kernel selftests are working as expected. This
means that we improved the performance and didn't lost any PMU
capability we already have.


[1] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03486.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg00082.html


Daniel Henrique Barboza (8):
  target/ppc: introduce power8-pmu-insn-cnt.c.inc
  target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc5()
  target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc1()
  target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc2()
  target/ppc/power8-pmu-insn-cnt: add pmu_inc_pmc3()
  target/ppc/power8-pmu-insn-cnt.c: add pmu_inc_pmc4()
  target/ppc/power8-pmu-insn-cnt: add pmu_check_overflow()
  target/ppc/power8-pmu.c: remove helper_insns_inc()

 target/ppc/helper.h                  |   2 +-
 target/ppc/power8-pmu-insn-cnt.c.inc | 365 +++++++++++++++++++++++++++
 target/ppc/power8-pmu.c              |  60 +----
 target/ppc/translate.c               |  44 +---
 4 files changed, 372 insertions(+), 99 deletions(-)
 create mode 100644 target/ppc/power8-pmu-insn-cnt.c.inc

-- 
2.33.1


