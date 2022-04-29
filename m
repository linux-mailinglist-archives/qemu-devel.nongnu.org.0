Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C35149F7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 14:53:24 +0200 (CEST)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkQ7f-0005Ms-FF
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 08:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nkQ4B-00034j-MM
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 08:49:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nkQ48-0005hY-C5
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 08:49:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651236583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zkxl0quYiv/DBhJfqbknRC3zm+FqSRFIjN1PnHfp8vE=;
 b=eF3zP7kBitawOlf+0rElLPZAP+oXqDQLCYU8q9e3nqJiXtijol5nNojmATZKI2Ee22qFtM
 idh3JpPzh4sKY32aN4NIuzCvWC2Df7f3PxIDqjouRr2GjiM4UStfuxVuRNX0mb2vpAQ4jx
 Da7Lyt679/SO20MfzTD1+fZDN0vVazQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-jdPD8sLdNge-kRz4W0EP7g-1; Fri, 29 Apr 2022 08:49:39 -0400
X-MC-Unique: jdPD8sLdNge-kRz4W0EP7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57546833942;
 Fri, 29 Apr 2022 12:49:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3512416379;
 Fri, 29 Apr 2022 12:49:36 +0000 (UTC)
Date: Fri, 29 Apr 2022 14:49:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v3 3/3] nbd/server: Allow MULTI_CONN for shared writable
 exports
Message-ID: <Ymve39AQLUIjzZU/@redhat.com>
References: <20220314203818.3681277-1-eblake@redhat.com>
 <20220314203818.3681277-4-eblake@redhat.com>
 <YmlmqSh9QADBm9jp@redhat.com>
 <20220427213907.arjmq7pxuqdhopvm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427213907.arjmq7pxuqdhopvm@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, rjones@redhat.com,
 Markus Armbruster <armbru@redhat.com>, nsoffer@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, v.sementsov-og@ya.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.04.2022 um 23:39 hat Eric Blake geschrieben:
> On Wed, Apr 27, 2022 at 05:52:09PM +0200, Kevin Wolf wrote:
> > Am 14.03.2022 um 21:38 hat Eric Blake geschrieben:
> > > According to the NBD spec, a server that advertises
> > > NBD_FLAG_CAN_MULTI_CONN promises that multiple client connections will
> > > not see any cache inconsistencies: when properly separated by a single
> > > flush, actions performed by one client will be visible to another
> > > client, regardless of which client did the flush.  We satisfy these
> > > conditions in qemu when our block layer is backed by the local
> > > filesystem (by virtue of the semantics of fdatasync(), and the fact
> > > that qemu itself is not buffering writes beyond flushes).  It is
> > > harder to state whether we satisfy these conditions for network-based
> > > protocols, so the safest course of action is to allow users to opt-in
> > > to advertising multi-conn.
> > 
> > Do you have an example of how this could be unsafe?
> 
> Nothing direct.  I tried to turn this on unconditionally in an earlier
> version, and we waffled about whether we could prove that network
> block backends (such as gluster) provide us the safety that the NBD
> spec demands:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg00038.html
> https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg06744.html
> 
> > 
> > As I understand it, the NBD server has a single BlockBackend and
> > therefore is a single client for the backend, be it file-posix or any
> > network-based protocol. It doesn't really make a difference for the
> > storage from how many different NBD clients the requests are coming.
> > 
> > I would have expected that cache coherency of the protocol level driver
> > would only matter if you had two QEMU processes accessing the same file
> > concurrently.
> 
> Or a multi-pathed connection to network storage, where one QEMU
> process accesses the network device, but those accesses may
> round-robin which server they reach, and where any caching at an
> individual server may be inconsistent with what is seen on another
> server unless flushing is used to force the round-robin access to
> synchronize between the multi-path views.

I don't think this is a realistic scenario. It would mean that you
successfully write data to the storage, and when you then read the same
location, you get different data back. This would be inconsistent even
with a single client. So I'd call this broken storage that should be
replaced as soon as possible.

I could imagine problems of this kind with two separate connections to
the network storage, but here all the NBD clients share a single
BlockBackend, so for the storage they are a single connection.

> > In fact, I don't think we even need the flush restriction from the NBD
> > spec. All clients see the same state (that of the NBD server
> > BlockBackend) even without anyone issuing any flush. The flush is only
> > needed to make sure that cached data is written to the backing storage
> > when writeback caches are involved.
> > 
> > Please correct me if I'm misunderstanding something here.
> 
> Likewise me, if I'm being overly cautious.
> 
> I can certainly write a simpler v4 that just always advertises
> MULTI_CONN if we allow more than one client, without any knob to
> override it; it's just that it is harder to write a commit message
> justifying why I think it is safe to do so.

Having an explicit option doesn't hurt, but it's the reasoning in the
commit message that feels wrong to me.

We could consider changing "auto" to advertise MULTI_CONN even for
writable exports. There might still be a good reason not to do this by
default, though, because of the NBD clients. I'm quite sure that the
backend won't make any trouble, but client might if someone else is
writing to the same image (this is why we require an explicit
share-rw=on for guest devices in the same case).

Kevin


