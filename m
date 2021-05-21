Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB82F38C0B8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 09:27:27 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljzZ9-0001ep-0k
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 03:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzXn-0000yy-Pa
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljzXl-0004Tr-Tg
 for qemu-devel@nongnu.org; Fri, 21 May 2021 03:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621581960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OvJE0bM2mdfXDxGhyH1a7L50Li0DSX68TwzN+9kOeEM=;
 b=K6V4Omipzqrh3PHxBDsaQdXyAgBTjiBmOxu00IjsJDjl7wmD21Y1h7J8IU3BAwwOOCCAfN
 8CuYatpuSU9rhxx8YCvLcPmFfsOqKHL1V6bWstHk5VT933h+0Ufd/zMcNuO0ReDLlF1Cs3
 t/ToX8G0d2ql6Cy0NSOSW5s++m2g6nE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-YcsClMZ8Ph-CSVnzRVUp2A-1; Fri, 21 May 2021 03:25:59 -0400
X-MC-Unique: YcsClMZ8Ph-CSVnzRVUp2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28779501E1;
 Fri, 21 May 2021 07:25:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B6C5E17B;
 Fri, 21 May 2021 07:25:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9A829113865F; Fri, 21 May 2021 09:25:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: A bug of Monitor Chardev ?
References: <cd197959-7da0-ee50-1e65-e6b2e7107a86@huawei.com>
 <CAJ+F1C+4URqrZvAiBk+o-Ei4etL_oBtdPr0cugGmnMaYaZqGyA@mail.gmail.com>
 <YKU/k/DIJd6gMLvw@redhat.com>
Date: Fri, 21 May 2021 09:25:52 +0200
In-Reply-To: <YKU/k/DIJd6gMLvw@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Wed, 19 May 2021 17:40:51 +0100")
Message-ID: <87lf88pmyn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: chenjiashang@huawei.com, QEMU <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Wed, May 19, 2021 at 08:17:51PM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>=20
>> On Mon, May 17, 2021 at 11:11 AM Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) <longpeng2@huawei.com> wrote:
>>=20
>> > We find a race during QEMU starting, which would case the QEMU process
>> > coredump.
>> >
>> > <main loop>                             |    <MON iothread>
>> >                                         |
>> > [1] create MON chardev                  |
>> > qemu_create_early_backends              |
>> >   chardev_init_func                     |
>> >                                         |
>> > [2] create MON iothread                 |
>> > qemu_create_late_backends               |
>> >   mon_init_func                         |
>> >         aio_bh_schedule----------------------->
>> > monitor_qmp_setup_handlers_bh
>> > [3] enter main loog                     |    tcp_chr_update_read_handl=
er
>> > (* A client come in, e.g. Libvirt *)    |      update_ioc_handlers
>> >
>> tcp_chr_new_client                      |
>> >   update_ioc_handlers                   |
>> >                                         |
>> >     [4] create new hup_source           |
>> >         s->hup_source =3D *PTR1*          |
>> >           g_source_attach(s->hup_source)|
>> >                                         |        [5]
>> > remove_hup_source(*PTR1*)
>> >                                         |            (create new
>> > hup_source)
>> >                                         |             s->hup_source =
=3D
>> > *PTR2*
>> >         [6] g_source_attach_unlocked    |
>> >               *PTR1* is freed by [5]    |
>> >
>> > Do you have any suggestion to fix this bug ? Thanks!
>> >
>> >
>> I see.. I think the simplest would be for the chardev to not be dispatch=
ed
>> in the original thread after monitor_init_qmp(). It looks like this shou=
ld
>> translate at least to calling qio_net_listener_set_client_func_full() wi=
th
>> NULL handlers. I can't see where we could fit that in the chardev API.
>> Perhaps add a new qemu_chr_be_disable_handlers() (until
>> update_read_handlers is called again to enable them)?
>>=20
>> Daniel? Paolo?
>
> IIUC, the problem is:
>
>   - when we first create the chardev, its IO watches are setup with
>     the default (NULL) GMainContext which is processed by the main
>     thread
>
>   - when we create the monitor, we re-initialize the chardev to
>     attach its IO watches to a custom GMainCOntext associated with
>     the monitor thread.
>
>   - The re-initialization is happening in a bottom half that runs
>     in the monitor thread, thus the main thread can already start
>     processing an IO event in parallel
>
> Looking at the code in qmp.c monitor_init_qmp method it has a
> comment:
>
>         /*
>          * We can't call qemu_chr_fe_set_handlers() directly here
>          * since chardev might be running in the monitor I/O
>          * thread.  Schedule a bottom half.
>          */
>
> AFAICT, that comment is wrong. monitor_init_qmp is called from
> monitor_init, which is called from monitor_init_opts, which is
> called from qemu_create_late_backends, which runs in the main
> thread.

Goes back to commit a5ed352596a8b7eb2f9acce34371b944ac3056c4
Author: Peter Xu <peterx@redhat.com>
Date:   Fri Mar 9 16:59:52 2018 +0800

    monitor: allow using IO thread for parsing
   =20
    For each Monitor, add one field "use_io_thr" to show whether it will be
    using the dedicated monitor IO thread to handle input/output.  When set=
,
    monitor IO parsing work will be offloaded to the dedicated monitor IO
    thread, rather than the original main loop thread.
   =20
    This only works for QMP.  HMP will always be run on the main loop
    thread.
   =20
    Currently we're still keeping use_io_thr off always.  Will turn it on
    later at some point.
   =20
    One thing to mention is that we cannot set use_io_thr for every QMP
    monitor.  The problem is that MUXed typed chardevs may not work well
    with it now. When MUX is used, frontend of chardev can be the monitor
    plus something else.  The only thing we know would be safe to be run
    outside main thread so far is the monitor frontend. All the rest of the
    frontends should still be run in main thread only.
   =20
    Signed-off-by: Peter Xu <peterx@redhat.com>
    Message-Id: <20180309090006.10018-10-peterx@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    [eblake: squash in Peter's followup patch to avoid test failures]
    Signed-off-by: Eric Blake <eblake@redhat.com>

Peter, do you remember why you went for a bottom half?

Hmm, back then it was in monitor_init(), which was called from several
places.  Did we manage to lose the need for a bottom half along the way?

Note that the initial comment was a bit different:

        if (mon->use_io_thr) {
            /*
             * Make sure the old iowatch is gone.  It's possible when
             * e.g. the chardev is in client mode, with wait=3Don.
             */
            remove_fd_in_watch(chr);
            /*
             * We can't call qemu_chr_fe_set_handlers() directly here
             * since during the procedure the chardev will be active
             * and running in monitor iothread, while we'll still do
             * something before returning from it, which is a possible
             * race too.  To avoid that, we just create a BH to setup
             * the handlers.
             */
            aio_bh_schedule_oneshot(monitor_get_aio_context(),
                                    monitor_qmp_setup_handlers_bh, mon);
            /* We'll add this to mon_list in the BH when setup done */
            return;
        } else {
            qemu_chr_fe_set_handlers(&mon->chr, monitor_can_read,
                                     monitor_qmp_read, monitor_qmp_event,
                                     NULL, mon, NULL, true);
        }

I changed it in commit 774a6b67a40.

> I think we should explicitly document that monitor_init_qmp
> is *required* to be invoked from the main thread and then
> remove the bottom half usage.

Assert "running in main thread", so screwups crash reliably instead of
creating a race.

>                                If we ever find a need to
> create a new monitor from a non-main thread, that thread
> could use an idle callback attached to the default GMainContext
> to invoke monitor_init_qmp.
>
> Regards,
> Daniel


