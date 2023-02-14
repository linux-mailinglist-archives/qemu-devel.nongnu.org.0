Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA2695D4C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 09:41:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRqrV-0002UO-KH; Tue, 14 Feb 2023 03:40:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqrO-000259-2v
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:40:22 -0500
Received: from mga12.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRqrK-0002Jg-S4
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 03:40:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676364018; x=1707900018;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LaR4Hr8mY0U527XS41QgWIw0HM2JqCNxL3062BNFJ6M=;
 b=BYFO+eYbLDpsrvHjBfuMOCmgnzQFtXk80rSIk68cSp+VIAcHP5xxCb5v
 roWM31TvHfyUFQBAKr6Y0xYPtNTqHcbUsJ2xG8Kv4uJAqWBauCCmTEyr7
 NagMb8BUZXUSvdNmIEVsOFdIzafgmE29hWtPY6NhI5Dqy3C1zocTgUPWj
 5UwhtZlyCTuUdeR+2S6VeLtTgUYDZ1mOtazlR+G0JwkKoXMc20N8FzugA
 +IGnj1iWZipDpj8Xsn06ZsO8NSekBA/ufzt10CqC3MVrolVh1qFc2efqX
 XRoWBu4V5Rc+QV7uNpXjUAldmMFNjvI4xJAXs4xW6Kd8ScouyJ2f39rle A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="310743930"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="310743930"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 00:40:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="778232770"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="778232770"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga002.fm.intel.com with ESMTP; 14 Feb 2023 00:40:12 -0800
Date: Tue, 14 Feb 2023 16:48:00 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC 00/52] Introduce hybrid CPU topology
Message-ID: <Y+tKwN6Y1HKaeXMz@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <87y1p1c18a.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1p1c18a.fsf@linaro.org>
Received-SPF: none client-ip=192.55.52.136;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga12.intel.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Mon, Feb 13, 2023 at 10:14:22AM +0000, Alex Bennée wrote:
> Date: Mon, 13 Feb 2023 10:14:22 +0000
> From: Alex Bennée <alex.bennee@linaro.org>
> Subject: Re: [RFC 00/52] Introduce hybrid CPU topology
> 
> 
> Zhao Liu <zhao1.liu@linux.intel.com> writes:
> 
> > From: Zhao Liu <zhao1.liu@intel.com>
> >
> > Hi list,
> >
> > This RFC series is to introduce hybrid topology in QEMU, and is based
> > on our previous patches about cluster support for x86 [1] ([PATCH RESEND
> > 00/18] Support smp.clusters for x86).
> >
> > Though our cluster support patches [1] has not yet accepted, we are
> > still posting the hybrid topology support patches in advance, hoping to
> > get discussion and feedbacks.
> >
> > In this RFC series, we mainly have the following work:
> > * Introduce the new cpu topology under heterogeneous architecture, which
> >   we called "hybrid" cpu topology.
> >       - since the name "hmp" is already used in QEMU and "hybrid" is
> >         also a synonym for heterogeneous.
> > * Reorganized the relevant topology information in qemu to adapt to the
> >   hybrid topology.
> > * Introduce a new command "hybrid", which allows user to set a custom
> >   hybrid topology.
> >       - currently limited to custom cluster and custom core
> > * Support hybrid topology in i386 PC machine.
> > * Expose basic topology information (topology type and core type) in
> >   query_cpus_fast.
> >
> > We hope that the hybrid topology can be general enough to be compatible
> > with the needs of hybrids with various architectures in the future.
> >
> > Welcome your feedbacks!
> >
> >
> > # 1. Background
> >
> > Heterogeneous computing refers to systems that use more than one kind of
> > processor or cores [2]. Now there are more and more heterogeneous
> > computing architectures, typically including arm's big.LITTLE [3] and
> > intel hybrid architecture [4].
> >
> > The development of heterogeneous computing brings new challenges to
> > virtualization. The first problem we face is how to support the vCPU
> > topology under the heterogeneous architecture.
> >
> > Here, to distinguish it from "smp" cpu topology, we call it "hybrid" cpu
> > topology.
> >
> >
> > # 2. Motivation
> >
> > In a typical hybrid system, different types of core may have different
> > capabilities. This difference may be reflected in different capacities,
> > performance or power efficiencies, and even different instruction-per-
> > cycle (IPC) capabilities. The direct consequence of these differences is
> > to affect the performance of the workload.
> 
> This elides a use case for heterogeneous computing under emulation where
> different cores can have totally different ISA's. We already support
> emulation models where we have varying classes of the same ISA, for
> example xlnx-zyncmp supports 4 A profile and 2 R profile Arm chips.

This is emulation mode, so you also need to define heterogeneous CPU
topology in this case, right?

> 
> I've glanced over the patch set and I don't think there is any direct
> clash with that as this is mainly about representing the topology for
> x86 non-emulation accelerators but I just want ensure we don't end up
> stepping on each others toes.

Yes, this is for non-emulation case.

> 
> > For a virtual machines, vCPUs are just threads, although we can bind
> > vCPUs to different cores to benefit from the different advantages of
> > these physical cores, it's obviously not enough since CPU topology (and
> > cache topology) will still have a significant impact on scheduling
> > performance.
> >
> <snip>
> > ## 3.3. "-hybrid" command
> >
> > For hybrid cpu topology configuration, the original "-smp" lack of
> > flexibility to expand, and unables to customize different cores.
> >
> > So we introduce "-hybrid" command and implement it as the multi-
> > line command. The multi-line command format is more complex than the
> > single-line one, but it can bring stronger scalability and
> > intuitiveness. In the future, it can also be easily extended to more
> > heterogeneous topology levels.
> >
> > "-hybrid" command is as follows:
> >
> > -hybrid socket,sockets=n
> > -hybrid die,dies=n
> > -hybrid cluster,clusters=n
> > -hybrid core,cores=n,type=core_type[,threads=threads]
> >         [,clusterid=cluster]
> >
> > Here, we first define the corresponding qapi options for these 4
> > topology levels: core, cluster, die and socket.
> >
> > We doesn't need a thread level since thread doesn't have different
> > type.
> >
> > For example:
> >
> > -hybrid socket,sockets=1
> > -hybrid die,dies=1
> > -hybrid cluster,clusters=4
> > -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
> > -hybrid core,cores=4,coretype="atom",threads=1
> >
> > Here we can build a hybrid cpu topology, which has 1 socket, 1 die per
> > socket, 4 clusters per die. And in each die, every clusters has 4 "atom"
> > core with 1 threads, and cluster0, cluster1 and cluster2 have 1 "core"
> > cores with 2 threads.
> >
> > Please note this example is not an actual machine topology, but it shows
> > the powerful flexibility of "hybrid" command.
> 
> Is there any intention to apply this command to emulation or will it
> only be for hardware virtualisation? For example the x86 translator
> should be capable of emulating two different classes of x86 with
> different subsets of instructions.

We have not considered the hybrid case in emulation mode, and
the current hybrid CPUs of intel are same-ISA.

> It requires ensuring each CPU is
> assigned to the correct TYPE_CPU_CLUSTER so we don't re-use TBs from
> the "wrong" CPU.

From my understanding, this also seems like the topology of heterogeneous
core and heterogeneous cluster.

Zhao

> 
> <snip>
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro

