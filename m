Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193449C9BC
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:32:42 +0100 (CET)
Received: from localhost ([::1]:54422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChTc-0008Lv-Ve
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:32:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChQu-0006lJ-R5
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:29:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChQt-0003cT-1G
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:29:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643200189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSmfy2lO6BOxA9ibXIEKSyEr58CxVucCvmLzQrwH2UA=;
 b=dNrEY5q6S9oyf4Dl9ngzm9QsWzl9Rq1nbhGzIX2KQwIfrqrW69tGG8j747tL71b2o/CeTw
 mF3RtZbDqFVk/CUtqNLOQ5439QE21jN2qYdreKas6alT399RuBQ5zj7wstskpUxKC7IirQ
 +gOv8NdxH9uTnSQXXBXPxg1Nz99AAMM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-GLw1mZeDNSK-72tBvFzL4A-1; Wed, 26 Jan 2022 07:29:48 -0500
X-MC-Unique: GLw1mZeDNSK-72tBvFzL4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 q71-20020a1ca74a000000b003507f38e330so2435164wme.9
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OSmfy2lO6BOxA9ibXIEKSyEr58CxVucCvmLzQrwH2UA=;
 b=HgvvU8nriIEtXGm/Sq8RNK5nR6CQXU+snP/z4PpXi7Eytbfx5Yg8iEjQNYKzE7U8Ev
 TqGSFEW88YsxUvalz5l4geC3uX0PsrclgZcEPy2XTLPsFF39iNpmot3RnbdrJVffMRur
 MD4OzYH1ZEvjgrPYHdi/doQrjSmYMoMWl69+1yoCrURlP3tmgwSiRtGuMNUEKHic5CPZ
 uDhjzFWvxmH/d+y9lDq5kw+7k3TzIBMx9puOAXo1+/Mvn/itiuxfGbUMExoqDsSspMUV
 ZVF9j9MKV2X49II97HSgVH6s5v6xq+1AjspX6HYClTZ53ouUtNQaVMdSGkFYqrGwTEhJ
 HIUQ==
X-Gm-Message-State: AOAM531vG9P0Qul+3POm7VoiWGxvuFwDMRK341WN+NLi1IT/CtRowmRg
 2Q6vOAYk8+YZkhxu0JTO7/Jr05qUmoygE8kOECyt0bjLhY1k835yrMToT4gmv6Uf8g7Tdis4IhF
 oaWRRiQC9zNR52Yo=
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr22306624wri.345.1643200187733; 
 Wed, 26 Jan 2022 04:29:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy/SuH2RCdDkky9PbEuvELEZw5OWcSQ+IMkmLUSgvl4RM58mLyFBkP79hTE88K64eyWe7BiFA==
X-Received: by 2002:a5d:6d4f:: with SMTP id k15mr22306592wri.345.1643200187529; 
 Wed, 26 Jan 2022 04:29:47 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o8sm2849371wmc.46.2022.01.26.04.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:29:47 -0800 (PST)
Message-ID: <2cf5b7da-c1d1-1543-cdcc-be253bb37aad@redhat.com>
Date: Wed, 26 Jan 2022 13:29:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 23/33] block_int-common.h: split function pointers in
 BlockDriver
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-24-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-24-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Similar to the header split, also the function pointers in BlockDriver
> can be split in I/O and global state.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/block_int-common.h | 434 ++++++++++++++++---------------
>   1 file changed, 231 insertions(+), 203 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index 70534f94ae..e007dbf768 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h

[...]

> @@ -159,7 +148,66 @@ struct BlockDriver {

[...]

> +    /*
> +     * Global state (GS) API. These functions run under the BQL lock.
> +     *
> +     * See include/block/block-global-state.h for more information about
> +     * the GS API.
> +     */
> +
> +    /*
> +     * Return true if @to_replace can be replaced by a BDS with the
> +     * same data as @bs without it affecting @bs's behavior (that is,
> +     * without it being visible to @bs's parents).
> +     */
> +    bool (*bdrv_recurse_can_replace)(BlockDriverState *bs,
> +                                     BlockDriverState *to_replace);
> +
> +    int (*bdrv_probe)(const uint8_t *buf, int buf_size, const char *filename);

Considering that its only caller (bdrv_probe_all()) is now an I/O 
function, shouldn’t this be, too?

Hanna


