Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBC694733
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:39:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZ2c-0004ep-MV; Mon, 13 Feb 2023 08:38:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZ2a-0004e9-TR
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZ2V-0001ac-Ss
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:38:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676295518;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=USwAVFOxR69i2bEAvgRc/5iuOLBJecjvdF2NLVpRZqw=;
 b=LS9XoahB7pq4CttwDhczMfKcLFDyh52gE3yqm3CMIoU2VU7hC+GiX7wk9aZafzjv0dryyJ
 TCx84QzXb6I4wfxFeodZVdT5i+hS8dZAGrTocdEjFaYoNIJgcDnc7e9HvKlD91TwS0wAgl
 DyrxqirLbrgEfnFGWU/xNb3pZeX8JsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-eawXhdY4OWOij4hSCqDIzg-1; Mon, 13 Feb 2023 08:38:35 -0500
X-MC-Unique: eawXhdY4OWOij4hSCqDIzg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4EDF2A5957A;
 Mon, 13 Feb 2023 13:38:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD0D2026D4B;
 Mon, 13 Feb 2023 13:38:30 +0000 (UTC)
Date: Mon, 13 Feb 2023 13:38:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
Message-ID: <Y+o9VIV64mjXTcpF@redhat.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Feb 13, 2023 at 05:49:43PM +0800, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> ## 3.3. "-hybrid" command
> 
> For hybrid cpu topology configuration, the original "-smp" lack of
> flexibility to expand, and unables to customize different cores.
> 
> So we introduce "-hybrid" command and implement it as the multi-
> line command. The multi-line command format is more complex than the
> single-line one, but it can bring stronger scalability and
> intuitiveness. In the future, it can also be easily extended to more
> heterogeneous topology levels.
> 
> "-hybrid" command is as follows:
> 
> -hybrid socket,sockets=n
> -hybrid die,dies=n
> -hybrid cluster,clusters=n
> -hybrid core,cores=n,type=core_type[,threads=threads]
>         [,clusterid=cluster]
> 
> Here, we first define the corresponding qapi options for these 4
> topology levels: core, cluster, die and socket.
> 
> We doesn't need a thread level since thread doesn't have different
> type.
> 
> For example:
> 
> -hybrid socket,sockets=1
> -hybrid die,dies=1
> -hybrid cluster,clusters=4
> -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
> -hybrid core,cores=4,coretype="atom",threads=1
> 
> Here we can build a hybrid cpu topology, which has 1 socket, 1 die per
> socket, 4 clusters per die. And in each die, every clusters has 4 "atom"
> core with 1 threads, and cluster0, cluster1 and cluster2 have 1 "core"
> cores with 2 threads.

How will this interact with the -cpu  parameter. Presumably we now
need two distinct -cpu parameters, one for the 'core' CPU model and
one for the 'atom' CPU model ?

> Please note this example is not an actual machine topology, but it shows
> the powerful flexibility of "hybrid" command.

IIUC the functionality offered by -hybrid should be a superset
of the -smp functionality. IOW, -smp ought to be possible to
re-implement -smp as an alias for -hybrid, such that internally
code only ever has to deal with the modern approach. Having to
keep support for both -smp and -hybrid throughout the code is
undesirable IMHO. Keeping the compat at the CLI parsing level
limits the burden.


As a more general thought, rather than introducing a new top level
command line argument -hybrid, I'm thinking we should possibly just
define this all using QOM and thus re-use the existing -object
argument. 

I'm also finding the above example command lines quite difficult
to understand, as there is alot of implicit linkage and expansion
between the different levels. With devices we're much more
explicitly with the parent/child relationships, and have to
express everything with no automatic expansion, linking it all
together via the id=/bus= properties.  This is quite a bit more
verbose, but it is also very effective at letting us express
arbitrarily complex relationships.

I think it would be worth exploring that approach for the CPU
topology expression too.

If we followed the more explicit device approach to modelling
then instead of:

 -cpu core,...
 -cpu atom,...
 -hybrid socket,sockets=1
 -hybrid die,dies=1
 -hybrid cluster,clusters=4
 -hybrid core,cores=1,coretype="core",threads=2,clusterid=0-2
 -hybrid core,cores=4,coretype="atom",threads=1

