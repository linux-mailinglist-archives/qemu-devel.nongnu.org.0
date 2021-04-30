Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7F336F605
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 08:56:41 +0200 (CEST)
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcN4q-00018y-Mx
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 02:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcMqH-0000l9-IP
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:41:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lcMqC-0007Y8-7i
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 02:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619764890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cCfRI7nDY6M3W8Er5W8Oo5AEqaWnbh1itUlwv8LIrIw=;
 b=YFuFlkVrbkMTcnqozz0KCUvoKH9p/atDwk6kegb15FbsUBZP1iPMA4kILoOw+64AOKPMON
 Bb8UumbYZLo4pdS5LbTXY8n3AjpiwX5f+vUVASWOncVOy7YLk+bE3keHgy3QzRMSDYA9mj
 WZSO/VfoPj9jpF7hSJFBLkivgXhDK70=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-VPTzY7yrOTaT5TGh_RZuCw-1; Fri, 30 Apr 2021 02:41:29 -0400
X-MC-Unique: VPTzY7yrOTaT5TGh_RZuCw-1
Received: by mail-ed1-f72.google.com with SMTP id
 d6-20020a0564020786b0290387927a37e2so8875608edy.10
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 23:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cCfRI7nDY6M3W8Er5W8Oo5AEqaWnbh1itUlwv8LIrIw=;
 b=jlhvts7tsYDxFTQiBwLNImf/o66ojY5XauakdFoVRkYYjNUqHgfsboLHryvMTVGnGs
 OJlLvFkq16bc6ZCcCIxmaePronQxMKcQHeqaHfuecEEByHNHSDqIIbYciG0WDuuKWzkl
 6LgofLN8vcxf3k4rwMsKMAXqxCJcNBFtFTqp4sdKMG2AS8hKipOHzRwZ4Yn25iMkXZ9H
 7PCD43TujW0q8T5mIRimXvHkFDhZYdyIHjf2cH6Ep4WDY6oaJnLDJZYT6dcyzwy8Sibs
 6AMA5figZ+/7fFt+3It5/CToyIRqFJdGZXC65fu0F4xk+yRIalDS6XXYRV4KwxFDOmIt
 Et2Q==
X-Gm-Message-State: AOAM533qycfgxQc5h3Ko14YT/8YiVQ3RQ/4E1RLhIFIGcAbzQvi/eu25
 cz+REq79Mt/7ITakyBoOzYidEM8Jjvxfw5xd7S5rKQSoJ1wSChtw5XtL1ma/aOGw9lEs2fvHeLm
 d2bPKWrACu2bMJmw=
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr3805070edb.227.1619764887876; 
 Thu, 29 Apr 2021 23:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2H0YlEyHoEfY9cF8EXK3HSmbgRdoyaMFbJ2RO7Ig25ak9X26dVa9p/poV7FyI8FSyI6tlnQ==
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr3805037edb.227.1619764887578; 
 Thu, 29 Apr 2021 23:41:27 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id rs28sm1337257ejb.35.2021.04.29.23.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 23:41:27 -0700 (PDT)
Date: Fri, 30 Apr 2021 08:41:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 2/4] hw/arm/virt: Parse -smp cluster parameter in
 virt_smp_parse
Message-ID: <20210430064125.3b5fjolwqculrjxz@gator.home>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
 <20210413083147.34236-3-wangyanan55@huawei.com>
 <20210428103141.5qfhzcqko6hxhxee@gator>
 <262dba57-437c-36aa-7a86-8f0c59751887@huawei.com>
 <20210429071614.lywpbfpeyclqxnke@gator.home>
 <ce557539-ac8f-7245-747b-8212a4857811@huawei.com>
 <20210429110229.7jtz6hfrfvqdkrbx@gator>
 <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
