Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57FC301782
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 19:13:06 +0100 (CET)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3NPF-0007KG-Qw
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 13:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NNL-0006Wa-VT
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:11:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3NNG-00074S-VU
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 13:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611425461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=miRz2czIE57l9Vhxh/PbQ9AElAtqDG9DBEbK8HbHhAs=;
 b=W5wVmxVuniKjc785m+ImjZRAB54KDbNmLBMvXBYH2kcS9fibbSnHL1jbfPkJlmLuv4ZXfz
 ya9vB8afGA6DzFd6RIhRc/3DcHvsUCeQPdgKQ/La4bYaYypLm3AEwdtMDyE69hLhlPM09I
 TUdSD07uSZEeVKUTy6yJevhGkB28NYs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-pp92U7C_Nk29FTNygZm2hQ-1; Sat, 23 Jan 2021 13:10:59 -0500
X-MC-Unique: pp92U7C_Nk29FTNygZm2hQ-1
Received: by mail-ed1-f71.google.com with SMTP id j11so4058102edy.20
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 10:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=miRz2czIE57l9Vhxh/PbQ9AElAtqDG9DBEbK8HbHhAs=;
 b=XY3M1zQ36+u6ASasyIWp58/jW+7VXcqBWRCeypoXAUsI9A3kIUnBsm7wJLGJ43veq9
 //IHJpIlpLYVqJenxK5JfPgZmvG70UybWmVCMdfq/uz2h7X+KBxJbVr/ljV3c5kIeITi
 vE98boU/TILlcN5lRvT+AtaedtubZhn4aovf/TNLnvaAvpe/a3vIZpdvkDfrIM1DXroL
 DUlOLa+tvInLjZWnW2DEY7kpG461rS8+FmEunsrp94nuOm0UUPTKrPG/dPeByCUf6XbP
 I82tA9UJk4CjUFHOsD5xFYvATONIByXQ37PN8MfOD8g/2zptOiTvnvyP+cJ1z2uLwLXs
 43YA==
X-Gm-Message-State: AOAM531dhFFyuqv8wIK6tZ7Vlz16JjR3BXjR5HH51Nlpqc2jG2Tj+E6N
 pbRCpKJ1aiuom4Le+1S65twTF4jUJ7V5uCsvHZXe9tG86n8dFghwmyGmv5TISfu06aPyWmNbOyU
 E01KnXyAnIv7XlBo=
X-Received: by 2002:a05:6402:54d:: with SMTP id
 i13mr213724edx.12.1611425458114; 
 Sat, 23 Jan 2021 10:10:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyY+dq5AXrB+7YEdWIT+u0+GQG0Dw6EznwH9TrOkdt8T8UZyd9RfiUUNjo11VX2GtZsZ+NNDw==
X-Received: by 2002:a05:6402:54d:: with SMTP id
 i13mr213704edx.12.1611425457901; 
 Sat, 23 Jan 2021 10:10:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id cy13sm7623555edb.27.2021.01.23.10.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jan 2021 10:10:57 -0800 (PST)
Subject: Re: [PATCH v2 09/12] qapi/meson: Restrict qdev code to system-mode
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122204441.2145197-1-philmd@redhat.com>
 <20210122204441.2145197-10-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <fcb116d8-8701-90cc-fabd-85983740f74b@redhat.com>
Date: Sat, 23 Jan 2021 19:10:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122204441.2145197-10-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 21:44, Philippe Mathieu-Daudé wrote:
> Beside a CPU device, user-mode emulation doesn't access
> anything else from qdev subsystem.
> 
> Tools don't need anything from qdev.

I prefer to avoid stubs.  So if this patch can simply be dropped with no 
effects on 10-12, that's nicer for me.

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> ---
>   stubs/qdev.c      | 23 +++++++++++++++++++++++
>   MAINTAINERS       |  1 +
>   qapi/meson.build  |  6 +++++-
>   stubs/meson.build |  2 ++
>   4 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 stubs/qdev.c
> 
> diff --git a/stubs/qdev.c b/stubs/qdev.c
> new file mode 100644
> index 00000000000..92e61431344
> --- /dev/null
> +++ b/stubs/qdev.c
> @@ -0,0 +1,23 @@
> +/*
> + * QOM stubs
> + *
> + * Copyright (c) 2021 Red Hat, Inc.
> + *
> + * Author:
> + *   Philippe Mathieu-Daudé <philmd@redhat.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/qapi-events-qdev.h"
> +
> +void qapi_event_send_device_deleted(bool has_device,
> +                                    const char *device,
> +                                    const char *path)
> +{
> +    /* Nothing to do. */
> +}
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34359a99b8e..d2dd7c24228 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2523,6 +2523,7 @@ F: qapi/qom.json
>   F: qapi/qdev.json
>   F: scripts/coccinelle/qom-parent-type.cocci
>   F: softmmu/qdev-monitor.c
> +F: stubs/qdev.c
>   F: qom/
>   F: tests/check-qom-interface.c
>   F: tests/check-qom-proplist.c
> diff --git a/qapi/meson.build b/qapi/meson.build
> index ab68e7900e4..2839871b478 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -35,7 +35,6 @@
>     'misc-target',
>     'net',
>     'pragma',
> -  'qdev',
>     'pci',
>     'qom',
>     'rdma',
> @@ -49,6 +48,11 @@
>     'ui',
>     'yank',
>   ]
> +if have_system
> +  qapi_all_modules += [
> +    'qdev',
> +  ]
> +endif
>   
>   qapi_storage_daemon_modules = [
>     'block-core',
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 1a656cd0704..a054d5877fb 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -53,4 +53,6 @@
>   if have_system
>     stub_ss.add(files('semihost.c'))
>     stub_ss.add(files('xen-hw-stub.c'))
> +else
> +  stub_ss.add(files('qdev.c'))
>   endif
> 