we would end up with something like

  -object cpu-socket,id=sock0
  -object cpu-die,id=die0,parent=sock0
  -object cpu-cluster,id=cluster0,parent=die0
  -object cpu-cluster,id=cluster1,parent=die0
  -object cpu-cluster,id=cluster2,parent=die0
  -object cpu-cluster,id=cluster3,parent=die0
  -object x86-cpu-model-atom,id=cpu0,parent=cluster0
  -object x86-cpu-model-atom,id=cpu1,parent=cluster0
  -object x86-cpu-model-atom,id=cpu2,parent=cluster0
  -object x86-cpu-model-atom,id=cpu3,parent=cluster0
  -object x86-cpu-model-core,id=cpu4,parent=cluster0,threads=2
  -object x86-cpu-model-atom,id=cpu5,parent=cluster1
  -object x86-cpu-model-atom,id=cpu6,parent=cluster1
  -object x86-cpu-model-atom,id=cpu7,parent=cluster1
  -object x86-cpu-model-atom,id=cpu8,parent=cluster1
  -object x86-cpu-model-core,id=cpu9,parent=cluster1,threads=2
  -object x86-cpu-model-atom,id=cpu10,parent=cluster2
  -object x86-cpu-model-atom,id=cpu11,parent=cluster2
  -object x86-cpu-model-atom,id=cpu12,parent=cluster2
  -object x86-cpu-model-atom,id=cpu13,parent=cluster2
  -object x86-cpu-model-core,id=cpu14,parent=cluster2,threads=2
  -object x86-cpu-model-atom,id=cpu15,parent=cluster3
  -object x86-cpu-model-atom,id=cpu16,parent=cluster3
  -object x86-cpu-model-atom,id=cpu17,parent=cluster3
  -object x86-cpu-model-atom,id=cpu18,parent=cluster3
  -object x86-cpu-model-core,id=cpu19,parent=cluster3,threads=2

The really obvious downside is that it is much more verbose.

This example only has 20 CPUs. For a VM with say 1000 CPUs
this will be very big, but that doesn't neccesarily make it
wrong.

On the flipside

 * It is really clear exactly how many CPUs I've added

 * The relationship between the topology levels is clear

 * Every CPU has a unique ID given that can be used in
   later QMP commands

 * Whether or not 'threads' are permitted is now a property
   of the specific CPU model implementation, not the global
   config. IOW we can express that some CPU models allowing
   for threads, and some don't.

 * The -cpu arg is also obsoleted, replaced by the
   -object x86-cpu-model-core. This might facilitate the
   modelling of machines with CPUs from different architectures.


We could potentially compress the leaf node level by expressing
how many instances of an object we want. it we want. ie, define
a more convenient shorthand syntax to creating many instances of
an object. so eg

  -object-set $TYPE,$PROPS,idbase=foo,count=4

would be functionally identical to

  -object $TYPE,$PROPS,id=foo.0
  -object $TYPE,$PROPS,id=foo.1
  -object $TYPE,$PROPS,id=foo.2
  -object $TYPE,$PROPS,id=foo.3

QEMU just expands it and creates all the objects internally.

So the huge example I have above for 20 cpus would become much
shorter: e.g.

  -object cpu-socket,id=sock0
  -object cpu-die,id=die0,parent=sock0
  -object cpu-cluster,id=cluster0,parent=die0
  -object cpu-cluster,id=cluster1,parent=die0
  -object cpu-cluster,id=cluster2,parent=die0
  -object cpu-cluster,id=cluster3,parent=die0
  -object-set x86-cpu-core-atom,idbase=cpu0,parent=cluster0,count=4
  -object-set x86-cpu-core-core,id=cpu1,parent=cluster0,threads=2,count=1
  -object-set x86-cpu-core-atom,idbase=cpu2,parent=cluster1,count=4
  -object-set x86-cpu-core-core,id=cpu3,parent=cluster1,threads=2,count=1
  -object-set x86-cpu-core-atom,idbase=cpu4,parent=cluster2,count=4
  -object-set x86-cpu-core-core,id=cpu5,parent=cluster2,threads=2,count=1
  -object-set x86-cpu-core-atom,idbase=cpu6,parent=cluster3,count=4
  -object-set x86-cpu-core-core,id=cpu7,parent=cluster3,threads=2,count=1

IOW, the size of the CLI config only depends on the number of elements
in the hierarchy, and is independant of the number of leaf CPU cores.

Obviously in describing all of the above, I've ignored any complexity
of dealing with our existing code implementation and pain of getting
it converted to the new model.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


