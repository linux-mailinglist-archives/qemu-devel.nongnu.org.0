Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3CE4DC483
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:11:02 +0100 (CET)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUo21-0004qq-Lj
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:11:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUo0T-0003xj-6q
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nUo0Q-0005oc-LY
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:09:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647515361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zcibYwCcTwjLz+LjsFZDZYRuqQZHi5CYT8JuPlCn8qI=;
 b=jJCCzrRm0go0pDErj701/STGKF1M6Zo5g07b5C4o6smwrVlWeJdqkqRlpPb+sgK2pBnuaI
 Og9kULv5uhtq1A0lLb5FRiSJpS98r/Xbq1NMbOz4UwkVpAD/9R/s2AwoLwcpabXdk/NncN
 LPT6GXMf5oA7E6Vz+nhmhlKaZ511KQY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-GCVTAonLPLCr454VPXQTzg-1; Thu, 17 Mar 2022 07:09:18 -0400
X-MC-Unique: GCVTAonLPLCr454VPXQTzg-1
Received: by mail-ej1-f70.google.com with SMTP id
 k16-20020a17090632d000b006ae1cdb0f07so2725488ejk.16
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:09:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zcibYwCcTwjLz+LjsFZDZYRuqQZHi5CYT8JuPlCn8qI=;
 b=ZLozb9qH/G08dzcq7+4+Sws2U2iDVgk/uB1nTzbjzCmYUf3ZVswuS8kwPuSMbyvMc7
 iXq807TieBoarqNl19Ww4tGWywRfWSdsIcDbP8DPxibw3P8YKuvE/zog1U3K2lnAitCG
 HF71i0xFwnxvsVAGShT8JvGoyVjUcJ8YQ5FVnbCXLZlvXQBKomcmfpA2q4lTauO7XmLX
 fXfU7Uxdcb4jIrCqiSbH4TFotRApbDU2RHAnui7H6D7UnTYBmOEGcdeDm0pEPs6zSpKa
 B/pVhINgsLsB7wCJeF3HGF9CnzBpWpb+5nuuds2SK6egzsq+kQeBsuWsrpO9ZRpD9ygm
 dmJA==
X-Gm-Message-State: AOAM533t+nuciht8jHXhEirJzRbXx3Xjp+wy6dnhMNR/6QLKTUVEzJi6
 YzyQE8ROiD5gUZK8N1XIlQkXZhC5W5B2oImBFhXQnpZ4uRFSxFL+2LvkXV6XG7OXq6yNKJ5dJuA
 wtaMuNRjPpjlyP1k=
X-Received: by 2002:a05:6402:2987:b0:414:39b0:7fc1 with SMTP id
 eq7-20020a056402298700b0041439b07fc1mr3787905edb.214.1647515357224; 
 Thu, 17 Mar 2022 04:09:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrMd16Gj55t5w5V8eaEV5NAEXuB3lgMO6ONRqQKwwWlNi6MAfXxMhqDC+GIeAR3u0AcFbD0w==
X-Received: by 2002:a05:6402:2987:b0:414:39b0:7fc1 with SMTP id
 eq7-20020a056402298700b0041439b07fc1mr3787880edb.214.1647515356999; 
 Thu, 17 Mar 2022 04:09:16 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm2201541ejz.57.2022.03.17.04.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Mar 2022 04:09:16 -0700 (PDT)
Message-ID: <8df888e9-ff8e-507a-a36a-dfe798853a4a@redhat.com>
Date: Thu, 17 Mar 2022 12:09:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/14] iotests: add qemu_img_info()
To: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
References: <20220309035407.1848654-1-jsnow@redhat.com>
 <20220309035407.1848654-4-jsnow@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220309035407.1848654-4-jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.03.22 04:53, John Snow wrote:
> Add qemu_img_info() by analogy with qemu_img_measure() and
> qemu_img_check(). Modify image_size() to use this function instead to
> take advantage of the better diagnostic information on failure provided
> (ultimately) by qemu_img().
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>   tests/qemu-iotests/065        |  5 ++---
>   tests/qemu-iotests/242        |  5 ++---
>   tests/qemu-iotests/iotests.py | 15 +++++++++++----
>   3 files changed, 15 insertions(+), 10 deletions(-)

[...]

> diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
> index 7b37938d45..62f82281a9 100644
> --- a/tests/qemu-iotests/iotests.py
> +++ b/tests/qemu-iotests/iotests.py

[...]

> @@ -570,10 +573,14 @@ def create_image(name, size):
>               file.write(sector)
>               i = i + 512
>   
> -def image_size(img):
> -    '''Return image's virtual size'''
> -    r = qemu_img_pipe('info', '--output=json', '-f', imgfmt, img)
> -    return json.loads(r)['virtual-size']
> +def image_size(img: str) -> int:
> +    """Return image's virtual size"""
> +    value = qemu_img_info('-f', imgfmt, img)['virtual-size']
> +    if not isinstance(value, int):
> +        type_name = type(value).__name__
> +        raise TypeError("Expected 'int' for 'virtual-size', "
> +                        f"got '{value}' of type '{type_name}'")
> +    return value

Bit overkill for my taste for the scope of iotests.py, but if you want 
to go the extra mile, I’m not stopping you.

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


