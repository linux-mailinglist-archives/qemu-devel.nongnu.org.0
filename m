Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FFC4089FE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 13:18:50 +0200 (CEST)
Received: from localhost ([::1]:36416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPjz6-0003rA-V5
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 07:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjxC-0002zW-11
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:16:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPjxA-0001hM-7d
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631531806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kks+MazJLg2WMdTX9a2vfNRqiXVlxt4GMy4aYqp3k14=;
 b=fUn31EN/mI0BuQQhxIBeYs3R/BHcG4rxKdd7kiydcSH3c5zv7GbMBvsjd3W9ciCGRHRsFS
 1gpld2fRx1GwdIx+WB6nP18QbmhLCLWMMD6hlnkYlrBb5YDq1rU3uw38a14xl2bmaxkoz9
 yXX+MKjjY8w9scuCh/9AEB4SoOiXZcg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-bytfxj7MOv64Ju-R7urZ6g-1; Mon, 13 Sep 2021 07:16:43 -0400
X-MC-Unique: bytfxj7MOv64Ju-R7urZ6g-1
Received: by mail-wm1-f72.google.com with SMTP id
 g18-20020a1c4e12000000b002fa970d2d8dso1580291wmh.0
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Kks+MazJLg2WMdTX9a2vfNRqiXVlxt4GMy4aYqp3k14=;
 b=XEHe74pzw72tvV8j4P32jV2ZtdAh7wNQJeAQEelrlOp1HRgzHt1pLx9hIfvZ7yJS3Z
 oB5tGSFmDpw5+3+HP1buy54wdCR1uFIbM4zvnTV4G/VchXqe6prie+Fflnl6epLpzA/c
 Pmsh1nY0K86LfTKxtaeGSAeNY6OyT1FwakK4Jc/9J5qMHhDt83nPIVBUkTAwpHqNidlF
 rIIjGJ5TodSAeGoZe6f8zugbF6qwTEA7L9ykvxb4Dzxa+W1eSoD6VyO9hHpzTGIvWmXX
 i1amz1kijcyc31/RymYWMJAL/OT9PF6Vmo8U4qcpfsJGXg12rwvT6DN8f3tasSV5v0UW
 5JXw==
X-Gm-Message-State: AOAM532Ss4ph40D0iHVt7kNG7XW7ZwytzXSdcubSn86wthxzgOk5PYBN
 nslRh/SGdnRr+zijkpTnZ+GwQru9w6uduMEt/pkDb8Wui3Eo6oXQpf1undZnKgdJujBKlhelPq1
 AAcD8OZadERB9nzE=
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr4527078wrw.122.1631531802006; 
 Mon, 13 Sep 2021 04:16:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5UQ7037nLe71hd5Eodb3kFtCkIgu8G4PSK+9RawRq+Lozr8r/tSGFX4aXTQpP8q6AeD4SZw==
X-Received: by 2002:a5d:67c8:: with SMTP id n8mr4527060wrw.122.1631531801795; 
 Mon, 13 Sep 2021 04:16:41 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id l13sm6999909wrb.11.2021.09.13.04.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 04:16:41 -0700 (PDT)
Subject: Re: [PATCH v2 04/17] iotests.py: rewrite default luks support in
 qemu_img
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210720113832.586428-1-vsementsov@virtuozzo.com>
 <20210720113832.586428-5-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <a93ab286-5785-f05f-2059-4cac783d6cf0@redhat.com>
Date: Mon, 13 Sep 2021 13:16:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720113832.586428-5-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.07.21 13:38, Vladimir Sementsov-Ogievskiy wrote:
> Move the logic to more generic qemu_img_pipe_and_status(). Also behave
> better when we have several -o options. And reuse argument parser of
> course.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/iotests.py | 36 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 19 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index def6ae2475..484f616270 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -128,9 +128,13 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>       args = args[1:]
>   
>       p = argparse.ArgumentParser(allow_abbrev=False)
> +    # -o option may be specified several times
> +    p.add_argument('-o', action='append', default=[])
>       p.add_argument('-f')
>       parsed, remaining = p.parse_known_args(args)
>   
> +    opts_list = parsed.o
> +
>       result = ['create']
>       if parsed.f is not None:
>           result += ['-f', parsed.f]
> @@ -139,8 +143,18 @@ def qemu_img_create_prepare_args(args: List[str]) -> List[str]:
>       # like extended_l2 or compression_type for qcow2. Test may want to create
>       # additional images in other formats that doesn't support these options.
>       # So, use IMGOPTS only for images created in imgfmt format.
> -    if parsed.f == imgfmt and 'IMGOPTS' in os.environ:
> -        result += ['-o', os.environ['IMGOPTS']]
> +    imgopts = os.environ.get('IMGOPTS')
> +    if imgopts and parsed.f == imgfmt:
> +        opts_list.insert(0, imgopts)

Hm.  Yes, IMGOPTS should come first, so it has lower priority.  That 
means that patch 2 should have inserted IMGOPTS at the beginning of the 
parameter list, though, right?

Hanna

> +
> +    # default luks support
> +    if parsed.f == 'luks' and \
> +            all('key-secret' not in opts for opts in opts_list):
> +        result += ['--object', luks_default_secret_object]
> +        opts_list.append(luks_default_key_secret_opt)
> +
> +    for opts in opts_list:
> +        result += ['-o', opts]
>   
>       result += remaining


