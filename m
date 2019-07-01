Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB254B056
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 05:06:28 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdQvb-0007it-5p
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 23:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42586)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <like.xu@linux.intel.com>) id 1hdQud-0007HS-8b
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 23:05:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <like.xu@linux.intel.com>) id 1hdQub-0001wG-JC
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 23:05:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:23164)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
 id 1hdQub-0001og-As
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 23:05:25 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 20:05:16 -0700
X-IronPort-AV: E=Sophos;i="5.63,391,1557212400"; d="scan'208";a="170432874"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.132])
 ([10.239.196.132])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 18 Jun 2019 20:05:15 -0700
To: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
References: <20190612084104.34984-1-like.xu@linux.intel.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <1a1d0639-a46a-3af2-abb7-01d9e0105de6@linux.intel.com>
Date: Wed, 19 Jun 2019 11:05:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612084104.34984-1-like.xu@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-devel] [PATCH v3 0/9] Introduce cpu die topology and
 enable CPUID.1F for i386
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping for timely review.

On 2019/6/12 16:40, Like Xu wrote:
> Multi-chip packaging technology allows integration of multi-cores in one die
> and multi-dies in one single package, for example Intel CLX-AP or AMD EPYC.
> 
> This patch series extend the CPU topology to the socket/dies/core/thread model,
> allowing the setting of dies number per one socket on -smp qemu command. For
> i386, it upgrades APIC_IDs generation and reversion functions with a new exposed
> leaf called CPUID.1F, which is a preferred superset to leaf 0BH. The CPUID.1F
> spec is on https://software.intel.com/en-us/articles/intel-sdm, 3-190 Vol 2A.
> 
> E.g. we use -smp 4,dies=2,cores=2,threads=1 to run a multi-dies guest and
> check raw cpuid data and the expected output from guest is following:
> 0x0000001f 0x00: eax=0x00000000 ebx=0x00000001 ecx=0x00000100 edx=0x00000002
> 0x0000001f 0x01: eax=0x00000001 ebx=0x00000002 ecx=0x00000201 edx=0x00000001
> 0x0000001f 0x02: eax=0x00000002 ebx=0x00000004 ecx=0x00000502 edx=0x00000003
> 0x0000001f 0x03: eax=0x00000000 ebx=0x00000000 ecx=0x00000003 edx=0x00000001
> 
> Guest system could discover multi-die/package topology through CPUID.1F.
> and its benefit is primarily for _reporting_ of the (virtual) CPU topology.
> The guest kernel with multi-die/package support have no impact on its
> cache topology, NUMA topology, Linux scheduler, or system performance.
> 
> ==changelog==
> 
> v3:
> 
> - add a MachineClass::smp_parse function pointer
> - place the PC-specific function inside hw/i386/pc.c
> - introduce die_id in a separate patch with default value 0
> - set env->nr_dies in pc_new_cpu() and pc_cpu_pre_plug()
> - fix a circular dependency between target/i386/cpu.c and hw/i386/pc.c
> - fix cpu->die_id check in pc_cpu_pre_plug()
> - Based on "[PATCH v3 00/10] Refactor cpu topo into machine properties"
> - Rebase to commit 219dca61ebf41625831d4f96a720852baf44b762
> 
> v2: https://patchwork.kernel.org/cover/10953191/
> 
> - Enable cpu die-level topolgy only for PCMachine and X86CPU
> - Minimize cpuid.0.eax to the setting value actually used by guest
> - Update cmd line -smps docs for die-level configurations
> - Refactoring topo-bit tests for x86_apicid_from_cpu_idx() with nr_dies
> - Based on "[PATCH v3 00/10] Refactor cpu topo into machine properties"
> - Rebase to commit 2259637b95bef3116cc262459271de08e038cc66
> 
> v1: https://patchwork.kernel.org/cover/10876667/
> 
> Like Xu (9):
>    i386: Add die-level cpu topology to x86CPU on PCMachine
>    hw/i386: Adjust nr_dies with configured smp_dies for PCMachine
>    i386/cpu: Consolidate die-id validity in smp context
>    i386: Update new x86_apicid parsing rules with die_offset support
>    tests/x86-cpuid: Update testcases in test_topo_bits() with multiple dies
>    i386/cpu: Add CPUID.1F generation support for multi-dies PCMachine
>    target/i386: Support multi-dies when host doesn't support CPUID.1F
>    machine: Refactor smp_parse() in vl.c as MachineClass::smp_parse()
>    vl.c: Add -smp, dies=* command line support and update doc
> 
>   hmp.c                      |   3 +
>   hw/core/machine.c          |  89 ++++++++++++++++++++++
>   hw/i386/pc.c               | 148 ++++++++++++++++++++++++++++++++-----
>   include/hw/boards.h        |   5 ++
>   include/hw/i386/pc.h       |   3 +
>   include/hw/i386/topology.h |  76 +++++++++++++------
>   qapi/misc.json             |   6 +-
>   qemu-options.hx            |  17 +++--
>   target/i386/cpu.c          |  53 +++++++++++--
>   target/i386/cpu.h          |   7 ++
>   target/i386/kvm.c          |  36 ++++++++-
>   tests/test-x86-cpuid.c     |  84 +++++++++++----------
>   vl.c                       |  78 ++-----------------
>   13 files changed, 438 insertions(+), 167 deletions(-)
> 


