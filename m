Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD984A49C3
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:59:01 +0100 (CET)
Received: from localhost ([::1]:53458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEY8y-0002B3-B6
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:59:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEY56-0007qu-7W
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:55:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEY53-0008Bf-II
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643640896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HNDomTh1Z50PJ/hdiOfcfLoRyQfjgmUBEFhlu0SJJYY=;
 b=E681e06+gi8mz5csUKy3KaAQe/LG5lAiUFj73o1GmESTlKW+JU8f7hcyP6APj3Ev1O/IIq
 wi0XvMWIjtIEO2Av8AHeN6nNV9kbSFhPXhSMvmVqW1aKZiICweLhTmFWj8rVszgKHX1OHz
 8eY+Dq+f6+WKVyLmaLOhG5+XW1B5ly4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-wcyhtf9HOju1b5JnYQ5f2A-1; Mon, 31 Jan 2022 09:54:52 -0500
X-MC-Unique: wcyhtf9HOju1b5JnYQ5f2A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A66971091DA6;
 Mon, 31 Jan 2022 14:54:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEF197B9DD;
 Mon, 31 Jan 2022 14:54:07 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:54:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 02/33] include/block/block: split header into I/O and
 global state API
Message-ID: <Yff4Dl6bpHhTxAfB@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-3-eesposit@redhat.com>
 <YfJ7pbLDuwP2hgnw@redhat.com>
 <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ac8b0576-4c03-4eb6-9ef6-c0a6b20b6184@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 31.01.2022 um 14:40 hat Emanuele Giuseppe Esposito geschrieben:
> On 27/01/2022 12:01, Kevin Wolf wrote:
> >>> +    BlockDriverState *bs_ = (bs);                          \
> >>> +    AIO_WAIT_WHILE(bdrv_get_aio_context(bs_),              \
> >>> +                   cond); })
> >> Hmm... AIO_WAIT_WHILE() is explicitly documented to be called from I/O
> >> threads. But it has to be a specific I/O thread, the home thread of the
> >> AioContext of bs.
> >> 
> >> So it really fits neither the description for global state (it works
> >> outside the main thread) nor for I/O functions (it doesn't work in any
> >> arbitrary thread).
> 
> So I would say BDRV_POLL_WHILE can go in block-common? what you wrote
> above is the exact definition of common functions.

Maybe, but either way I feel it should be categorised the same as its
users, like bdrv_drained_begin() below.

> >>> +
> >>> +/**
> >>> + * bdrv_drained_begin:
> >>> + *
> >>> + * Begin a quiesced section for exclusive access to the BDS, by disabling
> >>> + * external request sources including NBD server, block jobs, and device model.
> >>> + *
> >>> + * This function can be recursive.
> >>> + */
> >>> +void bdrv_drained_begin(BlockDriverState *bs);
> >> I don't see how the whole family of drain functions can work in any
> >> arbitrary thread. They call BDRV_POLL_WHILE(), the rules for which are
> >> that it has to be either in the main thread or in the AioContext of bs
> >> (which currently ensures that all block nodes and their users are in the
> >> same AioContext).
> >> 
> >> Cross-AioContext BDRV_POLL_WHILE() can cause deadlocks, as documented in
> >> AIO_WAIT_WHILE().
> >> 
> >> Actually, the same is true for all other BDRV_POLL_WHILE() callers, too.
> >> For example, every function generated by block-coroutine-wrapper.py can
> >> only be thread-safe when called in coroutine context, otherwise it has
> >> to be called from the node's AioContext.
> >> 
> 
> Maybe not in any arbitrary thread, but an iothread can call these
> function in any case. Therefore it is not a GS function for sure, so I
> would leave it as I/O.
> 
> I guess you can also see I/O more as "all the ones that are not GS".

Your current definition is:

/*
 * I/O API functions. These functions are thread-safe, and therefore
 * can run in any thread as long as the thread has called
 * aio_context_acquire/release().
 */

If you want it to mean "everything that isn't GS", then you need to
change this definition. (This in turn would mean that nothing would fit
the definiton for common functions any more, which is "neither GS nor
I/O".)

I thought that the definition that you currently have is actually
meaningful in the context of multiqueue, which I think is ultimately the
goal of your work. If at some point you're going to argue "this uses
only I/O functions, so it's threadsafe", the definition of I/O functions
must actually guarantee this.

If you categorise bdrv_drained_begin() as an I/O function, then this
property is violated because you have to call it from a specific thread.

So I guess the decision depends on what you're going to use the
categories in the future. I get the feeling that we have one more
category than this series introduces:

* Global State (must run from the main thread/hold the BQL)
* I/O (can be called in any thread under the AioContext lock, doesn't
  modify global state, drain waits for it to complete)
* Common (doesn't even touch global state)
* iothread dependent (can run without the BQL, but only in one specific
  iothread while holding its AioContext lock; this would cover at least
  AIO_WAIT_WHILE() and all of its indirect callers)

Kevin


