Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673A842A548
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 15:18:08 +0200 (CEST)
Received: from localhost ([::1]:45578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maHfT-0003Qx-B7
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 09:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHbC-0007uu-RZ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:13:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHb9-0006Cs-9n
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 09:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634044418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AD0DU8iHMxbrjLux14dy0f5TIz6zXpI48KzHWoM0bII=;
 b=KW52MLa5h5yTuMDiNkcJR+QGSgWIOVkduaCD6atkM5HpuBGfXPyKCY2zxBeXwcy8/83jqi
 fwFNgaTS+oMvZrnQ4LYJIbr6fgwgjyHSdnTKhAYyXpBe/9eAmSC4K42VI5OIQqShtwEXPt
 u8kNeKiP9G/gF8rjczIOP0PBknIRZUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-HeDhYLsANC6dxTzvHLfviQ-1; Tue, 12 Oct 2021 09:13:12 -0400
X-MC-Unique: HeDhYLsANC6dxTzvHLfviQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 41-20020adf802c000000b00161123698e0so3847287wrk.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 06:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AD0DU8iHMxbrjLux14dy0f5TIz6zXpI48KzHWoM0bII=;
 b=vg7n/8egUKh2RlPGHaEWRb3GckiOyZrvf708OLo39ToCE61vkygP4dcT1KyVrmD26l
 ReBfglZ0p9sdr0n+ZLVPpaPxDqHNjp7GoIBQKssx+Z4T9NVuwhC5UXSsiqwj1zjxhqTf
 ZkA7s90QxezK64kU53NscXHC4osJRJh/P6tUAZ125wYtyxU8V+qaXu9u+s0t0MKAzlFt
 by/wdI6tF51b6A+HTMZuT2G6a2F0YDKWR1hFwVyJUjW6Untx6P9kHdv5YYwJE2uP+ktQ
 N1p0V9E3TpBvOxYFYuxlhP716AsjFxpJR3Yj+m8aADat4QVTBTjsq893XuH+kr1I1A2S
 1mRA==
X-Gm-Message-State: AOAM530BFZ6QAfMAjnjTYP8T6f+GjgkZXFn/343CZOzYsZcNhpG+fEXq
 paiQZx21WrxH9R8z2YedvM9hI9bt58FZy9TuYh6q8b/n2WXnakQ1xX54+q7ziFOgGcI1QWzBhuX
 5cJIQfEOPf35S2LU=
X-Received: by 2002:adf:c00a:: with SMTP id z10mr30580229wre.315.1634044391091; 
 Tue, 12 Oct 2021 06:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx+9ELij0Q65Ynf0EuuTY+loDu1Q2ZZXH6b9vaho11nXIMo4u0CRBqjZ0ZfVOj9yFwU2TzGA==
X-Received: by 2002:adf:c00a:: with SMTP id z10mr30580179wre.315.1634044390779; 
 Tue, 12 Oct 2021 06:13:10 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id r9sm10253776wru.2.2021.10.12.06.13.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:13:10 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:13:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012131308.45j7ofd4xwk42epv@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <20211012103754.kbyd3du26rpsi3ie@gator.home>
 <20211012142754.1c4e5071@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012142754.1c4e5071@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
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
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 02:27:54PM +0200, Igor Mammedov wrote:
> On Tue, 12 Oct 2021 12:37:54 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Tue, Oct 12, 2021 at 11:40:16AM +0200, Igor Mammedov wrote:
> > > On Wed,  6 Oct 2021 18:22:08 +0800
> > > Gavin Shan <gshan@redhat.com> wrote:
> > >   
> > > > The following option is used to specify the distance map. It's
> > > > possible the option isn't provided by user. In this case, the
> > > > distance map isn't populated and exposed to platform. On the
> > > > other hand, the empty NUMA node, where no memory resides, is
> > > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > > their corresponding device-tree nodes aren't populated, but
> > > > their NUMA IDs should be included in the "/distance-map"
> > > > device-tree node, so that kernel can probe them properly if
> > > > device-tree is used.
> > > > 
> > > >   -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > 
> > > > So when user doesn't specify distance map, we need to generate
> > > > the default distance map, where the local and remote distances
> > > > are 10 and 20 separately. This adds an extra parameter to the
> > > > exiting complete_init_numa_distance() to generate the default
> > > > distance map for this case.
> > > > 
> > > > Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > > 
> > > 
> > > how about error-ing out if distance map is required but
> > > not provided by user explicitly and asking user to fix
> > > command line?
> > > 
> > > Reasoning behind this that defaults are hard to maintain
> > > and will require compat hacks and being raod blocks down
> > > the road.
> > > Approach I was taking with generic NUMA code, is deprecating
> > > defaults and replacing them with sanity checks, which bail
> > > out on incorrect configuration and ask user to correct command line.
> > > Hence I dislike approach taken in this patch.
> > > 
> > > If you really wish to provide default, push it out of
> > > generic code into ARM specific one
> > > (then I won't oppose it that much (I think PPC does
> > > some magic like this))
> > > Also behavior seems to be ARM specific so generic
> > > NUMA code isn't a place for it anyways  
> > 
> > The distance-map DT node and the default 10/20 distance-map values
> > aren't arch-specific. RISCV is using it too.
> > 
> > I'm on the fence with this. I see erroring-out to require users
> > to provide explicit command lines as a good thing, but I also
> > see it as potentially an unnecessary burden for those that want
> > the default map anyway. The optional nature of the distance-map
> > node and the specification of the default map is here [1]
> > 
> > [1] Linux source: Documentation/devicetree/bindings/numa.txt
> 
> Looking at proposed linux patches [ https://lkml.org/lkml/2021/9/27/31 ],
> using optional distance table as source for numa-node-ids,
> looks like a hack around kernel's inability to fish them out
> from CPU &| PCI nodes (using those nodes as source should
> cover memory-less node use-case).
> 
> I consider including optional node as a policy decision.
> So user shall include it explicitly on QEMU command line
> if necessary (that works just fine for x86), or guest OS
> can make up defaults on its own in absence of data.

OK, so erroring-out on configs that must provide distance-maps, rather
than automatically generating them for all configs is better.

> 
> > So, my r-b stands for this patch, but I also wouldn't complain
> > about respinning it to error out instead.
> 
> > I would complain about
> > moving the logic to Arm specific code, though, since RISCV would
> > then need to duplicate it.
> 
> Instead of putting workaround in QEMU and then making them generic,
> I'd prefer to:
>  1. make QEMU to be able generate DT with memory-less nodes

How? DT syntax doesn't allow this, because each node needs a unique
name which is derived from its base address, which an empty numa
node doesn't have.

>  2. fix guest to get numa-node-id from CPU/PCI nodes if
>     memory node isn't present,

I'm not sure that's possible with DT. If it is, then proposing it
upstream to Linux DT maintainers would be the next step.

> or use ACPI tables which can
>     describe memory-less NUMA nodes if fixing how DT is
>     parsed unfeasible.

We use ACPI already for our guests, but we also generate a DT (which
edk2 consumes). We can't generate a valid DT when empty numa nodes
are put on the command line unless we follow a DT spec saying how
to do that. The current spec says we should have a distance-map
that contains those nodes.

Thanks,
drew


