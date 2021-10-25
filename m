Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB85439BE9
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 18:42:53 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf33j-0002D6-LA
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mf31G-00084W-S7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:40:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mf31B-00041L-SA
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 12:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635180012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6kR/b7p07C8LloRvBFIEUkJBwEs6JQ0+Q9TL34GVnA=;
 b=FZg0QRYZaez1f2+v2FV0zSxPpQ7+g2jDe+dlp6D6SrvMuqIeOyPUAOBnysDHMzmUjxlsnk
 T8g3Et34MlgAEfDgz9ucJBlLWjTxa2nE2z6pDOgn1opVbSgBUup29o+AVf2tkHUXZzkesn
 SFtm+k8coLtmI27WGBFnGCaNuHX0kZE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-I7i2uilcOKm3eiJQf6xNHg-1; Mon, 25 Oct 2021 12:40:09 -0400
X-MC-Unique: I7i2uilcOKm3eiJQf6xNHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 b197-20020a1c1bce000000b0032ca040eb40so3385071wmb.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 09:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=j6kR/b7p07C8LloRvBFIEUkJBwEs6JQ0+Q9TL34GVnA=;
 b=Una7bmDcjiKt/+5WxfpHdLlp5xdeZ8DNhli136SPLQLRwoAKEH3q61VwZcJTHiqvT7
 K9cj9BOWmbFoJwnoAgxxwsePYQMUKikMrgXouDnjoank/slNTrWEKrUJ+Gr6CwMoUi4g
 z9JSwZgquLm+9aWJ367sjLbNkoMr2PitvB23voF1Od0woV4NNYSsRZUWxcDKMHtO2n+9
 QDjQLpygQG5zFBEuPkrHl/iCLmR22BP+BvAGAddlS8vE1syg57kIdmardtoNtZ2H6CMy
 9NfIOq07wuczkKauhTqmKC6fQNh21XRqJJgT3iQM9T+APECwHUxsvrjCLvvRp6nhWqlb
 APaA==
X-Gm-Message-State: AOAM533GOQiTL6OQdJstMDzlAW8nYt3jlVrpp8avekhNJn8eysuxMtf5
 Yd193ZoalFZ+HDuD9zbIdcaJIeolPb3AXcRaxZQV+8Vpbsi35WBD1CcAryKK4kNkYAXX0IGZtnz
 uvVfe7XlQ0ikLxgU=
X-Received: by 2002:adf:9c02:: with SMTP id f2mr25578426wrc.329.1635180008307; 
 Mon, 25 Oct 2021 09:40:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzecN3nKphiwp6ww661+pDh+gwODMoOXhRHWsIZG/glplxS/oF/DLMwjk1vD+rUFDjcyOkvgg==
X-Received: by 2002:adf:9c02:: with SMTP id f2mr25578384wrc.329.1635180007990; 
 Mon, 25 Oct 2021 09:40:07 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b207sm9127451wmd.3.2021.10.25.09.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 09:40:07 -0700 (PDT)
Message-ID: <f9559937-f077-f8d5-4a5a-2c583c2131f5@redhat.com>
Date: Mon, 25 Oct 2021 18:40:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/4] qemu-img: implement compare --stat
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211021101236.1144824-1-vsementsov@virtuozzo.com>
 <20211021101236.1144824-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211021101236.1144824-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 nsoffer@redhat.com, nikita.lapshin@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.10.21 12:12, Vladimir Sementsov-Ogievskiy wrote:
