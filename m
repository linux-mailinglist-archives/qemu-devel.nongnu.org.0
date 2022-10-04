Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C825F3E98
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 10:42:01 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofdV1-0007Md-Ev
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 04:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofcqv-0004dl-1n
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ofcqr-0004y3-4r
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 04:00:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664870428;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NASjIEklrkwxhrCUZsSLoN0jURbBE3jpj7oxn+ovG8=;
 b=bcEpxhTkb8n0BB9PNaYmbNtjy+TfRPcB9y9ZplZQEF8ym9rwWgcL4oKy0iloRN6WlwcfG5
 B+eLx+aBIJ1LO8YkCvGkC59PHdCxuY9GIDeG8dok8pxgdMUVb3hcNEMVZig8y02Jtqol9U
 vvpB41FByJxCGJuVB1/DreAufL1Z//0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-mvWRqeU3OTiECECrPUXoPw-1; Tue, 04 Oct 2022 04:00:24 -0400
X-MC-Unique: mvWRqeU3OTiECECrPUXoPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 551C48027ED;
 Tue,  4 Oct 2022 08:00:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 773E9492B04;
 Tue,  4 Oct 2022 08:00:22 +0000 (UTC)
Date: Tue, 4 Oct 2022 09:00:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 06/13] mac_newworld: Simplify creation of Uninorth
 devices
Message-ID: <YzvoDktfkVhPuv5m@redhat.com>
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <4a039abeeddcc6c987065ca526c6fa0457784615.1664108862.git.balaton@eik.bme.hu>
 <fbb38c03-6092-78e2-c1af-e37f1674bad4@ilande.co.uk>
 <76294919-528e-4174-b8df-8e97c10c788a@amsat.org>
 <87pmf8gkhu.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pmf8gkhu.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 08:39:57AM +0200, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
> > Cc'ing CLI refactor team.
> >
> > On 29/9/22 09:39, Mark Cave-Ayland wrote:
> >> On 25/09/2022 13:38, BALATON Zoltan wrote:
> >> 
> >>> Avoid open coding sysbus_mmio_map() and map regions in ascending
> >>> otder. Reorganise code a bit to avoid some casts.
> >>>
> >>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >>> ---
> >>>   hw/ppc/mac_newworld.c | 42 +++++++++++++++++-------------------------
> >>>   1 file changed, 17 insertions(+), 25 deletions(-)
> >
> >> Same comment here re: sysbus. Also the patch seems correct here, but it is worth noting that the PCI bus initialisation is order sensitive: the 
> >> last bus created is the one that becomes the default PCI bus for -device, so changing this would break quite a few command lines...
> >
> > Eh, I was not aware of this API fragility. So when using -device without
> > expliciting the 'bus' key, the default is the latest bus created... OK.
> 
> Yes, our external interface is in part defined implicitly by the order
> in board code execution.  It goes deeper than just CLI, I'm afraid.
> 
> Omitting bus= is a convenience feature for users.  It's clearly useful.
> But what's the default?  We walk the qdev tree rooted at the main system
> bus looking for a bus of suitable bus type that is not full, or else of
> suitable type that is full.  See qdev_find_recursive().  The tree walk
> visits children in creation order.  Therefore, bus creation order is
> ABI.

There are different levels of ABI importance, however, depending on
which target/machine type we're talking about.

The critically important ABI is for anything that is part of, or used
by, machine types which are versioned. These are our top tier platforms,
typically associated with KVM and mgmt apps expect continuity from us,
and will usually be fully explicit in their configuration.

The less important ABI is for the non-versioned machine types. These
are typically associated with emulating legacy hardware platforms.
Users are more likely to use the convenience syntax, leaving out as
many implicit properties as possible.

ppc/mac_newworld is one of the latter class.

It is still desirable to avoid gratuitous changes that are likely
to break existing user's configurations of QEMU, but it is not
quite so critical. If someone can make a good case for why it is
better, it can be considered

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


