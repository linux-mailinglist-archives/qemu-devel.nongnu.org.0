Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DDE3F81D5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 06:58:37 +0200 (CEST)
Received: from localhost ([::1]:39710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJ7TJ-0001hu-0t
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 00:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJ7SU-000120-LA
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 00:57:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJ7SS-0005Dg-Us
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 00:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629953864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7MthSN1XHCkOQmrHvP2QBSEyNOH77dOvXau10dTLUnA=;
 b=Bth0MXsMWkVGucvJgpO1Vp70K2CRPUAfObbFk3Lbd4feGA7pi7/6GNHg3SIaQilXVYEgAi
 2QkRrvyHuF4JdGJpY40I6cO37mcIVciNQx7ThD3yR348QDL8FR1XhcpEygUycLhSX2Mb26
 p+B2nHkcPIhlteMu70hb8i6HeYUD9GU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-QOqTX6LaP06XHgvFnmHq_A-1; Thu, 26 Aug 2021 00:57:42 -0400
X-MC-Unique: QOqTX6LaP06XHgvFnmHq_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9068100E420
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 04:57:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 007F45F724;
 Thu, 26 Aug 2021 04:57:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E5D411380A9; Thu, 26 Aug 2021 06:57:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 4/4] vl: Prioritize realizations of devices
References: <20210818194217.110451-1-peterx@redhat.com>
 <20210818194318.110993-1-peterx@redhat.com>
 <20210823184912.mazqfn7gurntj7ld@habkost.net> <YSP0m83roQytqvDr@t490s>
 <20210823210703.cikdkhvyeqqypaqa@habkost.net> <YSQTwth0elaz4T8W@t490s>
 <20210823215623.bagyo3oojdpk3byj@habkost.net> <YSQp0Nh6Gs5equAG@t490s>
 <8735qxhnhn.fsf@dusky.pond.sub.org>
 <87h7fdg12w.fsf@dusky.pond.sub.org> <YSa7H3wGUHgccCrU@t490s>
Date: Thu, 26 Aug 2021 06:57:26 +0200
In-Reply-To: <YSa7H3wGUHgccCrU@t490s> (Peter Xu's message of "Wed, 25 Aug 2021
 17:50:23 -0400")
Message-ID: <87lf4o3irt.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> writes:

> On Wed, Aug 25, 2021 at 02:28:55PM +0200, Markus Armbruster wrote:
>> Markus Armbruster <armbru@redhat.com> writes:
>> 
>> > Peter Xu <peterx@redhat.com> writes:
>> >
>> >> On Mon, Aug 23, 2021 at 05:56:23PM -0400, Eduardo Habkost wrote:
>> >>> I don't have any other example, but I assume address assignment
>> >>> based on ordering is a common pattern in device code.
>> >>> 
>> >>> I would take a very close and careful look at the devices with
>> >>> non-default vmsd priority.  If you can prove that the 13 device
>> >>> types with non-default priority are all order-insensitive, a
>> >>> custom sort function as you describe might be safe.
>> >>
>> >> Besides virtio-mem-pci, there'll also similar devfn issue with all
>> >> MIG_PRI_PCI_BUS, as they'll be allocated just like other pci devices.  Say,
>> >> below two cmdlines will generate different pci topology too:
>> >>
>> >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
>> >>                        -device pcie-root-port,chassis=1 \
>> >>                        -device virtio-net-pci
>> >>
>> >> And:
>> >>
>> >>   $ qemu-system-x86_64 -device pcie-root-port,chassis=0 \
>> >>                        -device virtio-net-pci
>> >>                        -device pcie-root-port,chassis=1 \
>> >>
>> >> This cannot be solved by keeping priority==0 ordering.
>> >>
>> >> After a second thought, I think I was initially wrong on seeing migration
>> >> priority and device realization the same problem.
>> >>
>> >> For example, for live migration we have a requirement on PCI_BUS being migrated
>> >> earlier than MIG_PRI_IOMMU because there's bus number information required
>> >> because IOMMU relies on the bus number to find address spaces.  However that's
>> >> definitely not a requirement for device realizations, say, realizing vIOMMU
>> >> after pci buses are fine (bus assigned during bios).
>> >>
>> >> I've probably messed up with the ideas (though they really look alike!).  Sorry
>> >> about that.
>> >>
>> >> Since the only ordering constraint so far is IOMMU vs all the rest of devices,
>> >> I'll introduce a new priority mechanism and only make sure vIOMMUs are realized
>> >> earlier.  That'll also avoid other implications on pci devfn allocations.
>> >>
>> >> Will rework a new version tomorrow.  Thanks a lot for all the comments,
>> >
>> > Is it really a good idea to magically reorder device realization just to
>> > make a non-working command line work?  Why can't we just fail the
>> > non-working command line in a way that tells users how to get a working
>> > one?  We have way too much ordering magic already...
>> >
>> > If we decide we want more magic, then I'd argue for *dependencies*
>> > instead of priorities.  Dependencies are specific and local: $this needs
>> > to go after $that because $reasons.  Priorities are unspecific and
>> > global.
>> 
>> Having thought about this a bit more...
>> 
>> Constraints on realize order are nothing new.  For instance, when a
>> device plugs into a bus, it needs to be realized after the device
>> providing the bus.
>> 
>> We ensure this by having the device refer to the bus, e.g. bus=pci.0.
>> The reference may be implicit, but it's there.  It must resolve for
>> device creation to succeed, and if it resolves, the device providing the
>> bus will be realized in time.
>> 
>> I believe what's getting us into trouble with IOMMU is not having such a
>> reference.  Or in other words, keeping the dependence between the IOMMU
>> and the devices relying on it *implicit*, and thus hidden from the
>> existing realize-ordering machinery.
>> 
>> Instead of inventing another such machinery, let's try to use the one we
>> already have.
>
> Hmm... I just found that we don't have such machinery, do we?
>
> This does not really work:
>
> $ ./qemu-system-x86_64 -M q35 -device virtio-net-pci,bus=pcie.1 \
>                        -device pcie-root-port,id=pcie.1,bus=pcie.0
> qemu-system-x86_64: -device virtio-net-pci,bus=pcie.1: Bus 'pcie.1' not found
>
> While this will:
>
> $ ./qemu-system-x86_64 -M q35 -device pcie-root-port,id=pcie.1,bus=pcie.0 \
>                        -device virtio-net-pci,bus=pcie.1

This is exactly what I described.  bus=pcie.0 is the explicit reference.
It must resolve for device creation to succeed, and if it resolves, the
device providing the bus will be realized in time.  It resolves in the
second example, but not the first.

Look ma, no magic!  Instead, stupid & predictable.