> With new option qemu-img compare will not stop at first mismatch, but
> instead calculate statistics: how many clusters with different data,
> how many clusters with equal data, how many clusters were unallocated
> but become data and so on.
>
> We compare images chunk by chunk. Chunk size depends on what
> block_status returns for both images. It may return less than cluster
> (remember about qcow2 subclusters), it may return more than cluster (if
> several consecutive clusters share same status). Finally images may
> have different cluster sizes. This all leads to ambiguity in how to
> finally compare the data.
>
> What we can say for sure is that, when we compare two qcow2 images with
> same cluster size, we should compare clusters with data separately.
> Otherwise, if we for example compare 10 consecutive clusters of data
> where only one byte differs we'll report 10 different clusters.
> Expected result in this case is 1 different cluster and 9 equal ones.
>
> So, to serve this case and just to have some defined rule let's do the
> following:
>
> 1. Select some block-size for compare procedure. In this commit it must
>     be specified by user, next commit will add some automatic logic and
>     make --block-size optional.
>
> 2. Go chunk-by-chunk using block_status as we do now with only one
>     differency:
>     If block_status() returns DATA region that intersects block-size
>     aligned boundary, crop this region at this boundary.
>
> This way it's still possible to compare less than cluster and report
> subcluster-level accuracy, but we newer compare more than one cluster
> of data.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   docs/tools/qemu-img.rst |  18 +++-
>   qemu-img.c              | 206 +++++++++++++++++++++++++++++++++++++---
>   qemu-img-cmds.hx        |   4 +-
>   3 files changed, 212 insertions(+), 16 deletions(-)

Looks good to me overall!  Just some technical comments below.

> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index d58980aef8..21164253d4 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -159,6 +159,18 @@ Parameters to compare subcommand:
>   
>     Strict mode - fail on different image size or sector allocation
>   
> +.. option:: --stat
> +
> +  Instead of exit on first mismatch compare the whole images and print
> +  statistics on amount of different pairs of clusters, based on their
> +  block-status and are they equal or not.

I’d phrase this as:

Instead of exiting on the first mismatch, compare the whole images and 
print statistics on how much they differ in terms of block status (i.e. 
are blocks allocated or not, do they contain data, are they marked as 
containing only zeroes) and block content (a block of data that contains 
only zero still has the same content as a marked-zero block).

> +
> +.. option:: --block-size BLOCK_SIZE
> +
> +  Block size for comparing with ``--stat``. This doesn't guarantee exact
> +  size of comparing chunks, but that guarantee that data chunks being
> +  compared will never cross aligned block-size boundary.

I’d do just some minor tweaks to the second sentence:

This doesn't guarantee an exact size for comparing chunks, but it does 
guarantee that those chunks will never cross a block-size-aligned boundary.

> +
>   Parameters to convert subcommand:
>   
>   .. program:: qemu-img-convert

[...]

> diff --git a/qemu-img.c b/qemu-img.c
> index f036a1d428..79a0589167 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -83,6 +83,8 @@ enum {
>       OPTION_BITMAPS = 275,
>       OPTION_FORCE = 276,
>       OPTION_SKIP_BROKEN = 277,
> +    OPTION_STAT = 277,

That doesn’t look ideal, I believe `OPTION_STAT` should have a different 
value than `OPTION_SKIP_BROKEN`.  (I guess a rebase is to blame?)

> +    OPTION_BLOCK_SIZE = 278,
>   };
>   
>   typedef enum OutputFormat {
> @@ -1304,6 +1306,107 @@ static int check_empty_sectors(BlockBackend *blk, int64_t offset,
>       return 0;
>   }
>   
> +#define IMG_CMP_STATUS_MASK (BDRV_BLOCK_DATA | BDRV_BLOCK_ZERO | \
> +                             BDRV_BLOCK_ALLOCATED)
> +#define IMG_CMP_STATUS_MAX (IMG_CMP_STATUS_MASK | BDRV_BLOCK_EOF)
> +
> +typedef struct ImgCmpStat {
> +    /* stat: [ret: 0 is equal, 1 is not][status1][status2] -> n_bytes */
> +    uint64_t stat[2][IMG_CMP_STATUS_MAX + 1][IMG_CMP_STATUS_MAX + 1];

`IMG_CMP_STATUS_MAX` isn’t packed tightly because it only has four bits 
set (0x33).  That in itself isn’t a problem, but it means that 
`IMG_CMP_STATUS_MAX + 1` is 52, and so this array’s size is 52 * 52 * 2 
* sizeof(uint64_t) = 43264.  Again, that isn’t a problem in itself 
(although it is a bit sad that this could fit into 16 * 16 * 2 * 8 = 4 
kB), but in `img_compare()` [1], you put this structure on the stack, 
and I believe it’s too big for that.

> +} ImgCmpStat;

