Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD6E3F7210
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 11:41:04 +0200 (CEST)
Received: from localhost ([::1]:53778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIpP5-0007HD-Qe
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 05:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIpNz-0006EZ-VV
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mIpNw-0000gb-K2
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 05:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629884390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7tTmTdvAMxkrCGqlbrtvc/1jqXyYkBh/mpPSnZTYdj8=;
 b=eGVoq76v3+AJo71H/khyJJE4m0c0SGcs3wk5KM2kSyHYW67339S1XZKDPiRXX6PnrFKnvA
 B2LtiW/Cr9zb8pfnGgoOfhfKlCm/SruxZCuZsFSy7qkIP3T6SyXGFc6E90w8wIMde+ZD6x
 pS88GN//EY94cDzUMhBOz/ROt2bgl2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-Xa-kzSp1NZuV_Z1p7g9YGQ-1; Wed, 25 Aug 2021 05:39:49 -0400
X-MC-Unique: Xa-kzSp1NZuV_Z1p7g9YGQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D260B8799E0
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:39:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B6335D741;
 Wed, 25 Aug 2021 09:39:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF32C11380A9; Wed, 25 Aug 2021 11:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net> <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net> <YSQp0Nh6Gs5equAG@t490s>
Date: Wed, 25 Aug 2021 11:39:32 +0200
In-Reply-To: <YSQp0Nh6Gs5equAG@t490s> (Peter Xu's message of "Mon, 23 Aug 2021
 19:05:52 -0400")
Message-ID: <8735qxhnhn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
Cc: "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Mon, Aug 23, 2021 at 05:56:23PM -0400, Eduardo Habkost wrote:
>> I don't have any other example, but I assume address assignment
>> based on ordering is a common pattern in device code.
>> 
>> I would take a very close and careful look at the devices with
>> non-default vmsd priority.  If you can prove that the 13 device
>> types with non-default priority are all order-insensitive, a
>> custom sort function as you describe might be safe.
>
> Besides virtio-mem-pci, there'll also similar devfn issue with all
> MIG_PRI_PCI_BUS, as they'll be allocated just like other pci devices.  Say,
> below two cmdlines will generate different pci topology too:
>
>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
>                        -device pcie-root-port,chassis=1 \
>                        -device virtio-net-pci
>
> And:
>
>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
>                        -device virtio-net-pci
>                        -device pcie-root-port,chassis=1 \
>
> This cannot be solved by keeping priority==0 ordering.
>
> After a second thought, I think I was initially wrong on seeing migration
> priority and device realization the same problem.
>
> For example, for live migration we have a requirement on PCI_BUS being migrated
> earlier than MIG_PRI_IOMMU because there's bus number information required
> because IOMMU relies on the bus number to find address spaces.  However that's
> definitely not a requirement for device realizations, say, realizing vIOMMU
> after pci buses are fine (bus assigned during bios).
>
> I've probably messed up with the ideas (though they really look alike!).  Sorry
> about that.
>
> Since the only ordering constraint so far is IOMMU vs all the rest of devices,
> I'll introduce a new priority mechanism and only make sure vIOMMUs are realized
> earlier.  That'll also avoid other implications on pci devfn allocations.
>
> Will rework a new version tomorrow.  Thanks a lot for all the comments,

Is it really a good idea to magically reorder device realization just to
make a non-working command line work?  Why can't we just fail the
non-working command line in a way that tells users how to get a working
one?  We have way too much ordering magic already...

If we decide we want more magic, then I'd argue for *dependencies*
instead of priorities.  Dependencies are specific and local: $this needs
to go after $that because $reasons.  Priorities are unspecific and
global.


