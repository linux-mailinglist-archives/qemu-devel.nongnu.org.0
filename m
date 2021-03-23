Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0411A345F10
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 14:11:26 +0100 (CET)
Received: from localhost ([::1]:49548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgof-0002Hw-2V
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 09:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOgkQ-0006lL-G2
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:07:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lOgkO-0002jl-8P
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 09:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616504819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=++WUv2Aggw7xmJ3yto74C5jtxZe8kW2BL7WOGDXNEnI=;
 b=KJRQYJbcO9iSvMADZTvDaxhEfH6d9QXfbN2Kc87rbiePxuF0zQ0ELrtVXvgmtL1OlkQ5fe
 KnA2qwLvFWMyB0618sIjKYcCFNPjT5RPIbGh8HQPVP6hjw9Xt1YlFNnWHown8eE7pyFVXX
 sW9m89zik945/bNUcWo3raeo6rRzQyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385--_7vPZrhOKGd-_xoTkWL-Q-1; Tue, 23 Mar 2021 09:06:55 -0400
X-MC-Unique: -_7vPZrhOKGd-_xoTkWL-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CC7681746E;
 Tue, 23 Mar 2021 13:06:54 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 333259CA0;
 Tue, 23 Mar 2021 13:06:38 +0000 (UTC)
Date: Tue, 23 Mar 2021 14:06:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [RFC] adding a generic QAPI event for failed device hotunplug
Message-ID: <20210323140636.1a89eaab@redhat.com>
In-Reply-To: <YFlhiNorrttIslFf@yekko.fritz.box>
References: <d9567bf3-8740-e8fe-b29b-a3b0ebdb5809@gmail.com>
 <87blbt60hc.fsf@dusky.pond.sub.org>
 <8b79c207-f653-9eec-77f1-ea46c7c75ad5@gmail.com>
 <YEbp4wKK/QY7uKYw@yekko.fritz.box>
 <87mtvczvzw.fsf@dusky.pond.sub.org>
 <98d44670-5a63-1feb-aad8-9dbc62cf2e7a@gmail.com>
 <YErBpf7w25xho1so@yekko.fritz.box>
 <875z1w7ptm.fsf@dusky.pond.sub.org>
 <YFg7qYYBqGZuKSO+@yekko.fritz.box>
 <fc4b9be9-8fca-cfba-5c26-f3ad8ae8035c@redhat.com>
 <YFlhiNorrttIslFf@yekko.fritz.box>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, michael.roth@amd.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Julia Suvorova <jusual@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, Laine Stump <laine@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, jfreimann@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Mar 2021 14:33:28 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Mon, Mar 22, 2021 at 01:06:53PM +0100, Paolo Bonzini wrote:
> > On 22/03/21 07:39, David Gibson wrote:  
> > > > QEMU doesn't really keep track of "in flight" unplug requests, and as
> > > > long as that's the case, its timeout even will have the same issue.  
> > > Not generically, maybe.  In the PAPR code we effectively do, by means
> > > of the 'unplug_requested' boolean in the DRC structure.  Maybe that's
> > > a mistake, but at the time I couldn't see how else to handle things.  
> > 
> > No, that's good.  x86 also tracks it in some registers that are accessible
> > from the ACPI firmware.  See "PCI slot removal notification" in
> > docs/specs/acpi_pci_hotplug.txt.
> >   
> > > Currently we will resolve all "in flight" requests at machine reset
> > > time, effectively completing those requests.  Does that differ from
> > > x86 behaviour?  
> > 
> > IIRC on x86 the requests are instead cancelled, but I'm not 100%
> > sure.  
> 
> Ah... we'd better check that and try to make ppc consistent with
> whatever it does.
> 

Sorry for being late to discussion, I can't say much for all possible ways to unplug
PCI device (aside that it's a complicated mess), but hopefully I can shed some light on
state/behavior of ACPI based methods.

* x86 - ACPI based PCI hotplug
 Its sole existence was dictated by Widows not supporting SHPC (conventional PCI),
 and it looks like 'thanks' to Windows buggy drivers we would have to use it for
 PCI-E  as well (Julia works on it).
 HW registers described in docs/specs/acpi_pci_hotplug.txt are our own invention,
 they help to raise standard ACPI 'device check' and 'eject request' events when
 guest executes AML bytecode. Potentially there is possibility for guest to report
 plug/unplug progress via ACPI _OST method (including failure/completion) but given
 my experience with how Windows PCI core worked so far that may be not used by it
 (honestly I haven't tried to explore possibility, due to lack of interest in it).
 
 regarding unplug - on device_del QEMU raises SCI interrupt, after this the process is
 asynchronous. When ACPI interpreter gets SCI it sends a respective _EJ0 event to
 devices mentioned in PCI_DOWN_BASE register. After getting the event, guest OS may
 decide to eject PCI device (which causes clearing of device's bit in PCI_DOWN_BASE)
 or refuse to do it. There is no any progress tracking in QEMU for failure and device's
 bit in PCI_DOWN_BASE is kept set. On the next device_(add|del) (for any PCI device)
 guest will see it again and will retry removal.
 Also if guest reboots with any bits in PCI_DOWN_BASE set, respective devices will
 be deleted on QEMU side.
 There is no other way to cancel removal request in PCI_DOWN_BASE, aside of explicitly
 ejecting device on guest request or implicitly on reboot.
 IMHO:
     Sticky nature of PCI_(UP|DOWN)_BASE is more trouble than help but its there since
     SeaBios times so it's ABI we are stuck with. If I were re-implementing it now,
     I would use one shot event that's cleared once guest read it and if possible
     implement _OST status reporting (if it works on Windows).
 As it stands now, once device_del is issued one user can't know when PCI device will be
 removed. No timeout will help with it.
 
* ACPI CPU/Memory hotplug
 Events triggered by device_del are one shot, then guest may report progress to QEMU using
 _OST method (qapi_event_send_acpi_device_ost) (I know that libvirt were aware of it,
 but I don't recall what it does with it). So QEMU might send '_UNPLUG_ERROR' event to
 user if guest decides so. But instead of duplicating all possible events from spec
 QEMU will pass _OST arguments [1] as is for user to interpret as described by standard.
 Though I'd say _OST is not 100% reliable, depending used Windows or linux kernel version
 they might skip on reporting some events. But I don't recall exact state at the time I've
 been testing it. So I'd call status reporting support as 'best effort'.
 Also it doesn't feature pending removal on reboot, that our ACPI PCI hotplug code has.
 So with well behaving guest user will get notified about failure or device removal (when
 guest is able to run its code), for broken guests I'm more inclined to say 'use fixed guest'
 to get sane behavior.
 Policy for user is to retry on failure (there is no bad side effects on retry).

I think that any kind of timeout here is inherently racy, in async hot[un]plug usecase,
all user has to do is just sufficiently over-commit host (or run it nested).
So it's just a question of how long it will take for user to come back with a bug report. 

* As far as I'm aware mentioned 'pending_deleted_event' is there to make transparent
  failover magic happen (CCing Jens, also Michael might know how it works)

* SHCP & PCI-E has its own set of unplug quirks, which I know little about but Julia worked
  with Michael on fixing PCI-E bugs (mostly related how Windows drivers handle unplug,
  some are not possible to fix, hence decision to add ACPI based hotplug to Q35 as workaround).
  So they might know specifics.

1) ACPI spec: _OST (OSPM Status Indication)


