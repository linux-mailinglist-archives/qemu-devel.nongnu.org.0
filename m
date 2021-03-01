Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8EE328126
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:45:14 +0100 (CET)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjnN-0005yC-8W
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:45:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGjPp-0000XS-Gs
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:20:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lGjPm-0003Uc-7M
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614608448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcMLKTkDA9Bdaf3fKmfj6PDQeOQLZULO5/KaYwRt0q4=;
 b=L5ZXMghfVmWsx95mc0jxquoijNy/9gAszXV7K/rEvItBJDn39E9cmg587BsS9yeNXp4XJ+
 wJ4Qxui2kxx6uetbggxh465uJbzyOYDBi6+rZcMFT+FPw/4uPILNU/v/YXwzDC4K/24i5R
 xTtjpJV63+mQ4Grk5nKEe+5RuszubnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-RqZzePEUMJuWj6KzoUdbGA-1; Mon, 01 Mar 2021 09:20:44 -0500
X-MC-Unique: RqZzePEUMJuWj6KzoUdbGA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCE46186DD21;
 Mon,  1 Mar 2021 14:20:42 +0000 (UTC)
Received: from localhost (unknown [10.40.208.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B03755D71F;
 Mon,  1 Mar 2021 14:20:39 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:20:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <20210301152036.0c12cbf5@redhat.com>
In-Reply-To: <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <967d3e1f-d387-0b33-95b0-6560f49657dd@proxmox.com>
 <20210301021449-mutt-send-email-mst@kernel.org>
 <4b7e58a9-e6bf-818f-b2f1-72600fced210@proxmox.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: vit9696 <vit9696@protonmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Mar 2021 08:45:53 +0100
Thomas Lamprecht <t.lamprecht@proxmox.com> wrote:

> On 01.03.21 08:20, Michael S. Tsirkin wrote:
> > On Mon, Mar 01, 2021 at 08:12:35AM +0100, Thomas Lamprecht wrote:  
> >> On 28.02.21 21:43, Michael S. Tsirkin wrote:  
> >>> Sure. The way to do that is to tie old behaviour to old machine
> >>> versions. We'll need it in stable too ...  
> >>
> >> Yeah, using machine types is how its meant to be with solving migration
> >> breakage, sure.
> >> But that means we have to permanently pin the VM, and any backup restored from
> >> that to that machine type *forever*. That'd be new for us as we always could
> >> allow a newer machine type for a fresh start (i.e., non migration or the like)
> >> here, and mean that lots of other improvements guarded by a newer machine type
> >> for those VMs will.  
> > 
> > If you don't do that, that is a bug as any virtual hardware
> > can change across machine types.  
> 
> For us a feature, for fresh starts one gets the current virtual HW but for
> live migration or our live snapshot code it stays compatible. Works quite
> well here for many years, as we can simply test the HW changes on existing
> VMs - which failed here due to lack of static IPs in the test bed. So yes,
> it has its problems as it is not really  what an OS considers as HW change
> so big that it makes it a new device, mostly Windows is a PITA here as seen
> in this issue.
> 
> I mean, QEMU deprecates very old machines at some point anyway, so even then
> it is impossible to keep to the old machine forever, but otoh redoing some
> changes after a decade or two can be fine, I guess?
> 
> >   
> >> And yeah, stable is wanted, but extrapolating from the current stable releases
> >> frequency, where normally there's maximal one after 5-6 months from the .0
> >> release, means that this will probably still hit all those distributions I
> >> mentioned or is there something more soon planned?
> >>
> >> Also, is there any regression testing infrastructure around to avoid such
> >> changes in the future? This change got undetected for 7 months, which can be
> >> pretty the norm for QEMU releases, so some earlier safety net would be good? Is
> >> there anything which dumps various default machine HW layouts and uses them for
> >> an ABI check of some sorts?  
> > 
> > There are various testing efforts the reason this got undetected is
> > because it does not affect linux guests, and even for windows
> > they kind of recover, there's just some boot slowdown around reconfiguration.
> > Not easy to detect automatically given windows has lots of random
> > downtime during boot around updates etc etc.
> >   
> 
> No, Windows does not reconfigure, this is a permanent change, one is just lucky
> if one has a DHCP server around in the network accessible for the guest.
> As static addresses setup on that virtual NIC before that config is gone,
> no recovery whatsoever until manual intervention.
Static IP's are the pain guest admin picked up to deal with so he might have to
reconfigure guest OS when it decides to rename NICs. In this case moving
to new QEMU is alike to updating BIOS which fixed PCI description.
(On QEMU side we try to avoid breaking changes, but sometime it happens anyway
and it's up guest admin to fix OS quirks)

> I meant more of a "dump HW layout to .txt file, commit to git, and ensure
> there's no diff without and machine version bump" (very boiled down), e.g., like
> ABI checks for kernel builds are often done by distros - albeit those are easier
> as its quite clear what and how the kernel ABI can be used.
ACPI tables are not considered as ABI change in QEMU, technically tables that QEMU
generates are firmware and not version-ed (same like we don't tie anything to
specific firmware versions). 

However we rarely do version ACPI changes (only when it breaks something or
we suspect it would break and we can't accept that breakage), this time it took
a lot of time to find out that. We try to minimize such cases as every
versioning knob adds up to maintenance.

For ACPI tables changes, QEMU has bios-tables-test, but it lets us to catch
unintended changes only.
Technically it's possible to keep master tables for old machine versions
and test against it. But I'm not sure if we should do that, because some
(most) changes are harmless or useful and should apply to all machine
versions.
So we will end up in the same situation, where we decide if a change
should be versioned or not.


