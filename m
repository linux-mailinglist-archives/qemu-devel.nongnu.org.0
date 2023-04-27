Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2F66F04B0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 13:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1przPT-0001nw-AB; Thu, 27 Apr 2023 07:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przPR-0001nL-AN
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:03:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1przPN-0006X7-JP
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 07:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682593406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5GXBi7BMfgoQqlCZ0Xl4jWAkZuLphv05e22NvLnE0Hs=;
 b=OVUK+S9xUuweky16USJvZoYD8RAMhkv2Iqw4H5kXhpUevFJTJh9fkQyz1r22gzXMI8+eQW
 He7SEvkoEqI26eJwr8uh80mrI1JAr/OBntT5KtAmfADDEsWHV9rIoadTX42WEGBVoXwHhF
 MRzx1bP97fxexCb2cZHLsYfpFvpSBC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-iF8Mp5loNa-PihCYPZUY5A-1; Thu, 27 Apr 2023 07:03:23 -0400
X-MC-Unique: iF8Mp5loNa-PihCYPZUY5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C920F29A9D3C;
 Thu, 27 Apr 2023 11:03:22 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B64B492B03;
 Thu, 27 Apr 2023 11:03:20 +0000 (UTC)
Date: Thu, 27 Apr 2023 13:03:19 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, Peter Xu <peterx@redhat.com>
Subject: Re: QMP (without OOB) function running in thread different from the
 main thread as part of aio_poll
Message-ID: <ZEpWd+273aIVZrRV@redhat.com>
References: <2a61b581-5a21-c945-bb98-b6863cac0c1f@proxmox.com>
 <877cu7gk1g.fsf@pond.sub.org>
 <CABgObfapoyrFhY9kna_=D7PJ4yAssTgzY3jxSZD=6v0zCGDcSA@mail.gmail.com>
 <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ba2f8b9-9818-6601-2247-7b0e20d7ab0d@proxmox.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 26.04.2023 um 16:31 hat Fiona Ebner geschrieben:
> Am 20.04.23 um 08:55 schrieb Paolo Bonzini:
> > 
> > 
> > Il gio 20 apr 2023, 08:11 Markus Armbruster <armbru@redhat.com
> > <mailto:armbru@redhat.com>> ha scritto:
> > 
> >     So, splicing in a bottom half unmoored monitor commands from the main
> >     loop.  We weren't aware of that, as our commit messages show.
> > 
> >     I guess the commands themselves don't care; all they need is the BQL.
> > 
> >     However, did we unwittingly change what can get blocked?  Before,
> >     monitor commands could block only the main thread.  Now they can also
> >     block vCPU threads.  Impact?
> > 
> > 
> > Monitor commands could always block vCPU threads through the BQL(*).
> > However, aio_poll() only runs in the vCPU threads in very special cases;
> > typically associated to resetting a device which causes a blk_drain() on
> > the device's BlockBackend. So it is not a performance issue.
> > 
> 
> AFAIU, all generated coroutine wrappers use aio_poll. In my backtrace
> aio_poll happens via blk_pwrite for a pflash device. So a bit more
> often than "very special cases" ;)

Yes, it's a common thing for devices that start requests from the vcpu
thread when handling I/O (as opposed to devices that use an eventfd or
similar mechanisms).

> > However, liberal reuse of the main block layer AioContext could indeed
> > be a *correctness* issue. I need to re-read Fiona's report instead of
> > stopping at the first three lines because it's the evening. :)
> 
> For me, being called in a vCPU thread caused problems with a custom QMP
> function patched in by Proxmox. The function uses a newly opened
> BlockBackend and calls qemu_mutex_unlock_iothread() after which
> qemu_get_current_aio_context() returns 0x0 (when running in the main
> thread, it still returns the main thread's AioContext). It then calls
> blk_pwritev which is also a generated coroutine wrapper and the
> assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> in the else branch of the AIO_WAIT_WHILE_INTERNAL macro fails.
> 
> Sounds like there's room for improvement in our code :/ I'm not aware
> of something similar in upstream QEMU.

Yes, even if it didn't crash immediately, calling blk_*() without
holding a lock is invalid. In many cases, this is the BQL. If you don't
hold it while calling the function from a vcpu thread, you could run
into races with the main thread, which would probably be very painful to
debug.

Kevin


