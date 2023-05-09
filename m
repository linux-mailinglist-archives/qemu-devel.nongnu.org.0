Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FAA6FC83F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 15:55:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwNmk-0003Ml-AD; Tue, 09 May 2023 09:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwNmg-0003MA-I6
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:53:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwNme-0006ff-9j
 for qemu-devel@nongnu.org; Tue, 09 May 2023 09:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683640419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2iC/N0E1P97UuSO/WUAiwwMTDCWRBlsJFGZ61MYickc=;
 b=GHb0jSN1Ak816BxjTdniUj98/8usJYbt1Mjs9UpvvBzLqGHKrcxDq36At7y3su8jDzl3Mo
 8KE9FAQ3zlD/doBAywbbTlYRqYAnMyKLr7aIGylCX/9nITmweMv4YfuZ7Xr2pB6iS9op+R
 S8SjNXrrVy1dXmYMgv2yWX7WMVQT6XA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-mmLiEDh5MCiHjECVoFCLlg-1; Tue, 09 May 2023 09:53:35 -0400
X-MC-Unique: mmLiEDh5MCiHjECVoFCLlg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 749793815F0B;
 Tue,  9 May 2023 13:53:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46BBB492B00;
 Tue,  9 May 2023 13:53:33 +0000 (UTC)
Date: Tue, 9 May 2023 15:53:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Hanna Czenczek <hreitz@redhat.com>, eesposit@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Subject: Re: Question about graph locking preconditions regarding
 qemu_in_main_thread()
Message-ID: <ZFpQXPqW0s95/guu@redhat.com>
References: <9d413dd9-a606-8e80-2ae7-a068cd582bb5@proxmox.com>
 <ZFjRbW4+gsz65vqn@redhat.com>
 <8af6f1ef-9b91-7024-36a1-e98ba87a9feb@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8af6f1ef-9b91-7024-36a1-e98ba87a9feb@proxmox.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 09.05.2023 um 12:26 hat Fiona Ebner geschrieben:
> Am 08.05.23 um 12:40 schrieb Kevin Wolf:
> > Am 05.05.2023 um 11:35 hat Fiona Ebner geschrieben:
> >> Hi,
> >> I noticed that the bdrv_graph_co_rd_lock() and bdrv_graph_co_rd_unlock()
> >> functions use qemu_in_main_thread() as a conditional to return early.
> >> What high-level requirements ensure that qemu_in_main_thread() will
> >> evaluate to the same value during locking and unlocking?
> > 
> > I think it's actually wrong.
> > 
> > There are some conditions under which we don't actually need to do
> > anything for locking: Writing the graph is only possible from the main
> > context while holding the BQL. So if a reader is running in the main
> > contextunder the BQL and knows that it won't be interrupted until the
> > next writer runs, we don't actually need to do anything.
> > 
> > This is the case if the reader code neither has a nested event loop
> > (this is forbidden anyway while you hold the lock) nor is a coroutine
> > (because a writer could run when the coroutine has yielded).
> 
> Sorry, I don't understand the first part. If bdrv_writev_vmstate() is
> called, then, because it is a generated coroutine wrapper,
> AIO_WAIT_WHILE()/aio_poll() is used. And that is the case regardless of
> whether the lock is held or not, i.e. there is a nested event loop even
> if the lock is held?

With "lock" you mean the graph lock here, not the BQL, right?

These generated coroutine wrapper are a bit ugly because they behave
different when called from a coroutine and when called outside of
coroutine context:

* In coroutine context, the caller MUST hold the lock
* Outside of coroutine context, the caller MUST NOT hold the lock

The second requirement comes from AIO_WAIT_WHILE(), like you say. If you
hold the lock and you're not in a coroutine, you simply can't call such
functions.

However, as bdrv_graph_co_rdlock() is a coroutine_fn, you won't usually
hold the lock outside of coroutine context anyway. But it's something to
be careful with when you have a writer lock.

> > These conditions are exactly what bdrv_graph_rdlock_main_loop() asserts.
> > They are not fulfilled in bdrv_graph_co_rdlock, which always runs in a
> > coroutine.
> > 
> 
> Thank you for the explanation!
> 
> >> In the output below, the boolean value after the backtraces of
> >> bdrv_graph_co_rd(un)lock is the value of qemu_in_main_thread().
> >>
> >> AFAICT, what happened below is:
> >> 1. QMP function is executed in the main thread and drops the BQL.
> >> 2. bdrv_co_writev_vmstate_entry is called, increasing the reader count,
> >> because qemu_in_main_thread() is false.
> >> 3. A vCPU thread issued a write, not increasing the reader count,
> >> because qemu_in_main_thread() is true.
> >> 4. The write is finished in the main thread, decreasing the reader
> >> count, because qemu_in_main_thread() is false.
> > 
> > This one is weird. Why don't we hold the BQL there?
> > 
> > Ah, I actually have an idea: Maybe it is executed by the nested event
> > loop in bdrv_writev_vmstate(). This nested event loop runs now without
> > the BQL, too, and it can call any sort of callback in QEMU that really
> > expects to be called with the BQL. Scary!
> > 
> > If this is what happens, you actually have your proof that not holding
> > the BQL can cause problems even if there is no other thread active that
> > could interfere.
> > 
> > Can you try to confirm this in gdb? In case you haven't debugged
> > coroutines much yet: If you have this state in gdb for a running
> > instance, you can repeat 'fin' until you reach the next coroutine
> > switch, and then you should be able to get the stack trace to see who
> > entered the coroutine.
> > 
> 
> Thank you for the guidance! Hope I did it correctly, but AFAICS, you
> are spot-on :)

Yes, this looks like what I suspected. Thanks for confirming!

Kevin


