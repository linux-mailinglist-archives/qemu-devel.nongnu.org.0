Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0BE687966
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:47:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNW7q-0006T5-9E; Thu, 02 Feb 2023 04:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW7l-0006Rk-UF
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:23 -0500
Received: from mga02.intel.com ([134.134.136.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pNW7j-0006Mx-Gu
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675330999; x=1706866999;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ptCll99Q+fFM9nAaNi9xgFc8ub/4Xjdf9TH0yZCmhq8=;
 b=Suq6SouBoFvb63dzmCopz1dxeflUj6Zcdp0HHWG5HzvcozwFdHJlLr2g
 BZh0WYyyl0Pd54ZmbjDUWlQ47R81AgV08V3a0f0g/d8Wyiry+fU2TPYol
 oWaaXCha9hmaVuPDgSexncipVQdyln69qrb84GdBfprROTRbKfBLBRtJ/
 Nmuqx0SChpGamjaKRMZOEDWWiaj7OwrtSeiVT3rjDgC8OEIoQqjZZOK5d
 LSXVeAv2USQ+evtTxDq3lw1o7G39iLzFnRB4fu/2a5vOj4ap6+H/r49UZ
 qqNTqGcb2Nr958FSA8u9m4xAzsBlJPfCl1dCXytmeA2ViaYqfq97G2gjS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="316401864"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="316401864"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 01:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807909364"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="807909364"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by fmsmga001.fm.intel.com with ESMTP; 02 Feb 2023 01:41:55 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 00/18] Support smp.clusters for x86
Date: Thu,  2 Feb 2023 17:49:11 +0800
Message-Id: <20230202094929.343799-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.20;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga02.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: Zhao Liu <zhao1.liu@intel.com>

Hi list,

This series is based on 13356ed (Merge tag 'block-pull-request' of
https://gitlab.com/stefanha/qemu into staging), and adds the cluster
support for x86 PC machine, which allows x86 can use smp.clusters
to configure the modlue level CPU topology of x86.

And since the compatibility issue (see section: ## Why not share L2
cache in cluster directly), this series also introduce a new command
to adjust the topology of the x86 L2 cache.

Welcome your comments!


# Backgroud

The "clusters" parameter in "smp" is introduced by ARM [1], but x86
hasn't supported it.

At present, x86 defaults L2 cache is shared in one core, but this is
not enough. There're some platforms that multiple cores share the
same L2 cache, e.g., Alder Lake-P shares L2 cache for one module of
Atom cores [2], that is, every four Atom cores shares one L2 cache.
Therefore, we need the new CPU topology level (cluster/module).

Another reason is for hybrid architecture. cluster support not only
provides another level of topology definition in x86, but would aslo
provide required code change for future our hybrid topology support.


# Overview

## Introduction of module level for x86

"cluster" in smp is the CPU topology level which is between "core" and
die.

For x86, the "cluster" in smp is corresponding to the module level [3],
which is above the core level. So use the "module" other than "cluster"
in x86 code.

And please note that x86 already has a cpu topology level also named
"cluster" [3], this level is at the upper level of the package. Here,
the cluster in x86 cpu topology is completely different from the
"clusters" as the smp parameter. After the module level is introduced,
the cluster as the smp parameter will actually refer to the module level
of x86.


## Why not share L2 cache in cluster directly

Though "clusters" was introduced to help define L2 cache topology
[1], using cluster to define x86's L2 cache topology will cause the
compatibility problem:

Currently, x86 defaults that the L2 cache is shared in one core, which
actually implies a default setting "cores per L2 cache is 1" and
therefore implicitly defaults to having as many L2 caches as cores.

For example (i386 PC machine):
-smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16 (*)

Considering the topology of the L2 cache, this (*) implicitly means "1
core per L2 cache" and "2 L2 caches per die".

If we use cluster to configure L2 cache topology with the new default
setting "clusters per L2 cache is 1", the above semantics will change
to "2 cores per cluster" and "1 cluster per L2 cache", that is, "2
cores per L2 cache".

So the same command (*) will cause changes in the L2 cache topology,
further affecting the performance of the virtual machine.

Therefore, x86 should only treat cluster as a cpu topology level and
avoid using it to change L2 cache by default for compatibility.


## module level in CPUID

Currently, we don't expose module level in CPUID.1FH because currently
linux (v6.2-rc6) doesn't support module level. And exposing module and
die levels at the same time in CPUID.1FH will cause linux to calculate
wrong die_id. The module level should be exposed until the real machine
has the module level in CPUID.1FH.

We can configure CPUID.04H.02H (L2 cache topology) with module level by
a new command:

        "-cpu,x-l2-cache-topo=cluster"

More information about this command, please see the section: "## New
property: x-l2-cache-topo".


## New cache topology info in CPUCacheInfo

Currently, by default, the cache topology is encoded as:
1. i/d cache is shared in one core. 
   * In fact, the original is SMT level, which will be changed to core
     level in the patch: [PATCH 04/18] i386/cpu: Fix number of
     addressable IDs in CPUID.04H).
2. L2 cache is shared in one core.
3. L3 cache is shared in one die.

This default general setting has caused a misunderstanding, that is, the
cache topology is completely equated with a specific cpu topology, such
as the connection between L2 cache and core level, and the connection
between L3 cache and die level.

In fact, the settings of these topologies depend on the specific
platform and are not static. For example, on Alder Lake-P, every
four Atom cores share the same L2 cache [2].

Thus, in this patch set, we explicitly define the corresponding cache
topology for different cpu models and this has two benefits:
1. Easy to expand to new CPU models in the future, which has different
   cache topology.
2. It can easily support custom cache topology by some command (e.g.,
   x-l2-cache-topo).


## New property: x-l2-cache-topo

The property l2-cache-topo will be used to change the L2 cache topology
in CPUID.04H.

Now it allows user to set the L2 cache is shared in core level or
cluster level.

If user passes "-cpu x-l2-cache-topo=[core|cluster]" then older L2 cache
topology will be overrided by the new topology setting.

Since CPUID.04H is used by intel cpus, this property is available on
intel cpus as for now.

When necessary, it can be extended to CPUID[0x8000001D] for amd cpus.


# Patch description

patch 1-5 Cleanups and fixes related to subsequent changes.

patch 6-13 Add the module as the new CPU topology level in x86, and it
           is corresponding to the cluster level in generic code.

patch 14-17 Add cache topology infomation in cache models.

patch 18 Introduce a new command to configure L2 cache topology.


[1]: https://patchew.org/QEMU/20211228092221.21068-1-wangyanan55@huawei.com/
[2]: https://www.intel.com/content/www/us/en/products/platforms/details/alder-lake-p.html
[3]: SDM, vol.3, ch.9, 9.9.1 Hierarchical Mapping of Shared Resources.
---
Zhao Liu (10):
  machine: Fix comment of machine_parse_smp_config()
  tests: Rename test-x86-cpuid.c to test-x86-apicid.c
  i386/cpu: Fix number of addressable IDs in CPUID.04H
  i386/cpu: Consolidate the use of topo_info in cpu_x86_cpuid()
  i386: Fix comment style in topology.h
  i386: Add cache topology info in CPUCacheInfo
  i386: Use CPUCacheInfo.share_level to encode CPUID[4].EAX[bits 25:14]
  i386: Fix NumSharingCache for CPUID[0x8000001D].EAX[bits 25:14]
  i386: Use CPUCacheInfo.share_level to encode
    CPUID[0x8000001D].EAX[bits 25:14]
  i386: Add new property to control L2 cache topo in CPUID.04H

Zhuocheng Ding (8):
  softmmu: Fix CPUSTATE.nr_cores' calculation
  i386: Introduce module-level cpu topology to CPUX86State
  i386: Support modules_per_die in X86CPUTopoInfo
  i386: Support module_id in X86CPUTopoIDs
  i386: Update APIC ID parsing rule to support module level
  i386/cpu: Introduce cluster-id to X86CPU
  tests: Add test case of APIC ID for module level parsing
  hw/i386/pc: Support smp.clusters for x86 PC machine

 MAINTAINERS                                   |   2 +-
 hw/core/machine-smp.c                         |   7 +-
 hw/i386/pc.c                                  |   1 +
 hw/i386/x86.c                                 |  49 +++++-
 include/hw/core/cpu.h                         |   2 +-
 include/hw/i386/topology.h                    |  68 +++++---
 qemu-options.hx                               |  10 +-
 softmmu/cpus.c                                |   2 +-
 target/i386/cpu.c                             | 146 ++++++++++++++----
 target/i386/cpu.h                             |  25 +++
 tests/unit/meson.build                        |   4 +-
 .../{test-x86-cpuid.c => test-x86-apicid.c}   |  58 ++++---
 12 files changed, 275 insertions(+), 99 deletions(-)
 rename tests/unit/{test-x86-cpuid.c => test-x86-apicid.c} (73%)

-- 
2.34.1


