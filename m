Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585F13CB7CD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 15:19:52 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Nkt-0002CF-EK
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 09:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Nj9-000069-Bn
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:18:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Nj6-0000rZ-IM
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 09:18:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626441479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8rEacpTyRDJ0zo05Vqw73Qvjt14B+zVpE4pfuR+MeE=;
 b=X7Q1QknTKkkba0VSqDrIytSlGS5DBEGOIN/ft4llgmqJJk42JCzOulFs/1KbK2IEDwjqeS
 i7SgSN0Hqy3eewfuMEEPhkET5tHfZXh7fKeSOeKDMv9ZrHfXTVqltdJ+787j1Ev47ELd0p
 jOJxuGrhM70Y0QYSbYOWtG/HmtERbEM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-5zuTPq2WNNeX3JTaBFp4VQ-1; Fri, 16 Jul 2021 09:17:55 -0400
X-MC-Unique: 5zuTPq2WNNeX3JTaBFp4VQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 i12-20020adffc0c0000b0290140ab4d8389so4845320wrr.10
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 06:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C8rEacpTyRDJ0zo05Vqw73Qvjt14B+zVpE4pfuR+MeE=;
 b=d0LL70kIbtBEFPIVN1n1pf2VD5+q6iBURct5mPDrN+eZGSrKM+O7xy2q+7P3EFcY+R
 XQreN8hmNQkdFXivxFb5sqwvhTDeo08u4DJA/EJJDlKBj6kv5UAdbtOzghFktDGqbo7b
 KRpsA1lSyg2rZDRNcc6sMMzKh0l5CUyBp/YqYKdSBpV2CbmnYYUtYmi/zop20j/EmoVl
 Ocf+EJBi+4XKXqayDNFZsQuwao05IF4IrhYs33GIDib/IvptyFNLNkVqDvu8nuZOWP34
 pPdflm3QOzPh6bLVQyF5AF5Cy7FH0QjgxVLxqi/bb9b6ovFjcN9Gvo+eJ7vREKh/gWWn
 TzNQ==
X-Gm-Message-State: AOAM5327bBE0ko8WVWAirFQoRS6ef2f8QRRKb8i1cZaav9Ji+KE1/Gkr
 rfZ11YorHAUUKoPWO5ydCurHq8BNuVea+nXK/kKHmEi8L2iRYg8O0KdveOtn8BW7QRD8yo/ENxO
 TOG/kKCdBctZ+9EA=
X-Received: by 2002:a1c:48a:: with SMTP id 132mr16602631wme.157.1626441474718; 
 Fri, 16 Jul 2021 06:17:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMm3nzwfiwE0dvUf7hPZyUIfV/lTKPtM79mCbBl1OGFHNHjd+NGUDAz2iIywbSuX78RQJI1w==
X-Received: by 2002:a1c:48a:: with SMTP id 132mr16602602wme.157.1626441474505; 
 Fri, 16 Jul 2021 06:17:54 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 v15sm8460419wmj.11.2021.07.16.06.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 06:17:54 -0700 (PDT)
Subject: Re: [PATCH 11/14] iotests: bash tests: filter compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-12-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <9646362b-c01f-3ed8-b5c4-4fdefd9786eb@redhat.com>
Date: Fri, 16 Jul 2021 15:17:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-12-vsementsov@virtuozzo.com>
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
> test output is 287 (test for qcow2 compression type), so implement
> specific option for it.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/060.out       |  2 +-
>   tests/qemu-iotests/061.out       | 12 ++++++------
>   tests/qemu-iotests/082.out       | 14 +++++++-------
>   tests/qemu-iotests/198.out       |  4 ++--
>   tests/qemu-iotests/287           |  8 ++++----
>   tests/qemu-iotests/common.filter |  7 +++++++
>   tests/qemu-iotests/common.rc     | 14 +++++++++++++-
>   7 files changed, 40 insertions(+), 21 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
> index 268b749e2f..78efe3e4dd 100644
> --- a/tests/qemu-iotests/common.filter
> +++ b/tests/qemu-iotests/common.filter
> @@ -247,6 +247,7 @@ _filter_img_info()
>           -e "/block_state_zero: \\(on\\|off\\)/d" \
>           -e "/log_size: [0-9]\\+/d" \
>           -e "s/iters: [0-9]\\+/iters: 1024/" \
> +        -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
>           -e "s/uuid: [-a-f0-9]\\+/uuid: 00000000-0000-0000-0000-000000000000/" | \
>       while IFS='' read -r line; do
>           if [[ $format_specific == 1 ]]; then
> @@ -332,5 +333,11 @@ for fname in fnames:
>   sys.stdout.write(result)'
>   }
>   
> +_filter_qcow2_compression_type_bit()
> +{
> +    $SED -e 's/\(incompatible_features\s\+\)\[3\(, \)\?/\1[/' \
> +         -e 's/\(incompatible_features.*\), 3\]/\1]/'

What about “incompatble_features   [2, 3, 4]”?

I’d like to propose adding some form of filtering parameter to qcow2.py 
which allows filtering a specific bit from the qcow2_format.Flags64 
representation, but that seems rather difficult, actually...

> +}
> +
>   # make sure this script returns success
>   true
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index ee4b9d795e..813b51ee03 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -697,6 +697,7 @@ _img_info()
>               -e "s#$TEST_DIR#TEST_DIR#g" \
>               -e "s#$SOCK_DIR/fuse-#TEST_DIR/#g" \
>               -e "s#$IMGFMT#IMGFMT#g" \
> +            -e 's/\(compression type: \)\(zlib\|zstd\)/\1COMPRESSION_TYPE/' \
>               -e "/^disk size:/ D" \
>               -e "/actual-size/ D" | \
>           while IFS='' read -r line; do
> @@ -996,12 +997,23 @@ _require_one_device_of()
>   
>   _qcow2_dump_header()
>   {
> +    if [[ "$1" == "--no-filter-compression" ]]; then
> +        local filter_compression=0
> +        shift
> +    else
> +        local filter_compression=1
> +    fi
> +
>       img="$1"
>       if [ -z "$img" ]; then
>           img="$TEST_IMG"
>       fi
>   
> -    $PYTHON qcow2.py "$img" dump-header
> +    if [[ $filter_compression == 0 ]]; then
> +        $PYTHON qcow2.py "$img" dump-header
> +    else
> +        $PYTHON qcow2.py "$img" dump-header | _filter_qcow2_compression_type_bit
> +    fi
>   }
>   
>   # make sure this script returns success

Could have been done more extensibly for the future (i.e. a loop over 
the parameters, and a variable to invoke all applicable filters), but, 
well.  Not much reason to think about a future that we’re not sure will 
ever happen.

Max


