Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB1696ACF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:07:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRylp-0004Wx-SC; Tue, 14 Feb 2023 12:07:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRyla-0004P9-6d
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:06:57 -0500
Received: from mga07.intel.com ([134.134.136.100])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1pRylU-0008SA-Qn
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:06:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676394408; x=1707930408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TtBvFU3HT2orL5cKaf8EAdCqJnbGgdTcYBaMoUvMatk=;
 b=M3P+8jmS3zWl34OEC6Fp8L3hORzh95RMVKQwa4C+btdXwyaG+H5K3LAo
 tH54eW50QeH3w2ct7moW3ulstgdQx49egKH4VV8NJDt7hK2RMG+muFO97
 X85+0H36ByeKQcqsNYE37/mfd74fF8EbfQLGQwe4lGJyl3YfiibmhpB0j
 ONfiov1ZvF4Uyv3DMxzO8usXKvbLj8G8Jdw0yVDjqOhxaeuT/hS36T7Dh
 gs2i/yU7uekRV845D6ftwFSS1gSYe9tLgoLUIjoyL+vT8vRn1uUCspFV0
 e8q3AuPakYJn6OYrlxDI+z1MUzuzrpACIs5naJnQoPG6kHKhnVPLCnZlj Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="395822728"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="395822728"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2023 09:06:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="662606976"
X-IronPort-AV: E=Sophos;i="5.97,297,1669104000"; d="scan'208";a="662606976"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.112])
 by orsmga007.jf.intel.com with ESMTP; 14 Feb 2023 09:06:38 -0800
Date: Wed, 15 Feb 2023 01:14:25 +0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
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
 Sean Christopherson <seanjc@google.com>,
 Like Xu <like.xu.linux@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [RFC 00/52] Introduce hybrid CPU topology
Message-ID: <Y+vBcZupWFiluO6e@liuzhao-OptiPlex-7080>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <Y+o9VIV64mjXTcpF@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+o9VIV64mjXTcpF@redhat.com>
Received-SPF: none client-ip=134.134.136.100;
 envelope-from=zhao1.liu@linux.intel.com; helo=mga07.intel.com
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

On Mon, Feb 13, 2023 at 01:38:28PM +0000, Daniel P. Berrangé wrote:
> Date: Mon, 13 Feb 2023 13:38:28 +0000
> From: "Daniel P. Berrangé" <berrange@redhat.com>
> Subject: Re: [RFC 00/52] Introduce hybrid CPU topology
> 
> On Mon, Feb 13, 2023 at 05:49:43PM +0800, Zhao Liu wrote:
> > From: Zhao Liu <zhao1.liu@intel.com>
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
> 
> How will this interact with the -cpu  parameter. Presumably we now
> need two distinct -cpu parameters, one for the 'core' CPU model and
> one for the 'atom' CPU model ?

(About this explanation for core type, also CC Philippe again)

For intel's hybrid, the core type is not a specific cpu model, and it
refers CPUID.1AH, sounds like a flag to distinguish between "core" and
"atom". For example, Alder Lake (not defined in QEMU yet) is a CPU model,
the Alder Lake CPU can be "core" or "atom".

Although the real "core" and "atom" have different microarchitectures,
they belong to the same CPU model and have the same ISA, and the
difference that the software layer can recognize is whether the encode
in CPUID.1AH is "core" type or "atom" type.

I think this is also the difference between intel hybrid and other
heterogeneous architectures. IIUC the heterogeneity of arm contains
different CPU models, while intel hybrid only marks the cpu as "core"
or "atom" in the same CPU model.

I think this difference between intel hybrid and other heterogeneous can
be distinguished by different handling methods of mc->core_type() which
can be defined by other arch to check "coretype" field [1].

For x86, mc->core_type() asks "coretype" as "core" or "atom" and treat
it as a hybrid "flag". But for other arch, who contains different CPU
models in heterogeneous (maybe arm), its mc->coretype asks for the
correct cpu model.

In this sense, x86 does not need a different "-cpu" to correspond to
core/atom, and even "-cpu" can be set to "host" (ie, -cpu host). But
other arch, who contains different CPU models in heterogeneous, needs
to support distinct -cpu parameters.

