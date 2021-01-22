Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EE30064B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:57:23 +0100 (CET)
Received: from localhost ([::1]:60920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xsI-0005dG-7J
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:57:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2xr7-0004nB-Pj
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:56:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l2xr1-0001iK-Lu
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611327361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jU8Yk3Uohzmi5bWsCsK/pW9Rsg8007eTKL8Aw5rse0=;
 b=VdIR6GlfkJrZTeK0H/9UaAGf+KOtXisS7h1SLD970v5A/H1IfvmPWYnrGLbTQj99x2hlqW
 KKbB2lhdEcukJ5qyFVsXCMAQS6errbvtpIz5Ru+HPoMtq/ing00pHE7xAOlvYQBQQxXNOq
 Kv/f/xscgPofOtr4B82tmgoRxOrAWsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-fj8kBHECMCe5-zEOVzWcKA-1; Fri, 22 Jan 2021 09:55:59 -0500
X-MC-Unique: fj8kBHECMCe5-zEOVzWcKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C90107ACE4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:55:58 +0000 (UTC)
Received: from [10.3.113.116] (ovpn-113-116.phx2.redhat.com [10.3.113.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E611360BF3;
 Fri, 22 Jan 2021 14:55:54 +0000 (UTC)
Subject: Re: [PATCH] coroutine-sigaltstack: Keep SIGUSR2 handler up
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210122102041.27031-1-mreitz@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <8480a6bf-f228-30c8-0083-d35f4dbe732b@redhat.com>
Date: Fri, 22 Jan 2021 08:55:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122102041.27031-1-mreitz@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 4:20 AM, Max Reitz wrote:
> Modifying signal handlers is a process-global operation.  When two
> threads run coroutine-sigaltstack's qemu_coroutine_new() concurrently,
> they may interfere with each other: One of them may revert the SIGUSR2
> handler back to the default between the other thread setting up
> coroutine_trampoline() as the handler and raising SIGUSR2.  That SIGUSR2
> will then lead to the process exiting.
> 
> Outside of coroutine-sigaltstack, qemu does not use SIGUSR2.  We can
> thus keep the signal handler installed all the time.
> CoroutineThreadState.tr_handler tells coroutine_trampoline() whether its
> stack is set up so a new coroutine is to be launched (i.e., it should
> invoke sigsetjmp()), or not (i.e., the signal came from an external
> source and we should just perform the default action, which is to exit
> the process).

Not just exit the process, but exit due to a signal.  It matters...

> 
> Note that in user-mode emulation, the guest can register signal handlers
> for any signal but SIGSEGV and SIGBUS, so if it registers a SIGUSR2
> handler, sigaltstack coroutines will break from then on.  However, we do
> not use coroutines for user-mode emulation, so that is fine.
> 
> Suggested-by: Laszlo Ersek <lersek@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>  util/coroutine-sigaltstack.c | 56 +++++++++++++++++++-----------------
>  1 file changed, 29 insertions(+), 27 deletions(-)
> 

> @@ -121,7 +138,17 @@ static void coroutine_trampoline(int signal)
>      /* Get the thread specific information */
>      coTS = coroutine_get_thread_state();
>      self = coTS->tr_handler;
> +
> +    if (!self) {
> +        /*
> +         * This SIGUSR2 came from an external source, not from
> +         * qemu_coroutine_new(), so perform the default action.
> +         */
> +        exit(0);
> +    }

...here. Silently exiting with status 0 is wrong; the correct response
is to use signal(SIGUSR2, SIG_DFL); raise(SIGUSR2) to terminate the
process in the same manner as if we had not installed our hander at all.

With that fixed,

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


