Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF9A3F2D13
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 15:23:00 +0200 (CEST)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH4U7-00026w-Ei
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 09:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH4Sg-0001De-Cz
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:21:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mH4Sd-0003MR-JL
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 09:21:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629465686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbSrbveOcwIcGOredkfYimy2pbeH9cS2YC2H+NFQ8uo=;
 b=Q75thylqAhTBCNqc1xrurj/j025ejGf8ZY8jl70Pnkko25EmdMg2VAA8lSFfzTNZEbwHDz
 XBDCW2FYvh1M2jxG6VRVajTPw9rhBLzs5vX0u+px1HyL+i2R3dO1nv6FtFTi6TbnWK3YlM
 l6o6OiTkxufC2F50/kMCSUv4JFK6thQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-tSUa_8V2Ppa2hIFlCc4AeA-1; Fri, 20 Aug 2021 09:21:24 -0400
X-MC-Unique: tSUa_8V2Ppa2hIFlCc4AeA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v18-20020adfe2920000b029013bbfb19640so2818237wri.17
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 06:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WbSrbveOcwIcGOredkfYimy2pbeH9cS2YC2H+NFQ8uo=;
 b=U5CLDp3j3bzw30TNiAqrNMowLPj2oFUXQhZ1d4bphxHGqLOz8ZrZVCXp3eoFqMnrGx
 403zLIrRRdMvJ2dxApOSK0ZbtOMiv0r+8KZ9x/cDEvg6nsMGNXX9d+Mo3QSdst2XNpO2
 jBhPu0q65FxWkIer7QsvYzwMpFvIkl262Ur2L0i0CjJzocFjrfZxz9osYbba+ZbcUGqQ
 giYDxxO+C3PZYhOsyVEi4839caFDhfvFiI4+0X1/VjiCR+n0h6qGL4FW8vLhUbZ9QocW
 p/KxZui+bzhuJQ9A2HiQhQ4T8AE6jb00Z9tviG0W3/oVnM2+ccM+H9etDwNE44aTILxo
 CSOQ==
X-Gm-Message-State: AOAM533FTnI7cMofPWTSjUpvMV/xhrszoSUDlEQev0WVZ5tLzXMuC8Xl
 eTb/VCtC8Wn1d4+SyxTY5sQClufQVcVkDnYXXYi6RCrSSgxFNsEC55yn72m5aweHvaic9/JDVmV
 r8qjMje/8aP3hBg4=
X-Received: by 2002:a1c:f414:: with SMTP id z20mr4059800wma.94.1629465683777; 
 Fri, 20 Aug 2021 06:21:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+IFg5zRPF5/ZFb65AAwB3uaUbGCrB1KpTIE4vvMMbiZuWwcV2Gex/Z7VeKBZu2rX4IzzNyA==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr4059766wma.94.1629465683569; 
 Fri, 20 Aug 2021 06:21:23 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 a133sm10466052wme.5.2021.08.20.06.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 06:21:23 -0700 (PDT)
Subject: Re: [PATCH 3/3] qcow2: handle_dependencies(): relax conflict detection
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <d5941c16-ea90-b093-b72e-312054c13642@redhat.com>
Date: Fri, 20 Aug 2021 15:21:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210724133846.64614-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.49, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, den@openvz.org, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
> There is no conflict and no dependency if we have parallel writes to
> different subclusters of one cluster when cluster itself is already
> allocated. So, relax extra dependency.
>
> Measure performance:
> First, prepare build/qemu-img-old and build/qemu-img-new images.
>
> cd scripts/simplebench
> ./img_bench_templater.py
>
> Paste the following to stdin of running script:
>
> qemu_img=../../build/qemu-img-{old|new}
> $qemu_img create -f qcow2 -o extended_l2=on /ssd/x.qcow2 1G
> $qemu_img bench -c 100000 -d 8 [-s 2K|-s 2K -o 512|-s $((1024*2+512))] \
>          -w -t none -n /ssd/x.qcow2
>
> The result:
>
> All results are in seconds
>
> ------------------  ---------  ---------
>                      old        new
> -s 2K               6.7 ± 15%  6.2 ± 12%
>                                   -7%
> -s 2K -o 512        13 ± 3%    11 ± 5%
>                                   -16%
> -s $((1024*2+512))  9.5 ± 4%   8.4
>                                   -12%
> ------------------  ---------  ---------
>
> So small writes are more independent now and that helps to keep deeper
> io queue which improves performance.
>
> 271 iotest output becomes racy for three allocation in one cluster.
> Second and third writes may finish in different order. Second and
> third requests don't depend on each other any more. Still they both
> depend on first request anyway. Keep only one for consistent output.

I mean, we could also just filter the result 
(`s/\(20480\|40960\)/FILTERED/` or something).  Perhaps there was some 
idea behind doing three writes, I don’t know exactly.

I think I’d prefer a filter, because I guess this is the only test that 
actually will do two subcluster requests in parallel...?

Hanna

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2-cluster.c      | 11 +++++++++++
>   tests/qemu-iotests/271     |  4 +---
>   tests/qemu-iotests/271.out |  2 --
>   3 files changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
> index 967121c7e6..8f56de5516 100644
> --- a/block/qcow2-cluster.c
> +++ b/block/qcow2-cluster.c
> @@ -1403,6 +1403,17 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
>               continue;
>           }
>   
> +        if (old_alloc->keep_old_clusters &&
> +            (end <= l2meta_cow_start(old_alloc) ||
> +             start >= l2meta_cow_end(old_alloc)))
> +        {
> +            /*
> +             * Clusters intersect but COW areas don't. And cluster itself is
> +             * already allocated. So, there is no actual conflict.
> +             */
> +            continue;
> +        }
> +
>           /* Conflict */
>   
>           if (start < old_start) {
> diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
> index 599b849cc6..939e88ee88 100755
> --- a/tests/qemu-iotests/271
> +++ b/tests/qemu-iotests/271
> @@ -866,7 +866,7 @@ echo
>   
>   _concurrent_io()
>   {
> -# Allocate three subclusters in the same cluster.
> +# Allocate two subclusters in the same cluster.
>   # This works because handle_dependencies() checks whether the requests
>   # allocate the same cluster, even if the COW regions don't overlap (in
>   # this case they don't).
> @@ -876,7 +876,6 @@ break write_aio A
>   aio_write -P 10 30k 2k
>   wait_break A
>   aio_write -P 11 20k 2k
> -aio_write -P 12 40k 2k
>   resume A
>   aio_flush
>   EOF
> @@ -888,7 +887,6 @@ cat <<EOF
>   open -o driver=$IMGFMT $TEST_IMG
>   read -q -P 10 30k 2k
>   read -q -P 11 20k 2k
> -read -q -P 12 40k 2k
>   EOF
>   }
>   
> diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
> index 81043ba4d7..d94c8fe061 100644
> --- a/tests/qemu-iotests/271.out
> +++ b/tests/qemu-iotests/271.out
> @@ -721,6 +721,4 @@ wrote 2048/2048 bytes at offset 30720
>   2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   wrote 2048/2048 bytes at offset 20480
>   2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
> -wrote 2048/2048 bytes at offset 40960
> -2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>   *** done


