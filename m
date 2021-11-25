Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C245DDC3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:42:29 +0100 (CET)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGtH-00068g-Nk
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGri-0005SY-Pa
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:40:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mqGre-00022e-9i
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:40:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637854844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Ct2vHj+DD7KCDR/OY5wiDvXJN30jSbtnm35SBa+2Ys=;
 b=SvRItEVXN0YW4dBzY7FsmtOpU2OWRhnlwgm1wJCTxMWlkHplMu5I9zi+rIO4kml3xDPnPj
 SbyOnRajwjxt4CwAWWjdZfVZ2S14KD7uPgBrMWGFTt9LAIZyMsCUBR3bHeO2J1a5eLX6i3
 eSYM6Y4/wd9ihpxBWrXoo+Az3Fa7RfQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-Gb1p7FDOOUO3O0l5ZwEYdw-1; Thu, 25 Nov 2021 10:40:43 -0500
X-MC-Unique: Gb1p7FDOOUO3O0l5ZwEYdw-1
Received: by mail-wm1-f69.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so3696179wms.8
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=+Ct2vHj+DD7KCDR/OY5wiDvXJN30jSbtnm35SBa+2Ys=;
 b=nRPpKMxLcBtio38s4KDFOxThZEsUim3POBTRAKnRJz6QPbIv9d7Xd0x/OFSyswlhcp
 O8H5ZBaXgCft9BP7XqYonQ8t9VvaC3ue1mQ+pbMopV7ZQJNikPFS2PbzqLmI6p0+2B+V
 uny5RC+yxcCYWzcexfNBH5/dQc3LC+juLRFFG/02ftkmnO4TDGR9cHhHbgEcrKO5Ceep
 mf7HjDw9oVUV1fjUKM5HwHkRep2fNdP6haqA6KCJXJur9I3SPPUTEkq1vIZbnacp+bbN
 VZQkOv7iSgMgImuzqse7i5a69DYVvMjlx8ZqHsqbyziLSNncFXmYqHrF4YkXyUhL29sK
 9IGQ==
X-Gm-Message-State: AOAM532rvilmloRrQRvdUxMFGvDY+riflpB2wlgp7kNC75rgqdN2PsBc
 3M3rRDYjfyKYuKtORM6xVMG4TiKfy2aTyxOhzhVqHF0xKFTW6JSJwq3nBiy2ZSmpj3F8+lw36PS
 dqyYq9Bnbd0LYTGY=
X-Received: by 2002:a5d:6312:: with SMTP id i18mr7835018wru.475.1637854842382; 
 Thu, 25 Nov 2021 07:40:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvGvemUp8cbJID7mOFuqKTsx0zVrXQIUdc2XAcsJ90x5U37jE40WHNCNLEnUXKgzn/3OjMNA==
X-Received: by 2002:a5d:6312:: with SMTP id i18mr7834799wru.475.1637854840743; 
 Thu, 25 Nov 2021 07:40:40 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n32sm11365474wms.1.2021.11.25.07.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:40:38 -0800 (PST)
Date: Thu, 25 Nov 2021 15:40:36 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ+udETWZvkZP9ug@work-vm>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
 <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
 <20211125151107.nhh7jfofk7qhkujd@mhamilton>
