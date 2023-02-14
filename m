Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E206966CD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 15:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRwGL-0000fk-43; Tue, 14 Feb 2023 09:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRwGI-0000er-6D
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:26:26 -0500
Received: from mga17.intel.com ([192.55.52.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRwGC-0003IJ-42
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 09:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676384780; x=1707920780;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+8dSulfGrpobpRQJ8aMCMcMVqPhs3SvEviXKcKDg7FM=;
 b=R4iki1dE0FBH5A+XFm5Ms1uJ1jzIXWeqqqEA9IAQY2GB4mTWEm1AE5uo
 KjwyVAGfyEjacYxjPxZNdgHrKE767MrW4axsQxihAiBRIi+okB6kqLQed
 CtGs9K9Q7/8JH4Ou/7MbIQw2YuAr/GPjk80UUUo1GMfqqGcZK4Pzq4+o1
 e/ajPRR1B28MoGi4SvkCA3pAl+Tp6gv7MJbGhYrfDNvEfQdkPgCs1HXqv
 mqpQD0+tyhgHaOFUaCbBUlO9nicy3Qp2RnWXLUwXzqGSKJgjdfNhWkYRD
 dpINJy/mR4+jwSM1S0JTpJCNvZGI92m6P4/AN5hYkLhJnNbPA66kPd8zC w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311529140"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="311529140"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 06:26:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="646781662"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; d="scan'208";a="646781662"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2023 06:26:11 -0800
Date: Tue, 14 Feb 2023 22:33:59 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>,
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
Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
Message-ID: <Y+ub166+r4QUnm4v@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-42-zhao1.liu@linux.intel.com>
 <7d7c7914-ea9e-051f-2f86-840b251be5a9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d7c7914-ea9e-051f-2f86-840b251be5a9@linaro.org>
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga17.intel.com
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

On Mon, Feb 13, 2023 at 02:33:22PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Mon, 13 Feb 2023 14:33:22 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: Re: [RFC 41/52] machine: Introduce core_type() hook
> 
> On 13/2/23 10:50, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
> > 
> > Since supported core types are architecture specific, we need this hook
> > to allow archs define its own parsing or validation method.
> > 
> > As the example, add the x86 core_type() which will be used in "-hybrid"
> > parameter parsing.
> 
> What would be a "core type" for other archs?

For intel, core type refers to the CPUID.1AH, and it is different with
CPU model. For example, Alder Lake is a CPU model, it can be marked as
"Core" or "Atom".

But for other architectures, the core type may be considered "cpu type"
or "cpu model".

Therefore, whether "core type" is used as a mark of a big or small core,
or as a different cpu model/cpu type, each architecture needs to define
this by itself.

I do have limited understanding of other architectures. Do you think
whether this explanation and handling is generic enough?

Thanks,
Zhao

> 
> > Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> > ---
> >   hw/core/machine-topo.c | 14 ++++++++++++++
> >   hw/core/machine.c      |  1 +
> >   hw/i386/x86.c          | 15 +++++++++++++++
> >   include/hw/boards.h    |  7 +++++++
> >   4 files changed, 37 insertions(+)
> 
> 
> > index 9364c90d5f1a..34ec035b5c9f 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -36,6 +36,7 @@ void machine_set_cpu_numa_node(MachineState *machine,
> >                                  Error **errp);
> >   void machine_parse_smp_config(MachineState *ms,
> >                                 const SMPConfiguration *config, Error **errp);
> > +int machine_parse_hybrid_core_type(MachineState *ms, const char *coretype);
> >   /**
> >    * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
> > @@ -199,6 +200,11 @@ typedef struct {
> >    *    Return the type of KVM corresponding to the kvm-type string option or
> >    *    computed based on other criteria such as the host kernel capabilities.
> >    *    kvm-type may be NULL if it is not needed.
> > + * @core_type:
> > + *    Return the type of hybrid cores corresponding to the coretype string
> > + *    option. The default hook only accept "none" or "" since the most generic
> > + *    core topology should not specify any specific core type. Each arch can
> > + *    define its own core_type() hook to override the default one.
> >    * @numa_mem_supported:
> >    *    true if '--numa node.mem' option is supported and false otherwise
> >    * @hotplug_allowed:
> > @@ -237,6 +243,7 @@ struct MachineClass {
> >       void (*reset)(MachineState *state, ShutdownCause reason);
> >       void (*wakeup)(MachineState *state);
> >       int (*kvm_type)(MachineState *machine, const char *arg);
> > +    int (*core_type)(MachineState *state, const char *type);
> >       BlockInterfaceType block_default_type;
> >       int units_per_default_bus;
> 

