Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6831B952
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:35:08 +0100 (CET)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBd5n-0003gy-R4
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:35:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBczL-0006s2-OD
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:28:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBczJ-0001qD-Cs
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:28:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613392103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puKTxWMdDGkgRSoKVc3bc9lodN+l/1q+xI22O7VyVGs=;
 b=isdxSRDfL28hKBFjTHkIg345BUM3fU6tlzjljqxpklkV7aJYtbnqi1aQYUDhhkYURVDSod
 JaKfUCTXKzDG3TWpuKBV6PKhz/ah6AvJCwCqYZ9+8R4YAlIaYfq8Kg4fTwj9h4CRNc1F5I
 n4PZkHFwpR4opoBmEwpa4Ax2MVTqEC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-CHo69wmtP-2-FYno6uBZ2w-1; Mon, 15 Feb 2021 07:28:22 -0500
X-MC-Unique: CHo69wmtP-2-FYno6uBZ2w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DF7F192D787
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 12:28:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B09A25C233;
 Mon, 15 Feb 2021 12:28:20 +0000 (UTC)
Date: Mon, 15 Feb 2021 13:28:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] monitor/qmp: Stop processing requests when shutdown
 is requested
Message-ID: <20210215122819.GL7226@merkur.fritz.box>
References: <20210212172028.288825-1-kwolf@redhat.com>
 <20210212172028.288825-3-kwolf@redhat.com>
 <87blclzg4p.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87blclzg4p.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.02.2021 um 13:09 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > monitor_qmp_dispatcher_co() used to check whether shutdown is requested
> 
> "used to": until when?

Until right before this patch. Do you prefer present tense to describe
the old state?

Also, does your Tested-by imply that you expect someone else to merge
this series? I'm planning to send a pull request today, so if that was
your intention, I can include it there.

Kevin

> > only when it would have to wait for new requests. If there were still
> > some queued requests, it would try to execute all of them before
> > shutting down.
> >
> > This can be surprising when the queued QMP commands take long or hang
> > because Ctrl-C may not actually exit QEMU as soon as possible.
> >
> > Change monitor_qmp_dispatcher_co() so that it additionally checks
> > whether shutdown is request before it gets a new request from the queue.
> >
> > Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > ---
> >  monitor/qmp.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 43880fa623..2326bd7f9b 100644
> > --- a/monitor/qmp.c
> > +++ b/monitor/qmp.c
> > @@ -227,6 +227,11 @@ void coroutine_fn monitor_qmp_dispatcher_co(void *data)
> >           */
> >          qatomic_mb_set(&qmp_dispatcher_co_busy, false);
> >  
> > +        /* On shutdown, don't take any more requests from the queue */
> > +        if (qmp_dispatcher_co_shutdown) {
> > +            return;
> > +        }
> > +
> >          while (!(req_obj = monitor_qmp_requests_pop_any_with_lock())) {
> >              /*
> >               * No more requests to process.  Wait to be reentered from