MIME-Version: 1.0
In-Reply-To: <20211125151107.nhh7jfofk7qhkujd@mhamilton>
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Hubertus Franke <frankeh@us.ibm.com>, afrosi@redhat.com,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Tyler Fanelli <tfanelli@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Sergio Lopez (slp@redhat.com) wrote:
> On Thu, Nov 25, 2021 at 02:44:51PM +0200, Dov Murik wrote:
> > [+cc jejb, tobin, jim, hubertus]
> > 
> > 
> > On 25/11/2021 9:14, Sergio Lopez wrote:
> > > On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
> > >> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > >>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> > >>>> Hi,
> > >>>>
> > >>>> We recently discussed a way for remote SEV guest attestation through QEMU.
> > >>>> My initial approach was to get data needed for attestation through different
> > >>>> QMP commands (all of which are already available, so no changes required
> > >>>> there), deriving hashes and certificate data; and collecting all of this
> > >>>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> > >>>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> > >>>> provided, QEMU would then need to have support for attestation before a VM
> > >>>> is started. Upon speaking to Dave about this proposal, he mentioned that
> > >>>> this may not be the best approach, as some situations would render the
> > >>>> attestation unavailable, such as the instance where a VM is running in a
> > >>>> cloud, and a guest owner would like to perform attestation via QMP (a likely
> > >>>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> > >>>> commands, as this could be an issue.
> > >>>
> > >>> As a general point, QMP is a low level QEMU implementation detail,
> > >>> which is generally expected to be consumed exclusively on the host
> > >>> by a privileged mgmt layer, which will in turn expose its own higher
> > >>> level APIs to users or other apps. I would not expect to see QMP
> > >>> exposed to anything outside of the privileged host layer.
> > >>>
> > >>> We also use the QAPI protocol for QEMU guest agent commmunication,
> > >>> however, that is a distinct service from QMP on the host. It shares
> > >>> most infra with QMP but has a completely diffent command set. On the
> > >>> host it is not consumed inside QEMU, but instead consumed by a
> > >>> mgmt app like libvirt. 
> > >>>
> > >>>> So I ask, does anyone involved in QEMU's SEV implementation have any input
> > >>>> on a quality way to perform guest attestation? If so, I'd be interested.
> > >>>
> > >>> I think what's missing is some clearer illustrations of how this
> > >>> feature is expected to be consumed in some real world application
> > >>> and the use cases we're trying to solve.
> > >>>
> > >>> I'd like to understand how it should fit in with common libvirt
> > >>> applications across the different virtualization management
> > >>> scenarios - eg virsh (command line),  virt-manger (local desktop
> > >>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> > >>> And of course any non-traditional virt use cases that might be
> > >>> relevant such as Kata.
> > >>
> > >> That's still not that clear; I know Alice and Sergio have some ideas
> > >> (cc'd).
> > >> There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
> > >> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
> > >> ) - that I can't claim to fully understand.
> > >> However, there are some themes that are emerging:
> > >>
> > >>   a) One use is to only allow a VM to access some private data once we
> > >> prove it's the VM we expect running in a secure/confidential system
> > >>   b) (a) normally involves requesting some proof from the VM and then
> > >> providing it some confidential data/a key if it's OK
> > >>   c) RATs splits the problem up:
> > >>     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
> > >>     I don't fully understand the split yet, but in principal there are
> > >> at least a few different things:
> > >>
> > >>   d) The comms layer
> > >>   e) Something that validates the attestation message (i.e. the
> > >> signatures are valid, the hashes all add up etc)
> > >>   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
> > >> 8.4 kernel, or that's a valid kernel command line)
> > >>   g) Something that holds some secrets that can be handed out if e & f
> > >> are happy.
> > >>
> > >>   There have also been proposals (e.g. Intel HTTPA) for an attestable
> > >> connection after a VM is running; that's probably quite different from
> > >> (g) but still involves (e) & (f).
> > >>
> > >> In the simpler setups d,e,f,g probably live in one place; but it's not
> > >> clear where they live - for example one scenario says that your cloud
> > >> management layer holds some of them, another says you don't trust your
> > >> cloud management layer and you keep them separate.
> > >>
> > >> So I think all we're actually interested in at the moment, is (d) and
> > >> (e) and the way for (g) to get the secret back to the guest.
> > >>
> > >> Unfortunately the comms and the contents of them varies heavily with
> > >> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
> > >> while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
> > >> SEV-ES in some cases).
> > 
> > SEV-ES has pre-launch measurement and secret injection, just like SEV
> > (except that the measurement includes the initial states of all vcpus,
> > that is, their VMSAs.  BTW that means that in order to calculate the
> > measurement the Attestation Server must know exactly how many vcpus are
> > in the VM).
> 
> You need the number of vCPUs and an idea of what their initial state
> is going to be, to be able to reproduce the same VMSA struct in the
> Attestation Server.
> 
> This may tie the Attestation Server with a particular version of both
> QEMU and KVM. I haven't checked if configuration changes in QEMU may
> also have an impact on it.

That's all OK; I'm expecting the attestation server to be given a whole
pile of information about the apparent environment to check.

Dave

> Sergio.


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


