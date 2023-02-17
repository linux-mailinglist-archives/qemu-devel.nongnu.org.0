Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE6F69A405
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Feb 2023 03:49:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSqo2-0007Ej-T3; Thu, 16 Feb 2023 21:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pSqo1-0007Ea-SC
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 21:49:01 -0500
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1pSqo0-0002Rj-2B
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 21:49:01 -0500
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4PHx8Z0TyXz8PbP;
 Thu, 16 Feb 2023 21:48:46 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=4l1W8wi+A
 bhooZvxvmaKbCg5IN4=; b=qADaoTkjRHYStOnjfe5hVdtSGxPHKwCmO9aXh+Emi
 ZhAWohSzetwmS5JdfuBsuR+oMNysJVzrDJNqntVrTPBKYTvuUxlatD4o03lEFiRc
 rpeEwrWGrTa5nLD8B1r0/ZlRn16yZAzejiEWalMzFJHxcj1+oAvFwSj5bSbM+2Br
 ZU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:from:to:cc:references:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=eka
 2kQEqsEz+yvu9GODPLRNwn8OAKLrSKCH4WyV0S+ipcq04aBvj1bj6JQI8JVb+qlR
 6Yp6atTllNXqCJU6xAgfrA8tOaD9e51iobugunto5avMZeHtaYWkK0T9VNiXBUkU
 /62Cswn8xvMISCOr7pH5ch18p5rzAOmyLCDGOFWs=
Received: from [IPV6:2001:470:b050:6:cc31:46d5:f26a:a82b] (unknown
 [IPv6:2001:470:b050:6:cc31:46d5:f26a:a82b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4PHx8Y4tYcz8PbN;
 Thu, 16 Feb 2023 21:48:45 -0500 (EST)
Message-ID: <0bcd2493-4be4-6295-a193-2fc7b7180a19@comstyle.com>
Date: Thu, 16 Feb 2023 21:48:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] thread-posix: add support for setting threads name on
 OpenBSD
From: Brad Smith <brad@comstyle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
References: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
Content-Language: en-US
In-Reply-To: <Y57NrCmPTVSXLWC4@humpty.home.comstyle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

ping.

On 2022-12-18 3:22 a.m., Brad Smith wrote:
> Make use of pthread_set_name_np() to be able to set the threads name
> on OpenBSD.
>
> Signed-off-by: Brad Smith <brad@comstyle.com>
> ---
>   meson.build              | 12 ++++++++++++
>   util/qemu-thread-posix.c |  9 ++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 5c6b5a1c75..68adcb6291 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2123,6 +2123,18 @@ config_host_data.set('CONFIG_PTHREAD_SETNAME_NP_WO_TID', cc.links(gnu_source_pre
>       pthread_create(&thread, 0, f, 0);
>       return 0;
>     }''', dependencies: threads))
> +config_host_data.set('CONFIG_PTHREAD_SET_NAME_NP', cc.links(gnu_source_prefix + '''
> +  #include <pthread.h>
> +  #include <pthread_np.h>
> +
> +  static void *f(void *p) { return NULL; }
> +  int main(void)
> +  {
> +    pthread_t thread;
> +    pthread_create(&thread, 0, f, 0);
> +    pthread_set_name_np(thread, "QEMU");
> +    return 0;
> +  }''', dependencies: threads))
>   config_host_data.set('CONFIG_PTHREAD_CONDATTR_SETCLOCK', cc.links(gnu_source_prefix + '''
>     #include <pthread.h>
>     #include <time.h>
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index bae938c670..412caa45ef 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -18,6 +18,10 @@
>   #include "qemu/tsan.h"
>   #include "qemu/bitmap.h"
>   
> +#ifdef CONFIG_PTHREAD_SET_NAME_NP
> +#include <pthread_np.h>
> +#endif
> +
>   static bool name_threads;
>   
>   void qemu_thread_naming(bool enable)
> @@ -25,7 +29,8 @@ void qemu_thread_naming(bool enable)
>       name_threads = enable;
>   
>   #if !defined CONFIG_PTHREAD_SETNAME_NP_W_TID && \
> -    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID
> +    !defined CONFIG_PTHREAD_SETNAME_NP_WO_TID && \
> +    !defined CONFIG_PTHREAD_SET_NAME_NP
>       /* This is a debugging option, not fatal */
>       if (enable) {
>           fprintf(stderr, "qemu: thread naming not supported on this host\n");
> @@ -480,6 +485,8 @@ static void *qemu_thread_start(void *args)
>           pthread_setname_np(pthread_self(), qemu_thread_args->name);
>   # elif defined(CONFIG_PTHREAD_SETNAME_NP_WO_TID)
>           pthread_setname_np(qemu_thread_args->name);
> +# elif defined(CONFIG_PTHREAD_SET_NAME_NP)
> +        pthread_set_name_np(pthread_self(), qemu_thread_args->name);
>   # endif
>       }
>       QEMU_TSAN_ANNOTATE_THREAD_NAME(qemu_thread_args->name);

