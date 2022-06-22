Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B994555130
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 18:21:24 +0200 (CEST)
Received: from localhost ([::1]:42658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o436Z-0004Zl-4j
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 12:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o434k-00039J-KP
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1o434j-0006x8-2M
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:19:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655914768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2OHTkuK3UqYNanKu/+UkEn1opDw2+yAs/3CNqmYQZk=;
 b=JQkHKLkYYumXU1aYMabZApZABQVdhO2aoMxkr6AoyRkGumSpAu9x6vCcRlnqxOtOdzfftH
 4LHEPLHEHIhgA9NSQmHALyMKvEhHHUqV4qkT/nduGc3Rar8GsKmgeGQL9nVKs8S/9Ak/fq
 6kN3emq3vgOcT/jJHV/Xykbtasbgjf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-MtEtpO2FOiC0XXtYQWav5A-1; Wed, 22 Jun 2022 12:19:25 -0400
X-MC-Unique: MtEtpO2FOiC0XXtYQWav5A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54033185A7BA;
 Wed, 22 Jun 2022 16:19:24 +0000 (UTC)
Received: from redhat.com (unknown [10.2.18.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD33F2166B26;
 Wed, 22 Jun 2022 16:19:22 +0000 (UTC)
Date: Wed, 22 Jun 2022 11:19:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Luc Michel <lmichel@kalray.eu>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 2/7] semihosting: add the semihosting_exit_request
 function
Message-ID: <20220622161920.lq53geavwm7yiogw@redhat.com>
References: <20220621125916.25257-1-lmichel@kalray.eu>
 <20220621125916.25257-3-lmichel@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621125916.25257-3-lmichel@kalray.eu>
User-Agent: NeoMutt/20220429-125-d07217
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 21, 2022 at 02:59:11PM +0200, Luc Michel wrote:
> Add the semihosting_exit_request function to be used by targets when
> handling an `exit' semihosted syscall. This function calls gdb_exit to
> close existing GDB connections, and qemu_system_shutdown_request with
> the new `guest-semi-exit' exit reason. It sets the QEMU exit status
> given by the exit syscall parameter. Finally it stops the CPU to prevent
> further execution, and exit the CPU loop as the syscall caller expects
> this syscall to not return.
> 
> This function is meant to be used in place of a raw exit() call when
> handling semihosted `exit' syscalls. Such a call is not safe because
> it does not allow other CPU threads to exit properly, leading to e.g.
> at_exit callbacks being called while other CPUs still run. This can lead
> to strange bugs, especially in plugins with a registered at_exit function.
> 
> Signed-off-by: Luc Michel <lmichel@kalray.eu>
> ---
>  qapi/run-state.json            |  4 +++-
>  include/semihosting/semihost.h |  5 +++++
>  semihosting/config.c           | 16 ++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 6e2162d7b3..a4f08dd32e 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -80,20 +80,22 @@
>  # @guest-reset: Guest reset request, and command line turns that into
>  #               a shutdown
>  #
>  # @guest-panic: Guest panicked, and command line turns that into a shutdown
>  #
> +# @guest-semi-exit: Guest exit request via a semi-hosted exit syscall

Should include a '(since 7.1)' notation.

> +#
>  # @subsystem-reset: Partial guest reset that does not trigger QMP events and
>  #                   ignores --no-reboot. This is useful for sanitizing
>  #                   hypercalls on s390 that are used during kexec/kdump/boot
>  #
>  ##

As it is, the overall enum is missing a 'Since: 1.0' section.

>  { 'enum': 'ShutdownCause',
>    # Beware, shutdown_caused_by_guest() depends on enumeration order
>    'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
>              'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
> -            'guest-panic', 'subsystem-reset'] }
> +            'guest-panic', 'guest-semi-exit', 'subsystem-reset'] }
>  
>  ##
>  # @StatusInfo:
>  #
>  # Information about VCPU run state

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


