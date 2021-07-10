Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A65F23C3627
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 20:38:57 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2HsO-0003aE-7g
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 14:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2HrG-0002mD-Mz
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:37:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m2HrD-0007q6-Iy
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 14:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625942261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQZAu+zrvsqejLY/xof9cU/ulTWL/YabtJsvE12fEdg=;
 b=PywUkrPh273ATSRO+sQsVAkKu+Iv0/G1fhnmpMLAzijzIor0u5nUkIkIQf09vAMk2WS8Gr
 0CK0xs31QL+qRqf+Ee+41gIpFOmlh2oqLpMaEbLP4Gev5uJVmGc8oR8y6sBjRPSQIpkFPz
 tnIJHIaNVw69jEaxeXQf24jNN4HJSgs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-Yxu54lTDM-CtufCjQjKaUw-1; Sat, 10 Jul 2021 14:37:40 -0400
X-MC-Unique: Yxu54lTDM-CtufCjQjKaUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 h22-20020a7bc9360000b0290215b0f3da63so2346573wml.3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 11:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQZAu+zrvsqejLY/xof9cU/ulTWL/YabtJsvE12fEdg=;
 b=g/5ry4yJQjfdB7mcMiR+kPc/N7r54JcP/jIMF7tBQHOtAsGgPGd7fMnd9kvDbZT7A2
 D88TGVWBFgf+WIU2IZ664gKHnXjU7/KDg87S3/TKxd6DfpGoCVOM2YZwj2LhZIuKNuOS
 TC1L7ck6/N3QAZWUyOjD+S4zTdTk2twwfFhON6TVT5l3UIXongFex9MlhCEeVgGyqKYP
 ZwSCtxZJCBB5a6SAz5mwQAOfe5ZwCFWk009U5hVwmH/w0V/UahqQb08Jj3nhsydT5EF/
 yYQbE8hKSyeP7JLUM2m0GAsJvX/sMpcn5f/VuvL6vlCdSHiAZgEvYnZRbxOPtxMr/rvF
 Jdtg==
X-Gm-Message-State: AOAM53292tOka/XrFcUMoMvBgkSnhCWJOic7Jz/bI7EIX1xvMljxvyrA
 TKyiWoiEUH1fncQFtTrjHiTPcp3NFaL7QEa19oidzRxUPm8gR6WLOdR694XaK7GUgUrv2FFa6Z3
 D38sigZwRGVC4B6E=
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr5415929wrt.293.1625942258374; 
 Sat, 10 Jul 2021 11:37:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDsnczW0g81gOKErP2izjjKTVR5uTlhnxBn7S/sdq+kUwjbdOt0qbWrVAWheXKx0vTqXwL6g==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr5415907wrt.293.1625942258079; 
 Sat, 10 Jul 2021 11:37:38 -0700 (PDT)
Received: from [192.168.1.120] (93-173-255-129.bb.netvision.net.il.
 [93.173.255.129])
 by smtp.gmail.com with ESMTPSA id f26sm1871443wmc.29.2021.07.10.11.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Jul 2021 11:37:37 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] qemu-img: Add --skip-broken-bitmaps for 'convert
 --bitmaps'
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210709153951.2801666-1-eblake@redhat.com>
 <20210709153951.2801666-4-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Message-ID: <32217a0a-f9cf-dba6-1f07-0b540ae1ae6f@redhat.com>
Date: Sat, 10 Jul 2021 21:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210709153951.2801666-4-eblake@redhat.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 6:39 PM, Eric Blake wrote:
> The point of 'qemu-img convert --bitmaps' is to be a convenience for
> actions that are already possible through a string of smaller
> 'qemu-img bitmap' sub-commands.  One situation not accounted for
> already is that if a source image contains an inconsistent bitmap (for
> example, because a qemu process died abruptly before flushing bitmap
> state), the user MUST delete those inconsistent bitmaps before
> anything else useful can be done with the image.

The only thing affected by inconsistent bitmap is creating incremental 
backup, and taking some space on storage. Anything else should not be
affected by having such bitmap so the user does not need to remove it.

In oVirt we don't check or repair images after unclean guest shutdown.
Maybe this is a good idea for future version. Inconsistent bitmaps are 
removed only when the user ask to remove the related checkpoint.

