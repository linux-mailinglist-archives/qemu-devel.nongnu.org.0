Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34BC4CC8E8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 23:29:23 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPtwo-0001IQ-KS
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 17:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtvQ-0000T5-Ad
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nPtvN-0004Xf-EB
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 17:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646346470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bMLYmTVpA7djH36JAkRSNVJrw5O+Dh7DXrAFNxW+yQU=;
 b=gwy2scWAojoM3Ph6Iq/9aywiT4omrN178yff+Mu+gaMt4NzRZF6UN/NmgkA2SAZjFuNb77
 +Pg/pC1xtXxdLoGdBorlx6TS0KEA6bPWqNiuH21qbsWVHTutbCayPCS8vip44PZD8RnZRT
 /RmADS49beuDx5iNu/uDkVymryoSKaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-SEE6cXhuP3-KqHx8jLLuMw-1; Thu, 03 Mar 2022 17:27:45 -0500
X-MC-Unique: SEE6cXhuP3-KqHx8jLLuMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 918AE1006AA5;
 Thu,  3 Mar 2022 22:27:44 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A31E945CB5;
 Thu,  3 Mar 2022 22:27:42 +0000 (UTC)
Date: Thu, 3 Mar 2022 16:27:40 -0600
From: Eric Blake <eblake@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v2 2/4] qsd: Add pre-init argument parsing pass
Message-ID: <20220303222740.4lo64j2xgt6bpoyk@redhat.com>
References: <20220303164814.284974-1-hreitz@redhat.com>
 <20220303164814.284974-3-hreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220303164814.284974-3-hreitz@redhat.com>
User-Agent: NeoMutt/20211029-378-f757a4
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 03, 2022 at 05:48:12PM +0100, Hanna Reitz wrote:
> In contrast to qemu-nbd (where it is called --fork) and the system
> emulator, QSD does not have a --daemonize switch yet.  Just like them,
> QSD allows setting up block devices and exports on the command line.
> When doing so, it is often necessary for whoever invoked the QSD to wait
> until these exports are fully set up.  A --daemonize switch allows
> precisely this, by virtue of the parent process exiting once everything
> is set up.
> 
> Note that there are alternative ways of waiting for all exports to be
> set up, for example:
> - Passing the --pidfile option and waiting until the respective file
>   exists (but I do not know if there is a way of implementing this
>   without a busy wait loop)

Non-portably, you could use inotify or similar, to get a true
event-driven wakeup when the file is created.  And here's the python
glue that libnbd uses, instead of --pidfile:

https://gitlab.com/nbdkit/libnbd/-/blob/master/interop/interop-qemu-storage-daemon.sh#L58

> - Set up some network server (e.g. on a Unix socket) and have the QSD
>   connect to it after all arguments have been processed by appending
>   corresponding --chardev and --monitor options to the command line,
>   and then wait until the QSD connects
> 
> Having a --daemonize option would make this simpler, though, without
> having to rely on additional tools (to set up a network server) or busy
> waiting.
> 
> Implementing a --daemonize switch means having to fork the QSD process.
> Ideally, we should do this as early as possible: All the parent process
> has to do is to wait for the child process to signal completion of its
> set-up phase, and therefore there is basically no initialization that
> needs to be done before the fork.  On the other hand, forking after
> initialization steps means having to consider how those steps (like
> setting up the block layer or QMP) interact with a later fork, which is
> often not trivial.
> 
> In order to fork this early, we must scan the command line for
> --daemonize long before our current process_options() call.  Instead of
> adding custom new code to do so, just reuse process_options() and give
> it a @pre_init_pass argument to distinguish the two passes.  I believe
> there are some other switches but --daemonize that deserve parsing in

s/but/beyond/

> the first pass:
> 
> - --help and --version are supposed to only print some text and then
>   immediately exit (so any initialization we do would be for naught).
>   This changes behavior, because now "--blockdev inv-drv --help" will
>   print a help text instead of complaining about the --blockdev
>   argument.
>   Note that this is similar in behavior to other tools, though: "--help"
>   is generally immediately acted upon when finding it in the argument
>   list, potentially before other arguments (even ones before it) are
>   acted on.  For example, "ls /does-not-exist --help" prints a help text
>   and does not complain about ENOENT.

Well, GNU ls does that, but only if POSIXLY_CORRECT is not set (a
strict POSIX ls must give you two ENOENT).

> 
> - --pidfile does not need initialization, and is already exempted from
>   the sequential order that process_options() claims to strictly follow
>   (the PID file is only created after all arguments are processed, not
>   at the time the --pidfile argument appears), so it makes sense to
>   include it in the same category as --daemonize.
> 
> - Invalid arguments should always be reported as soon as possible.  (The
>   same caveat with --help applies: That means that "--blockdev inv-drv
>   --inv-arg" will now complain about --inv-arg, not inv-drv.)
> 
> This patch does make some references to --daemonize without having
> implemented it yet, but that will happen in the next patch.
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 43 ++++++++++++++++++++++++----
>  1 file changed, 38 insertions(+), 5 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


