Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17744A49C7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:00:50 +0100 (CET)
Received: from localhost ([::1]:56456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYAh-0004b0-Se
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:00:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEXkc-0002Eq-FA
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:33:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nEXkY-0004GF-Vu
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643639609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TiG6lRaR6ZV4VdAISxfqwMt+gZpK7/yywW8DdmKMbE4=;
 b=abMCrDQZzbt84FVIoNLuL0+O+NuFXu5ZbTZM//BxEUTU+HFajt54jfCvwEmYBBgQ5ftv1G
 ogzD4km5r6uDhaYZ9QDXdDXERThmsj78th6kPsnQES97HG6QsxjynZwKUS+qY1TdtnLV5W
 r4hjclrySX2d6Bx7GYXqn26Yl5VR/P0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-Qfb06u_5MmuKlvDJ2Oybpw-1; Mon, 31 Jan 2022 09:33:26 -0500
X-MC-Unique: Qfb06u_5MmuKlvDJ2Oybpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B167C363A9;
 Mon, 31 Jan 2022 14:33:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA8B6E212;
 Mon, 31 Jan 2022 14:33:18 +0000 (UTC)
Date: Mon, 31 Jan 2022 15:33:17 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v6 01/33] main-loop.h: introduce qemu_in_main_thread()
Message-ID: <YffzLaIhjgfBkcXf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-2-eesposit@redhat.com>
 <YfJ6dsVcmB4Uc2rO@redhat.com>
 <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7ada78d2-0978-8f5a-f0f8-318d2f26ba41@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 31.01.2022 um 12:25 hat Emanuele Giuseppe Esposito geschrieben:
> 
> 
> On 27/01/2022 11:56, Kevin Wolf wrote:
> > Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
> >> When invoked from the main loop, this function is the same
> >> as qemu_mutex_iothread_locked, and returns true if the BQL is held.
> > 
> > So its name is misleading because it doesn't answer the question whether
> > we're in the main thread, but whethere we're holding the BQL (which is
> > mostly equivalent to holding an AioContext lock, not being in the home
> > thread of that AioContext).
> > 
> >> When invoked from iothreads or tests, it returns true only
> >> if the current AioContext is the Main Loop.
> >>
> >> This essentially just extends qemu_mutex_iothread_locked to work
> >> also in unit tests or other users like storage-daemon, that run
> >> in the Main Loop but end up using the implementation in
> >> stubs/iothread-lock.c.
> >>
> >> Using qemu_mutex_iothread_locked in unit tests defaults to false
> >> because they use the implementation in stubs/iothread-lock,
> >> making all assertions added in next patches fail despite the
> >> AioContext is still the main loop.
> >>
> >> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> >> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > 
> > This adds a new function that is almost the same as an existing
> > function, but the documentation is unclear when I should use one or the
> > other.
> 
> Why do you think it is unclear? as explained in commit and
> documentation, unit tests for example use stubs/iothread-lock, which
> returns always false. So we can (and should!) use this function in
> APIs invoked by unit tests, because qemu_mutex_iothread_locked will
> just return false, making all tests crash. On the other side, I am
> pretty sure it won't cause any failure when running QEMU or
> qemu-iotests, because there most of the API use the cpu
> implementation.

I feel "use this function if your code is going to be used by unit
tests, but use qemu_mutex_iothread_locked() otherwise" is a very strange
interface. I'm relatively sure that qemu_mutex_iothread_locked() isn't
primarily used to make unit tests crash.

Documentation and the definition of the interface of a function
shouldn't be about the caller, but about the semantics of the function
itself. So, which question does qemu_mutex_iothread_locked() answer, and
which question does qemu_in_main_thread() answer?

The meaning of their result must be different, otherwise there wouldn't
be two different functions that must be used in different contexts.

> > What are the use cases for the existing qemu_mutex_iothread_locked()
> > stub where we rely on false being returned?
> 
> I don't think we ever rely on stub being false. There are only 2
> places where I see !qemu_mutex_iothread_locked(), and are in
> helper_regs.c and cpus.c
> 
> So being cpu related functions they use the cpu implementation.
> 
> However, commit 5f50be9b5810293141bb53cfd0cb46e765367d56 changed the
> stub to return false for a specific reason.

I must admit I don't really understand the reasoning there:

    With this change, the stub qemu_mutex_iothread_locked() must be changed
    from true to false.  The previous value of true was needed because the
    main thread did not have an AioContext in the thread-local variable,
    but now it does have one.

This explains why it _can_ be changed to false for this caller, but not
why it _must_ be changed.

> > If there aren't any, then maybe we should change the stub for that one
> > instead of adding a new function that behaves the same in the system
> > emulator and different only when it's stubbed out?
> 
> I don't think we can replace it, bcause stubs/qemu_in_main_thread()
> calls qemu_get_current_aio_context, that in turn calls
> qemu_mutex_iothread_locked. So we implicitly rely on that "false".

qemu_get_current_aio_context() will just return my_aiocontext, which is
qemu_aio_context because all tools call qemu_init_main_loop(). I don't
think it will ever call qemu_mutex_iothread_locked() in tools, except
for worker threads.

Ooh, and that's why we return false. Because the only kind of non-main
threads accessing global state in tools are worker threads which never
hold the BQL in the system emulator.

So is the problem with the unit tests really just that they never call
qemu_init_main_loop() and therefore never set the AioContext for the
main thread?

Kevin


