Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B56EAB6E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:23:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqjX-0007Vl-EA; Fri, 21 Apr 2023 09:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqjN-0007VV-TX
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:23:19 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqjL-0002oF-Iz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083395; x=1713619395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eeOfRLyKAMolH2J+MZMN9zTBisj3GtI7JokZB0u33oQ=;
 b=muQOqp3DuNu2GS9qtEbkk8lY3q7pVlDNzv3Z5/YGPigRVmYqgxguxFfw
 ygMNVxJCnArllMNFoHojFvuom5cRHhzTc96qRlJonPu3PrCimVQUTAITF
 IBfUO3wQzIwtgK8UXUv3u4XdCu/I+3PxGpdhStE65In1tkGsZhjb0tGwz
 0hudIx+tuJFqCN01EVlDCyXMnE6stZyJk9h4mytiZnYLt4YxKLzYrD99n
 H1yLYcbReG4Ubs90LennoCsEHLiyWNvYzusjSPhc8RRvcmQE39Tglyv7c
 ne8Rse6GubnH5mbiN9puQOuvGydjZDPh+pqEeJeYtuqbnh4GPA2eryhnx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432267949"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432267949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756905526"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756905526"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:23:08 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: Fei Wu <fei2.wu@intel.com>
Subject: [PATCH v11 00/14] TCG code quality tracking
Date: Fri, 21 Apr 2023 21:24:07 +0800
Message-Id: <20230421132421.1617479-1-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch series were done by Vanderson and Alex originally in 2019, I
(Fei Wu) rebased them on latest upstream from:
    https://github.com/stsquad/qemu/tree/tcg/tbstats-and-perf-v10
and send out this review per Alex's request, I will continue to address
any future review comments here. As it's been a very long time and there
are lots of conflicts during rebase, it's my fault if I introduce any
problems during the process.

Alex in his v10 series has addressed part of v9 comments:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg650258.html
and I tried to figure out some others. It looks to me not all of v9
comments had made complete agreement and I didn't join that discussion
then, so please comment to this series and I will fix them up if
necessary.


Alex Bennée (5):
  accel/tcg: move profiler dev_time to tb_stats
  accel/tcg: convert profiling of restore operations to TBStats
  accel/tcg: convert profiling of code generation to TBStats
  tb-stats: reset the tracked TBs on a tb_flush
  configure: remove the final bits of --profiler support

Vanderson M. do Rosario (9):
  accel/tcg: introduce TBStatistics structure
  accel: collecting TB execution count
  accel: collecting JIT statistics
  accel: replacing part of CONFIG_PROFILER with TBStats
  accel: adding TB_JIT_TIME and full replacing CONFIG_PROFILER
  debug: add -d tb_stats to control TBStatistics collection:
  monitor: adding tb_stats hmp command
  Adding info [tb-list|tb] commands to HMP (WIP)
  tb-stats: dump hot TBs at the end of the execution

 accel/tcg/cpu-exec.c          |   6 +
 accel/tcg/meson.build         |   1 +
 accel/tcg/monitor.c           | 133 +++++--
 accel/tcg/tb-context.h        |   1 +
 accel/tcg/tb-hash.h           |   7 +
 accel/tcg/tb-maint.c          |  20 +
 accel/tcg/tb-stats.c          | 689 ++++++++++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops.c     |  15 +-
 accel/tcg/tcg-runtime.c       |   8 +
 accel/tcg/tcg-runtime.h       |   2 +
 accel/tcg/translate-all.c     | 147 ++++++--
 accel/tcg/translator.c        |  13 +
 disas.c                       |  31 +-
 hmp-commands-info.hx          |  16 +
 hmp-commands.hx               |  16 +
 include/exec/exec-all.h       |   3 +
 include/exec/gen-icount.h     |   2 +
 include/exec/tb-stats-dump.h  |  21 ++
 include/exec/tb-stats-flags.h |  32 ++
 include/exec/tb-stats.h       | 165 ++++++++
 include/monitor/hmp.h         |   3 +
 include/qemu/log-for-trace.h  |   6 +-
 include/qemu/log.h            |   3 +
 include/qemu/timer.h          |   5 +-
 include/tcg/tcg.h             |  50 ++-
 linux-user/exit.c             |   2 +
 meson.build                   |   2 -
 meson_options.txt             |   2 -
 scripts/meson-buildoptions.sh |   3 -
 softmmu/runstate.c            |  10 +-
 stubs/meson.build             |   1 +
 stubs/tb-stats.c              |  32 ++
 tcg/tcg.c                     | 224 +++--------
 util/log.c                    | 103 ++++-
 34 files changed, 1482 insertions(+), 292 deletions(-)
 create mode 100644 accel/tcg/tb-stats.c
 create mode 100644 include/exec/tb-stats-dump.h
 create mode 100644 include/exec/tb-stats-flags.h
 create mode 100644 include/exec/tb-stats.h
 create mode 100644 stubs/tb-stats.c

-- 
2.25.1


