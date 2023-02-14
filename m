Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7D695EE3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 10:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRrXL-000739-0e; Tue, 14 Feb 2023 04:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRrXI-00072x-MB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:23:40 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRrXG-0007BX-Ft
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 04:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676366618; x=1707902618;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J69rc5RMdtghgykKPDDa30FasMok3YWVlZ2fe6553vg=;
 b=dDY5yhgiEFEcFdVmqVgTxDM7+sTPpHNNX6GtIRp0WLbIF6CadulVmHIo
 UcESlfdsTT3Y2pfCsx54NV3fyQUxIVWB1EOoLefIGLmjhZjcg5CZjfpxW
 pjByn91G674QmUu9kUGNEnrADAskrv+7m2lA5FYz/3Z0FCP+G+45mj7QS
 7ANoUMj69at6eiJ5v41Nkn3RvcrUMh3MF3vy8omvdckBYV8Hh1oSjntfi
 U8D9MOGPZ6ZvsED1Ca7LoqOxMdxsoMVDm6XMSaz8vBZNbdzuEtaKEe5ho
 ol2gMGQUuSVw9jxtK5Mv6RQWO7/EzuflqdXYPtvrYJDg32o4Oc6GM9hgD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393521295"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="393521295"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 01:23:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="914680007"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="914680007"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2023 01:23:07 -0800
Date: Tue, 14 Feb 2023 17:30:55 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Zhenyu Wang <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@intel.com>,
 Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
Message-ID: <Y+tUzz22eOaCqV8g@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-7-zhao1.liu@linux.intel.com>
 <d0fa7c07-824a-6dfb-2eaf-2e8f72aa7ad6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0fa7c07-824a-6dfb-2eaf-2e8f72aa7ad6@linaro.org>
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga06.intel.com
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

On Mon, Feb 13, 2023 at 02:10:17PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:10:17 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 06/52] hw/cpu: Introduce hybrid CPU topology
> 
> On 13/2/23 10:49, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > For smp systems, the parts in one topology level are the same. But now
> > there are more and more systems with hybrid architectures. Different
> > parts of the same topology level may have differences. For example,
> > Intel's Alder Lake series CPU has two types of cores, so the CPU
> > topology is no longer symmetrical.
> > 
> > The hybrid topology is compatible with the smp topology type, that is,
> > different parts on the same level of the hybrid topology can set to be
> > the same, but the hybrid topology will introduce more complexity (need
> > to allocate more memory, organized with array or linked-list), so the
> > original smp topology support is retained while introducing the hybrid
> > topology, and the hybrid topology is only built when the hybrid is
> > explicitly required.
> > 
> > Therefore, we introduce the definition support of hybrid cpu topology
> > here. At the same time, in order to unify with the original smp, we
> > introduce a new cpu topology structure that can support smp topology
> > or hybrid topology. This structure will replace the CpuTopology type (in
> > include/hw/boards.h) used by MachineState.smp.
> > 
> > As for now, we only support two hybrid topology levels: core and
> > cluster.
> > 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   MAINTAINERS                   |   1 +
> >   include/hw/cpu/cpu-topology.h | 117 ++++++++++++++++++++++++++++++++++
> >   qapi/machine.json             |  12 ++++
> >   3 files changed, 130 insertions(+)
> >   create mode 100644 include/hw/cpu/cpu-topology.h
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 58794885ced3..918a9418d98e 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1742,6 +1742,7 @@ F: qapi/machine-target.json
> >   F: include/hw/boards.h
> >   F: include/hw/core/cpu.h
> >   F: include/hw/cpu/cluster.h
> > +F: include/hw/cpu/cpu-topology.h
> >   F: include/sysemu/numa.h
> >   F: tests/unit/test-smp-parse.c
> >   T: git https://gitlab.com/ehabkost/qemu.git machine-next
> 
> Worth splitting this section in 2, machine VS numa/clusters?

Do you mean splitting this header file into numa.h and cluster.h?

It seems that the cpu topology is not related to the content of
numa.h, and it may be possible to merge some content into cluster.h,
but the definition in cluster.h is to use the cluster as a device
(if I understand correctly...) , and cpu_topology.h is just about
topology-related things.

I have not included the contents of cluster.h/cluster.c into hybrid
considerations, but only modified the topology defined by smp.

Zhao

