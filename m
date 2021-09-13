Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81074409669
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:53:41 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPnL2-0005lh-Kl
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnJM-0004Ix-HB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPnJK-00018V-T9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 10:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631544714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GO7TrDkBTG8DqjgzW/DbxtB7UhAj5kiBD1EFEzze+7Y=;
 b=C1x0pqYVo7YioNE3BPdUytcq22NY3Vzg5XwBJEPsPpKgjT1FI9CieJfhrhii1brFzVIHUN
 XWPsDUYZ1/8UZp0K7iABt28RHrVAc6OopI2UwT5NxDs2VoUBS+Ri3dIL0fCMXOtGyST6p2
 VsVLN1G0nVEd2SzE9OfbCtQYHoJLa5Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-GXoNEeVFOUqrV0sZiR6Ifw-1; Mon, 13 Sep 2021 10:51:47 -0400
X-MC-Unique: GXoNEeVFOUqrV0sZiR6Ifw-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020a5d4c82000000b0015b140e0562so2781485wrs.7
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 07:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GO7TrDkBTG8DqjgzW/DbxtB7UhAj5kiBD1EFEzze+7Y=;
 b=WyTt18nw7EbdCvYmY272nvEViXe5rUCxylbmREmmUcE26LF0kwEdgMT++K/GZ5U8B/
 IUyl686tSj+p4n85B/ynLfSSbumrqYgPKAwYFeEPiP/WsklRw8QCOjN7qpoxiCgxjsdC
 FRVzOpp7EUmcETQ6OR2IelfPrd/mT4aAnP8Gf0UCqR6LclxLQbF2FwWVqra/6jd+1Fvf
 UhsMTe4kqqFgccvLDX6wXU7t/KUiVuHn87f09k0YIRPy5FmgJ3lBZ5AS2bhMUoWiYm5q
 crojsi78veKEwKwzBr6FdsV9233Nd65QIBr0yd0MhNzLwoDkLEVhY/g2m9ApO9tQaqkJ
 qVTQ==
X-Gm-Message-State: AOAM5308l0yOWWm05ThnZqkikDWMfW58xRojHmDeVx+9hGWmEAKddL8+
 DS2CNmAeDgYNUFilLV4RPG78uCI2D7kukBd1VDjreM8LI4uuIM7VRRyk302PTtX+F4XJEULazT7
 ysIBLZISPNHQSk+8=
X-Received: by 2002:a1c:7403:: with SMTP id p3mr11727212wmc.72.1631544706581; 
 Mon, 13 Sep 2021 07:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzogTGxbB0BV45n82vchcpOYYprfxZHQbxjkCKbs/XK12mwWvsrvIkUvHAcnCdkDSvYUuUkjA==
X-Received: by 2002:a1c:7403:: with SMTP id p3mr11727190wmc.72.1631544706376; 
 Mon, 13 Sep 2021 07:51:46 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id x13sm7584444wrg.62.2021.09.13.07.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 07:51:46 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] qcow2: handle_dependencies(): relax conflict
 detection
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210824101517.59802-1-vsementsov@virtuozzo.com>
 <20210824101517.59802-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <18b2a050-4354-a5d7-0b19-9c0b19deeeaf@redhat.com>
Date: Mon, 13 Sep 2021 16:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824101517.59802-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, eblake@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.08.21 12:15, Vladimir Sementsov-Ogievskiy wrote:
> There is no conflict and no dependency if we have parallel writes to
> different subclusters of one cluster when the cluster itself is already
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
> depend on first request anyway. Filter out second and third write
> offsets to cover both possible outputs.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2-cluster.c      | 11 +++++++++++
>   tests/qemu-iotests/271     |  5 ++++-
>   tests/qemu-iotests/271.out |  4 ++--
>   3 files changed, 17 insertions(+), 3 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
> index 599b849cc6..d9d391955e 100755
> --- a/tests/qemu-iotests/271
> +++ b/tests/qemu-iotests/271
> @@ -893,7 +893,10 @@ EOF
>   }
>   
>   _make_test_img -o extended_l2=on 1M
> -_concurrent_io     | $QEMU_IO | _filter_qemu_io
> +# Second an third writes in _concurrent_io() are independent and may finish in

s/ an / and /

With that fixed:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> +# different order. So, filter offset out to match both possible variants.
> +_concurrent_io     | $QEMU_IO | _filter_qemu_io | \
> +    $SED -e 's/\(20480\|40960\)/OFFSET/'
>   _concurrent_verify | $QEMU_IO | _filter_qemu_io
>   
>   # success, all done


