Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FA03C2765
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:16:14 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tAj-0002XQ-9q
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1t1z-0003bd-Pw
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:07:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1t1w-00083T-NO
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625846827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ad3d/scraSmbJOI7uknp0NpI9oiuVrMJSDV0f/jFvso=;
 b=Oef9XcMAVfVq+XGJLijSRO2EPwQwtXxWOlf6chVzfFiReG+CHlv5AuMmYPi7rFI279qfKY
 LY4G7OHbIsXrjj8VDjGlsJwkLCK2SZbw7ahp9pEpN/99sLfe/k9UYA7wi65f5GpWdmv9cb
 46n4zd83xLirz6zd3XLuzbMiwhNjwQw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-653T5XPDMh29JJPVaDa0wg-1; Fri, 09 Jul 2021 12:07:05 -0400
X-MC-Unique: 653T5XPDMh29JJPVaDa0wg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p4-20020a05600c3584b0290210725ac6bcso5027619wmq.2
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 09:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ad3d/scraSmbJOI7uknp0NpI9oiuVrMJSDV0f/jFvso=;
 b=EwqozM4HXsoMOnShZlgvmHSvA/ZH9r6dNPaPD/eGjKZ3QGtgyI+DZpH3rzjbZ+sqOA
 UuttwFu7ifn1gXRl+ckgLhzn8BoCnYMTX9KsG1aVsNx3NpAf4IpEQ+CZ5yEJCxeblZ4u
 D1FcGsfEszKPBJYjNDzdrbxPhMjQFSbkwx5/qpj4+9+6aYaTGvOk/Copojg/+TTpuEG8
 9rifIvCJ2psmceYNONhG+IwHrl0qlQ7E0tMqrG3zG3go1WN6GfXYm8ySYSHbtGDVhFDV
 TUmLQL7sU4EE0o5K6dEtYD7w87I2Jqyoh+L2ene+v7Dkdf4misxthuZDk0etG/QE7HtE
 6o4w==
X-Gm-Message-State: AOAM533SWSG2j9zGHJN36m5dyPyFmM3XkhJWRvZBGlaletMtiA/MpUey
 ewMd0dn4cBa+LeqdUWAEjJp2YRPXjKhFHnaNnzeNbsqR+uOkcjoJ+xFPXrpjG7YybIJ3c1XuK1j
 WaF16Z3au/SaReho=
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr18292824wre.186.1625846824766; 
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytyZZLWk/pI8E5KpxTmSvf/xICdoCxdqp8zysSoqaAt0PkhTyV4EE5aqejzaAntXutu1zHYw==
X-Received: by 2002:adf:9cc7:: with SMTP id h7mr18292808wre.186.1625846824591; 
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x9sm516133wrm.82.2021.07.09.09.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 09:07:04 -0700 (PDT)
Subject: Re: [PATCH] util/guest-random: Fix size arg to tail memcpy
To: Mark Nelson <mdnelson8@gmail.com>, qemu-devel@nongnu.org
References: <20210709120600.11080-1-mdnelson8@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1df2d93e-5245-0ee3-1b8e-8002d944b64a@redhat.com>
Date: Fri, 9 Jul 2021 18:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709120600.11080-1-mdnelson8@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 2:06 PM, Mark Nelson wrote:
> We know that in the body of this if statement i is less than len, so
> we really should be copying len - i bytes not i - len bytes.
> 
> Fix this typo.
> 

Oops.

Fixes: 8d8404f1564 ("util: Add qemu_guest_getrandom and associated
routines")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Mark Nelson <mdnelson8@gmail.com>
> ---
>  util/guest-random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/guest-random.c b/util/guest-random.c
> index 086115bd67..23643f86cc 100644
> --- a/util/guest-random.c
> +++ b/util/guest-random.c
> @@ -38,7 +38,7 @@ static int glib_random_bytes(void *buf, size_t len)
>      }
>      if (i < len) {
>          x = g_rand_int(rand);
> -        __builtin_memcpy(buf + i, &x, i - len);
> +        __builtin_memcpy(buf + i, &x, len - i);
>      }
>      return 0;
>  }
> 


