Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA04AC6ED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 18:13:02 +0100 (CET)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7ZV-00089u-6G
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 12:13:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7Ga-0001Rl-KD
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:53:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nH7GX-0000Bh-GL
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 11:53:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644252804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VwYdiq2JCp2LvGcB2AK1zLicMdLE3Rj2pv89cJLlMC0=;
 b=CKQlf61+jDuOEiqlNu/pD8bw5SqaomOoy0VgXDkMEhXR1IfRrLq3xDS9RSR+FJLnVKx6xN
 y6QFb0Lo/iII1Avr1Sqh1Dtztzckfn6J2b8bs+3U1TMtfixFPL6Saxc6eqoI54fDcrRxiG
 8U3kozdvWS1Zin1PI07OeVsPzPt5ngY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-n14Yc-OtM_K-d87nNd-juA-1; Mon, 07 Feb 2022 11:53:21 -0500
X-MC-Unique: n14Yc-OtM_K-d87nNd-juA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3831383DEA6;
 Mon,  7 Feb 2022 16:53:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38A4970D5C;
 Mon,  7 Feb 2022 16:53:14 +0000 (UTC)
Date: Mon, 7 Feb 2022 17:53:12 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
Message-ID: <YgFOeOocta+pPE/y@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com>
 <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
 <Yff4Dl6bpHhTxAfB@redhat.com>
 <1653fd9d-e1e9-5f32-3bd1-62abecd09601@redhat.com>
 <feb30385-a222-166f-ad82-19307c980a0d@redhat.com>
 <bf72c7db-6f0a-e291-2f79-a061293dc810@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bf72c7db-6f0a-e291-2f79-a061293dc810@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.02.2022 um 11:30 hat Paolo Bonzini geschrieben:
> On 2/1/22 10:45, Emanuele Giuseppe Esposito wrote:
> > > That said, even if they are a different category, I think it makes sense
> > > to leave them in the same header file as I/O functions, because I/O
> > > functions are locked out between drained_begin and drained_end.
> > 
> > Proposed category description:
> > /*
> >   * "Global OR I/O" API functions. These functions can run without
> >   * the BQL, but only in one specific iothread/main loop.
> >   *
> >   * More specifically, these functions use BDRV_POLL_WHILE(bs), which
> >   * requires the caller to be either in the main thread and hold
> >   * the BlockdriverState (bs) AioContext lock, or directly in the
> >   * home thread that runs the bs AioContext. Calling them from
> >   * another thread in another AioContext would cause deadlocks.
> >   *
> >   * Therefore, these functions are not proper I/O, because they
> >   * can't run in *any* iothreads, but only in a specific one.
> >   */
> > 
> > Functions that will surely go under this category:
> > 
> > BDRV_POLL_WHILE
> > bdrv_parent_drained_begin_single
> > bdrv_parent_drained_end_single
> > bdrv_drain_poll
> > bdrv_drained_begin
> > bdrv_do_drained_begin_quiesce
> > bdrv_subtree_drained_begin
> > bdrv_drained_end
> > bdrv_drained_end_no_poll
> > bdrv_subtree_drained_end
> > 
> > (all generated_co_wrapper)
> > bdrv_truncate
> > bdrv_check
> > bdrv_invalidate_cache
> > bdrv_flush
> > bdrv_pdiscard
> > bdrv_readv_vmstate
> > bdrv_writev_vmstate
> > 
> > 
> > What I am not sure:
> > 
> > * bdrv_drain_all_begin - bdrv_drain_all_end - bdrv_drain_all: these were
> > classified as GS, because thay are always called from the main loop.
> > Should they go in this new category?
> 
> 1) They look at the list of BDS's, and 2) you can't in general be sure that
> all BDS's are in *your* AioContext if you call them from a specific
> AioContext.
> 
> So they should be GS.

I agree, calling drain_all functions can only work from the main thread,
so they are GS.

> > * how should I interpret "all the callers of BDRV_POLL_WHILE"?
> > Meaning, if I consider also the callers of the callers, we end up
> > covering much much more functions. Should I only consider the direct
> > callers (ie the above)?
> 
> In general it is safe to make a function GS even if it is potentially "GS or
> I/O", because that _reduces_ the number of places you can call it from.
> It's likewise safe to make it I/O-only, but probably it makes less sense.

Basically, we have a hierarchy of categories where you can always call
functions in other categories with less restrictions, but never the
opposite direction.

1. Common functions
2. I/O functions
3. I/O or GS functions
4. GS functions

So common functions must never call any of the other categories. Global
state functions can call functions in any category. And "I/O or GS"
functions like BDRV_POLL_WHILE() can be called by other "I/O or GS" or
just GS functions, but if it's ever (directly or indirectly) called by
an I/O or common function, that would be a bug.

Kevin


