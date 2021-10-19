Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3038A433355
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 12:15:03 +0200 (CEST)
Received: from localhost ([::1]:50134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcm98-0004Xr-9Z
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 06:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcm5Z-0000AE-2G
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:11:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mcm5V-0005WR-LN
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 06:11:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634638276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8rEWupvE8pI4m0oBMs3RwwifTeC+lmVomXGWVoB6yo=;
 b=D4K7MnpJBCv+fj3+Rsky6ULDz9k5nxJDBE4JXQLxYb+iNBcvlIsN2SxgTc8FbJC05iXFgY
 26IlMBuiggl+t8eW9k6lZ2U47YTJNvONqoffLHoSQ2/+4yCl2JeKfYJtjD396n08FZhOBL
 HBeImiceHKJKmZg8dzMOo4MiKWrb1vY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-6-EiykOTO-e5ZKqYtVPZhQ-1; Tue, 19 Oct 2021 06:11:14 -0400
X-MC-Unique: 6-EiykOTO-e5ZKqYtVPZhQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 p20-20020a50cd94000000b003db23619472so17162281edi.19
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 03:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D8rEWupvE8pI4m0oBMs3RwwifTeC+lmVomXGWVoB6yo=;
 b=GMHLF4DEWe7X/yizZk1ApRGHAtgTN4M9Ut0m+A8I/p8iAR402RCYJSpg8MzrYJuxco
 jB+Gyo5xZu5dmgSTdkwKgQaIdhC0qd7Zv4ewELtx+tAavJRTOlbEf90fSyQ6o4hmFx4s
 Q6Aee5q3U09H2IK1Xw52IbEx+e/CEM/0BZWpyLtkvU+DC1+SXStHKBsOJx8ZMSfDtr8v
 EZv5MwTvCwO8jxWEhN9VyMTbQxMiwO9FWbfsoYxHkvh1NxyN1wHG9LJ4B0D9RlbnhZUi
 WTJWtIi3EExmyCQpjiEXOnK5OzNXU7218Q6Ob38VMdb+08R5/sZZH8SHJ+BqdOUyc9HY
 yR5g==
X-Gm-Message-State: AOAM533Xfm0Ha1iFIf6RrG6nEac5MecbIBGwcZKrFXp/BAh5rC05XjlK
 csVSHtXq2HKheZ7jMTaVckEK3OSSgJJSUw17KeGs9MnL/kHYw2N/OomphppqEJJDG/0zNpbnBz8
 njKZ778EM2Wel0kA=
X-Received: by 2002:a17:906:f259:: with SMTP id
 gy25mr36593446ejb.210.1634638273481; 
 Tue, 19 Oct 2021 03:11:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZjfMellvFz2O0vaiGNEEdkFgdz7jcs3WRTlmdNOPrfGJ5EODBJEQXax9nZ+Fd6qiCyKb3Rw==
X-Received: by 2002:a17:906:f259:: with SMTP id
 gy25mr36593424ejb.210.1634638273253; 
 Tue, 19 Oct 2021 03:11:13 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8e02:b072:96b1:56d0?
 ([2001:b07:6468:f312:8e02:b072:96b1:56d0])
 by smtp.gmail.com with ESMTPSA id rk9sm9871703ejb.31.2021.10.19.03.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 03:11:12 -0700 (PDT)
Message-ID: <47933dd7-4318-b5bf-cb6c-c2360349139d@redhat.com>
Date: Tue, 19 Oct 2021 12:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] chardev: don't exit() straight away on C-a x
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211019092901.1519570-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211019092901.1519570-1-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.junger@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/21 11:29, Alex Bennée wrote:
> While there are a number of uses in the code-base of the exit(0)
> pattern it gets in the way of clean exit which can do all of it's
> house-keeping. In particular it was reported that you can crash
> plugins this way because TCG can still be running on other threads
> when the atexit callback is called.
> 
> Use qmp_quit() instead which takes care of some housekeeping before
> triggering the shutdown.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Lukas Jünger <lukas.junger@greensocs.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Message-Id: <20211018140226.838137-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - use qmp_quit instead of direct qemu_system_shutdown_request
>    - g_assert_not_reached() for the stub definition

Either g_assert_not_reached() or exit(0) should be okay, so

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks,

Paolo

> ---
>   chardev/char-mux.c | 3 ++-
>   stubs/qmp-quit.c   | 8 ++++++++
>   stubs/meson.build  | 1 +
>   3 files changed, 11 insertions(+), 1 deletion(-)
>   create mode 100644 stubs/qmp-quit.c
> 
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index ada0c6866f..ee2d47b20d 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -28,6 +28,7 @@
>   #include "qemu/option.h"
>   #include "chardev/char.h"
>   #include "sysemu/block-backend.h"
> +#include "qapi/qapi-commands-control.h"
>   #include "chardev-internal.h"
>   
>   /* MUX driver for serial I/O splitting */
> @@ -157,7 +158,7 @@ static int mux_proc_byte(Chardev *chr, MuxChardev *d, int ch)
>               {
>                    const char *term =  "QEMU: Terminated\n\r";
>                    qemu_chr_write_all(chr, (uint8_t *)term, strlen(term));
> -                 exit(0);
> +                 qmp_quit(NULL);
>                    break;
>               }
>           case 's':
> diff --git a/stubs/qmp-quit.c b/stubs/qmp-quit.c
> new file mode 100644
> index 0000000000..a3ff47f7bd
> --- /dev/null
> +++ b/stubs/qmp-quit.c
> @@ -0,0 +1,8 @@
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-commands-control.h"
> +#include "qapi/qmp/dispatch.h"
> +
> +void qmp_quit(Error **errp)
> +{
> +    g_assert_not_reached();
> +}
> diff --git a/stubs/meson.build b/stubs/meson.build
> index f6aa3aa94f..71469c1d50 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -31,6 +31,7 @@ stub_ss.add(files('pci-bus.c'))
>   stub_ss.add(files('qemu-timer-notify-cb.c'))
>   stub_ss.add(files('qmp_memory_device.c'))
>   stub_ss.add(files('qmp-command-available.c'))
> +stub_ss.add(files('qmp-quit.c'))
>   stub_ss.add(files('qtest.c'))
>   stub_ss.add(files('ram-block.c'))
>   stub_ss.add(files('ramfb.c'))
> 


