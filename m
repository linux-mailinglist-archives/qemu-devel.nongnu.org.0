Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40737398876
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:38:15 +0200 (CEST)
Received: from localhost ([::1]:33204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loPCQ-0001To-BW
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1loPB6-00009S-7h
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:36:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1loPB3-00036B-MH
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622633807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JVMFCMVk5F81sXN2BL6u43VAyk7L6rMGBpmJimkq1RQ=;
 b=TvWwljh66UKlZVLtMY5qetsI9yMxQ45TYGYuUMsIwhL+ZTCPs5I6zyDeU0iY6oBw7KK53K
 f8h/kjwBIMV6TPQ9TmaqjT5OeBy6AF1U6HbM3oZfvNzQwLp5dNhpMh8X8zCsEMRAFB1o5p
 3QhkkHz3llPp4CQ8rkDenYWVnA/g8vw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-EGx1RRnOM9aaq59Kw9RVfQ-1; Wed, 02 Jun 2021 07:36:46 -0400
X-MC-Unique: EGx1RRnOM9aaq59Kw9RVfQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 q7-20020a1709063607b02903f57f85ac45so518286ejb.15
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JVMFCMVk5F81sXN2BL6u43VAyk7L6rMGBpmJimkq1RQ=;
 b=sA9FpvzJH6Q97s3fCw6gk28AV9WPdVPM5pVYa+jS2E2tKX3wLOhQUmBjx0fG4ZF21G
 vmELGo5ngcMkAbuN3mXCOutdPYMCL/VSoX77wJezypkXU4xOK+QuccrhviftOGOKJoCt
 BJw4nl2mSARD5FYej+pD6tTgLr3mbXWyLAgJVtwXQqi9r3HNGcrKMrxckRpN09KWvvVl
 N7prOca+wuPEyqe7lb7HzLjBrQrHXhp5kjMKt8+jZ7GB4ictzScEz5FungFnphOFL6cz
 ThrHfPNNMVye2/FG6AOKdvhqCwsYZPstTUXlFsnpNo9OM3g3BRk/eDI+rwR/9H4OGcQ1
 JdYw==
X-Gm-Message-State: AOAM531S/s6/ZlDI2D9bQZch1oHsXKvEe/gFqZbBcs6kMW30HyQ/upm+
 Kbp8a+0oujhL+7qvhEta13lbWhRj14edbYGy0zkv2/8TyAQ0TKY/7ThEU2jI7yEvF1LdSUyzVwE
 IrjGn1Gdr9QnuS0U=
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr12086270eds.342.1622633804885; 
 Wed, 02 Jun 2021 04:36:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkmElh63Wx4J1PdgP03I1z5LyKGOZ8PczJGGBte8UThvw/YMhTyCBv57vTFZfTCcX+c2hKrQ==
X-Received: by 2002:aa7:d5cf:: with SMTP id d15mr12086247eds.342.1622633804611; 
 Wed, 02 Jun 2021 04:36:44 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id d15sm1161163edu.86.2021.06.02.04.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 04:36:44 -0700 (PDT)
Date: Wed, 2 Jun 2021 13:36:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/boot: Use NUMA node ID in memory node name
Message-ID: <20210602113642.axaxxgnw2haghas4@gator.home>
References: <20210601073004.106490-1-gshan@redhat.com>
 <20210601075045.ppmceogd5hp5rqcf@gator.home>
 <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e50c52e7-a8d5-c269-cebf-caf1688c629e@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 shan.gavin@gmail.com, eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02, 2021 at 11:09:32AM +1000, Gavin Shan wrote:
> Hi Drew,
> 
> On 6/1/21 5:50 PM, Andrew Jones wrote:
> > On Tue, Jun 01, 2021 at 03:30:04PM +0800, Gavin Shan wrote:
> > > We possibly populate empty nodes where memory isn't included and might
> > > be hot added at late time. The FDT memory nodes can't be created due
> > > to conflicts on their names if multiple empty nodes are specified.
> > > For example, the VM fails to start with the following error messages.
> > > 
> > >    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64          \
> > >    -accel kvm -machine virt,gic-version=host                        \
> > >    -cpu host -smp 4,sockets=2,cores=2,threads=1 -m 1024M,maxmem=64G \
> > >    -object memory-backend-ram,id=mem0,size=512M                     \
> > >    -object memory-backend-ram,id=mem1,size=512M                     \
> > >    -numa node,nodeid=0,cpus=0-1,memdev=mem0                         \
> > >    -numa node,nodeid=1,cpus=2-3,memdev=mem1                         \
> > >    -numa node,nodeid=2                                              \
> > >    -numa node,nodeid=3                                              \
> > >      :
> > >    -device virtio-balloon-pci,id=balloon0,free-page-reporting=yes
> > > 
> > >    qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: \
> > >                         FDT_ERR_EXISTS
> > > 
> > > This fixes the issue by using NUMA node ID or zero in the memory node
> > > name to avoid the conflicting memory node names. With this applied, the
> > > VM can boot successfully with above command lines.
> > > 
> > > Signed-off-by: Gavin Shan <gshan@redhat.com>
> > > ---
> > >   hw/arm/boot.c | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > > index d7b059225e..3169bdf595 100644
> > > --- a/hw/arm/boot.c
> > > +++ b/hw/arm/boot.c
> > > @@ -432,7 +432,12 @@ static int fdt_add_memory_node(void *fdt, uint32_t acells, hwaddr mem_base,
> > >       char *nodename;
> > >       int ret;
> > > -    nodename = g_strdup_printf("/memory@%" PRIx64, mem_base);
> > > +    if (numa_node_id >= 0) {
> > > +        nodename = g_strdup_printf("/memory@%d", numa_node_id);
> > > +    } else {
> > > +        nodename = g_strdup("/memory@0");
> > > +    }
> > > +
> > >       qemu_fdt_add_subnode(fdt, nodename);
> > >       qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > >       ret = qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells, mem_base,
> 
> [...]
> 
> > 
> > Is it conventional to use the unit-address like this? If so, can you point
> > out where that's documented? If it's not conventional, then we shouldn't
> > do it. And then I'm not sure what we should do in this case. Here's a
> > couple links I found, but they don't really help...
> > 
> > https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#sect-node-names
> > https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#memory-node
> > 
> 
> As stated in the document (section 2.2.1.1). It's conventional to take the first
> address of 'reg' property as unit-address, but it's not mandatory as I understand:
> 
> (1) In section 2.2.1.1, the bus can specify additional format to unit-address.

The bus type we're using is the physical memory map. Does it allow this
use of the unit-address? I still haven't seen that documented anywhere.

> (2) The device node name isn't used to identify the device node in Linux kernel.
>     They are actually identified by 'device_type' property.
>     (drivers/of/fdt.c::early_init_dt_scan_memory())

This doesn't matter. We can't change DT node name formats just because
they may not impact Linux. We need to follow the DT standard and the Linux
convention.

> 
> I think it's still nice to include the unit-address in meory node's name. For the
> conflicting nodes, we add more suffix like below. I can update the code in v2 if
> it's preferred way to go.

I don't think we should change the semantics of the unit address at all,
not without either a) finding a document that says our use is OK or b)
getting it documented in the Linux kernel first.

Thanks,
drew

> 
>    memory@0
>    memory@0-0                               # For empty NUMA node
>    memory@0-1                               # For empty NUMA node
>    memory@80000000
>    memory@80000000-0                        # For empty NUMA node
>    memory@80000000-1                        # For empty NUMA node
> 
> ---
> 
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#sect-node-names
> 
> The unit-address must match the first address specified in the reg property of the node.
> If the node has no reg property, the @unit-address must be omitted and the node-name
> alone differentiates the node from other nodes at the same level in the tree. The binding
> for a particular bus may specify additional, more specific requirements for the format
> of reg and the unit-address.
>