MIME-Version: 1.0
In-Reply-To: <f5b264ff-58ed-0cd2-3b84-42fa1724b8ac@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, yangyicong@huawei.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 30, 2021 at 01:09:00PM +0800, wangyanan (Y) wrote:
> Hi Drew,
> 
> On 2021/4/29 19:02, Andrew Jones wrote:
> > On Thu, Apr 29, 2021 at 04:56:06PM +0800, wangyanan (Y) wrote:
> > > On 2021/4/29 15:16, Andrew Jones wrote:
> > > > On Thu, Apr 29, 2021 at 10:14:37AM +0800, wangyanan (Y) wrote:
> > > > > On 2021/4/28 18:31, Andrew Jones wrote:
> > > > > > On Tue, Apr 13, 2021 at 04:31:45PM +0800, Yanan Wang wrote:
> > > > > > >             } else if (sockets == 0) {
> > > > > > >                 threads = threads > 0 ? threads : 1;
> > > > > > > -            sockets = cpus / (cores * threads);
> > > > > > > +            sockets = cpus / (clusters * cores * threads);
> > > > > > >                 sockets = sockets > 0 ? sockets : 1;
> > > > > > If we initialize clusters to zero instead of one and add lines in
> > > > > > 'cpus == 0 || cores == 0' and 'sockets == 0' like
> > > > > > 'clusters = clusters > 0 ? clusters : 1' as needed, then I think we can
> > > > > > add
> > > > > > 
> > > > > >     } else if (clusters == 0) {
> > > > > >         threads = threads > 0 ? threads : 1;
> > > > > >         clusters = cpus / (sockets * cores * thread);
> > > > > >         clusters = clusters > 0 ? clusters : 1;
> > > > > >     }
> > > > > > 
> > > > > > here.
> > > > > I have thought about this kind of format before, but there is a little bit
> > > > > difference between these two ways. Let's chose the better and more
> > > > > reasonable one of the two.
> > > > > 
> > > > > Way A currently in this patch:
> > > > > If value of clusters is not explicitly specified in -smp command line, we
> > > > > assume
> > > > > that users don't want to support clusters, for compatibility we initialized
> > > > > the
> > > > > value to 1. So that with cmdline "-smp cpus=24, sockets=2, cores=6", we will
> > > > > parse out the topology description like below:
> > > > > cpus=24, sockets=2, clusters=1, cores=6, threads=2
> > > > > 
> > > > > Way B that you suggested for this patch:
> > > > > Whether value of clusters is explicitly specified in -smp command line or
> > > > > not,
> > > > > we assume that clusters are supported and calculate the value. So that with
> > > > > cmdline "-smp cpus=24, sockets=2, cores=6", we will parse out the topology
> > > > > description like below:
> > > > > cpus =24, sockets=2, clusters=2, cores=6, threads=1
> > > > > 
> > > > > But I think maybe we should not assume too much about what users think
> > > > > through the -smp command line. We should just assume that all levels of
> > > > > cpu topology are supported and calculate them, and users should be more
> > > > > careful if they want to get the expected results with not so complete
> > > > > cmdline.
> > > > > If I'm right, then Way B should be better. :)
> > > > > 
> > > > Hi Yanan,
> > > > 
> > > > We're already assuming the user wants to describe clusters to the guest
> > > > because we require at least one per socket. If we want the user to have a
> > > > choice between using clusters or not, then I guess we need to change the
> > > > logic in the PPTT and the cpu-map to only generate the cluster level when
> > > > the number of clusters is not zero. And then change this parser to not
> > > > require clusters at all.
> > > Hi Drew,
> > > 
> > > I think this kind of change will introduce more complexity and actually is
> > > not necessary.
> > > Not generating cluster level at all and generating cluster level (one per
> > > socket) are same
> > > to kernel. Without cluster description provided, kernel will initialize all
> > > cores in the same
> > > cluster which also means one cluster per socket.
> > Which kernel? All kernels? One without the cluster support patches [1]?
> > 
> > [1] https://lore.kernel.org/lkml/20210420001844.9116-1-song.bao.hua@hisilicon.com/#t
> I'm sorry, I didn't make it clear. :)
> I actually mean the ARM64 kernel, with or without [1].
> 
> Without [1]: Kernel doesn't care about cluster. When populating cpu
> topology, it directly
> finds the hierarchy node with "physical package flag" as package when
> parsing ACPI, and
> finds the core node's parent as package when parsing DT. So even we provide
> cluster level
> description (one per socket), the parsing results will be the same as not
> providing at all.
> 
> With [1]: Kernel finds the core hierarchy node's parent as cluster when
> parsing ACPI. So if
> we don't provide cluster level description, package will be taken as
> cluster. And if we provide
> the description (one per socket), the parsing result will also be the same.
> 
> That's why I said that we just need to provide description of cluster (one
> per socket) if we
> don't want to make use of it in VMs.

