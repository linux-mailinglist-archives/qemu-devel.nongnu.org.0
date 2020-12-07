Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AF52D0F9E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:44:21 +0100 (CET)
Received: from localhost ([::1]:34560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEwG-0001lA-OF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:44:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmEW0-0002Tz-2U
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kmEVx-0002qu-GG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:17:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607339828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h7lJhkW0OVkGjHkfJxB6aANQjff1zcxFmji6PkIpzys=;
 b=Zdl1pjJFYFOk+2pDdid8ix7bGzIS5cDnZYU/EY2QCxZ7slLdGt0zNZ66dOjUuWF1t4p2kX
 cA0CIpgLxcbI1cIh7/RwAoBp45kHqqq13G8iW940GwmT0vIOrKg57Btb3iiVLfiWmuU28q
 8KM1oV7eZu5r4vMRlkrcp6LQYQdr9J8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-drmTvXezO3OCxWRPAGC04Q-1; Mon, 07 Dec 2020 06:17:06 -0500
X-MC-Unique: drmTvXezO3OCxWRPAGC04Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B91810054FF;
 Mon,  7 Dec 2020 11:17:05 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-161.ams2.redhat.com [10.36.113.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4632648A2;
 Mon,  7 Dec 2020 11:17:03 +0000 (UTC)
Date: Mon, 7 Dec 2020 12:17:02 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Feng Li <lifeng1519@gmail.com>
Subject: Re: [PATCH] file-posix: check the use_lock
Message-ID: <20201207111702.GA5281@merkur.fritz.box>
References: <1607077703-32344-1-git-send-email-fengli@smartx.com>
 <20201204104016.GC4833@merkur.fritz.box>
 <CAHckoCwJz0NTLWTpz0tApLe9qm-ZYYrE3-OmQmQCyfk4gtGUOA@mail.gmail.com>
 <CAEK8JBAu0jStwRgD=_hNDn1cHzxPXZyvHmikUtKcriCNvHxDKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEK8JBAu0jStwRgD=_hNDn1cHzxPXZyvHmikUtKcriCNvHxDKA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kyle Zhang <kyle@smartx.com>, Li Feng <fengli@smartx.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:raw" <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.12.2020 um 11:50 hat Feng Li geschrieben:
> Hi Kevin,
> 
> I have read the 182 test, and I'm very confused about the test.
> I'm not familiar with the permissions and locks in the qemu.
> Could you give me more tips about how to complete the test?

Hm, actually, to produce a failure, we would have to have a filesystem
in the host that doesn't support locks. I don't even know how to get
such a filesystem manually, and it's probably completely impossible in a
test case without root permissions.

So maybe just add a more detailed description of the bug to the commit
message, and we'll have to apply it without a test.

Kevin

> Li Feng <fengli@smartx.com> 于2020年12月4日周五 下午6:55写道：
> >
> > Hi Kevin,
> > Thanks for your reply.
> >
> > In my scenario, my NFS server doesn't support the file lock.
> > And when I set the file.locking = false, the Qemu still reports:
> > qemu-system-x86_64: -drive
> > file=/tmp/nfs/a,format=raw,cache=none,aio=native,if=none,id=drive-virtio-disk1,file.locking=on:
> > Failed to lock byte 100
> >
> > I will look at the iotest 182 and try to add a test.
> >
> > Thanks,
> > Feng Li
> >
> > Kevin Wolf <kwolf@redhat.com> 于2020年12月4日周五 下午6:40写道：
> > >
> > > Am 04.12.2020 um 11:28 hat Li Feng geschrieben:
> > > > When setting the file.locking = false, we shouldn't set the lock.
> > > >
> > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > >
> > > This looks right to me, but can you add a test for this scenario to
> > > iotest 182? This would both demonstrate the effect of the bug (I think
> > > it would be that files are locked after reopen even with locking=off?)
> > > and make sure that we won't have a regression later. Mentioning the
> > > effect in the commit message would be good, too.
> > >
> > > Kevin
> > >
> > > >  block/file-posix.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > index d5fd1dbcd2..806764f7e3 100644
> > > > --- a/block/file-posix.c
> > > > +++ b/block/file-posix.c
> > > > @@ -3104,7 +3104,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
> > > >      }
> > > >
> > > >      /* Copy locks to the new fd */
> > > > -    if (s->perm_change_fd) {
> > > > +    if (s->perm_change_fd && s->use_lock) {
> > > >          ret = raw_apply_lock_bytes(NULL, s->perm_change_fd, perm, ~shared,
> > > >                                     false, errp);
> > > >          if (ret < 0) {
> > > > --
> > > > 2.24.3
> > > >
> > >
> 


