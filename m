Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BE42A68A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:56:41 +0200 (CEST)
Received: from localhost ([::1]:46612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maIGm-0002RE-5B
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maIDk-0000BN-T1
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:53:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1maIDf-0007cm-Sc
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634046807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbMG2ANWbDgQcLlYfLO3PZOLLTcBzyquLybCUaE5jwg=;
 b=Cy+LmW7ptQiboRhtKZ/h+Kkg17M0LofJlG+rgECDVFgtxZxRNn0TrIDhlQvgLE17ivvrrj
 y8nqilLAwCBQxRIcMFn0EV+pZYzKz7UIN9vCAWHHsTtvU3R1Yzkz1v9HTnxFUpVhAR7Bcy
 nAEfDe8JAPfDbLRUGNSXHqzfle+kgFI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-79sAp5ncNrKB58d9nQtILw-1; Tue, 12 Oct 2021 09:53:24 -0400
X-MC-Unique: 79sAp5ncNrKB58d9nQtILw-1
Received: by mail-ed1-f72.google.com with SMTP id
 e14-20020a056402088e00b003db6ebb9526so9388585edy.22
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nbMG2ANWbDgQcLlYfLO3PZOLLTcBzyquLybCUaE5jwg=;
 b=i88MNdREJtsqxKIVAdtvJpeNsH3h3W/bIAid4L7BzMNuKmIFzw8ZKNkCQQy/POeZNj
 WMuL7ewU+z1uV8askgRWJS6sEBrAT0sD2IAvbVTINAowv+WguHFVxL0aGvRFbt27xMxi
 ZQLmjqHnC7HkvsJ1ZO5/YRHfG82mAvIKYJjM46gRog2zjla1iCh7bQ6o5n+qEh5JhIUP
 yiNTmfmVenchvaHT3uF/2lf3vAe36pujNwlk7lRRos0AZRaZmxEYKxgGROBWoF5y/T2T
 bycEEKwfdWTuMnUJTZujZAMbc1d+5fcrD/8We8xu4L9vWSeWSwMWofNj42E3aSdjo34F
 2tTQ==
X-Gm-Message-State: AOAM532Im1fyxHBtstynaCPMOOaLl+vGVorv/3ER9JjBK7bkJOJseNzY
 8f0xsuZfA6QsUheTpeW1LxpnIGUX8Ax/6SzHJV1s8fFMTZ7TmJYJeBH2zrJg9dewqEfn4jLfilc
 KF4AWnaDsV+BZis4=
X-Received: by 2002:a50:d88b:: with SMTP id p11mr50996527edj.287.1634046803608; 
 Tue, 12 Oct 2021 06:53:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOZEqQiqNt3EWSEmLaUCZ37EJ1cpfFiNEHg/4gln9y0voR6j5RgL9ClPMsEADvKLerTgV0UQ==
X-Received: by 2002:a50:d88b:: with SMTP id p11mr50996499edj.287.1634046803352; 
 Tue, 12 Oct 2021 06:53:23 -0700 (PDT)
Received: from localhost (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id g17sm5939810edv.72.2021.10.12.06.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:53:22 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:53:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012155321.256e8867@redhat.com>
In-Reply-To: <20211012131308.45j7ofd4xwk42epv@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
 <20211012142754.1c4e5071@redhat.com>
 <20211012131308.45j7ofd4xwk42epv@gator>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, robh@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 12 Oct 2021 15:13:08 +0200
Andrew Jones <drjones@redhat.com> wrote:

> On Tue, Oct 12, 2021 at 02:27:54PM +0200, Igor Mammedov wrote:
> > On Tue, 12 Oct 2021 12:37:54 +0200
> > Andrew Jones <drjones@redhat.com> wrote:
> >   
> > > On Tue, Oct 12, 2021 at 11:40:16AM +0200, Igor Mammedov wrote:  
> > > > On Wed,  6 Oct 2021 18:22:08 +0800
> > > > Gavin Shan <gshan@redhat.com> wrote:
> > > >     
> > > > > The following option is used to specify the distance map. It's
> > > > > possible the option isn't provided by user. In this case, the
> > > > > distance map isn't populated and exposed to platform. On the
> > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > > > their corresponding device-tree nodes aren't populated, but
> > > > > their NUMA IDs should be included in the "/distance-map"
> > > > > device-tree node, so that kernel can probe them properly if
> > > > > device-tree is used.
> > > > > 
> > > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > 
> > > > > So when user doesn't specify distance map, we need to generate
> > > > > the default distance map, where the local and remote distances
> > > > > are 10 and 20 separately. This adds an extra parameter to the
> > > > > exiting complete_init_numa_distance() to generate the default
> > > > > distance map for this case.
> > > > > 
> > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>    
> > > > 
> > > > 
> > > > how about error-ing out if distance map is required but
> > > > not provided by user explicitly and asking user to fix
> > > > command line?
> > > > 
> > > > Reasoning behind this that defaults are hard to maintain
> > > > and will require compat hacks and being raod blocks down
> > > > the road.
> > > > Approach I was taking with generic NUMA code, is deprecating
> > > > defaults and replacing them with sanity checks, which bail
> > > > out on incorrect configuration and ask user to correct command line.
> > > > Hence I dislike approach taken in this patch.
> > > > 
> > > > If you really wish to provide default, push it out of
> > > > generic code into ARM specific one
> > > > (then I won't oppose it that much (I think PPC does
> > > > some magic like this))
> > > > Also behavior seems to be ARM specific so generic
> > > > NUMA code isn't a place for it anyways    
> > > 
> > > The distance-map DT node and the default 10/20 distance-map values
> > > aren't arch-specific. RISCV is using it too.
> > > 
> > > I'm on the fence with this. I see erroring-out to require users
> > > to provide explicit command lines as a good thing, but I also
> > > see it as potentially an unnecessary burden for those that want
> > > the default map anyway. The optional nature of the distance-map
> > > node and the specification of the default map is here [1]
> > > 
> > > [1] Linux source: Documentation/devicetree/bindings/numa.txt  
> > 
> > Looking at proposed linux patches [ https://lkml.org/lkml/2021/9/27/31 ],
> > using optional distance table as source for numa-node-ids,
> > looks like a hack around kernel's inability to fish them out
> > from CPU &| PCI nodes (using those nodes as source should
> > cover memory-less node use-case).
> > 
> > I consider including optional node as a policy decision.
> > So user shall include it explicitly on QEMU command line
> > if necessary (that works just fine for x86), or guest OS
> > can make up defaults on its own in absence of data.  
> 
> OK, so erroring-out on configs that must provide distance-maps, rather
> than automatically generating them for all configs is better.
> 
> >   
> > > So, my r-b stands for this patch, but I also wouldn't complain
> > > about respinning it to error out instead.  
> >   
> > > I would complain about
> > > moving the logic to Arm specific code, though, since RISCV would
> > > then need to duplicate it.  
> > 
> > Instead of putting workaround in QEMU and then making them generic,
> > I'd prefer to:
> >  1. make QEMU to be able generate DT with memory-less nodes  
> 
> How? DT syntax doesn't allow this, because each node needs a unique
> name which is derived from its base address, which an empty numa
you are talking about memory@foo nodes, aren't you?

> node doesn't have.

Looking at Documentation/devicetree/bindings/numa.txt

mem/cpu/pci nodes also contain numa-node-id attribute,
so idea is to collect IDs from all present sources
instead of abusing distance map.
 
That would allow QEMU to skip memory@foo elements for
memory-less nodes because they obviously do not exist
and there is no way to describe them using 'memory' nodes.

> >  2. fix guest to get numa-node-id from CPU/PCI nodes if
> >     memory node isn't present,  
> 
> I'm not sure that's possible with DT. If it is, then proposing it
> upstream to Linux DT maintainers would be the next step.
Added Rob to CC.

> 
> > or use ACPI tables which can
> >     describe memory-less NUMA nodes if fixing how DT is
> >     parsed unfeasible.  
> 
> We use ACPI already for our guests, but we also generate a DT (which
> edk2 consumes). We can't generate a valid DT when empty numa nodes
does edk2 actually uses numa info from QEMU?

> are put on the command line unless we follow a DT spec saying how
> to do that. The current spec says we should have a distance-map
> that contains those nodes.

can you point out to the spec and place within it, pls?
 
> Thanks,
> drew
> 