OK, that sounds good.

> 
> [1] https://lore.kernel.org/lkml/20210420001844.9116-1-song.bao.hua@hisilicon.com/#t
> > > So we should only ensure value of clusters per socket is one if we don't
> > > want to use clusters,
> > > and don't need to care about whether or not to generate description in PPTT
> > > and cpu-map.
> > > Is this right?
> > Depends on your answer to my 'which kernel' questions.
> > 
> > > > I'm not a big fan of these auto-calculated values either, but the
> > > > documentation says that it'll do that, and it's been done that way
> > > > forever, so I think we're stuck with it for the -smp option. Hmm, I was
> > > > just about to say that x86 computes all its values, but I see the most
> > > > recently added one, 'dies', is implemented the way you're proposing we
> > > > implement 'clusters', i.e. default to one and don't calculate it when it's
> > > > missing. I actually consider that either a documentation bug or an smp
> > > > parsing bug, though.
> > > My propose originally came from implementation of x86.
> > > > Another possible option, for Arm, because only the cpus and maxcpus
> > > > parameters of -smp have ever worked, is to document, for Arm, that if even
> > > > one parameter other than cpus or maxcpus is provided, then all parameters
> > > > must be provided. We can still decide if clusters=0 is valid, but we'll
> > > > enforce that everything is explicit and that the product (with or without
> > > > clusters) matches maxcpus.
> > > Requiring every parameter explicitly will be most stable but indeed strict.
> > > 
> > > Currently all the parsers use way B to calculate value of thread if it is
> > > not provided explicitly.
> > > So users should ensure the -smp cmdline they provided can result in that
> > > parsed threads will
> > > be 1 if they don't want to support multiple threads in one core.
> > > 
> > > Very similar to thread, users should also ensure the provided cmdline can
> > > result in that parsed
> > > clusters will be 1 if they don't want to support multiple clusters in one
> > > socket.
> > > 
> > > So I'm wondering if we can just add some commit in the documentation to tell
> > > users that they
> > > should ensure this if they don't want support it. And as for calculation of
> > > clusters, we follow
> > > the logic of other parameters as you suggested in way B.
> > > 
> > > Thanks,
> > > Yanan
> > > > Requiring every parameter might be stricter than necessary, though, I
> > > > think we're mostly concerned with cpus/maxcpus, sockets, and cores.
> > > > clusters can default to one or zero (whatever we choose and document),
> > > > threads can default to one, and cpus can default to maxcpus or maxcpus can
> > > > default to cpus, but at least one of those must be provided. And, if
> > > > sockets are provided, then cores must be provided and vice versa. If
> > > > neither sockets nor cores are provided, then nothing else besides cpus and
> > > > maxcpus may be provided, and that would mean to not generate any topology
> > > > descriptions for the guest.
> > I still don't know. I think I prefer making -smp more strict (even for
> > other architectures, but that's more difficult to do than for Arm.) What I
> > wrote above isn't that bad. We only require one of cpus or maxcpus (pretty
> > much everybody already does that anyway), and then, if given sockets
> > or cores, the other will also be required. I assume anybody who bothers to
> > specify one or the other would already specify both anyway.
> I agree to make -smp more strict. We want to expose the cpu topology
> information
> to guest kernel, so that it can take advantage of the information for better
> scheduling.
> From this point of view, we hope the topology descriptions are accurately
> specified
> but not automatically populated.
> 
> But I think the requirement for ARM "if even one parameter other than cpus
> or maxcpus
> is provided then all parameters must be provided" will be better. This can
> ensure the
> whole accurate users-specified topology. As you mentioned, if anybody who
> bothers
> to specify one, why not also specify the others.
> 
> I can add the requirement for ARM in the documentation, and also check the
> parameters
> in virt_smp_parse. Will this be fine?

We sort of have to support command lines that are missing 'maxcpus' and
'clusters', unless we work together with libvirt to make the change.
Currently libvirt will generate '-smp 16,sockets=16,cores=1,threads=1'
from '<vcpu placement='static'>16</vcpu>'. That's sufficient for our
stricter, but not completely strict requirements. And, I still think
'threads' could be optional, because there's a good chance the user
doesn't want to describe them, so a default of 1 is good enough. Also,
given maxcpus, but not cpus, it's pretty obvious that cpus should equal
maxcpus.

Thanks,
drew


