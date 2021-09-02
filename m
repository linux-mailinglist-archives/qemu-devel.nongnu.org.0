Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4C43FEBCD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 12:02:10 +0200 (CEST)
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjXt-0004yT-7o
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 06:02:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjVG-0003Td-DK
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLjVD-0007BN-Ud
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630576762;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NjhmrnMnCb7KcOwyUbkeuAhsyH/pOo25S/ojJB1fDtQ=;
 b=WUqmv1enpRPPzwWDg5Dnn6GIbYlu1Th1IsNGwydIEWiKl0iNql84DrjVd+jX9QbJLUkjer
 Z6WKumBciKlcrLdzBHTPJCwbl4RbfO00Jqu1tMc99IM2bx9ejjSZx8zKSrSCAe4uWW6P1o
 2LMOtd6+K82UB+DeeXXLJaK55w461FQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-PuC8Y5ZPMPivJHky86Wxhw-1; Thu, 02 Sep 2021 05:59:20 -0400
X-MC-Unique: PuC8Y5ZPMPivJHky86Wxhw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741E4501E3;
 Thu,  2 Sep 2021 09:59:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF6F60BD8;
 Thu,  2 Sep 2021 09:59:04 +0000 (UTC)
Date: Thu, 2 Sep 2021 10:59:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTCgZnhwUCrPp1lP@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
 <YTCJRSue5NQ8qzPn@redhat.com>
 <CAJ6HWG45Xb2uc3OdJctL7SFxmrH0ZhDwQMBDAmS1TuDgiCrCMA@mail.gmail.com>
 <YTCXSoETM7UfeMQE@redhat.com>
 <CAJ6HWG7wLtEDY-X6wxdH9zG14NOdOCQ1YX0YBxTFEnbhJy6ozw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG7wLtEDY-X6wxdH9zG14NOdOCQ1YX0YBxTFEnbhJy6ozw@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 06:49:06AM -0300, Leonardo Bras Soares Passos wrote:
> On Thu, Sep 2, 2021 at 6:20 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Thu, Sep 02, 2021 at 05:52:15AM -0300, Leonardo Bras Soares Passos wrote:
> > > On Thu, Sep 2, 2021 at 5:21 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > >
> > > > On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> > > > > Hello Daniel, thanks for the feedback !
> > > > >
> > > > > On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > > > > > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > > > > > >
> > > > > > > Change the send_write() interface of multifd, allowing it to pass down
> > > > > > > flags for qio_channel_write*().
> > > > > > >
> > > > > > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > > > > > > other data being sent at the default copying approach.
> > > > > > >
> > > > > > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > > > > > ---
> > > > > > >  migration/multifd-zlib.c | 7 ++++---
> > > > > > >  migration/multifd-zstd.c | 7 ++++---
> > > > > > >  migration/multifd.c      | 9 ++++++---
> > > > > > >  migration/multifd.h      | 3 ++-
> > > > > > >  4 files changed, 16 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > > > > > >              }
> > > > > > >
> > > > > > >              if (used) {
> > > > > > > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > > > > > > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > > > > > > +                                                          &local_err);
> > > > > >
> > > > > > I don't think it is valid to unconditionally enable this feature due to the
> > > > > > resource usage implications
> > > > > >
> > > > > > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> > > > > >
> > > > > >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> > > > > >    if the socket option was not set, the socket exceeds its optmem
> > > > > >    limit or the user exceeds its ulimit on locked pages."
> > > > >
> > > > > You are correct, I unfortunately missed this part in the docs :(
> > > > >
> > > > > > The limit on locked pages is something that looks very likely to be
> > > > > > exceeded unless you happen to be running a QEMU config that already
> > > > > > implies locked memory (eg PCI assignment)
> > > > >
> > > > > Do you mean the limit an user has on locking memory?
> > > >
> > > > Yes, by default limit QEMU sees will be something very small.
> > > >
> > > > > If so, that makes sense. I remember I needed to set the upper limit of locked
> > > > > memory for the user before using it, or adding a capability to qemu before.
> > > > >
> > > > > Maybe an option would be trying to mlock all guest memory before setting
> > > > > zerocopy=on in qemu code. If it fails, we can print an error message and fall
> > > > > back to not using zerocopy (following the idea of a new io_async_writev()
> > > > > I told you in the previous mail).
> > > >
> > > > Currently ability to lock memory is something that has to be configured
> > > > when QEMU starts, and it requires libvirt to grant suitable permissions
> > > > to QEMU. Memory locking is generally undesirable because it prevents
> > > > memory overcommit. Or rather if you are allowing memory overcommit, then
> > > > allowing memory locking is a way to kill your entire host.
> > >
> > > You mean it's gonna consume too much memory, or something else?
> >
> > Essentially yes.
> 
> Well, maybe we can check for available memory before doing that,
> but maybe it's too much effort.

From a mgmt app POV, we assume QEMU is untrustworthy, so the mgmt
app needs to enforce policy based on the worst case that the
VM configuration allows for.

Checking current available memory is not viable, because even
if you see 10 GB free, QEMU can't know if that free memory is
there to satisfy other VMs's worst case needs, or its own. QEMU
needs to be explicitly told whether its OK to use locked memory,
and an enforcement policy applied to it.


> > Consider a VM host with 64 GB of RAM and 64 GB of swap, and an
> > overcommit ratio of 1.5. ie we'll run VMs with 64*1.5 GB of RAM
> > total.
> >
> > So we can run 3 VMs each with 32 GB of RAM, giving 96 GB of usage
> > which exceeds physical RAM. Most of the time this may well be fine
> > as the VMs don't concurrently need their full RAM allocation, and
> > worst case they'll get pushed to swap as the kernel re-shares
> > memory in respose to load. So perhaps each VM only needs 20 GB
> > resident at any time, but over time one VM can burst upto 32 GB
> > and then 12 GB of it get swapped out later when inactive.
> >
> > But now consider if we allowed 2 of the VMs to lock memory for
> > purposes of migration. Those 2 VMs can now pin 64 GB of memory
> > in the worst case, leaving no free memory for the 3rd VM or
> > for the OS. This will likely take down the entire host, regardless
> > of swap availability.
> >
> > IOW, if you are overcomitting RAM you have to be extremely
> > careful about allowing any VM to lock memory. If you do decide
> > to allow memory locking, you need to make sure that the worst
> > case locked memory amount still leaves enough unlocked memory
> > for the OS to be able to effectively manage the overcommit
> > load via swap.  We definitely can't grant memory locking to
> > VMs at startup in this scenario, and if we grant it at runtime,
> > we need to be able to revoke it again later.
> >
> > These overcommit numbers are a bit more extreme that you'd
> > usually do in real world, but it illustrates the genreal
> > problem. Also bear in mind that QEMU has memory overhead
> > beyond the guest RAM block, which varies over time, making
> > accounting quite hard. We have to also assume that QEMU
> > could have been compromised by a guest breakout, so we
> > can't assume that migration will play nice - we have to
> > assume the worst case possible, given the process ulimits.
> >
> 
> Yeah, that makes sense. Thanks for this illustration and elucidation !
> 
> I assume there is no way of asking the OS to lock memory, and if there is
> no space available, it fails and rolls back the locking.

Yes & no. On most Linux configs though it ends up being no, because
instead of getting a nice failure, when host memory pressure occurs,
the OOM Killer wakes up and just culls processes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


