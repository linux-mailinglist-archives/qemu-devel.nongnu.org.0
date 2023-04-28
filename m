Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88736F134C
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 10:31:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psJV3-0003E5-Oo; Fri, 28 Apr 2023 04:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1psJV0-0003DC-Rn
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1psJUw-0001pQ-HT
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 04:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682670633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Bamfp8aIIR9tgp6+PbDwSW/gWHPxd4V+bJ6g3EE4H8=;
 b=TWXbZaD9SQXRexEwjm4QUiG6EkKoT0+ofNqPxeML05Szu/Dc49jn58VWgGKO0mAFxLYjpe
 8jA2wCB/HAp49ZM4MkiL9iE7p+qZcZK4TgmPJk1UOPuLnNCnIGcNgfcivVfiUVtO7nUz8Z
 oUarxi9A5WYq8B9g55J4axnqDjoAziY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-pvJuJGfAMkqwHwVnIsknZA-1; Fri, 28 Apr 2023 04:30:30 -0400
X-MC-Unique: pvJuJGfAMkqwHwVnIsknZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF2D738149B3;
 Fri, 28 Apr 2023 08:30:29 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C1BE63F46;
 Fri, 28 Apr 2023 08:30:27 +0000 (UTC)
Date: Fri, 28 Apr 2023 10:30:26 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Message-ID: <ZEuEIhe86udi38kx@redhat.com>
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
 <ZEpWd+273aIVZrRV@redhat.com>
 <515e6a39-8515-b32b-05ce-6d7511779b1b@proxmox.com>
 <87zg6tbdep.fsf@secure.mitica>
 <b1402ecd-1288-1ceb-ce58-65fc90636fac@proxmox.com>
 <87bkj8bg8g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkj8bg8g.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 28.04.2023 um 09:47 hat Juan Quintela geschrieben:
> Fiona Ebner <f.ebner@proxmox.com> wrote:
> > Am 27.04.23 um 16:36 schrieb Juan Quintela:
> >> Fiona Ebner <f.ebner@proxmox.com> wrote:
> >>> Am 27.04.23 um 13:03 schrieb Kevin Wolf:
> >>>> Am 26.04.2023 um 16:31 hat Fiona Ebner geschrieben:
> >>>>> Am 20.04.23 um 08:55 schrieb Paolo Bonzini:
> >> 
> >> Hi
> >> 
> >>> Our function is a custom variant of saving a snapshot and uses
> >>> qemu_savevm_state_setup(), which is why the qemu_mutex_unlock_iothread()
> >>> is there. I looked for inspiration for how upstream does things and it
> >>> turns out that upstream QEMU v8.0.0 has essentially the same issue with
> >>> snapshot-save. When snapshot_save_job_bh runs in a vCPU thread instead
> >>> of the main thread, the situation is the same: after
> >>> qemu_mutex_unlock_iothread(), qemu_get_current_aio_context() will return
> >>> 0x0 and then the assertion in the AIO_WAIT_WHILE_INTERNAL macro fails
> >>> (this time the generated coroutine wrapper is bdrv_writev_vmstate)[0].
> >>>
> >>>
> >>> So all bottom halves scheduled for the main thread's AioContext can
> >>> potentially get to run in a vCPU thread and need to be very careful with
> >>> things like qemu_mutex_unlock_iothread.
> >>>
> >>> Is qemu_get_current_aio_context() returning 0x0 expected? I haven't
> >>> looked into why it happens yet. Does there need to be a way to drop the
> >>> BQL without also giving up the main thread's AioContext or would it be
> >>> enough to re-acquire the context?
> >>>
> >>> CC-ing Juan as the migration maintainer.
> >> 
> >> This is the world backwards.
> >> The tradition is that migration people blame block layer people for
> >> breaking things and for help, not the other way around O:-)
> >
> > Sorry, if I didn't provide enough context/explanation. See below for my
> > attempt to re-iterate. I CC'ed you, because the issue happens as part of
> > snapshot-save and in particular the qemu_mutex_unlock_iothread call in
> > qemu_savevm_state is one of the ingredients leading to the problem.
> 
> This was a joke O:-)
> 
> >> To see that I am understading this right:
> >> 
> >> - you create a thread
> >> - that calls a memory_region operation
> >> - that calls a device write function
> >> - that calls the block layer
> >> - that creates a snapshot
> >> - that calls the migration code
> >> - that calls the block layer again
> >> 
> >> Without further investigation, I have no clue what is going on here,
> >> sorry.
> >> 
> >> Later, Juan.
> >> 
> >
> > All I'm doing is using QEMU (a build of upstream's v8.0.0) in intended
> > ways, I promise! In particular, I'm doing two things at the same time
> > repeatedly:
> > 1. Write to a pflash drive from within the guest.
> > 2. Issue a snapshot-save QMP command (in a way that doesn't lead to an
> > early error).
> >
> > (I actually also used a debugger to break on pflash_update and
> > snapshot_save_job_bh, manually continuing until I triggered the
> > problematic situation. It's very racy, because it depends on the host OS
> > to switch threads at the correct time.)
> 
> I think the block layer is the problem (famous last words)
> 
> >
> > Now we need to be aware of two things:
> > 1. As discussed earlier in the mail thread, if the host OS switches
> > threads at an inconvenient time, it can happen that a bottom half
> > scheduled for the main thread's AioContext can be executed as part of a
> > vCPU thread's aio_poll.
> > 2. Generated coroutine wrappers for block layer functions spawn the
> > coroutine and use AIO_WAIT_WHILE/aio_poll to wait for it to finish.
> >
> > What happens in the backtrace above is:
> > 1. The write to the pflash drive uses blk_pwrite which leads to an
> > aio_poll in the vCPU thread.
> > 2. The snapshot_save_job_bh bottom half, that was scheduled for the main
> > thread's AioContext, is executed as part of the vCPU thread's aio_poll.
> > 3. qemu_savevm_state is called.
> > 4. qemu_mutex_unlock_iothread is called. Now
> > qemu_get_current_aio_context returns 0x0. Usually, snapshot_save_job_bh
> > runs in the main thread, in which case qemu_get_current_aio_context
> > still returns the main thread's AioContext at this point.
> 
> I am perhaps a bit ingenuous here, but it is there a way to convince
> qemu that snapshot_save_job_bh *HAS* to run on the main thread?

I believe we're talking about a technicality here. I asked another more
fundamental question that nobody has answered yet:

Why do you think that it's ok to call bdrv_writev_vmstate() without
holding the BQL?

Because if we come to the conclusion that it's not ok (which is what I
think), then it doesn't matter whether we violate the condition in the
main thread or a vcpu thread. It's wrong in both cases, just the failure
mode differs - one crashes spectacularly with an assertion failure, the
other has a race condition. Moving from the assertion failure to a race
condition is not a proper fix.

> > 5. bdrv_writev_vmstate is executed as part of the usual savevm setup.
> > 6. bdrv_writev_vmstate is a generated coroutine wrapper, so it uses
> > AIO_WAIT_WHILE.
> > 7. The assertion to have the main thread's AioContext inside the
> > AIO_WAIT_WHILE macro fails.

Kevin


