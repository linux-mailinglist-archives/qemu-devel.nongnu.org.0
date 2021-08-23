Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA33F5329
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 00:06:25 +0200 (CEST)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mII5I-0000Mj-0c
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 18:06:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mII4F-00084V-An
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:05:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mII4C-00007B-PF
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 18:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629756315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uyiy+RecJktL+e58EiIJUeKfd4ska3F/ulJ1KTvU/uI=;
 b=KQty6v9D6BT3RRSnzm+dlcOPgm7eV6ind16cStTTpvNI1W1+VoUllwZ0sCWAYv+WWkbAYb
 +r1w7/IiBN136XD8mByzj3ZD6S1ML3xkSpcFVp8aFMi56ewJFErAWRRVyOmBJZkDjc0duS
 bzREwanplt4Vr81J4shnPblWgiLHeiU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-aYsdvAGJO2OclvznQ6jTgQ-1; Mon, 23 Aug 2021 18:05:13 -0400
X-MC-Unique: aYsdvAGJO2OclvznQ6jTgQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 k13-20020aa7c04d000000b003bf04c03fc4so9520080edo.22
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 15:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uyiy+RecJktL+e58EiIJUeKfd4ska3F/ulJ1KTvU/uI=;
 b=JH3m9PQFBlPzYATb+B1uo7g9/qoEqJspCAAdOSv+0GhU+yp0ChDEqtehAR9Lo6vLUP
 /LqI6+z3CRG3iwFT2WlS5mpP1nxhN2HLc/DJ9E3V48b8qP50/ozDvlNJc0hMbp4sW/ue
 xHwBi5Plv6N1z/5B5j92bV/ycIENluGzvxwqPwlOL3btVGITsvdozGuxopuGlqtQ+o7n
 7IutBwMJts2FeG14vloBbyDipZSY3DfE1b0PP+CVvFa2VK5Si7+X6uFFLJtmVjrkGpjW
 gOM1AdB9ziLKfoT3eDGb0t4GeFHtYW82lXMvJvJdIcf84OJQM7z84MEnvXprnneKFTWD
 mftA==
X-Gm-Message-State: AOAM5339Z71MKYHVOU+ttc6XINMeNSVc+0HLi9bOzex1W8HMk0HOdFG4
 FN89YPE/k5rNG5MakvCHquwM72VghkqNvCaTFTPhGVF7XSGPi7K8DB9wGNCm2mGatQySyCkj28i
 uenawC0gPDh0JlPo=
X-Received: by 2002:a17:906:dfe6:: with SMTP id
 lc6mr6445247ejc.210.1629756312767; 
 Mon, 23 Aug 2021 15:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPtr5QK7YFgdVAxHzoCbN3PhtMod5Puu7AROwSOCvV+G2JsZgDh2XD961ZK1Q+fK4W2hAeqQ==
X-Received: by 2002:a17:906:dfe6:: with SMTP id
 lc6mr6445221ejc.210.1629756312553; 
 Mon, 23 Aug 2021 15:05:12 -0700 (PDT)
Received: from redhat.com ([2.55.137.225])
 by smtp.gmail.com with ESMTPSA id e11sm2930746edq.30.2021.08.23.15.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 15:05:11 -0700 (PDT)
Date: Mon, 23 Aug 2021 18:05:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
Message-ID: <20210823175457-mutt-send-email-mst@kernel.org>
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net>
 <YSP0m83roQytqvDr@t490s>
MIME-Version: 1.0
In-Reply-To: <YSP0m83roQytqvDr@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 03:18:51PM -0400, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 02:49:12PM -0400, Eduardo Habkost wrote:
> > On Wed, Aug 18, 2021 at 03:43:18PM -0400, Peter Xu wrote:
> > > QEMU creates -device objects in order as specified by the user's cmdline.
> > > However that ordering may not be the ideal order.  For example, some platform
> > > devices (vIOMMUs) may want to be created earlier than most of the rest
> > > devices (e.g., vfio-pci, virtio).
> > > 
> > > This patch orders the QemuOptsList of '-device's so they'll be sorted first
> > > before kicking off the device realizations.  This will allow the device
> > > realization code to be able to use APIs like pci_device_iommu_address_space()
> > > correctly, because those functions rely on the platfrom devices being realized.
> > > 
> > > Now we rely on vmsd->priority which is defined as MigrationPriority to provide
> > > the ordering, as either VM init and migration completes will need such an
> > > ordering.  In the future we can move that priority information out of vmsd.
> > > 
> > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > 
> > Can we be 100% sure that changing the ordering of every single
> > device being created won't affect guest ABI?  (I don't think we can)
> 
> That's a good question, however I doubt whether there's any real-world guest
> ABI for that.  As a developer, I normally specify cmdline parameter in an adhoc
> way, so that I assume most parameters are not sensitive to ordering and I can
> tune the ordering as wish.  I'm not sure whether that's common for qemu users,
> I would expect so, but I may have missed something that I'm not aware of.
> 
> Per my knowledge the only "guest ABI" change is e.g. when we specify "vfio-pci"
> to be before "intel-iommu": it'll be constantly broken before this patchset,
> while after this series it'll be working.  It's just that I don't think those
> "guest ABI" is necessary to be kept, and that's exactly what I want to fix with
> the patchset..
> 
> > 
> > How many device types in QEMU have non-default vmsd priority?
> 
> Not so much; here's the list of priorities and the devices using it:
> 
>        |--------------------+---------|
>        | priority           | devices |
>        |--------------------+---------|
>        | MIG_PRI_IOMMU      |       3 |
>        | MIG_PRI_PCI_BUS    |       7 |
>        | MIG_PRI_VIRTIO_MEM |       1 |
>        | MIG_PRI_GICV3_ITS  |       1 |
>        | MIG_PRI_GICV3      |       1 |
>        |--------------------+---------|

iommu is probably ok. I think virtio mem is ok too,
in that it is normally created by virtio-mem-pci ...



> All the rest devices are using the default (0) priority.
> 
> > 
> > Can we at least ensure devices with the same priority won't be
> > reordered, just to be safe?  (qsort() doesn't guarantee that)
> > 
> > If very few device types have non-default vmsd priority and
> > devices with the same priority aren't reordered, the risk of
> > compatibility breakage would be much smaller.
> 
> I'm also wondering whether it's a good thing to break some guest ABI due to
> this change, if possible.
> 
> Let's imagine something breaks after applied, then the only reason should be
> that qsort() changed the order of some same-priority devices and it's not the
> same as user specified any more.  Then, does it also means there's yet another
> ordering requirement that we didn't even notice?
> 
> I doubt whether that'll even happen (or I think there'll be report already, as
> in qemu man page there's no requirement on parameter ordering).  In all cases,
> instead of "keeping the same priority devices in the same order as the user has
> specified", IMHO we should make the broken devices to have different priorities
> so the ordering will be guaranteed by qemu internal, rather than how user
> specified it.

Well giving user control of guest ABI is a reasonable thing to do,
it is realize order that users do not really care about.

I guess we could move pci slot allocation out of realize
so it does not depend on realize order?


> >From that pov, maybe this patchset would be great if it can be accepted and
> applied in early stage of a release? So we can figure out what's missing and
> fix them within the same release.  However again I still doubt whether there's
> any user that will break in a bad way.
> 
> Thanks,
> 
> -- 
> Peter Xu


