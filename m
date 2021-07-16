Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D96AB3CB6A1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:17:41 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Lqe-00088m-Uh
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Lof-0007BY-D0
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Lod-0008Qi-9C
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626434134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4xeTaihGpLiv6dhbIXexVdLnU+iu953Z3SAjpTcxYQU=;
 b=KMKYAxf5y1zZbvZivtimHO1YRdDCq4i9PZtS+Xwy1Jg7fcJWZwPH86kWdYfqU0nILquKT8
 c6Bkv2D6CC4oaivVJ3XCoePS9xGjr1GGAokXXhVeYeTVG1JMHL8aLtjRVC2sPpFY8ZymQ2
 VYEvMASzzJ5H0INfwpgcVO3iPFnqsQU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-mtiF0DiLMleffe3TBdjUPg-1; Fri, 16 Jul 2021 07:15:30 -0400
X-MC-Unique: mtiF0DiLMleffe3TBdjUPg-1
Received: by mail-wr1-f69.google.com with SMTP id
 o10-20020a05600002cab02901426384855aso2195405wry.11
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 04:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4xeTaihGpLiv6dhbIXexVdLnU+iu953Z3SAjpTcxYQU=;
 b=o/1jJ/v5OqGZjrv+Z2VJx81iEgbFrhBIcDoOBIyfV7+oPCceY7LtPhC5+EhOZaY3T/
 b61uNmwqot78BcVdySwC9JnlPhivoJJC0UfqlrK8N++aeTMk1HhdCFjWaIVWHl9ME957
 gh63eo4vGzUKYQkVUo1oqLvcGHSO1vdrjQ9WC52f6xcjr56ZvvWDqR5zgoob7nXdbK5M
 wxOpF6asa8ADYMoPfxhavT1GZXK6R9iywSHoTA+hfxeG8RxcsjP/4qBNpIhVQfpXh8mG
 ASYqtdJ7huCbhSBTm2XbwX/KEpRU1Wklz5gObflO59AeTV4NOl4YAu2UDHR6fRqMeh3H
 nThA==
X-Gm-Message-State: AOAM5320SXvkIMtRNXKLoq/GxLmJgh6nZPnDRoLgDROLX/v7kH+fAqHT
 3Nop4KLW36xCNsl2bQtepbm1T+F+m/mivcpGkeB8H9+9ISxyFmn272NUyQhCLRmBAKgnEvdBZbM
 i1XMniKSTJGEG1Sw=
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr9647943wmq.145.1626434129604; 
 Fri, 16 Jul 2021 04:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4T1ZKSGANw/7nZK38FbrbURdNJuQMgtPGFFuVsOc2Ism/6sgrs8mLFOpiU8HkbNWzhPOXEw==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id
 g19mr9647920wmq.145.1626434129339; 
 Fri, 16 Jul 2021 04:15:29 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 x9sm9882209wrm.82.2021.07.16.04.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 04:15:29 -0700 (PDT)
Subject: Re: [PATCH 05/14] iotests.py: filter compression type out
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-6-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9ffe4dc6-f7c1-a788-84f8-03a763df2729@redhat.com>
Date: Fri, 16 Jul 2021 13:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-6-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> We want iotests pass with both the default zlib compression and with
> IMGOPTS='compression_type=zstd'.
>
> Actually the only test that is interested in real compression type in
> test output is 287 (test for qcow2 compression type) and it's in bash.
> So for now we can safely filter out compression type in all qcow2
> tests.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/206.out    | 10 +++---
>   tests/qemu-iotests/242.out    | 10 +++---
>   tests/qemu-iotests/255.out    |  8 ++---
>   tests/qemu-iotests/274.out    | 68 +++++++++++++++++------------------
>   tests/qemu-iotests/280.out    |  2 +-
>   tests/qemu-iotests/iotests.py | 13 ++++++-
>   6 files changed, 61 insertions(+), 50 deletions(-)

Looks OK, though I wonder if it weren’t better to have a filter that 
only prints some options and explicitly filters out everything else.  
(Well, actually, I’d prefer not to have the “Formatting…” line in the 
reference output at all, because I don’t see the point, but I suppose 
that can be considered a different problem.)

[...]

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 80f0cb4f42..6a8cc1bad7 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py
> @@ -224,9 +224,18 @@ def qemu_img_verbose(*args):
>                            % (-exitcode, ' '.join(qemu_img_args + list(args))))
>       return exitcode
>   
> +def filter_img_create(text: str) -> str:
> +    return re.sub('(compression_type=)(zlib|zstd)', r'\1COMPRESSION_TYPE',
> +                  text)
> +
>   def qemu_img_pipe(*args: str) -> str:
>       '''Run qemu-img and return its output'''
> -    return qemu_img_pipe_and_status(*args)[0]
> +    output =  qemu_img_pipe_and_status(*args)[0]

There’s a superfluous space after '='.

> +
> +    if args[0] == 'create':
> +        return filter_img_create(output)
> +
> +    return output

Wouldn’t it make more sense to have this filter be in 
qemu_img_pipe_and_status()?

Max

>   def qemu_img_log(*args):
>       result = qemu_img_pipe(*args)
> @@ -479,6 +488,8 @@ def filter_img_info(output, filename):
>                         'uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX',
>                         line)
>           line = re.sub('cid: [0-9]+', 'cid: XXXXXXXXXX', line)
> +        line = re.sub('(compression type: )(zlib|zstd)', r'\1COMPRESSION_TYPE',
> +                      line)
>           lines.append(line)
>       return '\n'.join(lines)
>   


