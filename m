Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2DE322EBF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:31:16 +0100 (CET)
Received: from localhost ([::1]:54630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaag-0004p6-Qg
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:31:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEaZI-0004HX-1F
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEaZF-0006cf-TE
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614097784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A1oMOJU93lniC0ET7TFEib1FTRDZLN6wo31fH6ar4kE=;
 b=O3xwG2jvxwnVO7z8EZIIJCSQyHv/ftyRIJ8cYqXK0aYafpq0/TquiHKa9ZyN6ED+MZaPLv
 La1ga/rwClCxR6xpyv8iIoGfddWSr0ddZa8lxWeMHAw4sfEOfgwt/jjMJH9iSzSCgsNYlf
 +dUqBgXl+Np1eTG6CjbZwbVoP5zarDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-UZZTV0vnN3yaF43qrBDa7w-1; Tue, 23 Feb 2021 11:29:41 -0500
X-MC-Unique: UZZTV0vnN3yaF43qrBDa7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D826185B6CC;
 Tue, 23 Feb 2021 16:29:29 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-233.ams2.redhat.com [10.36.113.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D135D6A1;
 Tue, 23 Feb 2021 16:29:27 +0000 (UTC)
Date: Tue, 23 Feb 2021 17:29:26 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: What prevents discarding a cluster during rewrite?
Message-ID: <20210223162926.GE5083@merkur.fritz.box>
References: <198596cd-4867-3da5-cd8f-68c1c570a52b@virtuozzo.com>
 <21d6f4e3-1512-50b3-d2a0-7969a49f18bb@virtuozzo.com>
 <20210223103534.GD5083@merkur.fritz.box>
 <e7480b84-bda0-c280-603e-38ba176c44c9@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <e7480b84-bda0-c280-603e-38ba176c44c9@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: "Denis V. Lunev" <den@openvz.org>, qemu-devel <qemu-devel@nongnu.org>,
 qemu block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.02.2021 um 16:23 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 
> 
> On 23.02.2021 13:35, Kevin Wolf wrote:
> > Am 22.02.2021 um 22:42 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > > 23.02.2021 00:30, Vladimir Sementsov-Ogievskiy wrote:
> > > > Thinking of how to prevent dereferencing to zero (and discard) of
> > > > host cluster during flush of compressed cache (which I'm working on
> > > > now), I have a question.. What prevents it for normal writes?
> > > 
> > > I have no idea about why didn't it fail for years.. May be, I'm
> > > missing something?
> > 
> > Ouch. I suppose the reason why we never ran into it is that afaik Linux
> > drains the queue before sending discard requests.
> > 
> > Of course, we still need to protect against this in QEMU. We can't just
> > unref a cluster that is still in use.
> > 
> > > I have idea of fixing: increase the refcount of host cluster before
> > > write to data_file (it's important to increase refacount in same
> > > s->lock critical section where we get host_offset) and dereference it
> > > after write.. It should help. Any thoughts?
> > 
> > It would cause metadata updates for rewrites. I don't know whether the
> > intermediate value would ever be written to disk, but at least we'd
> > rewrite the same refcounts as before. I don't think we want that.
> 
> Hmm, if that can provoke extra refcount cache flush that's bad..
> 
> May be we need something like of additional "dynamic" refcounts, so
> that total_refcount = normal_refcount + dynamic_refcount.. And for
> in-flight clusters dynamic_refcount is > 0. We can store dynamic
> refcounts in GHashTable(cluster -> refcount).

Do you think it's worth the complexity? The qcow2 driver is already
relatively complicated today.

> > Discard requests might be rare enough that not considering the cluster
> > at all could work. We could then take a reader CoRwlock during most
> > operations, and a writer lock for discard.
> > 
> > Actually, maybe s->lock should be this CoRwlock, and instead of dropping
> > it temporarily like we do now we would just upgrade and downgrade it as
> > needed. Maybe this would allow finer grained locking in other places,
> > too.
> 
> In this case many operations will be blocked during data writing, like
> allocation of another cluster.. That doesn't seem good.

You're right, that would be too restrictive.

> Separate CoRwLock looks more feasible.

Maybe that then.

Kevin


