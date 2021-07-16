Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2363CB772
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 14:40:16 +0200 (CEST)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4N8Z-0002gY-Ur
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 08:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4N6t-0001nD-LD
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:38:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4N6p-00058T-WE
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 08:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626439107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGgfQ8isg6+3mSJaiCAcWwVEB+Y7JGHrAd2/c+Ebm/k=;
 b=BSA+nezU1sRacMGKsXzWWEb/RInFDeBiGInnk229icDGDp2+GiELxm3D7MmaK3Jv/ZQlNa
 bp3swAuEFl2RqRMOpooXnwlLAtyUwHgNsrCbKZhBMhJCAt9Zdmz+HO8xA2NRkhKCFYMX+F
 0axxgPL0gufXvEQSnwFeOQnIN4YZF1k=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-F099G9rMPiOEBjlVWvgvDA-1; Fri, 16 Jul 2021 08:38:23 -0400
X-MC-Unique: F099G9rMPiOEBjlVWvgvDA-1
Received: by mail-wr1-f72.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so4759354wrz.23
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 05:38:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XGgfQ8isg6+3mSJaiCAcWwVEB+Y7JGHrAd2/c+Ebm/k=;
 b=dKJEh7Cx2UVZP1UoqOMdyJvRO+KRwg4y1CQhiBjSrCs4WiictYMSEwF2KDPGlVgGGY
 1iJqzqCP0i/l5Iw4JVQbXRrTVtE2b048wEBuQNsS+WNk9Wqegz281+V2Flf9bHmUU9P3
 hwxilGZ2m+RVvCyoiFmriertxVvtVYjQ4Mq9lyV+4ENAwZxzflSVUp3JBlLNL9v7eavG
 BwYZkBLT9/5Lq81nAtAWtex96v0KsW8w40Go1ZsZwYdIdavonBZrXCsw2MeBP7/QrSDW
 UvMGuNIDWYnWSuwQR6tUtiXKWv4JkfwumDPEOpp/ObUlwHigC+gOLp8BOFdqm8wXxuMf
 O8HA==
X-Gm-Message-State: AOAM531Ayli8vDsCR3hBmqRcxroNAsyKg/hKFGoPp9ljtvRDgMgcsK3A
 6yY9fNLkbEX6fIzpqEW09XAVTUF1GXx4GXHNWwCTnNT3lj6ymcQpM6LHsINAvrYtSVk3IGjrqDb
 2pykmLB/MnWhSvqQ=
X-Received: by 2002:a1c:493:: with SMTP id 141mr10578075wme.172.1626439102366; 
 Fri, 16 Jul 2021 05:38:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz517E//3vPYORFKzporf8wz0FxvC8TPi5jeK06NhGnX/BkyjwWy7nE2sjXY9tJ0sT2UZV4qg==
X-Received: by 2002:a1c:493:: with SMTP id 141mr10578055wme.172.1626439102139; 
 Fri, 16 Jul 2021 05:38:22 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 b9sm12378213wrh.81.2021.07.16.05.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:38:21 -0700 (PDT)
Subject: Re: [PATCH 08/14] iotests/common.rc: _make_test_img(): smarter
 compressiont_type handling
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-9-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d983ae4a-dce5-35d3-1c63-7285651eae56@redhat.com>
Date: Fri, 16 Jul 2021 14:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-9-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: s/compressiont_type/compression_type/

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> Like it is done in iotests.py in qemu_img_create_prepare_args(), let's
> not follow compression_type=zstd of IMGOPTS if test creates image in
> old format.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/common.rc | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
> index cbbf6d7c7f..4cae5b2d70 100644
> --- a/tests/qemu-iotests/common.rc
> +++ b/tests/qemu-iotests/common.rc
> @@ -438,6 +438,14 @@ _make_test_img()
>               backing_file=$param
>               continue
>           elif $opts_param; then
> +            if [[ "$param" == *"compat=0"* ]]; then

Like in patch 2, probably should be 0.10, and account for “v2”.

> +                # If user specified zstd compression type in IMGOPTS, this will
> +                # just not work. So, let's imply forcing zlib compression when
> +                # test creates image in old version of the format.
> +                # Similarly works qemu_img_create_prepare_args() in iotests.py
> +                optstr=$(echo "$optstr" | $SED -e 's/compression_type=\w\+//')

What about the surrounding comma, if compression_type is just one option 
among others?  Do we need something like

$SED -e 's/,compression_type=\w\+//' -e 's/compression_type=\w\+,\?//'

?

> +                optstr=$(_optstr_add "$optstr" "compression_type=zlib")

As the comment says, this is for compression_type in $IMGOPTS and then 
compat=0.10 in the parameters.  It won’t work if you have e.g. 
“_make_test_img -o compat=0.10,compression_type=zstd”, because then this 
generates the optstr 
“$IMGOPTS,compression_type=zlib,compat=0.10,compression_type=zstd”. Not 
sure if we want to care about this case, but, well...

Then there’s the case where I have compat=0.10 in $IMGOPTS, and the test 
wants to use compression_type=zstd.  I think it’s correct not to replace 
compression_type=zstd then, because the test should be skipped for 
compat=0.10 in $IMGOPTS.  But that’s not what happens in the iotest.py 
version (qemu_img_create_prepare_args()), so I wonder whether the latter 
should be made to match this behavior here, if in any way possible.

Now that I think about it more, I begin to wonder more...

So this code doesn’t explicitly handle compression_type only in 
$IMGOPTS.  If you have

_make_test_img -o compression_type=zstd,compat=0.10

It’ll still keep the compression_type=zstd.  However, for

_make_test_img -o compression_type=zstd -o compat=0.10

It’ll replace it by zlib.

So perhaps we should explicitly scan for compression_type only in 
$IMGOPTS and then drop it from the optstr if compat=0.10 is in the 
_make_test_img's -o options.

But thinking further, this is not how $IMGOPTS work.  So far they aren’t 
advisory, they are mandatory.  If a test cannot work with something in 
$IMGOPTS, it has to be skipped.  Like, when you have compat=0.10 in 
$IMGOPTS, I don’t want to run tests that use v3 features and have them 
just create v3 images for those tests.

So my impression is that you’re giving compression_type special 
treatment here, and I don’t know why exactly.  Tests that create v2 
images should just have compression_type be an unsupported_imgopt.

Max

> +            fi
>               optstr=$(_optstr_add "$optstr" "$param")
>               opts_param=false
>               continue


