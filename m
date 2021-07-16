Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 141853CB726
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:10:00 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4MfG-0005yq-Pk
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Mdj-0004dC-FU
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:08:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Mdg-0002t5-NE
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:08:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626437299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=44VOIf+CUcRGeKO/ry7a9D7HnX2vs0oNGQ08f4fuQzw=;
 b=hF8glnxwFMjNLJ5K3JEkFVEtcNwPtTaaJ0p0J/+d0ooqCC4G/q+vQ6Su3biQ0HvtNowxSi
 4N+48zXVF4agKAx5vALp6gcm1jQ2Xr+cUxpdYOgvMbHbHy2jql/2Pssjj28QviURMQryTo
 QLlv5XteifPRd+5yttuH0miSTGwBGKA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-nen3atsHOJKvfh1avdousA-1; Fri, 16 Jul 2021 08:08:18 -0400
X-MC-Unique: nen3atsHOJKvfh1avdousA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d8-20020adf9c880000b0290141a87409b5so3922763wre.16
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=44VOIf+CUcRGeKO/ry7a9D7HnX2vs0oNGQ08f4fuQzw=;
 b=IgIXMsSeqd+J31ew7uO5G292zXXCtuKA/NqJx9IALYm+l5EW8+YCrXRXFu3AAYiOav
 vuPhEXZGINnjHio/IancG+IwZe5tn/HYdVdb/3+iwuFxDbfuyF2xwi8kajkcWzJDEom+
 u9MlGbfvAsLsGnDF0wyKck5gfhBNfBrfZPlY35G9KxB6jmPWQJ1yor38S73yrAujlF0w
 AWjE9u8Uw+yctulkFNN86qyfa15W3A5Wp9bUVlfqvpV+OKiyboWirxUziHzCPB8bAPzW
 ywU0TpRFie9ui2FIdG6CmXK9VWmMnhD55T8DGbEjOaoQ0+nLVB7wyEFCqVwdGc++GrvQ
 o6Ig==
X-Gm-Message-State: AOAM533kuiBkh0SgMXpm5gqEODF2O2vhyVpW4z1Gz//G5YxD3QygDQ0c
 Jcz9gVzOS6BLgxS4Nrquvaptami4H9iPsmH3JuswIR6ouWPhnAo89tTljdAjG91Hk7pk2UTyRnN
 MPt6ZbJ36Tz5qQgE=
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr15990777wmf.176.1626437297247; 
 Fri, 16 Jul 2021 05:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJUnu3YjMFFJxPFcf18ZoR3BDVQ2lfpnQOyP3LG41OWtM3WSA+65cvobLAodss2Ga7BIy1rw==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr15990734wmf.176.1626437296857; 
 Fri, 16 Jul 2021 05:08:16 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 c2sm9861867wrn.28.2021.07.16.05.08.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:08:16 -0700 (PDT)
Subject: Re: [PATCH 07/14] qcow2: simple case support for downgrading of qcow2
 images with zstd
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-8-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <ca28df05-0084-9107-b17b-bd0de4104363@redhat.com>
Date: Fri, 16 Jul 2021 14:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-8-vsementsov@virtuozzo.com>
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
> If image doesn't have any compressed cluster we can easily switch to
> zlib compression, which may allow to downgrade the image.
>
> That's mostly needed to support IMGOPTS='compression_type=zstd' in some
> iotests which do qcow2 downgrade.
>
> While being here also fix checkpatch complain against '#' in printf
> formatting.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/qcow2.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 2 deletions(-)
>
> diff --git a/block/qcow2.c b/block/qcow2.c
> index ee4530cdbd..bed3354474 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -5221,6 +5221,38 @@ static int qcow2_load_vmstate(BlockDriverState *bs, QEMUIOVector *qiov,
>                                           qiov->size, qiov, 0, 0);
>   }
>   
> +static int qcow2_has_compressed_clusters(BlockDriverState *bs)
> +{
> +    int64_t offset = 0;
> +    int64_t bytes = bdrv_getlength(bs);
> +
> +    if (bytes < 0) {
> +        return bytes;
> +    }
> +
> +    while (bytes != 0) {
> +        int ret;
> +        QCow2SubclusterType type;
> +        unsigned int cur_bytes = MIN(INT_MAX, bytes);
> +        uint64_t host_offset;
> +
> +        ret = qcow2_get_host_offset(bs, offset, &cur_bytes, &host_offset,
> +                                    &type);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +
> +        if (type == QCOW2_SUBCLUSTER_COMPRESSED) {
> +            return 1;
> +        }
> +
> +        offset += cur_bytes;
> +        bytes -= cur_bytes;
> +    }
> +
> +    return 0;
> +}
> +
>   /*
>    * Downgrades an image's version. To achieve this, any incompatible features
>    * have to be removed.
> @@ -5278,9 +5310,10 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
>        * the first place; if that happens nonetheless, returning -ENOTSUP is the
>        * best thing to do anyway */
>   
> -    if (s->incompatible_features) {
> +    if (s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION) {
>           error_setg(errp, "Cannot downgrade an image with incompatible features "
> -                   "%#" PRIx64 " set", s->incompatible_features);
> +                   "0x%" PRIx64 " set",
> +                   s->incompatible_features & ~QCOW2_INCOMPAT_COMPRESSION);
>           return -ENOTSUP;
>       }
>   
> @@ -5298,6 +5331,27 @@ static int qcow2_downgrade(BlockDriverState *bs, int target_version,
>           return ret;
>       }
>   
> +    if (s->incompatible_features & QCOW2_INCOMPAT_COMPRESSION) {
> +        ret = qcow2_has_compressed_clusters(bs);
> +        if (ret < 0) {
> +            error_setg(errp, "Failed to check block status");
> +            return -EINVAL;
> +        }
> +        if (ret) {
> +            error_setg(errp, "Cannot downgrade an image with zstd compression "

Perhaps s/zstd/non-zlib/?

Like, really “perhaps”.  Right now I think this is the better error 
message, it’s just that “non-zlib” is more technically correct and 
theoretically future-proof.

> +                       "type and existing compressed clusters");
> +            return -ENOTSUP;
> +        }
> +        /*
> +         * No compressed clusters for now, so just chose default zlib
> +         * compression.
> +         */
> +        s->incompatible_features = 0;

Not wrong, though I’d prefer

s->incompatible_features &= ~QCOW2_INCOMPAT_COMPRESSION;

Anyway:

Reviewed-by: Max Reitz <mreitz@redhat.com>

> +        s->compression_type = QCOW2_COMPRESSION_TYPE_ZLIB;
> +    }
> +
> +    assert(s->incompatible_features == 0);
> +
>       s->qcow_version = target_version;
>       ret = qcow2_update_header(bs);
>       if (ret < 0) {


