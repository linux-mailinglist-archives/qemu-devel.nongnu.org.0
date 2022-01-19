Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBBF493F15
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:32:13 +0100 (CET)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEoe-0003ga-Kq
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:32:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAEei-0006BW-Gv
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nAEef-0000mq-Vd
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642612912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7WrC41h0RxZcaua4ZVlSntGf0udnld9qur2yZub2B14=;
 b=XfDrD+alomagj0/Bfd5I85DrJwpEJ0q/6R8l16XzCyxv0Z7Ocvz9yuAsH4vVaTqlfV6cUx
 ztLcvYkqy6X4aXkhbVQ4Y8TCEYw/0LZA9HkGH3wf/BDsLxQ6JHTvCpFPyRu9VOrjv0QY36
 ywu//4Qb5eghpKdLo4DAxeEVyybr8ms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-N5fGinT0M4W8ujedFI-w_A-1; Wed, 19 Jan 2022 12:21:51 -0500
X-MC-Unique: N5fGinT0M4W8ujedFI-w_A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 703CC84DA42;
 Wed, 19 Jan 2022 17:21:50 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C7977D3CA;
 Wed, 19 Jan 2022 17:21:39 +0000 (UTC)
Date: Wed, 19 Jan 2022 18:21:38 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
Message-ID: <YehIosxuXCqsGBSW@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
 <87zgnrubkf.fsf@dusky.pond.sub.org>
 <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4a15fbad-b177-f35c-1468-ef14f7ab1887@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.01.2022 um 14:44 hat Hanna Reitz geschrieben:
> On 19.01.22 13:58, Markus Armbruster wrote:
> > Hanna Reitz <hreitz@redhat.com> writes:
> > 
> > > We want to add a --daemonize argument to QSD's command line.
> > Why?
> 
> OK, s/we/I/.  I find it useful, because without such an option, I need to
> have whoever invokes QSD loop until the PID file exists, before I can be
> sure that all exports are set up.  I make use of it in the test cases added
> in patch 3.
> 
> I suppose this could be worked around with a special character device, like
> so:
> 
> ```
> ncat --listen -U /tmp/qsd-done.sock </dev/null &
> ncat_pid=$!
> 
> qemu-storage-daemon \
>     ... \
>     --chardev socket,id=signal_done,path=/tmp/qsd-done.sock \
>     --monitor signal_done \
>     --pidfile /tmp/qsd.pid &
> 
> wait $ncat_pid
> ```
> 
> But having to use an extra tool for this is unergonomic.  I mean, if there’s
> no other way...

The other point is that the system emulator has it, qemu-nbd has it,
so certainly qsd should have it as well. Not the least because it should
be able to replace qemu-nbd (at least for the purpose of exporting NBD.
not necessarily for attaching it to the host).

> > >                                                                This will
> > > require forking the process before we do any complex initialization
> > > steps, like setting up the block layer or QMP.  Therefore, we must scan
> > > the command line for it long before our current process_options() call.
> > Can you explain in a bit more detail why early forking is required?
> > 
> > I have a strong dislike for parsing more than once...
> 
> Because I don’t want to set up QMP and block devices, and then fork the
> process into two.  That sounds like there’d be a lot of stuff to think
> about, which just isn’t necessary, because we don’t need to set up any
> of this in the parent.

Here we can compare again: Both the system emulator and qemu-nbd behave
the same, they fork before they do anything interesting.

The difference is that they still parse the command line only once
because they don't immediately create things, but just store the options
and later process them in their own magic order. I'd much rather parse
the command line twice than copy that behaviour.

Kevin

> For example, if I set up a monitor on a Unix socket (server=true),
> processing is delayed until the client connects.  Say I put --daemonize
> afterwards.  I connect to the waiting server socket, the child is forked
> off, and then... I’m not sure what happens, actually.  Do I have a
> connection with both the parent and the child listening?  I know that in
> practice, what happens is that once the parent exits, the connection is
> closed, and I get a “qemu: qemu_thread_join: Invalid argument” warning/error
> on the QSD side.
> 
> There’s a lot of stuff to think about if you allow forking after other
> options, so it should be done first.  We could just require the user to put
> --daemonize before all other options, and so have a single pass; but still,
> before options are even parsed, we have already for example called
> bdrv_init(), init_qmp_commands(), qemu_init_main_loop().  These are all
> things that the parent of a daemonizing process doesn’t need to do, and
> where I’d simply rather not think about what impact it has if we fork
> afterwards.
> 
> Hanna
> 
> > > Instead of adding custom new code to do so, just reuse process_options()
> > > and give it a @pre_init_pass argument to distinguish the two passes.  I
> > > believe there are some other switches but --daemonize that deserve
> > > parsing in the first pass:
> > > 
> > > - --help and --version are supposed to only print some text and then
> > >    immediately exit (so any initialization we do would be for naught).
> > >    This changes behavior, because now "--blockdev inv-drv --help" will
> > >    print a help text instead of complaining about the --blockdev
> > >    argument.
> > >    Note that this is similar in behavior to other tools, though: "--help"
> > >    is generally immediately acted upon when finding it in the argument
> > >    list, potentially before other arguments (even ones before it) are
> > >    acted on.  For example, "ls /does-not-exist --help" prints a help text
> > >    and does not complain about ENOENT.
> > > 
> > > - --pidfile does not need initialization, and is already exempted from
> > >    the sequential order that process_options() claims to strictly follow
> > >    (the PID file is only created after all arguments are processed, not
> > >    at the time the --pidfile argument appears), so it makes sense to
> > >    include it in the same category as --daemonize.
> > > 
> > > - Invalid arguments should always be reported as soon as possible.  (The
> > >    same caveat with --help applies: That means that "--blockdev inv-drv
> > >    --inv-arg" will now complain about --inv-arg, not inv-drv.)
> > > 
> > > Note that we could decide to check only for --daemonize in the first
> > > pass, and defer --help, --version, and checking for invalid arguments to
> > > the second one, thus largely keeping our current behavior.  However,
> > > this would break "--help --daemonize": The child would print the help
> > > text to stdout, which is redirected to /dev/null, and so the text would
> > > disappear.  We would need to have the text be printed to stderr instead,
> > > and this would then make the parent process exit with EXIT_FAILURE,
> > > which is probably not what we want for --help.
> > > 
> > > This patch does make some references to --daemonize without having
> > > implemented it yet, but that will happen in the next patch.
> > > 
> > > Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> 


