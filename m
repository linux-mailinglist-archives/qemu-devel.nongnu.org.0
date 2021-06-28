Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECA33B69F3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 22:58:16 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxyKd-0001kv-04
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 16:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyJA-00010t-0D
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:56:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lxyJ5-0001Id-Ky
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 16:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624913797;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lArCdhD+h3Uy7BBKsPdqbRgM3W+iRrwvkGnGxaza840=;
 b=iJ0UhT3GPmQ9tLoLSAArzwv7RS/snpCt4RiMhD5es+g4mIfX730k2b1dSPSV1qOPUfRgPa
 PS8XB+PHf6Lm67mahmm684MvcV2SJCZlQaS7Qw6tQ5cHC+9vj9POLK3PjMGOWmv4MFDgHr
 unUIufCU8AZ2LW2aTWmrmlmPMNVklrU=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-GqbDIwnTMSK_kDKEvlboyg-1; Mon, 28 Jun 2021 16:56:32 -0400
X-MC-Unique: GqbDIwnTMSK_kDKEvlboyg-1
Received: by mail-pj1-f72.google.com with SMTP id
 c10-20020a17090a558ab029017019f7ec8fso8292461pji.8
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 13:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lArCdhD+h3Uy7BBKsPdqbRgM3W+iRrwvkGnGxaza840=;
 b=ox5tFPqxrABVCcSQPhRxCNlLJXLIExvzjB7RAQOF5rp6RfwzFYjKmrKaOC3QOMYoC2
 Done8FBFO7NNpEhBVsa34gFKy1wpN0DWPlDDR1CDu0ns8/V/lk+XQi46yRtPTnf3qu6K
 ZqRAKcgRpuN25t+Z7zxlnEANeECkmFNCIklEzC0SpAl5gcTF6JacwgponvK20YHN340L
 vhTsstDhruLXYUtZkzC8o3QK+a92+CY8PACxqTxD9nEf31V6Hs5RTAxYkItrtDD3t3gF
 IA+CrRDw82Jl65jyGm2cG3sLMagIBdk7CdlKLcgQisIVxhe78t2T6bQn9uxPXJzcigTM
 lpdA==
X-Gm-Message-State: AOAM532FG9LurJ55Zxes4RpfJRg3HCv3qqxV65sw8nojtrFeIorYCLua
 kXZTEBPJs9wAXlYKqtxqUIjyGUngilWvKL9STxYasIKh6w9KJ8FltvY3vHBsqkJN+OCzuqcQi3G
 qPiWlEOhHl3611lU=
X-Received: by 2002:a17:902:c412:b029:127:958e:79c3 with SMTP id
 k18-20020a170902c412b0290127958e79c3mr23902378plk.27.1624913791377; 
 Mon, 28 Jun 2021 13:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhFoVyP6HZ9VfRWhQIChKATYP3AwbPYwqjxIGF+JskcCZqNOAbNk/oYjw0JlOBLLKTfK/xGg==
X-Received: by 2002:a17:902:c412:b029:127:958e:79c3 with SMTP id
 k18-20020a170902c412b0290127958e79c3mr23902348plk.27.1624913791093; 
 Mon, 28 Jun 2021 13:56:31 -0700 (PDT)
Received: from wainer-laptop.localdomain ([179.105.223.44])
 by smtp.gmail.com with ESMTPSA id w123sm15064373pfb.109.2021.06.28.13.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 13:56:30 -0700 (PDT)
Subject: Re: [PATCH 05/11] python: Add no-install usage instructions
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-6-jsnow@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <afdd7d63-abd3-091c-6048-340b79a91cbf@redhat.com>
Date: Mon, 28 Jun 2021 17:56:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625154540.783306-6-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Reply-To: wainersm@redhat.com
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/25/21 12:45 PM, John Snow wrote:
> It's not encouraged, but it's legitimate to want to know how to do.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   python/README.rst | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/python/README.rst b/python/README.rst
> index 107786ffdc..d4502fdb60 100644
> --- a/python/README.rst
> +++ b/python/README.rst
> @@ -37,6 +37,34 @@ See `Installing packages using pip and virtual environments
>   for more information.
>   
>   
> +Using these packages without installing them
> +--------------------------------------------
> +
> +These packages may be used without installing them first, by using one
> +of two tricks:
> +
> +1. Set your PYTHONPATH environment variable to include this source
> +   directory, e.g. ``~/src/qemu/python``. See
> +   https://docs.python.org/3/using/cmdline.html#envvar-PYTHONPATH
> +
> +2. Inside a Python script, use ``sys.path`` to forcibly include a search
> +   path prior to importing the ``qemu`` namespace. See
> +   https://docs.python.org/3/library/sys.html#sys.path
> +
> +A strong downside to both approaches is that they generally interfere
> +with static analysis tools being able to locate and analyze the code
> +being imported.
> +
> +Package installation also normally provides executable console scripts,
> +so that tools like ``qmp-shell`` are always available via $PATH. To
> +invoke them without installation, you can invoke e.g.:
> +
> +``> PYTHONPATH=~/src/qemu/python python3 -m qemu.qmp.qmp_shell``
> +
> +The mappings between console script name and python module path can be
> +found in ``setup.cfg``.
> +
> +
>   Files in this directory
>   -----------------------
>   


