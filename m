Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5121445DBDC
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 15:04:29 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFMS-000204-38
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 09:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqFFz-0001uv-F6
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:57:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mqFFx-00018P-Hq
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:57:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637848664;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PdKLQgjpEyuaIfLcRaBORP/LudCwrOPgMJNcfEB26Y=;
 b=WKiBNsMupmZQBiIpYRIWNUQxbxeJjIn+90ZJDiAlA3KhMMAp7KN49Gxh7k1/mpGxRvq+Fw
 U8CgnxB8HSAJzBeA92cX0o7DP/dRswimuvMUzhouseDl3edQ68YXWXYjK7KyWEQQBmYz5+
 YYl3kpr/yVXTsEnKb0DFhavEx6ptvUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-559-3Q9NmTOvOBKXwXFgTLG7EQ-1; Thu, 25 Nov 2021 08:57:41 -0500
X-MC-Unique: 3Q9NmTOvOBKXwXFgTLG7EQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93BCE102CC42;
 Thu, 25 Nov 2021 13:57:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 09369694D8;
 Thu, 25 Nov 2021 13:56:50 +0000 (UTC)
Date: Thu, 25 Nov 2021 13:56:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+WH9NxgucH4hoO@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <YZ+PNJRcyPGX4KAM@redhat.com>
 <9c4fe1fe-cdb5-d991-439f-393e9a6f66bd@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <9c4fe1fe-cdb5-d991-439f-393e9a6f66bd@linux.ibm.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: slp@redhat.com, afrosi@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Tyler Fanelli <tfanelli@redhat.com>, dinechin@redhat.com,
 John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 25, 2021 at 03:50:46PM +0200, Dov Murik wrote:
> 
> 
> On 25/11/2021 15:27, Daniel P. Berrangé wrote:
> > On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
> >> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> >>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> >>>> Hi,
> >>>>
> >>>> We recently discussed a way for remote SEV guest attestation through QEMU.
> >>>> My initial approach was to get data needed for attestation through different
> >>>> QMP commands (all of which are already available, so no changes required
> >>>> there), deriving hashes and certificate data; and collecting all of this
> >>>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> >>>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> >>>> provided, QEMU would then need to have support for attestation before a VM
> >>>> is started. Upon speaking to Dave about this proposal, he mentioned that
> >>>> this may not be the best approach, as some situations would render the
> >>>> attestation unavailable, such as the instance where a VM is running in a
> >>>> cloud, and a guest owner would like to perform attestation via QMP (a likely
> >>>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> >>>> commands, as this could be an issue.
> >>>
> >>> As a general point, QMP is a low level QEMU implementation detail,
> >>> which is generally expected to be consumed exclusively on the host
> >>> by a privileged mgmt layer, which will in turn expose its own higher
> >>> level APIs to users or other apps. I would not expect to see QMP
> >>> exposed to anything outside of the privileged host layer.
> >>>
> >>> We also use the QAPI protocol for QEMU guest agent commmunication,
> >>> however, that is a distinct service from QMP on the host. It shares
> >>> most infra with QMP but has a completely diffent command set. On the
> >>> host it is not consumed inside QEMU, but instead consumed by a
> >>> mgmt app like libvirt. 
> >>>
> >>>> So I ask, does anyone involved in QEMU's SEV implementation have any input
> >>>> on a quality way to perform guest attestation? If so, I'd be interested.
> >>>
> >>> I think what's missing is some clearer illustrations of how this
> >>> feature is expected to be consumed in some real world application
> >>> and the use cases we're trying to solve.
> >>>
> >>> I'd like to understand how it should fit in with common libvirt
> >>> applications across the different virtualization management
> >>> scenarios - eg virsh (command line),  virt-manger (local desktop
> >>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> >>> And of course any non-traditional virt use cases that might be
> >>> relevant such as Kata.
> >>
> >> That's still not that clear; I know Alice and Sergio have some ideas
> >> (cc'd).
> >> There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
> >> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
> >> ) - that I can't claim to fully understand.
> >> However, there are some themes that are emerging:
> >>
> >>   a) One use is to only allow a VM to access some private data once we
> >> prove it's the VM we expect running in a secure/confidential system
> >>   b) (a) normally involves requesting some proof from the VM and then
> >> providing it some confidential data/a key if it's OK
> > 
> > I guess I'm wondering what the threat we're protecting against is,
> > and / or which pieces of the stack we can trust ?
> > 
> > eg, if the host has 2 VMs running, we verify the 1st and provide
> > its confidental data back to the host, what stops the host giving
> > that dat to the 2nd non-verified VM ? 
> 
> The host can't read the injected secret: It is encrypted with a key that
> is available only to the PSP.  The PSP receives it and writes it in a
> guest-encrypted memory (which the host also cannot read; for the guest
> it's a simple memory access with C-bit=1).  So it's a per-vm-invocation
> secret.

Is there some way the PSP verifies which VM is supposed to receive
the injected data. ie the host can't read it, but it can tell the
PSP to inject it to VM B instead of VM A.

> > Presumably the data has to be encrypted with a key that is uniquely
> > tied to this specific boot attempt of the verified VM, and not
> > accessible to any other VM, or to future boots of this VM ?
> 
> Yes, launch blob, which (if I recall correctly) the Guest Owner should
> generate and give to the Cloud Provider so it can start a VM with it
> (this is one of the options on the sev-guest object).

Does something stop the host from booting a 2nd VM on the side with
the same launch blob, and thus be able to also tell the PSP to inject
the secret data into this 2nd VM later too ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


