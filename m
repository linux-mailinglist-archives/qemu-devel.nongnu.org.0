Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A52C31869E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 10:13:27 +0100 (CET)
Received: from localhost ([::1]:41550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA82Q-0002JV-Gc
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 04:13:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lA80a-0001io-0f
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:11:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lA80U-0004XK-Uj
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 04:11:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613034686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r22HqcCVvSVwPqBGR+isNxEFf47PBG/kaH5BomrkhmY=;
 b=P/B+AwLE9oDah92J8c4/enbud2gKOpNhQfm7w7s01BOTJKiKIVG/hjt5MIr1P12ZdGx3fu
 bl+orcxwq1GR0oSIor30NOIp0pYDKClqSkRNV7zOxsiaNrRozg54k3KASgrOJ5H29J7Qlq
 xCKaCDKj2A6DFwtM9hE0kaxeGjlWX+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-Q5rA_He4P36DVo2S8Ca5ow-1; Thu, 11 Feb 2021 04:11:24 -0500
X-MC-Unique: Q5rA_He4P36DVo2S8Ca5ow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 248AF107ACE3;
 Thu, 11 Feb 2021 09:11:23 +0000 (UTC)
Received: from work-vm (ovpn-114-222.ams2.redhat.com [10.36.114.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9CB35D9DC;
 Thu, 11 Feb 2021 09:11:18 +0000 (UTC)
Date: Thu, 11 Feb 2021 09:11:16 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: Interactive launch over QMP socket?
Message-ID: <YCT0tCBad25u5M92@work-vm>
References: <47b15088-514a-8174-029d-8d9c4571960a@redhat.com>
 <ac1a5075878d86b0a46db20cb6e579b5fec74d87.camel@linux.ibm.com>
 <ef2db65a-f9bd-5cf7-7c1a-9ba07dd4bda0@redhat.com>
 <f46a24d33185b808801531da7d9ca6457d9a790e.camel@linux.ibm.com>
 <a06cf1b7-85fe-caeb-67e8-1e67f828f5db@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a06cf1b7-85fe-caeb-67e8-1e67f828f5db@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: jejb@linux.ibm.com, npmccallum@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Connor Kuehl (ckuehl@redhat.com) wrote:
> On 2/10/21 1:06 PM, James Bottomley wrote:
> > On Wed, 2021-02-10 at 12:46 -0600, Connor Kuehl wrote:
> > > Right, I didn't mean to include cbitpos in consideration for this.
> > > I'm only interested in supplying the session, policy, and certificate
> > > info over the socket.
> > > 
> > > Shouldn't the session, policy, and certificate information only be
> > > required in time for the KVM_SEV_LAUNCH_START ioctl call? This is
> > > the place I'm interested in waiting for the relevant data.
> > 
> > Well, it could, but I see the session information as being the same as
> > the image file, which is also a command line argument, so if you can do
> > the image file on the command line, why not the session info as well?
> 
> It would be interesting to allow remote delivery of the initial image as
> well because for purposes of attestation I would argue that the guest owner
> should have as much of the locus of control as possible. However, because
> the guest image is unlikely to change between launches/guests, it's probably
> more helpful to deliver it to the host, let it cache it, and supply that via
> a command line argument. I'm mainly interested in the session blob, policy,
> and certificate for now though.
> 
> I don't see a similar value in caching a session blob or policy because it
> is trivial to generate these and put them in a JSON object and send them on
> demand. I think that chopping up part of the attestation process, setting it
> aside, and having to figure out how to deliver it to the host where the QEMU
> process will launch creates an impedance mismatch. Usability impedance
> mismatches tend to motivate the creation of one or more
> automation/translation layers to automate that "glue" away.
> 
> Extending QMP to allow end-to-end attestation via QEMU removes the need for
> that glue and improves interoperability with other client implementations
> who care about attestation. Providers would just need to point out the QMP
> endpoint for guest owners. It lends itself to a more "atomic"
> transaction-like attestation experience overall.

Note that QMP is not 'safe' - anyone who has control of QMP can cause
the qemu to try and open arbitrary files on the host (by binding them as
disks for example) or allocate memory (by hot adding RAM); so raw QMP is
not something that you could give to a guest owner.

Dave

> > The other problem is the session info is exchanged for a launch handle
> > in kvm_init, which is machine_init in qemu terms.  That's called
> > phenomenally early, so there's not much of kvm to pause before you do
> > that.  So either qemu has to be rewritten to pause before processing
> > command line arguments, and then any argument can be added over QMP, or
> > the handle exchange has to occur later.
> 
> Ah, I see, thank you.
> 
> Connor
> 
> > James
> > 
> > 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