[...]

> +static void cmp_stat_print_agenda(void)
> +{
> +    printf("Compare stats:\n"
> +           "Agenda\n"

I’m more used to the term “Key” for this, but my experience is mostly 
limited to the git-backport-diff output, so it’s not that strong.

> +           "D: DATA\n"
> +           "Z: ZERO\n"
> +           "A: ALLOCATED\n"
> +           "E: after end of file\n\n");
> +}

[...]

> @@ -1331,6 +1436,9 @@ static int img_compare(int argc, char **argv)
>       uint64_t progress_base;
>       bool image_opts = false;
>       bool force_share = false;
> +    ImgCmpStat stat = {0};

[1] (Here is where `ImgCmpStat` goes on the stack, which it shouldn’t, 
considering it’s over 40 kB in size.)

> +    bool do_stat;
> +    int64_t block_size = 0;
>   
>       cache = BDRV_DEFAULT_CACHE;
>       for (;;) {

[...]

> @@ -1395,6 +1505,15 @@ static int img_compare(int argc, char **argv)
>           case OPTION_IMAGE_OPTS:
>               image_opts = true;
>               break;
> +        case OPTION_STAT:
> +            do_stat = true;
> +            break;
> +        case OPTION_BLOCK_SIZE:
> +            block_size = cvtnum_full("block size", optarg, 1, INT64_MAX);
> +            if (block_size < 0) {
> +                exit(EXIT_SUCCESS);

Shouldn’t this be 2 instead of `EXIT_SUCCESS`?

(Above for --object we use `EXIT_SUCCESS`, but only for the case where a 
help text was printed.  When parsing fails, we exit with 2, which is 
documented as the error code (“>1”).)

> +            }
> +            break;
>           }
>       }
>   
> @@ -1410,6 +1529,20 @@ static int img_compare(int argc, char **argv)
>       filename1 = argv[optind++];
>       filename2 = argv[optind++];
>   
> +    if (!do_stat && block_size) {
> +        error_report("--block-size can be used only together with --stat");
> +        ret = 1;

2 is the error code, 1 means “success, but images differ”.

> +        goto out;

The `out` label frees `buf1` and `buf2`, and unrefs `blk1` and `blk2`.  
My gcc complains that `blk1` and `blk2` have not been initialized by 
this point, though.  I believe we should go to `out3` here.

> +    }
> +
> +    if (do_stat && !block_size) {
> +        /* TODO: make block-size optional */
> +        error_report("You must specify --block-size together with --stat");
> +        ret = 1;
> +        goto out;

Same here.

> +    }
> +
> +
>       /* Initialize before goto out */
>       qemu_progress_init(progress, 2.0);
>   

[...]

> @@ -1486,11 +1623,15 @@ static int img_compare(int argc, char **argv)
>               goto out;
>           }
>           allocated2 = status2 & BDRV_BLOCK_ALLOCATED;
> +        if (do_stat && (status2 & BDRV_BLOCK_DATA)) {
> +            /* Don't compare cross-block data */
> +            pnum2 = MIN(block_end, offset + pnum2) - offset;
> +        }
>   
>           assert(pnum1 && pnum2);
>           chunk = MIN(pnum1, pnum2);
>   
> -        if (strict) {
> +        if (strict && !do_stat) {

Question is, do we want to allow strict mode together with --stat at 
all?  I think I’d prefer making it an outright error.

Hanna

>               if (status1 != status2) {
>                   ret = 1;
>                   qprintf(quiet, "Strict mode: Offset %" PRId64


