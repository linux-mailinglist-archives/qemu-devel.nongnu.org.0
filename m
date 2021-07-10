Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C343C3602
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 20:07:58 +0200 (CEST)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HOP-0005ip-Lp
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 14:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2HN3-00052U-CQ
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2HN1-0003VK-Jk
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625940390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3b4qSv6KbBmIA5oChZcUU0EebeoQ+NLIzD18gXpFIhY=;
 b=RgxKsGxFPdGplLMf4/5hs7K0F2YEcA7AdphaWORQRSjiR4U+GiZGzvP3Sml8IjQt8/gO7Y
 EbrdjGc+48tLoCg4olENsWNCBBBbQkpWaqB7PiVqgh6jTIVFCIFI11sO1voEkiee59gBF5
 ixyiIEIMRepcySziRM53Mpw+2RziqlA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-p3PoTPikNlav-SfuLi61Ag-1; Sat, 10 Jul 2021 14:06:29 -0400
X-MC-Unique: p3PoTPikNlav-SfuLi61Ag-1
Received: by mail-wm1-f70.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso4936279wmj.0
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3b4qSv6KbBmIA5oChZcUU0EebeoQ+NLIzD18gXpFIhY=;
 b=rY7FCfcmtd0J8skjPWt1uoEHPwjTN6SrZ8L7uvgDcMrKC1s7gOaVSnw5J+x3agHrAs
 azaVtPXOE+B7Y6nrE9LwHFPNGe9pMXtWykLtEp9pTZ/e5qCEUa/ac4wZUvibae1BVlDU
 wlqrQ81bu7YGz7NHKQdMN9lOxZbyffzP7HaEqIx81LM9sOZ2TbwKOXeak6/KIFXFXuaJ
 hRCYVJIYynGZ8dZfkE0YO0nIwu7fSMVR64uYYbs365TlZM9xILe89IKKeOIrBYn19gEH
 NG+uZgiFUSB3Z5Ir+yReFOFzIWW9Vi62xzFdyruXRhfNFhdh2pe1E+rQRFSPvDdL+LtX
 w2yQ==
X-Gm-Message-State: AOAM531kYG2KTluJ4QgEl5imth1V6qgCisoG1gwcPYXddmuydKcWtNTF
 JsEtyzyFR1njPJzC95Bh2u4Dd7B3ehlEX5pPzWhwZ5QDuRA42B/36XDkZtokeDgSSjyz5BRechX
 2Yz1x6CW44s2Kbe8=
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr5414229wmr.155.1625940387262; 
 Sat, 10 Jul 2021 11:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx78uzrmpDq+peMv9OIbnUvA5HvuXdoYyExwVGqczO33mQieUJlBqDX8Q+XW65jyUyccyy45g==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr5414191wmr.155.1625940386850; 
 Sat, 10 Jul 2021 11:06:26 -0700 (PDT)
Received: from [192.168.1.120] (93-173-255-129.bb.netvision.net.il.
 [93.173.255.129])
 by smtp.gmail.com with ESMTPSA id z12sm8732013wrs.39.2021.07.10.11.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 11:06:26 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] qemu-img: Fail fast on convert --bitmaps with
 inconsistent bitmap
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-3-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Message-ID: <a5a194b3-4d9c-c64a-ad62-be20e5a64b99@redhat.com>
Date: Sat, 10 Jul 2021 21:06:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210709153951.2801666-3-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.452,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 6:39 PM, Eric Blake wrote:
> Waiting until the end of the convert operation (a potentially
> time-consuming task) to finally detect that we can't copy a bitmap is
> bad, comparing to failing fast up front.  Furthermore, this prevents
> us from leaving a file behind with a bitmap that is not marked as
> inconsistent even though it does not have sane contents.

I don't think this is an issue since qemu-img terminate with non-zero
exit code, and we cannot ensure that image is complete if we fail in
the middle of the operation for all image formats and protocols.

For files we could use a temporary file and rename after successful
conversion for for raw format on block device we don't have any way
to mark the contents as temporary.

But failing fast is very important.

> This fixes the problems exposed in the previous patch to the iotest.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   qemu-img.c                                    | 30 +++++++++++++++++--
>   tests/qemu-iotests/tests/qemu-img-bitmaps     |  2 --
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 20 ++-----------
>   3 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 7956a8996512..e84b3c530155 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2101,6 +2101,30 @@ static int convert_do_copy(ImgConvertState *s)
>       return s->ret;
>   }
> 
> +/* Check that bitmaps can be copied, or output an error */
> +static int convert_check_bitmaps(BlockDriverState *src)
> +{
> +    BdrvDirtyBitmap *bm;
> +
> +    if (!bdrv_supports_persistent_dirty_bitmap(src)) {
> +        error_report("Source lacks bitmap support");
> +        return -1;
> +    }
> +    FOR_EACH_DIRTY_BITMAP(src, bm) {
> +        const char *name;
> +
> +        if (!bdrv_dirty_bitmap_get_persistence(bm)) {
> +            continue;
> +        }
> +        name = bdrv_dirty_bitmap_name(bm);
> +        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> +            error_report("Cannot copy inconsistent bitmap '%s'", name);

We can add a useful hint:

     Try "qemu-img bitmap --remove" to delete this bitmap from disk.

> +            return -1;
> +        }
> +    }
> +    return 0;
> +}
> +
>   static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>   {
>       BdrvDirtyBitmap *bm;
> @@ -2127,6 +2151,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>                                 &err);
>           if (err) {
>               error_reportf_err(err, "Failed to populate bitmap %s: ", name);
> +            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);

This may fail for the same reason populate failed (e.g. storage became 
inaccessibel in the middle of the copy). Since we fail the convert, I 
don't think it worth to try to do this kind of cleanup.

If we have a way to disable the bitmap before merge, and enable it after
successful merge it make more sense, since if the operation fails we are
left with disabled bitmap.

>               return -1;
>           }
>       }
> @@ -2552,9 +2577,8 @@ static int img_convert(int argc, char **argv)
>               ret = -1;
>               goto out;
>           }
> -        if (!bdrv_supports_persistent_dirty_bitmap(blk_bs(s.src[0]))) {
> -            error_report("Source lacks bitmap support");
> -            ret = -1;
> +        ret = convert_check_bitmaps(blk_bs(s.src[0]));
> +        if (ret < 0) {
>               goto out;
>           }
>       }
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 2f51651d0ce5..3fde95907515 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -141,8 +141,6 @@ $QEMU_IMG bitmap --remove "$TEST_IMG" b1
>   _img_info --format-specific | _filter_irrelevant_img_info
>   $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
>       echo "unexpected success"
> -# Bug - even though we failed at conversion, we left a file around with
> -# a bitmap marked as not corrupt
>   TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
>       | _filter_irrelevant_img_info
> 
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index b762362075d1..546aaa404bba 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -143,22 +143,6 @@ Format specific information:
>               name: b4
>               granularity: 65536
>       corrupt: false
> -qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
> -Try block-dirty-bitmap-remove to delete this bitmap from disk
> -image: TEST_DIR/t.IMGFMT.copy
> -file format: IMGFMT
> -virtual size: 10 MiB (10485760 bytes)
> -cluster_size: 65536
> -Format specific information:
> -    bitmaps:
> -        [0]:
> -            flags:
> -            name: b0
> -            granularity: 65536
> -        [1]:
> -            flags:
> -                [0]: auto
> -            name: b4
> -            granularity: 65536
> -    corrupt: false
> +qemu-img: Cannot copy inconsistent bitmap 'b0'
> +qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory
>   *** done
>