> We don't want to delete inconsistent bitmaps by default: although a
> corrupt bitmap is only a loss of optimization rather than a corruption
> of user-visible data, it is still nice to require the user to opt in
> to the fact that they are aware of the loss of the bitmap.  Still,
> requiring the user to check 'qemu-img info' to see whether bitmaps are
> consistent, then use 'qemu-img bitmap --remove' to remove offenders,
> all before using 'qemu-img convert', is a lot more work than just
> adding a knob 'qemu-img convert --bitmaps --skip-broken-bitmaps' which
> opts in to skipping the broken bitmaps.

I think this is more than convenience. During live storage migration in
oVirt, we mirror the top layer to the destination using libvirt 
blockCopy, and copy the rest of the chain using qemu-img convert with 
the --bitmaps option.

If we have to remove inconsistent bitmaps at this point we need to 
modify images opened for reading by qemu, which is likely not possible 
and even if it is possible, sounds like a bad idea.

> 
> After testing the new option, also demonstrate the way to manually fix
> things (either deleting bad bitmaps, or re-creating them as empty) so
> that it is possible to convert without the option.
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1946084
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>   docs/tools/qemu-img.rst                       |  8 ++++-
>   qemu-img.c                                    | 26 +++++++++++++---
>   tests/qemu-iotests/tests/qemu-img-bitmaps     | 10 ++++++
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 31 +++++++++++++++++++
>   4 files changed, 69 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index cfe11478791f..4d407b180450 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -414,7 +414,7 @@ Command description:
>     4
>       Error on reading data
> 
> -.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
> +.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken-bitmaps]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME

I liked --skip-broken more, but Vladimir is right that this is not 
really a sub-option.

> 
>     Convert the disk image *FILENAME* or a snapshot *SNAPSHOT_PARAM*
>     to disk image *OUTPUT_FILENAME* using format *OUTPUT_FMT*. It can
> @@ -456,6 +456,12 @@ Command description:
>     *NUM_COROUTINES* specifies how many coroutines work in parallel during
>     the convert process (defaults to 8).
> 
> +  Use of ``--bitmaps`` requests that any persistent bitmaps present in
> +  the original are also copied to the destination.  If any bitmap is
> +  inconsistent in the source, the conversion will fail unless
> +  ``--skip-broken-bitmaps`` is also specified to copy only the
> +  consistent bitmaps.
> +
>   .. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE] [-F BACKING_FMT] [-u] [-o OPTIONS] FILENAME [SIZE]
> 
>     Create the new disk image *FILENAME* of size *SIZE* and format
> diff --git a/qemu-img.c b/qemu-img.c
> index e84b3c530155..661538edd785 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -82,6 +82,7 @@ enum {
>       OPTION_MERGE = 274,
>       OPTION_BITMAPS = 275,
>       OPTION_FORCE = 276,
> +    OPTION_SKIP_BROKEN = 277,
>   };
> 
>   typedef enum OutputFormat {
> @@ -2102,7 +2103,7 @@ static int convert_do_copy(ImgConvertState *s)
>   }
> 
>   /* Check that bitmaps can be copied, or output an error */
> -static int convert_check_bitmaps(BlockDriverState *src)
> +static int convert_check_bitmaps(BlockDriverState *src, bool skip_broken)
>   {
>       BdrvDirtyBitmap *bm;
> 
> @@ -2117,7 +2118,7 @@ static int convert_check_bitmaps(BlockDriverState *src)
>               continue;
>           }
>           name = bdrv_dirty_bitmap_name(bm);
> -        if (bdrv_dirty_bitmap_inconsistent(bm)) {
> +        if (!skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
>               error_report("Cannot copy inconsistent bitmap '%s'", name);

We can add another hint:

     Try --skip-brocken-bitmaps to skip this bitmap or "qemu-img bitmap
     --remove" to delete it from disk.

>               return -1;
>           }
> @@ -2125,7 +2126,8 @@ static int convert_check_bitmaps(BlockDriverState *src)
>       return 0;
>   }
> 
> -static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
> +static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst,
> +                                bool skip_broken)
>   {
>       BdrvDirtyBitmap *bm;
>       Error *err = NULL;
> @@ -2137,6 +2139,10 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
>               continue;
>           }
>           name = bdrv_dirty_bitmap_name(bm);
> +        if (skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
> +            warn_report("Skipping inconsistent bitmap %s", name);

In other logs we quote the bitmap name:'%s'

> +            continue;
> +        }
>           qmp_block_dirty_bitmap_add(dst->node_name, name,
>                                      true, bdrv_dirty_bitmap_granularity(bm),
>                                      true, true,
> @@ -2192,6 +2198,7 @@ static int img_convert(int argc, char **argv)
>       bool force_share = false;
>       bool explict_min_sparse = false;
>       bool bitmaps = false;
> +    bool skip_broken = false;
>       int64_t rate_limit = 0;
> 
>       ImgConvertState s = (ImgConvertState) {
> @@ -2213,6 +2220,7 @@ static int img_convert(int argc, char **argv)
>               {"salvage", no_argument, 0, OPTION_SALVAGE},
>               {"target-is-zero", no_argument, 0, OPTION_TARGET_IS_ZERO},
>               {"bitmaps", no_argument, 0, OPTION_BITMAPS},
> +            {"skip-broken-bitmaps", no_argument, 0, OPTION_SKIP_BROKEN},
>               {0, 0, 0, 0}
>           };
>           c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WUr:",
> @@ -2341,6 +2349,9 @@ static int img_convert(int argc, char **argv)
>           case OPTION_BITMAPS:
>               bitmaps = true;
>               break;
> +        case OPTION_SKIP_BROKEN:
> +            skip_broken = true;
> +            break;
>           }
>       }
> 
> @@ -2348,6 +2359,11 @@ static int img_convert(int argc, char **argv)
>           out_fmt = "raw";
>       }
> 
> +    if (skip_broken && !bitmaps) {
> +        error_report("Use of --skip-broken-bitmaps requires --bitmaps");
> +        goto fail_getopt;
> +    }
> +
>       if (s.compressed && s.copy_range) {
>           error_report("Cannot enable copy offloading when -c is used");
>           goto fail_getopt;
> @@ -2577,7 +2593,7 @@ static int img_convert(int argc, char **argv)
>               ret = -1;
>               goto out;
>           }
> -        ret = convert_check_bitmaps(blk_bs(s.src[0]));
> +        ret = convert_check_bitmaps(blk_bs(s.src[0]), skip_broken);
>           if (ret < 0) {
>               goto out;
>           }
> @@ -2702,7 +2718,7 @@ static int img_convert(int argc, char **argv)
> 
>       /* Now copy the bitmaps */
>       if (bitmaps && ret == 0) {
> -        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs);
> +        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs, skip_broken);
>       }
> 
>   out:
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 3fde95907515..20f3dffa8e5e 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -143,6 +143,16 @@ $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
>       echo "unexpected success"
>   TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
>       | _filter_irrelevant_img_info

