Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F84027B3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 13:21:22 +0200 (CEST)
Received: from localhost ([::1]:50460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNZAB-0001bH-RM
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 07:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZ6h-0008Q4-QB
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mNZ6R-0005sw-JH
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 07:17:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631013442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hFuwgmupsMrH2iZ+8ALuMlnY+2CRiUPmNviG/sTDDyA=;
 b=Yu1fs/a4D4v9jsPVb1tQFWd7A7yECFJLSEkFB3ZKhWZO5aT+O3mcOKsAnozg7is0GgqD0Z
 G+nTY+pMvTwPTO65uYs8w/IBUP1Sx1ZfrLpF5YyKy2fJbHI1dAH2urdGalmHxS6epa/cRM
 OlnBldv0S/TpB4bg47ymP7Z2nRrj33E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-nNcjLblcM8-N7JMhbLGVmQ-1; Tue, 07 Sep 2021 07:17:21 -0400
X-MC-Unique: nNcjLblcM8-N7JMhbLGVmQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 y13-20020adfe6cd000000b00159694c711dso2002865wrm.17
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 04:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hFuwgmupsMrH2iZ+8ALuMlnY+2CRiUPmNviG/sTDDyA=;
 b=WhADpasjnGUYEzQATSHticuDx4Y1KJf3r2dHH7HG4MSh3lbRLjbXA5osEeD+FJcu4e
 Xii8s76rFQwj9D4hGExSh6AMdqVM6mDU3d3WSBvE+DkSLl8RZT1QHvaprUKgZ7qU6U2F
 TdFQyU9gsjY++cMAu/4Fdv11md2ETesZb1a4mn68yp4AHayzKBNpyo+B3cmkm6KxdW2O
 dPzuDKSQTSKQh0D4S1Mu8HTKAHkFBb5oMAcAl7adQDIchUO0yr5K+kZhC2EREBYLpOAi
 H1Npb9xWjMF7Wp7yV8sg1ZSWgNVixV4HygkGiaAf1uppUUrhTKw9d69gw739IRqay4NA
 yTaA==
X-Gm-Message-State: AOAM533gnJL2YGZQcjFj/yEPkp3fCP2NxlHW5eT93LPvS/REOTYQFMmx
 45au8qVO5ejbC+AGRO8OX5unFwroEKBPYclIpa7ZxvQAWgS26TgEx/nqIFbZ4Gg9Ycyxm1XPgrz
 eoMwKk5STs7PXHOI=
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr3278050wmm.182.1631013440536; 
 Tue, 07 Sep 2021 04:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjrvr+zjkBPkBxtCJq+FoPfsuewBDplayaOOYcXg3Lh6NJKmqXC8bD6w1YDJcPZyxloMAwoA==
X-Received: by 2002:a05:600c:cc:: with SMTP id
 u12mr3278029wmm.182.1631013440271; 
 Tue, 07 Sep 2021 04:17:20 -0700 (PDT)
Received: from work-vm (cpc109021-salf6-2-0-cust453.10-2.cable.virginm.net.
 [82.29.237.198])
 by smtp.gmail.com with ESMTPSA id s14sm2006207wmc.25.2021.09.07.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 04:17:19 -0700 (PDT)
Date: Tue, 7 Sep 2021 12:17:17 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTdKPeu5liVmi5AS@work-vm>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTCJRSue5NQ8qzPn@redhat.com>
 <CAJ6HWG45Xb2uc3OdJctL7SFxmrH0ZhDwQMBDAmS1TuDgiCrCMA@mail.gmail.com>
 <YTCXSoETM7UfeMQE@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YTCXSoETM7UfeMQE@redhat.com>
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
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras Soares Passos <leobras@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Thu, Sep 02, 2021 at 05:52:15AM -0300, Leonardo Bras Soares Passos wrote:
> > On Thu, Sep 2, 2021 at 5:21 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > >
> > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > > Hello Daniel, thanks for the feedback !
> > > >
> > > > On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > >
> > > > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > > > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > > > > >
> > > > > > Change the send_write() interface of multifd, allowing it to pass down
> > > > > > flags for qio_channel_write*().
> > > > > >
> > > > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > > > > > other data being sent at the default copying approach.
> > > > > >
> > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > ---
> > > > > >  migration/multifd-zlib.c | 7 ++++---
> > > > > >  migration/multifd-zstd.c | 7 ++++---
> > > > > >  migration/multifd.c      | 9 ++++++---
> > > > > >  migration/multifd.h      | 3 ++-
> > > > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > > >
> > > > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > > > > >              }
> > > > > >
> > > > > >              if (used) {
> > > > > > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > > > > > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > > > > > +                                                          &local_err);
> > > > >
> > > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > > resource usage implications
> > > > >
> > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > >
> > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > > > >    if the socket option was not set, the socket exceeds its optmem
> > > > >    limit or the user exceeds its ulimit on locked pages."
> > > >
> > > > You are correct, I unfortunately missed this part in the docs :(
> > > >
> > > > > The limit on locked pages is something that looks very likely to be
> > > > > exceeded unless you happen to be running a QEMU config that already
> > > > > implies locked memory (eg PCI assignment)
> > > >
> > > > Do you mean the limit an user has on locking memory?
> > >
> > > Yes, by default limit QEMU sees will be something very small.
> > >
> > > > If so, that makes sense. I remember I needed to set the upper limit of locked
> > > > memory for the user before using it, or adding a capability to qemu before.
> > > >
> > > > Maybe an option would be trying to mlock all guest memory before setting
> > > > zerocopy=on in qemu code. If it fails, we can print an error message and fall
> > > > back to not using zerocopy (following the idea of a new io_async_writev()
> > > > I told you in the previous mail).
> > >
> > > Currently ability to lock memory is something that has to be configured
> > > when QEMU starts, and it requires libvirt to grant suitable permissions
> > > to QEMU. Memory locking is generally undesirable because it prevents
> > > memory overcommit. Or rather if you are allowing memory overcommit, then
> > > allowing memory locking is a way to kill your entire host.
> > 
> > You mean it's gonna consume too much memory, or something else?
> 
> Essentially yes. 
> 
> > > I don't think we can unconditionally grant ability to lock arbitrary
> > > guest RAM at startup, just to satisfy a possible desire to use zerocopy
> > > migration later. Granting it at runtime feels questionable as you now
> > > need to track and predict how much locked memory you've allowed, and
> > > also have possible problems with revokation.
> > 
> > (I am really new to this, so please forgive me if I am asking dumb or
> > overly basic questions)
> > 
> > What does revokation means in this context?
> > You give the process hability to lock n MB of memory, and then you take it?
> > Why would that happen? Is Locked memory a limited resource?
> 
> Consider a VM host with 64 GB of RAM and 64 GB of swap, and an
> overcommit ratio of 1.5. ie we'll run VMs with 64*1.5 GB of RAM
> total.
> 
> So we can run 3 VMs each with 32 GB of RAM, giving 96 GB of usage
> which exceeds physical RAM. Most of the time this may well be fine
> as the VMs don't concurrently need their full RAM allocation, and
> worst case they'll get pushed to swap as the kernel re-shares
> memory in respose to load. So perhaps each VM only needs 20 GB
> resident at any time, but over time one VM can burst upto 32 GB
> and then 12 GB of it get swapped out later when inactive.
> 
> But now consider if we allowed 2 of the VMs to lock memory for
> purposes of migration. Those 2 VMs can now pin 64 GB of memory
> in the worst case, leaving no free memory for the 3rd VM or
> for the OS. This will likely take down the entire host, regardless
> of swap availability.
> 
> IOW, if you are overcomitting RAM you have to be extremely
> careful about allowing any VM to lock memory. If you do decide
> to allow memory locking, you need to make sure that the worst
> case locked memory amount still leaves enough unlocked memory
> for the OS to be able to effectively manage the overcommit
> load via swap.  We definitely can't grant memory locking to
> VMs at startup in this scenario, and if we grant it at runtime,
> we need to be able to revoke it again later.
> 
> These overcommit numbers are a bit more extreme that you'd 
> usually do in real world, but it illustrates the genreal
> problem. Also bear in mind that QEMU has memory overhead
> beyond the guest RAM block, which varies over time, making
> accounting quite hard. We have to also assume that QEMU
> could have been compromised by a guest breakout, so we
> can't assume that migration will play nice - we have to
> assume the worst case possible, given the process ulimits.

We already have the same problem for RDMA; 
(Although it has some options for doing rolling locking in chunks
and recently there's code for use with new cards that don't need
locking).

I think the thing here is to offer zerocopy as an option; then people
can decide on the costs etc.

Dave

> 
> > > Overall the memory locking needs look like a significant constraint that
> > > will affect ability to use this feature.
> > >
> > 
> > I Agree, there is a lot to take in account.
> > In any way, those constraints could be checked at the same function as
> > the setsockopt() right?
> 
> QEMU could possibly check its ulimits to see if it is possible, but it
> would be safer to require a migration capability to be explicitly set
> by the mgmt app to opt-in to zerocopy.
> 
> > (Setting up configs to improve the chance of zerocopy would probably only
> > happen at/before qemu starting, right?)
> 
> Usually, but you can change ulimits on the fly for a process. I'm just
> not sure of semantics if you reduce limits and existing usage exceeds
> the reduced value.
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


