Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 693144016A2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 08:54:18 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN8WH-0008VP-E6
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 02:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mN8UD-0006VE-UC
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mN8U7-0001Rc-9Y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 02:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630911122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PCdnN4pAn+/xmmbriU/U+31LCKZQmkynEALqW5VYQQc=;
 b=ha8E7DQV1fezWTtpZQsk6k2eGvxUuTfwA1xbUD6iH+AULZSMCcCfChkzYUcVYOcPHZezwM
 HtaMni/Rd/Kw7gD9XIc04n9W1boVmL6KN4UXPJAMoVI36UOnuJ+aL9oGgSw+Y/8O2DNGOW
 qf+lJqXkxOiEApbxfz2QIuJSIpZMHKc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-aXJByPipP5-pBcW1G1rHAQ-1; Mon, 06 Sep 2021 02:51:59 -0400
X-MC-Unique: aXJByPipP5-pBcW1G1rHAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 jw25-20020a17090776b900b005ca775a2a00so1887463ejc.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 23:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PCdnN4pAn+/xmmbriU/U+31LCKZQmkynEALqW5VYQQc=;
 b=sftIZgxF+GQ6jZRhMzLaLmlXmMaEeL3MyyuvVHn17AEqVU22g1TF1BY0aAwCQFeW8i
 PdCXG1iCQnQlF7NDR4W0InC/4tXRgCGCwsyzaUOVI5rUslpFVDdIWZpU+eL6txfzErMT
 g3sbx7vQ5s/mMOv9YfIqkDY5qG8f1AaFaSJRlU/Zt/poXxF+s0G/9GZXpNLAzbR6r433
 2UhhpwKm1NkoIytQ9T3DZGjacBQZuL7CR+xHBtjGtCVHKCAFTRka9JEagoEvPvxpmhbr
 E1BB+t1N3AKIZb3rDk9EAM/VEU/jKJOiCoKXG4nfAp2CQkhniECAeyyRy2RbGpdbs46R
 wDbg==
X-Gm-Message-State: AOAM533wkGCwkSdaQNtyHwzpQGJdv+4u8wT+qKPmGnnT6YZgkzKu67MA
 uA1CVDYk/UXfZ3k6Af9Grpwrngzx3gATfpaaGcmXwTojlTmuKGdWZkFXkhAhQlPZ4z0ib/wO0GE
 AdbfvBvdbJXccJn0=
X-Received: by 2002:a05:6402:430f:: with SMTP id
 m15mr11910740edc.115.1630911117578; 
 Sun, 05 Sep 2021 23:51:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxryCaGrvlAJEf68e+w3n+l8L1w2e9tdGfWgMVYoNVml5JFmHClFuHLenTTHM89huxgG09qHg==
X-Received: by 2002:a05:6402:430f:: with SMTP id
 m15mr11910726edc.115.1630911117374; 
 Sun, 05 Sep 2021 23:51:57 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cz15sm471585edb.50.2021.09.05.23.51.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 23:51:56 -0700 (PDT)
Subject: Re: [PATCH] util/compatfd.c: use libc signalfd wrapper instead of raw
 syscall
To: =?UTF-8?B?S2FjcGVyIFPFgm9tacWEc2tp?= <kacper.slominski72@gmail.com>,
 qemu-devel@nongnu.org
References: <20210905011621.200785-1-kacper.slominski72@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6ccb0c26-88d0-77fa-ce9c-4b5ee02656a3@redhat.com>
Date: Mon, 6 Sep 2021 08:51:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210905011621.200785-1-kacper.slominski72@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/09/21 03:16, Kacper Słomiński wrote:
> This allows the use of native signalfd instead of the sigtimedwait
> based emulation on systems other than Linux.
> 
> Signed-off-by: Kacper Słomiński <kacper.slominski72@gmail.com>
> ---
> Apologies if I CC'd the wrong maintaineers, it's my first time
> submitting patches to QEMU. According to get_maintainers.pl this
> file has no maintainers, and the only system supported upstream
> that supports signalfd natively is Linux.
> 
> Glibc has had the signalfd wrapper since version 2.8 (2008), and
> musl has had it since at least version 0.5.0 (2011), and as such
> I think using syscall directly is not necessary here.
> 
> Found this while porting QEMU to Managarm
> (https://github.com/managarm/managarm).
> 
>   meson.build     | 7 +++----
>   util/compatfd.c | 5 ++---
>   2 files changed, 5 insertions(+), 7 deletions(-)

Queued, thanks!

Paolo

> diff --git a/meson.build b/meson.build
> index bf63784812..bcdfea5492 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1415,10 +1415,9 @@ config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
>     #include <stddef.h>
>     int main(void) { return posix_madvise(NULL, 0, POSIX_MADV_DONTNEED); }'''))
>   config_host_data.set('CONFIG_SIGNALFD', cc.links(gnu_source_prefix + '''
> -  #include <unistd.h>
> -  #include <sys/syscall.h>
> -  #include <signal.h>
> -  int main(void) { return syscall(SYS_signalfd, -1, NULL, _NSIG / 8); }'''))
> +  #include <sys/signalfd.h>
> +  #include <stddef.h>
> +  int main(void) { return signalfd(-1, NULL, SFD_CLOEXEC); }'''))
>   config_host_data.set('CONFIG_SPLICE', cc.links(gnu_source_prefix + '''
>     #include <unistd.h>
>     #include <fcntl.h>
> diff --git a/util/compatfd.c b/util/compatfd.c
> index a8ec525c6c..ab810c42a9 100644
> --- a/util/compatfd.c
> +++ b/util/compatfd.c
> @@ -17,7 +17,7 @@
>   #include "qemu/thread.h"
>   
>   #if defined(CONFIG_SIGNALFD)
> -#include <sys/syscall.h>
> +#include <sys/signalfd.h>
>   #endif
>   
>   struct sigfd_compat_info {
> @@ -96,9 +96,8 @@ int qemu_signalfd(const sigset_t *mask)
>   #if defined(CONFIG_SIGNALFD)
>       int ret;
>   
> -    ret = syscall(SYS_signalfd, -1, mask, _NSIG / 8);
> +    ret = signalfd(-1, mask, SFD_CLOEXEC);
>       if (ret != -1) {
> -        qemu_set_cloexec(ret);
>           return ret;
>       }
>   #endif
> 


