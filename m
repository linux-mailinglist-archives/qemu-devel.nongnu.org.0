Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 496FC493B7D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 14:55:37 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nABR1-0004aF-SU
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 08:55:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAAY1-00088p-MO
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:58:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nAAXw-0001Fi-PD
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 07:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642597117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tUI7+qPhqQyNxqavdKZ17Zbe+d8gxY/blZDChfbjuaw=;
 b=MP1jLstOES+SWMnYnseH4VDYNYb5zsBrWlHTc6AL8QBmktsfDyDhhOXa2lbIzo4Sb4Mw7r
 uIzkr1nGvoJUrDW9/N+5eB2AIxvl8LX4vsjlwjF2rbA2mqiYSGScV1tMs/9m9VIci23fKT
 3m+TU7lTDTzwXsWEVFSKIukVL5Nd7o8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-KUHOJ8GwPkWHoGMUOMDhRA-1; Wed, 19 Jan 2022 07:58:34 -0500
X-MC-Unique: KUHOJ8GwPkWHoGMUOMDhRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12EFC100C663;
 Wed, 19 Jan 2022 12:58:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-16.ams2.redhat.com
 [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF0D52378E;
 Wed, 19 Jan 2022 12:58:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68AE9113865F; Wed, 19 Jan 2022 13:58:24 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/3] qsd: Add pre-init argument parsing pass
References: <20211222114153.67721-1-hreitz@redhat.com>
 <20211222114153.67721-2-hreitz@redhat.com>
Date: Wed, 19 Jan 2022 13:58:24 +0100
In-Reply-To: <20211222114153.67721-2-hreitz@redhat.com> (Hanna Reitz's message
 of "Wed, 22 Dec 2021 12:41:51 +0100")
Message-ID: <87zgnrubkf.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hanna Reitz <hreitz@redhat.com> writes:

> We want to add a --daemonize argument to QSD's command line.

Why?

>                                                               This will
> require forking the process before we do any complex initialization
> steps, like setting up the block layer or QMP.  Therefore, we must scan
> the command line for it long before our current process_options() call.

Can you explain in a bit more detail why early forking is required?

I have a strong dislike for parsing more than once...

> Instead of adding custom new code to do so, just reuse process_options()
> and give it a @pre_init_pass argument to distinguish the two passes.  I
> believe there are some other switches but --daemonize that deserve
> parsing in the first pass:
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
> Note that we could decide to check only for --daemonize in the first
> pass, and defer --help, --version, and checking for invalid arguments to
> the second one, thus largely keeping our current behavior.  However,
> this would break "--help --daemonize": The child would print the help
> text to stdout, which is redirected to /dev/null, and so the text would
> disappear.  We would need to have the text be printed to stderr instead,
> and this would then make the parent process exit with EXIT_FAILURE,
> which is probably not what we want for --help.
>
> This patch does make some references to --daemonize without having
> implemented it yet, but that will happen in the next patch.
>
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>


