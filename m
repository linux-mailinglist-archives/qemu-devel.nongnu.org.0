Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982C42315E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 22:12:26 +0200 (CEST)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXqnY-00080q-SG
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 16:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXqlL-0005zX-Rp
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:10:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mXqlG-0006JH-Kf
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 16:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633464601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7bTipGzSoCso5emqPecoFKluLCOEAj9SOFuYl2NeLjI=;
 b=Bfw/lGdtoR2U3qao/1+CClrQnw9xo5nqvzuEKEJ9yg2Zyxwg4XILZs3ZFktlTqIoSwlrRr
 dK8AfUSO7oMamM/mbUXEDd5VnXyCI6LuOqMwUu2mMWee563RgPh4/s6asPVgybKYHHbRNI
 xYxR8GoegVZgHu6HB3/ZcDZYPxq7f/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-RGdkC3CTMXSWVQswvhdvTg-1; Tue, 05 Oct 2021 16:09:57 -0400
X-MC-Unique: RGdkC3CTMXSWVQswvhdvTg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370321923761;
 Tue,  5 Oct 2021 20:09:56 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.9.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A02535F4F5;
 Tue,  5 Oct 2021 20:09:35 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 2E860220BDB; Tue,  5 Oct 2021 16:09:35 -0400 (EDT)
Date: Tue, 5 Oct 2021 16:09:35 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 10/13] virtiofsd: Custom threadpool for remote blocking
 posix locks requests
Message-ID: <YVyw/wCkjn1JBtDJ@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
 <20210930153037.1194279-11-vgoyal@redhat.com>
 <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YVsVp4rPILhz+/Eh@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: miklos@szeredi.hu, qemu-devel@nongnu.org, iangelak@redhat.com,
 dgilbert@redhat.com, virtio-fs@redhat.com, jaggel@bu.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 03:54:31PM +0100, Stefan Hajnoczi wrote:
> On Thu, Sep 30, 2021 at 11:30:34AM -0400, Vivek Goyal wrote:
> > Add a new custom threadpool using posix threads that specifically
> > service locking requests.
> > 
> > In the case of a fcntl(SETLKW) request, if the guest is waiting
> > for a lock or locks and issues a hard-reboot through SYSRQ then virtiofsd
> > unblocks the blocked threads by sending a signal to them and waking
> > them up.
> > 
> > The current threadpool (GThreadPool) is not adequate to service the
> > locking requests that result in a thread blocking. That is because
> > GLib does not provide an API to cancel the request while it is
> > serviced by a thread. In addition, a user might be running virtiofsd
> > without a threadpool (--thread-pool-size=0), thus a locking request
> > that blocks, will block the main virtqueue thread that services requests
> > from servicing any other requests.
> > 
> > The only exception occurs when the lock is of type F_UNLCK. In this case
> > the request is serviced by the main virtqueue thread or a GThreadPool
> > thread to avoid a deadlock, when all the threads in the custom threadpool
> > are blocked.
> > 
> > Then virtiofsd proceeds to cleanup the state of the threads, release
> > them back to the system and re-initialize.
> 
> Is there another way to cancel SETLKW without resorting to a new thread
> pool? Since this only matters when shutting down or restarting, can we
> close all plock->fd file descriptors to kick the GThreadPool workers out
> of fnctl()?

Ok, I tested this. If a thread is blocked on OFD lock and another
thread closes associated "fd", it does not unblock the thread
which is blocked on lock. So closing OFD can't be used for unblocking
a thread.

Even if it could be, it can't be a replacement for a thread pool
in general as we can't block main thread otherwise it can deadlock.
But we could have used another glib thread pool (instead of a
custom thread pool which can handle signals to unblock threads).

If you are curious, here is my test program.

https://github.com/rhvgoyal/misc/blob/master/virtiofs-tests/ofd-lock.c

Comments in there explain how to use it. It can block on an OFD
lock and one can send SIGUSR1 which will close fd.

Thanks
Vivek


