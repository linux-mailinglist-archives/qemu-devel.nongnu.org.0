Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116E54A6038
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:34:58 +0100 (CET)
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvBI-0003he-JK
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEs0K-0002Bn-4O
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:11:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEs0G-0004tA-MS
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 07:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643717479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xN27N7O8t3VbuO+yO0K/qtPfL3IL+QLyt3IfNbXN37M=;
 b=dxF2Mt7Xu/zC3nUJRTgOIKJmGNH5P5DgNdEjWgLCYvT2Ke3tmPfi8aQ7fAA2Bh6P85WYSU
 sMsmLMlzriUpX66NI2yhl5SWufkjSucrRosicdRVYLjr7AIIU+eWYqYU8g9SZ7P12LX9L1
 k/DkWRYVUe/B8fAFDOvmMxkoKKuSApY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-V8LB1UXUOM-1DUW4sr565w-1; Tue, 01 Feb 2022 07:11:18 -0500
X-MC-Unique: V8LB1UXUOM-1DUW4sr565w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C7F86A8A1;
 Tue,  1 Feb 2022 12:11:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.45])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 075FC6F9C6;
 Tue,  1 Feb 2022 12:10:43 +0000 (UTC)
Date: Tue, 1 Feb 2022 13:10:42 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Message-ID: <YfkjQicHUv7X+Y10@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com>
 <YfJ6dsVcmB4Uc2rO@redhat.com>
 <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
 <YffzLaIhjgfBkcXf@redhat.com>
 <3fa2d527-91f6-0869-d6b0-c82bdd04884c@redhat.com>
 <YfkfndfaOha/fZZU@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YfkfndfaOha/fZZU@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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

Am 01.02.2022 um 12:55 hat Kevin Wolf geschrieben:
> Am 31.01.2022 um 16:49 hat Paolo Bonzini geschrieben:
> > > > However, commit 5f50be9b5810293141bb53cfd0cb46e765367d56 changed the
> > > > stub to return false for a specific reason.
> > > 
> > > I must admit I don't really understand the reasoning there:
> > > 
> > >      With this change, the stub qemu_mutex_iothread_locked() must be changed
> > >      from true to false.  The previous value of true was needed because the
> > >      main thread did not have an AioContext in the thread-local variable,
> > >      but now it does have one.
> > > 
> > > This explains why it _can_ be changed to false for this caller, but not
> > > why it _must_ be changed.
> > 
> > See above: because it returns the wrong value for all threads except one,
> > and there are better ways to do a meaningful check in that one thread: using
> > qemu_get_current_aio_context(), which is what aio_co_enter did at the time
> > and qemu_in_main_thread() does with Emanuele's change.
> > 
> > > So is the problem with the unit tests really just that they never call
> > > qemu_init_main_loop() and therefore never set the AioContext for the
> > > main thread?
> > 
> > No, most of them do (and if some are missing it we can add it).
> 
> But if they do, why doesn't qemu_get_current_aio_context() already
> return the right result? In this case, my_aiocontext is set and it
> should never even call qemu_mutex_iothread_locked() - at least not in
> any case where qemu_in_main_thread() would return true.
> 
> So provided that qemu_init_main_loop() is called, both functions should
> be equivalent and we wouldn't need a second one.

Sorry, I was confused and comparing the wrong two functions.
qemu_get_current_aio_context() does return the right result and it's
exactly what qemu_in_main_thread() uses. So yes, it's right and it's
different from qemu_mutex_iothread_locked().

It would be less confusing if qemu_get_current_aio_context() used
qemu_in_main_thread() (with two different implementations of
qemu_in_main_thread() for the system emulator and tools) instead of the
other way around, but I guess that's harder to implement because we
would need a different way to figure out whether we're in the main
thread, at least as long as my_aiocontext is static and can't be
accessed in stubs. We could probably make it public, though.

Kevin