Do you think it is appropriate to use arch-specific mc->coretype to
handle different requirements for CPU model/core type?

[1]: [RFC 41/52] machine: Introduce core_type() hook,
     https://lists.gnu.org/archive/html/qemu-devel/2023-02/msg03244.html

> 
> > Please note this example is not an actual machine topology, but it shows
> > the powerful flexibility of "hybrid" command.
> 
> IIUC the functionality offered by -hybrid should be a superset
> of the -smp functionality. IOW, -smp ought to be possible to
> re-implement -smp as an alias for -hybrid, such that internally
> code only ever has to deal with the modern approach.

Yes, I agree.

> Having to
> keep support for both -smp and -hybrid throughout the code is
> undesirable IMHO. Keeping the compat at the CLI parsing level
> limits the burden.
>


"-hybrid" is introduced as a completely different implementation from
"-smp", for these 2 reasons:

1. Single-line commands can be very complex, and it is more difficult
to identify the relationship between different levels.

2. smp is implemented as the property of machine [2] and I don't have a
good way to define "hybrid" also as a property since I need to use
opts_visitor for multi-line commands instead of input_visitor.

[2]: fe68090: machine: add smp compound property.

> 
> As a more general thought, rather than introducing a new top level
> command line argument -hybrid, I'm thinking we should possibly just
> define this all using QOM and thus re-use the existing -object
> argument. 
> 
> I'm also finding the above example command lines quite difficult
> to understand, as there is alot of implicit linkage and expansion
> between the different levels. With devices we're much more
> explicitly with the parent/child relationships, and have to
> express everything with no automatic expansion, linking it all
> together via the id=/bus= properties.  This is quite a bit more
> verbose, but it is also very effective at letting us express
> arbitrarily complex relationships.
> 
> I think it would be worth exploring that approach for the CPU
> topology expression too.
> 
> If we followed the more explicit device approach to modelling
> then instead of:
> 
>  -cpu core,...
>  -cpu atom,...
>  -hybrid socket,sockets=1
>  -hybrid die,dies=1
>  -hybrid cluster,clusters=4
>  -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
>  -hybrid core,cores=4,coretype="atom",threads=1
> 
> we would end up with something like
> 
>   -object cpu-socket,id=sock0
>   -object cpu-die,id=die0,parent=sock0
>   -object cpu-cluster,id=cluster0,parent=die0
>   -object cpu-cluster,id=cluster1,parent=die0
>   -object cpu-cluster,id=cluster2,parent=die0
>   -object cpu-cluster,id=cluster3,parent=die0
>   -object x86-cpu-model-atom,id=cpu0,parent=cluster0
>   -object x86-cpu-model-atom,id=cpu1,parent=cluster0
>   -object x86-cpu-model-atom,id=cpu2,parent=cluster0
>   -object x86-cpu-model-atom,id=cpu3,parent=cluster0
>   -object x86-cpu-model-core,id=cpu4,parent=cluster0,threads=2
>   -object x86-cpu-model-atom,id=cpu5,parent=cluster1
>   -object x86-cpu-model-atom,id=cpu6,parent=cluster1
>   -object x86-cpu-model-atom,id=cpu7,parent=cluster1
>   -object x86-cpu-model-atom,id=cpu8,parent=cluster1
>   -object x86-cpu-model-core,id=cpu9,parent=cluster1,threads=2
>   -object x86-cpu-model-atom,id=cpu10,parent=cluster2
>   -object x86-cpu-model-atom,id=cpu11,parent=cluster2
>   -object x86-cpu-model-atom,id=cpu12,parent=cluster2
>   -object x86-cpu-model-atom,id=cpu13,parent=cluster2
>   -object x86-cpu-model-core,id=cpu14,parent=cluster2,threads=2
>   -object x86-cpu-model-atom,id=cpu15,parent=cluster3
>   -object x86-cpu-model-atom,id=cpu16,parent=cluster3
>   -object x86-cpu-model-atom,id=cpu17,parent=cluster3
>   -object x86-cpu-model-atom,id=cpu18,parent=cluster3
>   -object x86-cpu-model-core,id=cpu19,parent=cluster3,threads=2


Given that x86 hybrid currently has the same cpu model and "core"/"atom"
is not CPU model, so the -object still needs a coretype fields to specify
"core" or "atom", right?

