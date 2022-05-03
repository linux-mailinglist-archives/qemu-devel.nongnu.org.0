Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59403517F90
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 10:15:40 +0200 (CEST)
Received: from localhost ([::1]:34298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlnh5-0003KS-6y
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 04:15:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlnOq-0002x2-0G
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:56:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nlnOo-0006W7-5g
 for qemu-devel@nongnu.org; Tue, 03 May 2022 03:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651564604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dO/HXjys+MQ2wjSC9O6IAhfEywDJEv+5YvAmO0H3bBQ=;
 b=LZMmk7UU/2NOe1sp+7vGh/vNC/dbNopxfiDbye4RC1YITkNtZgMtZxsoXcZb56XmyI+vyp
 R9VEyYy/6cDq4h5VaXPdBUTpcnu52yO42xS8gJxQGTJkgw4hkcYWY/GFALjknVMmpGsRCy
 nFoJ5GG5zLlCLuC8ODbMjcrZlESP/JE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-wBKkcyPyP4msliUQi-ZXHQ-1; Tue, 03 May 2022 03:56:41 -0400
X-MC-Unique: wBKkcyPyP4msliUQi-ZXHQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BE803839742;
 Tue,  3 May 2022 07:56:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD39C3598E;
 Tue,  3 May 2022 07:56:38 +0000 (UTC)
Date: Tue, 3 May 2022 09:56:37 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, rjones@redhat.com, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <YnDgNcBwklBQOh2l@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
 <YmlmqSh9QADBm9jp@redhat.com>
 <20220427213907.arjmq7pxuqdhopvm@redhat.com>
 <Ymve39AQLUIjzZU/@redhat.com>
 <20220502211237.h7vqio2r7lhl7u5h@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502211237.h7vqio2r7lhl7u5h@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.05.2022 um 23:12 hat Eric Blake geschrieben:
> On Fri, Apr 29, 2022 at 02:49:35PM +0200, Kevin Wolf wrote:
> ...
> > > Or a multi-pathed connection to network storage, where one QEMU
> > > process accesses the network device, but those accesses may
> > > round-robin which server they reach, and where any caching at an
> > > individual server may be inconsistent with what is seen on another
> > > server unless flushing is used to force the round-robin access to
> > > synchronize between the multi-path views.
> > 
> > I don't think this is a realistic scenario. It would mean that you
> > successfully write data to the storage, and when you then read the same
> > location, you get different data back. This would be inconsistent even
> > with a single client. So I'd call this broken storage that should be
> > replaced as soon as possible.
> > 
> > I could imagine problems of this kind with two separate connections to
> > the network storage, but here all the NBD clients share a single
> > BlockBackend, so for the storage they are a single connection.
> 
> I like that chain of reasoning.
> 
> > 
> > > > In fact, I don't think we even need the flush restriction from the NBD
> > > > spec. All clients see the same state (that of the NBD server
> > > > BlockBackend) even without anyone issuing any flush. The flush is only
> > > > needed to make sure that cached data is written to the backing storage
> > > > when writeback caches are involved.
> > > > 
> > > > Please correct me if I'm misunderstanding something here.
> > > 
> > > Likewise me, if I'm being overly cautious.
> > > 
> > > I can certainly write a simpler v4 that just always advertises
> > > MULTI_CONN if we allow more than one client, without any knob to
> > > override it; it's just that it is harder to write a commit message
> > > justifying why I think it is safe to do so.
> > 
> > Having an explicit option doesn't hurt, but it's the reasoning in the
> > commit message that feels wrong to me.
> > 
> > We could consider changing "auto" to advertise MULTI_CONN even for
> > writable exports. There might still be a good reason not to do this by
> > default, though, because of the NBD clients. I'm quite sure that the
> > backend won't make any trouble, but client might if someone else is
> > writing to the same image (this is why we require an explicit
> > share-rw=on for guest devices in the same case).
> 
> If your worry is about a client trying to determine if writing to an
> NBD server is going to race with some external process writing to the
> direct image

No, I'm not really thinking of a race, but just the fact that someone
else could write to the image at all. Guest OSes don't generally expect
the disk magically changing under their feet (unless you use cluster
filesystems etc.), so the safe default is not allowing multiple writers
to the same image.

> I don't see how not advertising MULTI_CONN will make things safer -
> the NBD client to qemu-nbd will still be going through a single
> backend, and that race is present even if there is only one NBD
> client.  The point of MULTI_CONN is informing the client that it can
> open multiple sockets and see a consistent view across all of them,
> and in your scenario of the server competing with some external
> process over the underlying data file, that competition is not
> controlled by how many NBD clients connect to the server, but by the
> external process having access at the same time the server has access
> through a single BlockBackend (and would be just as risky as if
> MULTI_CONN were not advertised and the client limits itself to one NBD
> connection).

Oh, right, that makes sense. So the other connections should really be
considered the same client in this case, not some random other writer.

Can we somehow tell whether a new connection is just the same client
opening an additional connection or whether someone else is connecting?

But maybe it's not worth spending too much time with this for a check
that would only try to catch configurations that the user set up in a
way they didn't actually intend.

> If we can argue that our single BlockBackend point of access is safe
> enough to default to advertising MULTI_CONN for writable connections
> (when we support parallel clients), then exposing an OnOffAuto knob is
> overkill.  I'm not even sure I can envision a case where needing to
> not advertise the bit would matter to a client (clients are supposed
> to ignore unknown feature bits).

Yes, my concern seems unrelated to MULTI_CONN after all.

Kevin


