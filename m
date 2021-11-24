Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA8B45CC16
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 19:30:53 +0100 (CET)
Received: from localhost ([::1]:55554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpx2h-0002hF-L2
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 13:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpx1H-0001AS-O6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:29:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mpx1D-00040y-UX
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 13:29:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637778558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=H7QpRtvFJuLpoiys8B38RpfgQpEWWKF8xGgX11+um6M=;
 b=VIk3WdxKP6tgES3MPE5DA/WG5b6+Cnn82K3XaifUqTDusx7xCSzI+thUzYwYwNeRJKXY94
 HrD3lONP9A0JZwOZQr5kBkpt+cft9U1UxJzbNjhHHeobY67mfFHY3l5HtpO4ffZqDIm3tv
 rzJoeo8iI2knafgP2WOC4Eti6wEJLwg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-pJArSUGkP-SO89P254uk5g-1; Wed, 24 Nov 2021 13:29:13 -0500
X-MC-Unique: pJArSUGkP-SO89P254uk5g-1
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1933636wms.1
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=H7QpRtvFJuLpoiys8B38RpfgQpEWWKF8xGgX11+um6M=;
 b=sa0s7ZfbSdOv57DmNMyHP0GftjIMvweoyfETt0L7YRBzVc/bNQTVTK9ExIVoIifxeg
 Gakn60Yv1d+rT7m6XuLFny0bNn8PYReyXpcUFHUuEZ74L+BKlNMURGgtEJ6QmMguvkya
 A6dmCE/Kb9MS5gYVgr7O6K7ConxkxK6zJoSIMlypWtF18wn4G2Bu0V/wWu3c5TRUeDR+
 8u+v5bsEk/w4EdGQi/YH1AnxB98rcYmT20PjcaDQwZFO9WhLsz/3ngq62HXcWwXerBEJ
 mG2RnL+PKPFAH3UfE0ovOr+iuXnM9CWkZliF+dSvmvQ5zr7TpwZZ0eED+bCu7IjBWs7g
 WDzA==
X-Gm-Message-State: AOAM533MzBUVq1DhB6lWuJRvFTOnm6VwpiZDURmMmqbtBR8w6QtXcduU
 pitw8X0P62u/CwsvJUp+4lWp3pVZk/oV7WrLr1bkbo9uO3wm/meQvj1/cbMadUxEMwAvVjjptlI
 N57Hv6o1WBFXsk6w=
X-Received: by 2002:adf:f444:: with SMTP id f4mr323484wrp.538.1637778551726;
 Wed, 24 Nov 2021 10:29:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9asSTV9k6V+ufEPcYgpMUQJyJnFoqrykvTrxbHFsNXzVNYJv8WmG2qoOb9h/k8gpsYS7MNQ==
X-Received: by 2002:adf:f444:: with SMTP id f4mr323452wrp.538.1637778551471;
 Wed, 24 Nov 2021 10:29:11 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id p19sm691839wmq.4.2021.11.24.10.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 10:29:09 -0800 (PST)
Date: Wed, 24 Nov 2021 18:29:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: SEV guest attestation
Message-ID: <YZ6Ec0yG82nhbN+B@work-vm>
MIME-Version: 1.0
In-Reply-To: <YZ58+T04uVXaO2Ab@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FAKE_REPLY_C=1.486, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: slp@redhat.com, afrosi@redhat.com, qemu-devel@nongnu.org,
 dovmurik@linux.ibm.com, Tyler Fanelli <tfanelli@redhat.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
> > Hi,
> > 
> > We recently discussed a way for remote SEV guest attestation through QEMU.
> > My initial approach was to get data needed for attestation through different
> > QMP commands (all of which are already available, so no changes required
> > there), deriving hashes and certificate data; and collecting all of this
> > into a new QMP struct (SevLaunchStart, which would include the VM's policy,
> > secret, and GPA) which would need to be upstreamed into QEMU. Once this is
> > provided, QEMU would then need to have support for attestation before a VM
> > is started. Upon speaking to Dave about this proposal, he mentioned that
> > this may not be the best approach, as some situations would render the
> > attestation unavailable, such as the instance where a VM is running in a
> > cloud, and a guest owner would like to perform attestation via QMP (a likely
> > scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
> > commands, as this could be an issue.
> 
> As a general point, QMP is a low level QEMU implementation detail,
> which is generally expected to be consumed exclusively on the host
> by a privileged mgmt layer, which will in turn expose its own higher
> level APIs to users or other apps. I would not expect to see QMP
> exposed to anything outside of the privileged host layer.
> 
> We also use the QAPI protocol for QEMU guest agent commmunication,
> however, that is a distinct service from QMP on the host. It shares
> most infra with QMP but has a completely diffent command set. On the
> host it is not consumed inside QEMU, but instead consumed by a
> mgmt app like libvirt. 
> 
> > So I ask, does anyone involved in QEMU's SEV implementation have any input
> > on a quality way to perform guest attestation? If so, I'd be interested.
> 
> I think what's missing is some clearer illustrations of how this
> feature is expected to be consumed in some real world application
> and the use cases we're trying to solve.
> 
> I'd like to understand how it should fit in with common libvirt
> applications across the different virtualization management
> scenarios - eg virsh (command line),  virt-manger (local desktop
> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
> And of course any non-traditional virt use cases that might be
> relevant such as Kata.

That's still not that clear; I know Alice and Sergio have some ideas
(cc'd).
There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
) - that I can't claim to fully understand.
However, there are some themes that are emerging:

  a) One use is to only allow a VM to access some private data once we
prove it's the VM we expect running in a secure/confidential system
  b) (a) normally involves requesting some proof from the VM and then
providing it some confidential data/a key if it's OK
  c) RATs splits the problem up:
    https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
    I don't fully understand the split yet, but in principal there are
at least a few different things:

  d) The comms layer
  e) Something that validates the attestation message (i.e. the
signatures are valid, the hashes all add up etc)
  f) Something that knows what hashes to expect (i.e. oh that's a RHEL
8.4 kernel, or that's a valid kernel command line)
  g) Something that holds some secrets that can be handed out if e & f
are happy.

  There have also been proposals (e.g. Intel HTTPA) for an attestable
connection after a VM is running; that's probably quite different from
(g) but still involves (e) & (f).

In the simpler setups d,e,f,g probably live in one place; but it's not
clear where they live - for example one scenario says that your cloud
management layer holds some of them, another says you don't trust your
cloud management layer and you keep them separate.

So I think all we're actually interested in at the moment, is (d) and
(e) and the way for (g) to get the secret back to the guest.

Unfortunately the comms and the contents of them varies heavily with
technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
SEV-ES in some cases).

So my expectation at the moment is libvirt needs to provide a transport
layer for the comms, to enable an external validator to retrieve the
measurements from the guest/hypervisor and provide data back if
necessary.  Once this shakes out a bit, we might want libvirt to be
able to invoke the validator; however I expect (f) and (g) to be much
more complex things that don't feel like they belong in libvirt.

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


