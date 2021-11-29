Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82414461A96
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 16:02:40 +0100 (CET)
Received: from localhost ([::1]:33712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mriAv-0008TH-CY
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 10:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mri6m-00065O-Dq
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:58:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mri6k-0006Uy-DW
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638197895;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rf3YPZwvEPGFaTnxJTb89eSgv/OGj9TlWeW1jNDRGs8=;
 b=BzG9+sCp5WBB8alo6CMpOO1Rmhbm1E8ev6cgV9IAIkwPpwjtTkzfpDtVfstAgdit2n+Fm6
 6pqqdNRE8z3fTEAoVISDUCmL56wSC5Xv1t2nTaiMPQmn1b29nXmDsr3yAzywANUNDu2DDO
 iNa9i+Di7iFDlekUSzufEGF/wdqbVzs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-t6rGnpRXPDeAhwh2GJoeuA-1; Mon, 29 Nov 2021 09:58:13 -0500
X-MC-Unique: t6rGnpRXPDeAhwh2GJoeuA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF7E593921;
 Mon, 29 Nov 2021 14:58:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93D795DF21;
 Mon, 29 Nov 2021 14:58:06 +0000 (UTC)
Date: Mon, 29 Nov 2021 14:58:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/2] multifd: use qemu_sem_timedwait in
 multifd_recv_thread to avoid waiting forever
Message-ID: <YaTqfO1ZqUanlA7K@redhat.com>
References: <20211126153154.25424-1-lizhang@suse.de>
 <20211126153154.25424-2-lizhang@suse.de>
 <YaECIGJAPAtB+n8/@redhat.com> <YaS3aKW6AWH4JAeR@work-vm>
MIME-Version: 1.0
In-Reply-To: <YaS3aKW6AWH4JAeR@work-vm>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: qemu-devel@nongnu.org, Li Zhang <lizhang@suse.de>, cfontana@suse.de,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 11:20:08AM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Fri, Nov 26, 2021 at 04:31:53PM +0100, Li Zhang wrote:
> > > When doing live migration with multifd channels 8, 16 or larger number,
> > > the guest hangs in the presence of the network errors such as missing TCP ACKs.
> > > 
> > > At sender's side:
> > > The main thread is blocked on qemu_thread_join, migration_fd_cleanup
> > > is called because one thread fails on qio_channel_write_all when
> > > the network problem happens and other send threads are blocked on sendmsg.
> > > They could not be terminated. So the main thread is blocked on qemu_thread_join
> > > to wait for the threads terminated.
> > 
> > Isn't the right answer here to ensure we've called 'shutdown' on
> > all the FDs, so that the threads get kicked out of sendmsg, before
> > trying to join the thread ?
> 
> I agree a timeout is wrong here; there is no way to get a good timeout
> value.
> However, I'm a bit confused - we should be able to try a shutdown on the
> receive side using the 'yank' command. - that's what it's there for; Li
> does this solve your problem?

Why do we even need to use 'yank' on the receive side ? Until migration
has switched over from src to dst, the receive side is discardable and
the whole process can just be teminated with kill(SIGTERM/SIGKILL).

On the source side 'yank' is needed, because the QEMU process is still
running the live workload and thus is precious and mustn't be killed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


