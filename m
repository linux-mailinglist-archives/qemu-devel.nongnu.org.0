Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01824936F
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 05:33:44 +0200 (CEST)
Received: from localhost ([::1]:50864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Er9-000881-Rj
	for lists+qemu-devel@lfdr.de; Tue, 18 Aug 2020 23:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8EqN-0007hX-N9
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 23:32:55 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51349
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k8EqI-0006s6-9X
 for qemu-devel@nongnu.org; Tue, 18 Aug 2020 23:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597807969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ZiGisiywky/pJZpb7hS6jtmM7XEZMFHD3P6d3blZWIU=;
 b=gUTWjj3U18E0PU4RzUrNc3ZRLhimZYACqWLdyOE/dcHWoponh5KqnSVq6s2AXkWuZAyy9q
 553/HhI+ctqo3IyIfZG0eCd71oo06HCzFPSz0o0SLRORUbQd6OVEFGqVCwruenoW/IzpZo
 svbPwWZi02ki+x8pZkYh2WUNNtEaPNE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-rs4J6AeDN8eIEBUSZhXPoA-1; Tue, 18 Aug 2020 23:32:46 -0400
X-MC-Unique: rs4J6AeDN8eIEBUSZhXPoA-1
Received: by mail-wr1-f70.google.com with SMTP id o10so8880368wrs.21
 for <qemu-devel@nongnu.org>; Tue, 18 Aug 2020 20:32:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZiGisiywky/pJZpb7hS6jtmM7XEZMFHD3P6d3blZWIU=;
 b=bFD32pWooyXCz9fXxD86VQYSNEXbvroSXjRAya8h6ntS0Hf0LOAvpaRCdE1R7cdmOu
 So1GvSBDhirM8ZhrQWi/6T4w91kUaILiYGDcblwZF5URAsISkJuXhOAJc7qiU4iB1t2x
 eQOrPmbEZFwl5aiEONdtmJvKUiTHQY2qHePDE9JMe/N65O88b/5Q+zcJQadd8zeUX44e
 LdpM3S4mHGhUDKmNL52W/GVY+tK280NAEv8DqK3u6qiCz7qgXN9j6Sy9GfPPl7WTf4K+
 HCUTZfaFgu7uKZ5AU5GXqLFmzBIwXjN6RXNEhHzMtGFSVk3j/CKrT3dsdpO+R4k7Vcuk
 dDDQ==
X-Gm-Message-State: AOAM5318aDwXp4eUWFXiVPWvGf4NIhH8krR5a/DamWYm1PXaPlzm2oFX
 pIGdlLdjbGJV70++q1kkNVuD4B47f+RohfX3jB4VA3UON3viXZaw4hgbhQXEqWpwmjCMtGEWY7V
 X/9IYA6qJXr6Mu/k=
X-Received: by 2002:adf:ea85:: with SMTP id s5mr2129485wrm.55.1597807964941;
 Tue, 18 Aug 2020 20:32:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV+SsKhe/mthUwsLnf5rD7lmiiPUxOQ4ACrUQ38UsFCk26s6u7SDoRSh8A73zmdXsNhX3E9A==
X-Received: by 2002:adf:ea85:: with SMTP id s5mr2129468wrm.55.1597807964635;
 Tue, 18 Aug 2020 20:32:44 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id q19sm38925085wrf.48.2020.08.18.20.32.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2020 20:32:43 -0700 (PDT)
Subject: Re: [PATCH v3 1/1] audio/jack: fix use after free segfault
To: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org
References: <20200819011835.92737-1-geoff@hostfission.com>
 <20200819011835.92737-2-geoff@hostfission.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <34c4c83a-c870-0d21-1a15-3da76b4e5488@redhat.com>
Date: Wed, 19 Aug 2020 05:32:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200819011835.92737-2-geoff@hostfission.com>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/18 22:38:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Geoffrey,

On 8/19/20 3:18 AM, Geoffrey McRae wrote:
> The client may have been freed already by a secondary audio device
> recovering its session as JACK2 has some cleanup code to work around
> broken clients, which doesn't account for well behaved clients.
> 
> https://github.com/jackaudio/jack2/issues/627
> 
> As JACK1 and JACK2 are interchangeable and JACK2 has "cleanup" routine
> that JACK1 does not have, we need to determine which version is in use
> at runtime. Unfortunatly there is no way to determine which is in use
> other then to look for symbols that are missing in JACK1, which in this
> case is `jack_get_version`.
> 
> An issue has been raised over this, but to be compatible with older
> versions we must use this method to determine which library is in use.
> If at some time the jack developers implement `jack_get_version` in
> JACK1, this code will need to be revisited.
> 
> At worst the workaround will be enabled and this will introduce a small
> memory leak if the jack server is restarted. This however is better then
> the alternative which would be a use after free segfault.
> 
> Signed-off-by: Geoffrey McRae <geoff@hostfission.com>
> ---
>  audio/jackaudio.c | 37 ++++++++++++++++++++++++++++++++++++-
>  configure         |  4 +++-
>  2 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
> index 72ed7c4929..d1685999c3 100644
> --- a/audio/jackaudio.c
> +++ b/audio/jackaudio.c
> @@ -31,6 +31,7 @@
>  #define AUDIO_CAP "jack"
>  #include "audio_int.h"
>  
> +#include <dlfcn.h>
>  #include <jack/jack.h>
>  #include <jack/thread.h>
>  
> @@ -84,6 +85,7 @@ typedef struct QJackIn {
>  }
>  QJackIn;
>  
> +static int QJackWorkaroundCloseBug;
>  static int qjack_client_init(QJackClient *c);
>  static void qjack_client_connect_ports(QJackClient *c);
>  static void qjack_client_fini(QJackClient *c);
> @@ -563,7 +565,10 @@ static void qjack_client_fini(QJackClient *c)
>          /* fallthrough */
>  
>      case QJACK_STATE_SHUTDOWN:
> -        jack_client_close(c->client);
> +        if (!QJackWorkaroundCloseBug) {
> +            jack_client_close(c->client);
> +        }
> +        c->client = NULL;
>          /* fallthrough */
>  
>      case QJACK_STATE_DISCONNECTED:
> @@ -662,6 +667,36 @@ static void qjack_info(const char *msg)
>  
>  static void register_audio_jack(void)
>  {
> +    void *handle;
> +
> +    /*
> +     * As JACK1 and JACK2 are interchangeable and JACK2 has "cleanup" routine
> +     * that JACK1 does not have, we need to determine which version is in use at
> +     * runtime. Unfortunatly there is no way to determine which is in use other
> +     * then to look for symbols that are missing in JACK1, which in this case is
> +     * `jack_get_version`. An issue has been raised over this, but to be
> +     * compatible with older versions we must use this method to determine which
> +     * library is in use. If at some time the jack developers implement
> +     * `jack_get_version` in JACK1, this code will need to be revisited.
> +     *
> +     * At worst the workaround will be enabled and we will introduce a small
> +     * memory leak if the jack server is restarted. This is better then the
> +     * alternative which would be a use after free segfault.
> +     */
> +
> +    handle = dlopen("libjack.so", RTLD_LAZY | RTLD_NOLOAD);
> +    if (!handle) {
> +        dolog("unable to open libjack.so to determine version\n");
> +        dolog("assuming JACK2 and enabling the close bug workaround\n");
> +        QJackWorkaroundCloseBug = 1;
> +    } else {
> +        if (dlsym(handle, "jack_get_version")) {
> +            dolog("JACK2 detected, enabling close bug workaround\n");
> +            QJackWorkaroundCloseBug = 1;
> +        }
> +        dlclose(handle);
> +    }
> +
>      audio_driver_register(&jack_driver);
>      jack_set_thread_creator(qjack_thread_creator);
>      jack_set_error_function(qjack_error);
> diff --git a/configure b/configure
> index 2acc4d1465..43d2893fbb 100755
> --- a/configure
> +++ b/configure
> @@ -3754,7 +3754,8 @@ for drv in $audio_drv_list; do
>  
>      jack | try-jack)
>      if $pkg_config jack --exists; then
> -        jack_libs=$($pkg_config jack --libs)
> +        # dl is needed to check at runtime if jack1 or jack2 is in use
> +        jack_libs="$($pkg_config jack --libs) -ldl"
>          if test "$drv" = "try-jack"; then
>              audio_drv_list=$(echo "$audio_drv_list" | sed -e 's/try-jack/jack/')
>          fi

Why not checking jack_get_version() using compile_prog here?

Thanks,

Phil.


