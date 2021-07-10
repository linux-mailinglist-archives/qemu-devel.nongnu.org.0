Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A63C35E8
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 19:49:09 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2H6C-0004vP-93
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 13:49:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2H5K-00040a-5J
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:48:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2H5G-00082g-Sz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 13:48:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625939289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npqCH9Sipfg3ToVo0HSqme/3n5lAyUPLjQtZp63Jzic=;
 b=i7OvS4b7tX7gcvDz7XjBsjkjpcz31Tc7+ZnfXmvK/VWa08KpSuP4butT3J5xyJz26pAFue
 qp+yXM0eXrF+pvsD6ioF1UcGstj7p0NxDv0mf2pQUDHDfufh029TfPPEtXmzfAaLfYfzgt
 bN0xJva1O5jq7Ftk7aQ+L8E1RTlSgQw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-daFrR6M7NuW2Q7xPDzd3Pg-1; Sat, 10 Jul 2021 13:48:08 -0400
X-MC-Unique: daFrR6M7NuW2Q7xPDzd3Pg-1
Received: by mail-wm1-f72.google.com with SMTP id
 m31-20020a05600c3b1fb02902082e9b2132so5659320wms.5
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 10:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=npqCH9Sipfg3ToVo0HSqme/3n5lAyUPLjQtZp63Jzic=;
 b=not3PZHQEdsnz8hPWW8GiovPwHG2bfZcltjLYMFQHYJAUChehCxXrPIet/ERriI0xV
 ToPuLrIp5ECS6eVIh8F6xCSlszWhzSsyElqa/kowvFdHI12KQuAnSML0w+ZEspyRNBuk
 94SHjjP5ZA16ii51BSJbLl2tvTr3Pj8oEjoCeor0NKRYwbxKDWXogtaOEkw6JU7Fa9Cb
 PcVIEnsgkAX4GsS2Gg2685eygUExlMR3pmwF+3Zq2Sc76nJMhJS9kBeYcX8jijQJS437
 QxEiCxDXlHdL6Csea9aNdjIqs5VFzQ6oZtlHo0rSfhSOZxkcxXcvOKVD3C8b2nZy8IL4
 C45Q==
X-Gm-Message-State: AOAM530LjZu+CZI1MCrqJyLL7riU6brcDtjZQiTLt89X4mt2qzYCJ2K/
 YwEGlsjcsRXuzpBbas4m5Mt4aNSzU1zX42lU/jS4lrcTwUSx/m+1R509qzshGcpXmN4Ne0/w/B1
 +X9sM+SyEz2DC6WY=
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr49837429wrs.170.1625939286931; 
 Sat, 10 Jul 2021 10:48:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztmhWKdV7ZRzUW/9Yyl3fTIwoq9iyiudPxkG0kjsdn0F80Aw5iu6kx/ZErvphyu2LcFllKoQ==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr49837407wrs.170.1625939286676; 
 Sat, 10 Jul 2021 10:48:06 -0700 (PDT)
Received: from [192.168.1.120] (93-173-255-129.bb.netvision.net.il.
 [93.173.255.129])
 by smtp.gmail.com with ESMTPSA id c125sm13568585wme.36.2021.07.10.10.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 10:48:06 -0700 (PDT)
From: Nir Soffer <nsoffer@redhat.com>
Subject: Re: [PATCH v2 1/3] iotests: Improve and rename test 291 to
 qemu-img-bitmap
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-2-eblake@redhat.com>
Message-ID: <ddf1b914-3aaf-6b6d-d72c-4971f5fc7139@redhat.com>
Date: Sat, 10 Jul 2021 20:48:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210709153951.2801666-2-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.452,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 6:39 PM, Eric Blake wrote:
> Enhance the test to demonstrate existing less-than-stellar behavior of
> qemu-img with a qcow2 image containing an inconsistent bitmap: we
> don't diagnose the problem until after copying the entire image (a
> potentially long time), and when we do diagnose the failure, we still
> end up leaving an empty bitmap in the destination.  This mess will be
> cleaned up in the next patch.
> 
> While at it, rename the test now that we support useful iotest names,
> and fix a missing newline in the error message thus exposed.

Much nicer with a meaningful name!

> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   block/dirty-bitmap.c                          |  2 +-
>   .../{291 => tests/qemu-img-bitmaps}           | 19 +++++++-
>   .../{291.out => tests/qemu-img-bitmaps.out}   | 48 ++++++++++++++++++-
>   3 files changed, 66 insertions(+), 3 deletions(-)
>   rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (88%)
>   rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (75%)
> 
> diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
> index 68d295d6e3ed..0ef46163e3ea 100644
> --- a/block/dirty-bitmap.c
> +++ b/block/dirty-bitmap.c
> @@ -193,7 +193,7 @@ int bdrv_dirty_bitmap_check(const BdrvDirtyBitmap *bitmap, uint32_t flags,
>           error_setg(errp, "Bitmap '%s' is inconsistent and cannot be used",
>                      bitmap->name);
>           error_append_hint(errp, "Try block-dirty-bitmap-remove to delete"
> -                          " this bitmap from disk");
> +                          " this bitmap from disk\n");
>           return -1;
>       }
> 
> diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/tests/qemu-img-bitmaps
> similarity index 88%
> rename from tests/qemu-iotests/291
> rename to tests/qemu-iotests/tests/qemu-img-bitmaps
> index 20efb080a6c0..2f51651d0ce5 100755
> --- a/tests/qemu-iotests/291
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -3,7 +3,7 @@
>   #
>   # Test qemu-img bitmap handling
>   #
> -# Copyright (C) 2018-2020 Red Hat, Inc.
> +# Copyright (C) 2018-2021 Red Hat, Inc.
>   #
>   # This program is free software; you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
> @@ -27,11 +27,13 @@ status=1 # failure is the default!
>   _cleanup()
>   {
>       _cleanup_test_img
> +    _rm_test_img "$TEST_IMG.copy"
>       nbd_server_stop
>   }
>   trap "_cleanup; exit \$status" 0 1 2 3 15
> 
>   # get standard environment, filters and checks
> +cd ..
>   . ./common.rc
>   . ./common.filter
>   . ./common.nbd
> @@ -129,6 +131,21 @@ $QEMU_IMG map --output=json --image-opts \
> 
>   nbd_server_stop
> 
> +echo
> +echo "=== Check handling of inconsistent bitmap ==="
> +echo
> +
> +$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
> +$QEMU_IMG bitmap --add "$TEST_IMG" b4
> +$QEMU_IMG bitmap --remove "$TEST_IMG" b1
> +_img_info --format-specific | _filter_irrelevant_img_info
> +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
> +    echo "unexpected success"
> +# Bug - even though we failed at conversion, we left a file around with
> +# a bitmap marked as not corrupt
> +TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> +    | _filter_irrelevant_img_info
> +
>   # success, all done
>   echo '*** done'
>   rm -f $seq.full
> diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> similarity index 75%
> rename from tests/qemu-iotests/291.out
> rename to tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index 23411c0ff4d9..b762362075d1 100644
> --- a/tests/qemu-iotests/291.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -1,4 +1,4 @@
> -QA output created by 291
> +QA output created by qemu-img-bitmaps
> 
>   === Initial image setup ===
> 
> @@ -115,4 +115,50 @@ Format specific information:
>   [{ "start": 0, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
>   { "start": 2097152, "length": 1048576, "depth": 0, "zero": false, "data": false},
>   { "start": 3145728, "length": 7340032, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
> +
> +=== Check handling of inconsistent bitmap ===
> +
> +image: TEST_DIR/t.IMGFMT
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +backing file: TEST_DIR/t.IMGFMT.base
> +backing file format: IMGFMT
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +                [0]: in-use
> +                [1]: auto
> +            name: b2
> +            granularity: 65536
> +        [1]:
> +            flags:
> +                [0]: in-use
> +            name: b0
> +            granularity: 65536
> +        [2]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +    corrupt: false
> +qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
> +Try block-dirty-bitmap-remove to delete this bitmap from disk

In this context a more useful error message would be:

     Try "qemu-img bitmap --remove" ...

but this is not a new issue.

> +image: TEST_DIR/t.IMGFMT.copy
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +            name: b0
> +            granularity: 65536
> +        [1]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +    corrupt: false
>   *** done
> 

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


