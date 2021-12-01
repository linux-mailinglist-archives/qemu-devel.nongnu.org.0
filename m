Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C7C464F6F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 15:14:28 +0100 (CET)
Received: from localhost ([::1]:49322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msQNP-0003Y6-Ae
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 09:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msQJk-0001KU-Rv
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 09:10:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1msQJe-0006hJ-EH
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 09:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638367832;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dPQBWSiFd4l3XEYqrXoE+y2FnYokcyZK/wJNmct1g+A=;
 b=cPNJR6ekiG1bymmKICTdjRBeWWuRhjAUNmpwgZrKzCoVQIsSZujEm+ydp0v5fjHYednH/W
 lrJnDcpqIf+YRzXVf7vFvlrDMfibCBTS9w73OkWvOq9DLLXKndyomVa+yMGOCeISIjDTcq
 kClJi9qi+BeQODIekZQZyQepbXdeeYY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-azcwhgZ-OYC3FShIBPnkpQ-1; Wed, 01 Dec 2021 09:10:27 -0500
X-MC-Unique: azcwhgZ-OYC3FShIBPnkpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C917100CC94;
 Wed,  1 Dec 2021 14:10:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C9950239;
 Wed,  1 Dec 2021 14:09:59 +0000 (UTC)
Date: Wed, 1 Dec 2021 14:09:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Zhang <lizhang@suse.de>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaeCNK60ziPm9p4N@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com> <YaS3aKW6AWH4JAeR@work-vm>
 <50dbb2b9-152e-f97a-d82e-0b6613e54085@suse.de>
 <YaTorUbhzjFhvBl5@work-vm>
 <9b20d47c-8b4e-b1b2-c0b9-1ec82dc775ff@suse.de>
 <YadpCGtNYfPOFgxO@redhat.com>
 <f08dd91a-18e0-51dc-b48a-29473588bbce@suse.de>
MIME-Version: 1.0
In-Reply-To: <f08dd91a-18e0-51dc-b48a-29473588bbce@suse.de>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 01, 2021 at 02:42:04PM +0100, Li Zhang wrote:
> 
> On 12/1/21 1:22 PM, Daniel P. Berrangé wrote:
> > On Wed, Dec 01, 2021 at 01:11:13PM +0100, Li Zhang wrote:
> > > On 11/29/21 3:50 PM, Dr. David Alan Gilbert wrote:
> > > > * Li Zhang (lizhang@suse.de) wrote:
> > > > > On 11/29/21 12:20 PM, Dr. David Alan Gilbert wrote:
> > > > > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > > > > On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > > > > > > > When doing live migration with multifd channels 8, 16 or larger number,
> > > > > > > > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > > > > > > > 
> > > > > > > > At sender's side:
> > > > > > > > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > > > > > > > is called because one thread fails on qio_channel_write_all when
> > > > > > > > the network problem happens and other send threads are blocked on sendmsg.
> > > > > > > > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > > > > > > > to wait for the threads terminated.
> > > > > > > Isn't the right answer here to ensure we've called 'shutdown' on
> > > > > > > all the FDs, so that the threads get kicked out of sendmsg, before
> > > > > > > trying to join the thread ?
> > > > > > I agree a timeout is wrong here; there is no way to get a good timeout
> > > > > > value.
> > > > > > However, I'm a bit confused - we should be able to try a shutdown on the
> > > > > > receive side using the 'yank' command. - that's what it's there for; Li
> > > > > > does this solve your problem?
> > > > > No, I tried to register 'yank' on the receive side, the receive threads are
> > > > > still waiting there.
> > > > > 
> > > > > It seems that on send side, 'yank' doesn't work either when the send threads
> > > > > are blocked.
> > > > > 
> > > > > This may be not the case to call yank. I am not quite sure about it.
> > > > We need to fix that; 'yank' should be able to recover from any network
> > > > issue.  If it's not working we need to understand why.
> > > Hi Dr. David,
> > > 
> > > On the receive side, I register 'yank' and it is called. But it is just to
> > > shut down the channels,
> > > 
> > > it couldn't fix the problem of the receive threads which are waiting for the
> > > semaphore.
> > > 
> > > So the receive threads are still waiting there.
> > > 
> > > On the send side,  the main process is blocked on qemu_thread_join(), when I
> > > tried the 'yank'
> > > 
> > > command with QMP,  it is not handled. So the QMP doesn't work and yank
> > > doesn't work.
> > IOW, there is a bug in QEMU on the send side. It should not be calling
> > qemu_thread_join() from the main thread, unless it is extremely
> > confident that the thread in question has already finished.
> > 
> > You seem to be showing that the thread(s) are still running, so we
> > need to understand why that is the case, and why the main thread
> > still decided to try to join these threads which haven't finished.
> 
> Some threads are running. But there is one thread fails to
> qio_channel_write_all.
> 
> In migration_thread(), it detects an error here:
> 
>    thr_error = migration_detect_error(s);
>         if (thr_error == MIG_THR_ERR_FATAL) {
>             /* Stop migration */
>             break;
> 
> It will stop migration and cleanup.

Those threads which are still running need to be made to
terminate before trying to join them

A quick glance at multifd_send_terminate_threads() makes me
suspect multifd shutdown is not reliable.

It is merely setting some boolean flags and posting to a
semaphore. It is doing nothing to shutdown the socket
associated with each thread, so the threads can still be
waiting in an I/O call. IMHO multifd_send_terminate_threads
needs to call qio_chanel_shutdown(p->c, QIO_CHANNEL_SHUTDOWN_BOTH)


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


