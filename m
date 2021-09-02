Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 689A83FEA8F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 10:23:11 +0200 (CEST)
Received: from localhost ([::1]:53196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLi06-0004S6-Dw
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 04:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLhya-0002xM-JT
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:21:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLhyW-0008HG-G3
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 04:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630570890;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LiZZOHgPstclUUjXPVwQDsjgQFfoIhAOkm/NgU+D7p4=;
 b=DFF/wf7XShunr2IiGuCsExVmq34tr4B1wkwSw4PRluc2kd/yvDManZ5NC/dcAqhIDCwgGK
 PIhMMOAvsOe7P8xzAaoPHuVYF7Io/1JwNKKsLENZegtME/JlQkkxEMUlVLsSAP73BRgY19
 Q9T9G8DQsC97CGbfOQrxsFyUFsNR/vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-bETbioikNROGv9RTO0fz_A-1; Thu, 02 Sep 2021 04:21:23 -0400
X-MC-Unique: bETbioikNROGv9RTO0fz_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CF0C19611C4;
 Thu,  2 Sep 2021 08:21:18 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EA3D61176;
 Thu,  2 Sep 2021 08:20:24 +0000 (UTC)
Date: Thu, 2 Sep 2021 09:20:21 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Leonardo Bras Soares Passos <leobras@redhat.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
Message-ID: <YTCJRSue5NQ8qzPn@redhat.com>
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com>
 <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ6HWG5cH_33GDTo_v=8zZDZMJNf4k5+Y79Pt1A_7LmxXBx9bQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Sep 02, 2021 at 04:22:55AM -0300, Leonardo Bras Soares Passos wrote:
> Hello Daniel, thanks for the feedback !
> 
> On Tue, Aug 31, 2021 at 10:17 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > On Tue, Aug 31, 2021 at 08:02:39AM -0300, Leonardo Bras wrote:
> > > Call qio_channel_set_zerocopy(true) in the start of every multifd thread.
> > >
> > > Change the send_write() interface of multifd, allowing it to pass down
> > > flags for qio_channel_write*().
> > >
> > > Pass down MSG_ZEROCOPY flag for sending memory pages, while keeping the
> > > other data being sent at the default copying approach.
> > >
> > > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > > ---
> > >  migration/multifd-zlib.c | 7 ++++---
> > >  migration/multifd-zstd.c | 7 ++++---
> > >  migration/multifd.c      | 9 ++++++---
> > >  migration/multifd.h      | 3 ++-
> > >  4 files changed, 16 insertions(+), 10 deletions(-)
> >
> > > @@ -675,7 +676,8 @@ static void *multifd_send_thread(void *opaque)
> > >              }
> > >
> > >              if (used) {
> > > -                ret = multifd_send_state->ops->send_write(p, used, &local_err);
> > > +                ret = multifd_send_state->ops->send_write(p, used, MSG_ZEROCOPY,
> > > +                                                          &local_err);
> >
> > I don't think it is valid to unconditionally enable this feature due to the
> > resource usage implications
> >
> > https://www.kernel.org/doc/html/v5.4/networking/msg_zerocopy.html
> >
> >   "A zerocopy failure will return -1 with errno ENOBUFS. This happens
> >    if the socket option was not set, the socket exceeds its optmem
> >    limit or the user exceeds its ulimit on locked pages."
> 
> You are correct, I unfortunately missed this part in the docs :(
> 
> > The limit on locked pages is something that looks very likely to be
> > exceeded unless you happen to be running a QEMU config that already
> > implies locked memory (eg PCI assignment)
> 
> Do you mean the limit an user has on locking memory?

Yes, by default limit QEMU sees will be something very small.

> If so, that makes sense. I remember I needed to set the upper limit of locked
> memory for the user before using it, or adding a capability to qemu before.
> 
> Maybe an option would be trying to mlock all guest memory before setting
> zerocopy=on in qemu code. If it fails, we can print an error message and fall
> back to not using zerocopy (following the idea of a new io_async_writev()
> I told you in the previous mail).

Currently ability to lock memory is something that has to be configured
when QEMU starts, and it requires libvirt to grant suitable permissions
to QEMU. Memory locking is generally undesirable because it prevents
memory overcommit. Or rather if you are allowing memory overcommit, then
allowing memory locking is a way to kill your entire host.

I don't think we can unconditionally grant ability to lock arbitrary
guest RAM at startup, just to satisfy a possible desire to use zerocopy
migration later. Granting it at runtime feels questionable as you now
need to track and predict how much locked memory you've allowed, and
also have possible problems with revokation.

Possibly you could unconditionally grant ability to lock a small amount
of guest RAM at startup, but how small can it be, while still making a
useful difference to migration. It would imply we also need to be very
careful with migration to avoid having too large an amount of outstanding
zerocopy requests to exceed the limit.

IOW, the only clear place in which we can use zerocopy, is where we are
already forced to accept the penalty of locked memory at startup. eg when
the guest is using huge pages and no overcommit, or possibly when the guest
is using PCI device assignment, though in the latter I can't remember if
we allow entire of guest RAM to be locked or not.

Overall the memory locking needs look like a significant constraint that
will affect ability to use this feature.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