A new title here will make the test output much more clear.

> +$QEMU_IMG convert --bitmaps --skip-broken-bitmaps \
> +    -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> +TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> +    | _filter_irrelevant_img_info

New title will make both the test and output more clear. Maybe also 
using more descriptive names for the bitmaps (e.g bad, good).

> +_rm_test_img "$TEST_IMG.copy"
> +$QEMU_IMG bitmap --remove "$TEST_IMG" b0
> +$QEMU_IMG bitmap --remove --add "$TEST_IMG" b2
> +$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
> +TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
> +    | _filter_irrelevant_img_info
> 
>   # success, all done
>   echo '*** done'
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index 546aaa404bba..4d196e24d0fb 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -145,4 +145,35 @@ Format specific information:
>       corrupt: false
>   qemu-img: Cannot copy inconsistent bitmap 'b0'
>   qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory

Why to we get this error? I guess it is part of the first copy that 
should fail?

> +qemu-img: warning: Skipping inconsistent bitmap b0
> +qemu-img: warning: Skipping inconsistent bitmap b2

Looks useful, I need to check that we log such warnings.

> +image: TEST_DIR/t.IMGFMT.copy
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +    corrupt: false
> +image: TEST_DIR/t.IMGFMT.copy
> +file format: IMGFMT
> +virtual size: 10 MiB (10485760 bytes)
> +cluster_size: 65536
> +Format specific information:
> +    bitmaps:
> +        [0]:
> +            flags:
> +                [0]: auto
> +            name: b4
> +            granularity: 65536
> +        [1]:
> +            flags:
> +                [0]: auto
> +            name: b2
> +            granularity: 65536
> +    corrupt: false
>   *** done
> 


