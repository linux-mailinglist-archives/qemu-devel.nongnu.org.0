Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FCC401842
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 10:50:45 +0200 (CEST)
Received: from localhost ([::1]:49000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNAKw-0003PF-Q9
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 04:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNAJh-0002ik-Ka
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 04:49:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNAJe-0000pj-Ao
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 04:49:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630918160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BA64cONkSrozLapBBAogA0JbHMeh0Ry4mHgcwKyR1CU=;
 b=EAlsf0pD4b7kzhLqokPcuNmhVlMknZSyzRnnvyDmE8lx1zEd3aEtrYS4lYd6ktFa2ROstB
 UdicMsN4IMKhfpRB0gjt2pqpo4L6WR3Poz4cNFlZSzt0lbOuocpVTbxa/vEa/AToJWoiY3
 JKGOYPl1bWPXHASGHVhSwBjY/SY6SnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-qB_7mn1vMbuunoug3uwNPQ-1; Mon, 06 Sep 2021 04:49:19 -0400
X-MC-Unique: qB_7mn1vMbuunoug3uwNPQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 y11-20020aa7d50b000000b003ca1ef38cf3so3356566edq.7
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 01:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BA64cONkSrozLapBBAogA0JbHMeh0Ry4mHgcwKyR1CU=;
 b=rc2r3vJCMsJleAgQafg0k5SSClC8/tFWfRIpndO5NC0tfbv/ZyemgufY14JNfPW2Dg
 R5aFywDqHwBlcNsbNGAGlSXo3H/f2PCwafW+1UEqN2GSFpMM7JqmnnB9DpipHBy2QclS
 abA7XPayZC34bnI5ahn2+EeYGBqgi0tB0/gbInslIly6Ifyf21RLCz13VqPQLjp+XsGd
 WdrDlXNx7l0A8X88a3RXjsEMsCXZjVZxmPBCNfH8dQcrdcfrSIHrk/i/RNJxUTPUTeCj
 EWAFzM1KDEyKWZTRvz6GuzO08HTo7Aq39SPmuqcPiRgIAZpeUSnV9gK0VO6MOtLjaYap
 52Gg==
X-Gm-Message-State: AOAM5322y4EuhhgTqrrzXv6WKUjBaXpTbKwL5sXKhklggmQP2FrJKXUm
 +2HMQCWzLWSx0Teew0baow0Vj7U1o67/81ITyQluTkUtlGlliyVDgFVzRhsxMRDeFSV7xJZlviH
 HBXkilpfdDWdBhAI=
X-Received: by 2002:a17:906:f20a:: with SMTP id
 gt10mr12467571ejb.487.1630918158161; 
 Mon, 06 Sep 2021 01:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz20zZw+IDd5o/2FvHSKBzIoriXc69sJcnIqw9m7dcPplIgTgQa82c+5mKiibtU2iPgqcFtbQ==
X-Received: by 2002:a17:906:f20a:: with SMTP id
 gt10mr12467550ejb.487.1630918157939; 
 Mon, 06 Sep 2021 01:49:17 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s18sm3587989ejh.12.2021.09.06.01.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 01:49:17 -0700 (PDT)
Date: Mon, 6 Sep 2021 10:49:15 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210906104915.7dd5c934@redhat.com>
In-Reply-To: <YTJHOnZNyYUkGV9O@t490s>
References: <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
 <YScPg0cYYGxxTz+b@xz-m1.local> <87y28oy6rm.fsf@dusky.pond.sub.org>
 <20210826133629.2ddd3b88@redhat.com> <YSean3PIkslbTHeU@t490s>
 <YS0rXQXwqKjhr4TA@t490s> <20210902102616.1b596104@redhat.com>
 <YTDVh9/MVAfCdkeu@t490s> <20210903150005.58afaf10@redhat.com>
 <YTJHOnZNyYUkGV9O@t490s>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: "Daniel P . =?UTF-8?B?QmVycmFu?=
 =?UTF-8?B?Z8Op?=" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 Sep 2021 12:03:06 -0400
Peter Xu <peterx@redhat.com> wrote:

> On Fri, Sep 03, 2021 at 03:00:05PM +0200, Igor Mammedov wrote:
> > PS:
> > Another, albeit machine depended approach to resolve IOMMU ordering problem
> > can be adding to a specific machine  pre_plug hook, an IOMMU handling.
> > Which is called during IOMMU realize time and check if existing buses
> > without bypass enabled (iommu managed) have any children. And if they
> > have devices attached, error out telling user to reorder '-device iommu'
> > before affected devices/bus.
> > It should cover mixed IOMMU+bypass case and doesn't require fixing
> > vfio-pci address space initialization nor defining any priorities
> > for PCI devices.  
> 
> This sounds appealing among the approaches.

That's the easy one, compared to moving address space (re)initialization
to reset time (at least to me since vfio realize looks intimidating on
the first glance, but its maintainer(s) probably should know enough to
impl. change properly).

 
> Does it need to be a pre_plug hook?  I thought we might just need a flag in the
> pci device classes showing that it should be after vIOMMUs, then in vIOMMU
> realize functions we walk pci bus to make sure no such device exist?
> 
> We could have a base vIOMMU class, then that could be in the realize() of the
> common class.

We basically don't know if device needs IOMMU or not and can work
with/without it just fine. In this case I'd think about IOMMU as board
feature that morphs PCI buses (some of them) (address space, bus numers, ...).
So I don't perceive any iommu flag as a device property at all.

As for realize vs pre_plug, the later is the part of abstract realize
(see: device_set_realized) and is already used by some PCI infrastructure:
  ex: pcie_cap_slot_pre_plug_cb/spapr_pci_pre_plug

It's purpose is to check pre-conditions and possibly pre-configure some
some wiring on behalf of device's parent hot-plug handler (bus owner/machine),
and fail cleanly if something is wrong without leaving side effects.

See 0ed48fd32eb8 for boiler plate required to set up custom hot-plug handler.
You might need only parts of it, but still it's something that's to be done
for each affected machine type, to implement error checking at proper
layer.

So I'd rather look into 'reset' approach and only if that doesn't
look possible, resort to adding pre_plug/error check.


PS:
 yours d2321d31ff98b & c6cbc29d36f look to me like another candidate
 for pre_plug for pci deivice instead of adding dedicated hook
 just for vfio-pci to generic machine.
 
> > (but I think it's more a hack compared earlier suggested
> > address space initialization at reset time, and it would need to be
> > done for every affected machine)  
> 
> Agreed.
> 


