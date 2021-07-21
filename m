Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F42163D1970
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:54:52 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6KAx-0006c2-2S
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m6KA8-0005eV-PO
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:53:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1m6KA5-0007rf-Ja
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 17:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626904431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSF5BwIdZyuC1QsXSPJbH73L1lL1+FI0zu8HxMtU4hI=;
 b=EFhQPlsnsmJVI9kSPoVG2gV7U9/SspxM/MHtzFSSilePT3m2IHcP2PTKZxJgd+A6HncskP
 HdJxQmyRqv7/Gcp0KJQBeZxyGAY9IR/osD4GgJmWycL6bxbecy+s7wdS0U+8ArSeEj330m
 Jp5DoGVOiudsUqSyOWGprP3kR54Om68=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-AdIjKirYO8qyXQoToFqvqw-1; Wed, 21 Jul 2021 17:53:50 -0400
X-MC-Unique: AdIjKirYO8qyXQoToFqvqw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020a5d49890000b02901524df25ad7so1538521wrq.8
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 14:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fSF5BwIdZyuC1QsXSPJbH73L1lL1+FI0zu8HxMtU4hI=;
 b=hX5+LHsBZBEbR+OJXyUCxLLIsKeXgtGNVNfwO0IgV81I99RtLId2UI+xN9fGuyntE7
 wo0X9itygyGrFiWeBe3ZPIDDt00A0c7Kja97Xo4uBKLI4suJHZ02WKCo/2VvSGcrHgBj
 ab5obzUjvphIXVAH5kAsofejTChWW6Id2W4MZohbwmgsw2PQiiO4EcBjTGvFPpokiqyG
 TJs2272OSmdenSZrKVXmDzaCYJEFvriju5gj08dIjVc/9wbgmGOb8JcEl/NAXRPg3/fD
 OgZvgzISl6RZylHygXxyp2ca73GYXiMvf33Hpg6B0Dpu9qiJBw+Vg+TmkLTH/AkfX48N
 sruw==
X-Gm-Message-State: AOAM532oIC6t42k9S5pdU+QI0Fob3TXKYGpYcxLhTmNGGDRWG4YjcO5s
 PhkgZv4jSnQHIzodMoQNZ0lSarpNTJ32X/M5QPFVlcGjE7VAIJygwQIXfPhRtyueKvPMBwirOkZ
 TBKAliLyVI7Yb/Lc=
X-Received: by 2002:adf:f9c9:: with SMTP id w9mr44049381wrr.107.1626904429016; 
 Wed, 21 Jul 2021 14:53:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ9g/XJoYICNg2LnIzLdIknYHcHyh8Cm+t3Ucc7kOYDERIustQGD6+FNa9Vo2BkUoCzhM60A==
X-Received: by 2002:adf:f9c9:: with SMTP id w9mr44049360wrr.107.1626904428736; 
 Wed, 21 Jul 2021 14:53:48 -0700 (PDT)
Received: from [192.168.1.154] (93-173-255-129.bb.netvision.net.il.
 [93.173.255.129])
 by smtp.gmail.com with ESMTPSA id p9sm17557712wrj.54.2021.07.21.14.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 14:53:48 -0700 (PDT)
Subject: Re: [PATCH for-6.1?] iotest: Further enhance qemu-img-bitmaps
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210721204616.652155-1-eblake@redhat.com>
From: Nir Soffer <nsoffer@redhat.com>
Message-ID: <deb2acd6-d587-8dba-e6f3-66f0b6460bf0@redhat.com>
Date: Thu, 22 Jul 2021 00:53:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210721204616.652155-1-eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.117, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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

On 7/21/21 11:46 PM, Eric Blake wrote:
> Add a regression test to make sure we detect attempts to use 'qemu-img
> bitmap' to modify an in-use local file.
> 
> Suggested-by: Nir Soffer <nsoffer@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> 
> Sadly, this missed my bitmaps pull request today.  If there's any
> reason to respin that pull request, I'm inclined to add this in, as it
> just touches the iotests; otherwise, if it slips to 6.2 it's not too
> bad.
> 
>   tests/qemu-iotests/tests/qemu-img-bitmaps     | 6 ++++++
>   tests/qemu-iotests/tests/qemu-img-bitmaps.out | 5 +++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
> index 7a3fe8c3d37a..3b6fade11735 100755
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
> @@ -129,6 +129,12 @@ $QEMU_IMG map --output=json --image-opts \
>   $QEMU_IMG map --output=json --image-opts \
>       "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map
> 
> +echo
> +echo "=== bitmap command fails to modify image already in use ==="
> +echo
> +
> +$QEMU_IMG bitmap --add "$TEST_IMG" b4 2>&1 | _filter_testdir
> +
>   nbd_server_stop
> 
>   echo
> diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> index e851f0320ecb..c6e12dd700aa 100644
> --- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> +++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
> @@ -116,6 +116,11 @@ Format specific information:
>   { "start": 2097152, "length": 1048576, "depth": 0, "present": false, "zero": false, "data": false},
>   { "start": 3145728, "length": 7340032, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
> 
> +=== bitmap command fails to modify image already in use ===
> +
> +qemu-img: Could not open 'TEST_DIR/t.qcow2': Failed to get "write" lock
> +Is another process using the image [TEST_DIR/t.qcow2]?
> +
>   === Check handling of inconsistent bitmap ===
> 
>   image: TEST_DIR/t.IMGFMT
> 

It would be nice to test more than --add. I guess the implementation
is shared but if someone change it the test will protect us.

Reviewed-by: Nir Soffer <nsoffer@redhat.com>


