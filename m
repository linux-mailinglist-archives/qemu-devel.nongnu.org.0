Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A27AC6B7DB5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 17:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbl6j-0001So-AG; Mon, 13 Mar 2023 12:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pbl6U-0001PL-H6
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:33:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pbl6S-0005WR-NY
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 12:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678725171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xu+qKa5rE7+bl9+U7wE+BCQUFSKBdJNDRXqN4+UGumg=;
 b=a/K9SeVC+k8cE/zXPdwbWq4uoC4yGf+YtoOgpPUDhKtWW7x5+TsmDIan80ctbJtwPp2gE6
 JQ860+dSkD6nY9i30SyCDJDtpv8J+XMxHi7jpfO1LXGjawRtlDVbfTnDZYlO4G7DXE1tJB
 o6W8hS6ZDZFFlSqwNpqD6L1kwgmbDiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-XVKcpvyyO526-xWksPf9Hw-1; Mon, 13 Mar 2023 12:32:49 -0400
X-MC-Unique: XVKcpvyyO526-xWksPf9Hw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2771A3C025D1;
 Mon, 13 Mar 2023 16:32:49 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9E683542A;
 Mon, 13 Mar 2023 16:32:47 +0000 (UTC)
Date: Mon, 13 Mar 2023 17:32:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fiona Ebner <f.ebner@proxmox.com>, Hanna Czenczek <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: [PATCH for-8.0] ide: Fix manual in-flight count for TRIM BH
Message-ID: <ZA9QLvv3P7da/Rvq@redhat.com>
References: <20230309114430.33684-1-hreitz@redhat.com>
 <88de2e68-61e2-9397-b202-d611247002ba@redhat.com>
 <CABgObfZkSt6-0-vKkUtiWUy1TtHS_kEiYM2wRh+MfjTXmW497A@mail.gmail.com>
 <7ca18cb4-eeb1-4cba-feea-90f28fb9c2fc@redhat.com>
 <3e695f64-13bb-1311-6cd6-09bffc312873@redhat.com>
 <ZAobe/wtsf//YGHJ@redhat.com>
 <a432cb4d-8d7e-8408-15a9-c84414c03196@proxmox.com>
 <ZAs92f/J9qvA6X5B@redhat.com>
 <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfbJ_20fk4H=w0HUBrAtUBbrzn53euqUc-D-s5a3-Xur5w@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 10.03.2023 um 16:13 hat Paolo Bonzini geschrieben:
> On Fri, Mar 10, 2023 at 3:25 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > > 1. The TRIM operation should be completed on the IDE level before
> > > draining ends.
> > > 2. Block layer requests issued after draining has begun are queued.
> > >
> > > To me, the conclusion seems to be:
> > > Issue all block layer requests belonging to the IDE TRIM operation up
> > > front.
> > >
> > > The other alternative I see is to break assumption 2, introduce a way
> > > to not queue certain requests while drained, and use it for the
> > > recursive requests issued by ide_issue_trim_cb. But not the initial
> > > one, if that would defeat the purpose of request queuing. Of course
> > > this can't be done if QEMU relies on the assumption in other places
> > > already.
> >
> > I feel like this should be allowed because if anyone has exclusive
> > access in this scenario, it's IDE, so it should be able to bypass the
> > queuing. Of course, the queuing is still needed if someone else drained
> > the backend, so we can't just make TRIM bypass it in general. And if you
> > make it conditional on IDE being in blk_drain(), it already starts to
> > become ugly again...
> >
> > So maybe the while loop is unavoidable.
> >
> > Hmm... But could ide_cancel_dma_sync() just directly use
> > AIO_WAIT_WHILE(s->bus->dma->aiocb) instead of using blk_drain()?
> 
> While that should work, it would not fix other uses of
> bdrv_drain_all(), for example in softmmu/cpus.c. Stopping the device
> model relies on those to run *until the device model has finished
> submitting requests*.

If so, do_vm_stop() really expects drain to do something it isn't
designed to do. It's only for quiescing backends, not for any other
activity a qdev device might still be doing. I think it's really the
vm_state_notify() that should take care of stopping device activity.

But maybe we can make it work with drain anyway.

> So I still think that this bug is a symptom of a problem in the design
> of request queuing.
> 
> In fact, shouldn't request queuing was enabled at the _end_ of
> bdrv_drained_begin (once the BlockBackend has reached a quiescent
> state on its own terms), rather than at the beginning (which leads to
> deadlocks like this one)?

No, I don't think that is ever right. As I said earlier in this thread
(and you said yourself previously), there are two different users of
drain:

1. I want to have exclusive access to the node. This one wants request
   queuing from the start to avoid losing time unnecessarily until the
   guest stops sending new requests.

2. I want to wait for my requests to complete. This one never wants
   request queuing. Enabling it at the end of bdrv_drained_begin()
   wouldn't hurt it (because it has already achieved its goal then), but
   it's also not necessary for the same reason.

IDE reset and do_vm_stop() are case 2, implemented with blk_drain*().
The request queuing was implemented for case 1, something else in the
block graph draining the BlockBackend's root node with bdrv_drain*().

So maybe what we could take from this is that request queuing should be
temporarily disabled while we're in blk_drain*() because these
interfaces are only meant for case 2. In all other cases, it should
continue to work as it does now.

Kevin