Given an example of "-cpu host":

-cpu host,...
-hybrid socket,sockets=1
-hybrid die,dies=1
-hybrid cluster,clusters=4
-hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
-hybrid core,cores=4,coretype="atom",threads=1


It occurred to me that there may be two conversion formats for qom.

The one with "coretype" field like:

-object x86-cpu-model-host,coretype="atom",id=cpu0,parent=cluster0
-object x86-cpu-model-host,coretype="core",id=cpu1,parent=cluster0

or another format like "x86-cpu-model-[real model name]-[core type]":

-object x86-cpu-model-host-atom,id=cpu0,parent=cluster0
-object x86-cpu-model-host-core,id=cpu1,parent=cluster0

Can qom support the parsing of the second naming format?

At the same time, I understand that for other architectures, there is
no need to consider the issue of core type, just specify different
heterogeneous CPU models.

> 
> The really obvious downside is that it is much more verbose.
> 
> This example only has 20 CPUs. For a VM with say 1000 CPUs
> this will be very big, but that doesn't neccesarily make it
> wrong.
> 
> On the flipside
> 
>  * It is really clear exactly how many CPUs I've added
> 
>  * The relationship between the topology levels is clear
> 
>  * Every CPU has a unique ID given that can be used in
>    later QMP commands
> 
>  * Whether or not 'threads' are permitted is now a property
>    of the specific CPU model implementation, not the global
>    config. IOW we can express that some CPU models allowing
>    for threads, and some don't.

Will this way break the smp property of machine (the above mentioned [2])?

If so, IIUC we still need keep smp code to support this smp format:

"-machine smp.{cores,threads,cpu,...}",

but we can mark this smp format as deprecated and at some point completely
remove the smp code and replace it with the qom implementation, right?

> 
>  * The -cpu arg is also obsoleted, replaced by the
>    -object x86-cpu-model-core. This might facilitate the
>    modelling of machines with CPUs from different architectures.
> 
> 
> We could potentially compress the leaf node level by expressing
> how many instances of an object we want. it we want. ie, define
> a more convenient shorthand syntax to creating many instances of
> an object. so eg
> 
>   -object-set $TYPE,$PROPS,idbase=foo,count=4
> 
> would be functionally identical to
> 
>   -object $TYPE,$PROPS,id=foo.0
>   -object $TYPE,$PROPS,id=foo.1
>   -object $TYPE,$PROPS,id=foo.2
>   -object $TYPE,$PROPS,id=foo.3
> 
> QEMU just expands it and creates all the objects internally.
> 
> So the huge example I have above for 20 cpus would become much
> shorter: e.g.
> 
>   -object cpu-socket,id=sock0
>   -object cpu-die,id=die0,parent=sock0
>   -object cpu-cluster,id=cluster0,parent=die0
>   -object cpu-cluster,id=cluster1,parent=die0
>   -object cpu-cluster,id=cluster2,parent=die0
>   -object cpu-cluster,id=cluster3,parent=die0
>   -object-set x86-cpu-core-atom,idbase=cpu0,parent=cluster0,count=4
>   -object-set x86-cpu-core-core,id=cpu1,parent=cluster0,threads=2,count=1
>   -object-set x86-cpu-core-atom,idbase=cpu2,parent=cluster1,count=4
>   -object-set x86-cpu-core-core,id=cpu3,parent=cluster1,threads=2,count=1
>   -object-set x86-cpu-core-atom,idbase=cpu4,parent=cluster2,count=4
>   -object-set x86-cpu-core-core,id=cpu5,parent=cluster2,threads=2,count=1
>   -object-set x86-cpu-core-atom,idbase=cpu6,parent=cluster3,count=4
>   -object-set x86-cpu-core-core,id=cpu7,parent=cluster3,threads=2,count=1

What's difference between "id" and "idbase"?

> 
> IOW, the size of the CLI config only depends on the number of elements
> in the hierarchy, and is independant of the number of leaf CPU cores.
> 
> Obviously in describing all of the above, I've ignored any complexity
> of dealing with our existing code implementation and pain of getting
> it converted to the new model.

Thanks and sounds cool! I think I need some time to study this way.


Zhao

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

