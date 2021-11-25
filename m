Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85D45DD38
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:21:36 +0100 (CET)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGZ4-0006jo-Eb
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGWs-0004JS-Kf
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:19:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGWn-0006QG-4o
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:19:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637853551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzUWktIogEvCDubNfZig+mmkgKwE+ToURJPUV+NJhGk=;
 b=FvnvBKJ11lMd9iYrlIp2raO5k64SF6L7v0QNvhLXh2s5pBIQQkNSug7z8cSMTJqjRNttd+
 xII6N8E5U3dtBYbmgPB48cJxLqnL3ZtAs6UnoVWua+O8LsET9TfK7nHe9zVJMbZY81cTVE
 P+BUbkB54pZ/HxRRA7fa+hYL+DQJHPk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-g0E6d2KcML-0LIoPjP4o3A-1; Thu, 25 Nov 2021 10:19:08 -0500
X-MC-Unique: g0E6d2KcML-0LIoPjP4o3A-1
Received: by mail-wm1-f71.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so3669467wmq.9
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:19:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=uzUWktIogEvCDubNfZig+mmkgKwE+ToURJPUV+NJhGk=;
 b=LfqZRbqzszT0RqoUxF0E1EIO+hlRDijBwaIn2Zc6HF13ulDPm81k0G5g0f5w1qrawR
 Y3wJnlXW7l/fTwyEiRa2b3tjdGJXgn6VCuqIVIYDOmZxPbaq43Z+gBXBQQNz6HCQ4LdE
 7mLEaNpRkbqKEsLHoWhmQXG4xenCdM1EqJZ5/TuKl6HWL8d9Jp9bPonaPzPd5IAcIVTS
 zbVcnJKDs9cH1ZL0BxYWnwsAckbJ1yDp9AhhUAV3Qbobk4HWvoLDQI2XKs7mu/48OLIg
 wtbpIwPiieWF6qkT8zMXVYP7cvIqvTBXZHM7Riy+LMh/g4CGmbbdsKVwSjD1Yj7QXS70
 NNVQ==
X-Gm-Message-State: AOAM5328zWkCqqpn8NjqHFURZXWc8/NAP6asHL4aMtScVMTeQdW/llIs
 x68mgc17t7LNNkjncklFjEAWuWVBOA6sXYaUa3XHOAapjGQ/SiFs2it75lyMqLthoV6grjuvqnJ
 VCOrXfeY50Dim0uw=
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr7380663wrq.610.1637853546773; 
 Thu, 25 Nov 2021 07:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVHQfmQVfIicCeEIRR1tKQTLmzsZ2mGbCeKQLvScaAUyoOeik34Udun/GzmbJQEqmJTSl7yQ==
X-Received: by 2002:a5d:40c8:: with SMTP id b8mr7380607wrq.610.1637853546442; 
 Thu, 25 Nov 2021 07:19:06 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id z7sm7938340wmi.33.2021.11.25.07.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:19:05 -0800 (PST)
Date: Thu, 25 Nov 2021 15:19:03 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+pZ0diEsYMPj7W@work-vm>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <YZ+PNJRcyPGX4KAM@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YZ+PNJRcyPGX4KAM@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: slp@redhat.com, afrosi@redhat.com, qemu-devel@nongnu.org,
 dovmurik@linux.ibm.com, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> > > > Hi,
> > > > 
> > > > We recently discussed a way for remote SEV guest attestation through QEMU.
> > > > My initial approach was to get data needed for attestation through different
> > > > QMP commands (all of which are already available, so no changes required
> > > > there), deriving hashes and certificate data; and collecting all of this
> > > > into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> > > > secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> > > > provided, QEMU would then need to have support for attestation before a VM
> > > > is started. Upon speaking to Dave about this proposal, he mentioned that
> > > > this may not be the best approach, as some situations would render the
> > > > attestation unavailable, such as the instance where a VM is running in a
> > > > cloud, and a guest owner would like to perform attestation via QMP (a likely
> > > > scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> > > > commands, as this could be an issue.
> > > 
> > > As a general point, QMP is a low level QEMU implementation detail,
> > > which is generally expected to be consumed exclusively on the host
> > > by a privileged mgmt layer, which will in turn expose its own higher
> > > level APIs to users or other apps. I would not expect to see QMP
> > > exposed to anything outside of the privileged host layer.
> > > 
> > > We also use the QAPI protocol for QEMU guest agent commmunication,
> > > however, that is a distinct service from QMP on the host. It shares
> > > most infra with QMP but has a completely diffent command set. On the
> > > host it is not consumed inside QEMU, but instead consumed by a
> > > mgmt app like libvirt. 
> > > 
> > > > So I ask, does anyone involved in QEMU's SEV implementation have any input
> > > > on a quality way to perform guest attestation? If so, I'd be interested.
> > > 
> > > I think what's missing is some clearer illustrations of how this
> > > feature is expected to be consumed in some real world application
> > > and the use cases we're trying to solve.
> > > 
> > > I'd like to understand how it should fit in with common libvirt
> > > applications across the different virtualization management
> > > scenarios - eg virsh (command line),  virt-manger (local desktop
> > > GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> > > And of course any non-traditional virt use cases that might be
> > > relevant such as Kata.
> > 
> > That's still not that clear; I know Alice and Sergio have some ideas
> > (cc'd).
> > There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
> > and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
> > ) - that I can't claim to fully understand.
> > However, there are some themes that are emerging:
> > 
> >   a) One use is to only allow a VM to access some private data once we
> > prove it's the VM we expect running in a secure/confidential system
> >   b) (a) normally involves requesting some proof from the VM and then
> > providing it some confidential data/a key if it's OK
> 
> I guess I'm wondering what the threat we're protecting against is,
> and / or which pieces of the stack we can trust ?

