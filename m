Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2057C2E00FB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 20:29:59 +0100 (CET)
Received: from localhost ([::1]:52934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krQsX-0000ix-NT
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 14:29:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krQql-0008HJ-In
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:28:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1krQqj-00056O-7Z
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 14:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608578883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nfkKHy8qM9k9DAIrPoYSMsSOR5BdzM/x60UnwYwcWrA=;
 b=ZYBit+OUObpO2d2GAoKcSHwj8tm36LgpBaE3VILJJ7ARAtP1RyohPpnRuKoMSDbOMKgBcY
 zCRn9kw9QeId/GFascrdkD1WBWnZR9pTBXaED6c9mmO7+o3wsaT4UIVVPhTrfgkgHudlAB
 cYNIiQGuy5vLnCof8jkNSD7TP1m/OmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-UDpKtRHENraGNlenG3G63A-1; Mon, 21 Dec 2020 14:28:01 -0500
X-MC-Unique: UDpKtRHENraGNlenG3G63A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04A341007464;
 Mon, 21 Dec 2020 19:28:01 +0000 (UTC)
Received: from localhost (ovpn-113-96.rdu2.redhat.com [10.10.113.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB795D6D1;
 Mon, 21 Dec 2020 19:28:00 +0000 (UTC)
Date: Mon, 21 Dec 2020 14:28:00 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: QOM address space handling
Message-ID: <20201221192800.GC6040@habkost.net>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
 <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
 <20201218223250.GW3140057@habkost.net>
 <750e98b8-4e7b-f912-f06b-d2b835cc6113@redhat.com>
 <20201221185420.GA6040@habkost.net>
 <caf04038-213b-a88e-0dd7-ee294c0459b7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <caf04038-213b-a88e-0dd7-ee294c0459b7@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 21, 2020 at 08:16:00PM +0100, Paolo Bonzini wrote:
> On 21/12/20 19:54, Eduardo Habkost wrote:
> > On Sun, Dec 20, 2020 at 10:25:25AM +0100, Paolo Bonzini wrote:
> > > On 18/12/20 23:32, Eduardo Habkost wrote:
> > > > Who owns the FlatView reference, exactly?
> > > 
> > > The AddressSpace.  The device creates the AddressSpace, which holds a
> > > reference to the MemoryRegion through FlatView and AddressSpaceDispatch,
> > > which holds a reference to the device.
> > > 
> > > By destroying the address space that it created, the device can break the
> > > reference loop.
> > > 
> > > > If the FlatView reference is owned by the MemoryRegion, we have a
> > > > reference loop: the device holds a reference to the MemoryRegion,
> > > > which owns the FlatView, which holds a reference to the device.
> > > > In this case, who owns the reference loop and is responsible for
> > > > breaking it?
> > > 
> > > The reference loop is owned by the device, which breaks it through unrealize
> > > (called by unparent).
> > > 
> > > instance_finalize by definition cannot break reference loops, so this means
> > > that my suggestion of using address_space_init in instance_init was wrong.
> > 
> > Once we fix that, I suggest we add an assertion to make it
> > illegal to call object_ref() on an object during instance_init.
> 
> It's not necessarily illegal.  You can for example call a function that
> internally does
> 
>     object_ref(obj);
>     oc->func(obj);
>     object_unref(obj);

Oh, right.

> 
> But perhaps we could assert that refcount == 1 on exit.

That would be more difficult to debug, but would work.

> 
> > Do we know how many address_space_init() calls in instance_init
> > we have today?
> 
> I can see them in raven_pcihost_initfn, in sun4?_iommu.c's iommu_init and
> xtensa_cpu_initfn, I think that's all.

There's usb_ehci_init() too.

-- 
Eduardo


