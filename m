Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F7869EEC4
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 07:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUidc-0001zo-Uc; Wed, 22 Feb 2023 01:30:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pUidU-0001xJ-GK
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:29:52 -0500
Received: from mga03.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pUidR-0000sg-Qo
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 01:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677047389; x=1708583389;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CIV3UFgGfWsw1EW47VtBvp1vwnvUoWDZioXlQPzeSJI=;
 b=fIW2ZFVg9/XwrA6Rn8JkiW2HXXw+qmgbQFhegymrQIiIvhpRHBxjW4M1
 kYbK9A86TOhmTGipwiHrGvpBzydDGb4cLCZ7W7s296+TRpYMNV6FuPIwl
 Gc/W+n9MBZ1wGP5pEN7lx3DUdlnHPHiGx6chCpuip2yOQCOpsuvbZjkZM
 7L14DsuoqZd0KEYJqe7zj0Ha+kitMsS2VpI2wE2hQWTkhLtMx1zkoNwU8
 FgTIMkVwOprOQUjnrkrBzhP9HwrkImtYLSHxE/pXe4xwOpkMQzA8KlTIY
 PWtUqx8e8T3sQsg+2plodcFbsu5S00cQ0a3M+9NF6bZQHHDOI0dAstZxj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="335044594"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="335044594"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 22:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="673989680"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; d="scan'208";a="673989680"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga007.fm.intel.com with ESMTP; 21 Feb 2023 22:29:36 -0800
Date: Wed, 22 Feb 2023 14:37:32 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs in
 CPUID.04H
Message-ID: <Y/W4LFqvUbsleBAf@liuzhao-OptiPlex-7080>
References: <20230213093625.158170-1-zhao1.liu@linux.intel.com>
 <20230213093625.158170-5-zhao1.liu@linux.intel.com>
 <e7d7f1a0-15ac-d863-625f-08e66667e4ec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7d7f1a0-15ac-d863-625f-08e66667e4ec@intel.com>
Received-SPF: none client-ip=134.134.136.65;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga03.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Xiaoyao,

Thanks, I've spent some time thinking about it here.

On Mon, Feb 20, 2023 at 02:59:20PM +0800, Xiaoyao Li wrote:
> Date: Mon, 20 Feb 2023 14:59:20 +0800
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> Subject: Re: [PATCH RESEND 04/18] i386/cpu: Fix number of addressable IDs
>  in CPUID.04H
> 
> On 2/13/2023 5:36 PM, Zhao Liu wrote:
> > For i-cache and d-cache, the maximum IDs for CPUs sharing cache (
> > CPUID.04H.00H:EAX[bits 25:14] and CPUID.04H.01H:EAX[bits 25:14]) are
> > both 0, and this means i-cache and d-cache are shared in the SMT level.
> > This is correct if there's single thread per core, but is wrong for the
> > hyper threading case (one core contains multiple threads) since the
> > i-cache and d-cache are shared in the core level other than SMT level.
> > 
> > Therefore, in order to be compatible with both multi-threaded and
> > single-threaded situations, we should set i-cache and d-cache be shared
> > at the core level by default.
> 
> It's true for VM only when the exactly HW topology is configured to VM.
> i.e., two virtual LPs of one virtual CORE are pinned to two physical LPs
> that of one physical CORE.

Yes, in this case, host and guest has the same topology, and their
topology can match.

> Otherwise it's incorrect for VM.

My understanding here is that what we do in QEMU is to create
self-consistent CPU topology and cache topology for the guest.

If the VM topology is self-consistent and emulated to be almost
identical to the real machine, then the emulation in QEMU is correct,
right? ;-)

> 
> for example. given a VM of 4 threads and 2 cores. If not pinning the 4
> threads to physical 4 LPs of 2 CORES. It's likely each vcpu running on a LP
> of different physical cores.

Thanks for bringing this up, this is worth discussing.

I looked into it and found that the specific scheduling policy for the
vCPU actually depends on the host setting. For example, (IIUC) if host

enables core scheduling, then host will schedule the vCPU on the SMT
threads of same core.

Also, to explore the original purpose of the "per thread" i/d cache
topology, I have retraced its history.

The related commit should be in '09, which is 400281a (set CPUID bits
to present cores and threads topology). In this commit, the
multithreading cache topology is added in CPUID.04H. In particular, here
it set the L2 cache level to per core, but it did not change the level of
L1 (i/d cache), that is, L1 still remains per thread.

I think that here is the problem, L1 should also be per core in
multithreading case. (the fix for this patch is worth it?)

Another thing we can refer to is that AMD's i/d cache topology is per
core rather than per thread (different CPUID leaf than intel): In
encode_cache_cpuid8000001d() (target/i386/cpu.c), i/d cache and L2
are encoded as core level in EAX. They set up the per core supposedly
to emulate the L1 topology of the real machine as well.

So, I guess this example is "unintentionally" benefiting from the
"per thread" level of i/d cache.

What do you think?

> So no vcpu shares L1i/L1d cache at core level.

Yes. The scheduling of host is not guaranteed, and workload balance
policies in various scenarios and some security mitigation ways may
break the delicate balance we have carefully set up.

Perhaps another way is to also add a new command "x-l1-cache-topo" (like
[1] did for L2) that can adjust the i/d cache level from core to smt to
benefit cases like this.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03201.html

Thanks,
Zhao