Yeh and that varies depending who you speak to.

> eg, if the host has 2 VMs running, we verify the 1st and provide
> its confidental data back to the host, what stops the host giving
> that dat to the 2nd non-verified VM ? 
> 
> Presumably the data has to be encrypted with a key that is uniquely
> tied to this specific boot attempt of the verified VM, and not
> accessible to any other VM, or to future boots of this VM ?

In the SEV/-ES case the attestation is uniquefied by a Nonce I think
and there's sometype of session key used (can't remember the details)
and the returning of the key to the VM is encrypted through that same
channel; so you know you're giving the key to the thing you attested.

However, since in SEV/ES you only measure the firmware (and number of
CPUs) all VMs look pretty much identical at that point - distinguishing
them relies either on:
  a) In the GRUB/OVMF case you are relying on the key you return to the
VM succesfully decrypting the disk and the embedded Grub being able to
load the kernel/initrd (You attested the embedded Grub, so you trust
it to do that)
  b) In the separate kernel/initrd case you do have the kernel command
line measured as well.

> >   c) RATs splits the problem up:
> >     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
> >     I don't fully understand the split yet, but in principal there are
> > at least a few different things:
> > 
> >   d) The comms layer
> >   e) Something that validates the attestation message (i.e. the
> > signatures are valid, the hashes all add up etc)
> >   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
> > 8.4 kernel, or that's a valid kernel command line)
> >   g) Something that holds some secrets that can be handed out if e & f
> > are happy.
> > 
> >   There have also been proposals (e.g. Intel HTTPA) for an attestable
> > connection after a VM is running; that's probably quite different from
> > (g) but still involves (e) & (f).
> > 
> > In the simpler setups d,e,f,g probably live in one place; but it's not
> > clear where they live - for example one scenario says that your cloud
> > management layer holds some of them, another says you don't trust your
> > cloud management layer and you keep them separate.
> 
> Yep, again I'm wondering what the specific threats are that we're
> trying to mitigate. Whether we trust the cloud mgmt APIs, but don't
> trust the compute hosts, or whether we trust neither the cloud
> mgmt APIs or the compute hosts.
> 
> If we don't trust the compute hosts, does that include the part
> of the cloud mgmt API that is  running on the compute host, or
> does that just mean the execution environment of the VM, or something
> else?

I think there's pretty good consensus you don't trust the compute host
at all.  How much of the rest of the cloud you trust varies
depending on who you ask.  Some suggest trusting one small part of the
cloud (some highly secure apparently trusted attestation box).
Some would rather not trust the cloud at all, so would want to do
attestation to do their own system;  the problem there is you have to do
an off-site attestation every time your VMs start.
Personally I think maybe a 2 level system would work;  you boot one [set
of ] VMs in the cloud that's attested to your offsite - and they then
run the attestation service for all your VMs in the cloud.

> > So I think all we're actually interested in at the moment, is (d) and
> > (e) and the way for (g) to get the secret back to the guest.
> > 
> > Unfortunately the comms and the contents of them varies heavily with
> > technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
> > while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
> > SEV-ES in some cases).
> > 
> > So my expectation at the moment is libvirt needs to provide a transport
> > layer for the comms, to enable an external validator to retrieve the
> > measurements from the guest/hypervisor and provide data back if
> > necessary.  Once this shakes out a bit, we might want libvirt to be
> > able to invoke the validator; however I expect (f) and (g) to be much
> > more complex things that don't feel like they belong in libvirt.
> 
> Yep, I don't think (f) & (g) belong in libvirt, since libvirt is
> deployed per compute host, while (f) / (g) are something that is
> likely to be deployed in a separate trusted host, at least for
> data center / cloud deployments. May be there's a case where they
> can all be same-host for more specialized use cases.

Or even less specialised;  the easiest setup is where you run an
attestation server that does all this on your site, and then put the
compute nodes in a cloud somewhere.

Dave

> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


