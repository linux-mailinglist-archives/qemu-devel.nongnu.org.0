Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309CD53FEC2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:28:08 +0200 (CEST)
Received: from localhost ([::1]:48770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyYJb-0002xO-8V
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyY3y-0006zY-Ju
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 08:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyY3t-0005it-PD
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 08:11:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654603913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yYS/aqTColfq7mavFI4QmOrup+y9SpG/O9LadVXCLrU=;
 b=DBRxcZKFzS5ttSrw0mlClbMMOM2entfTvdMxwYr9GLvXm3Iv9Yyi1hBGQINBWfddf2/9qq
 rdXfh+QtpmPOUTyM6mjuyoCUNaR/m8sqTzgNzTkhw5FMT0JKXHftQeGLg9wcfuTXrRh7OO
 FfqSD/nSsza5PrqBP/6J7T8uQBaGzrw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-SwHYp55lPp6GP537gxjeUA-1; Tue, 07 Jun 2022 08:11:52 -0400
X-MC-Unique: SwHYp55lPp6GP537gxjeUA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n18-20020a05600c3b9200b0039746f3d9faso5711159wms.4
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 05:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yYS/aqTColfq7mavFI4QmOrup+y9SpG/O9LadVXCLrU=;
 b=X2yumE0RYPPgivYKYBPK1HEnSxkd/C9OmUV1+iR2IhB8HjtAw4QBi+pTHIJWMkyvcL
 XSWKdXoWJaTaSGVcEhRs+N+A7NFRuHd1v3raEVB78vq/38E0P/qXdVv7DBma8RqIBdaz
 WpEC6ZS2/xTZkUeiZ8XYPgWzO/rvpmTISmzoYnjDtaI39w0MQh24htR2dhI2V+w9PXHW
 v1PiY+fNz8/vrBc8pzD+Y+/UFpcHd2tsiMGMu29pb1KaWoOQvTgJeMlMNeDXvL5+HV2K
 LlT0sal0a9UpYhtdoBFYBMGfI4OEq1J0Rlnbw54PK0mWaFbePsR5nNkXckQzPJNC2oGE
 uA0A==
X-Gm-Message-State: AOAM531j+zssZEbGYw8OtE7uHj4e8S0AYWtzjN6Fr82H5OsQh+yJaNsh
 1Q0f78aeLzK1HDxBOuCw8VaITYaM7qEwJoIMoMivvAOc/tCLujmdLic0EjI9A10igxEn2xYZHLx
 mfdSnKd0nv7txeeY=
X-Received: by 2002:a7b:c10d:0:b0:39c:4a17:1e90 with SMTP id
 w13-20020a7bc10d000000b0039c4a171e90mr14818718wmi.108.1654603909981; 
 Tue, 07 Jun 2022 05:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfMMc6JI38A+NU3AsX8Ba3GfV0nvFlAgaEWSkiw/HM5xglJy7cxRZCSFnufnXqp6nC01smYQ==
X-Received: by 2002:a7b:c10d:0:b0:39c:4a17:1e90 with SMTP id
 w13-20020a7bc10d000000b0039c4a171e90mr14818658wmi.108.1654603909362; 
 Tue, 07 Jun 2022 05:11:49 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a7bc407000000b00397402ae674sm1860624wmi.11.2022.06.07.05.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 05:11:48 -0700 (PDT)
Message-ID: <cda0091d-65ac-f23a-4e12-7b681d655ea2@redhat.com>
Date: Tue, 7 Jun 2022 14:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 07/45] block: document connection between child roles
 and bs->backing/bs->file
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-8-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-8-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Make the informal rules formal. In further commit we'll add
> corresponding assertions.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   include/block/block-common.h | 42 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
>
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index fdb7306e78..2687a2519c 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -313,6 +313,48 @@ enum {
>    *
>    * At least one of DATA, METADATA, FILTERED, or COW must be set for
>    * every child.
> + *
> + *
> + * = Connection with bs->children, bs->file and bs->backing fields =
> + *
> + * 1. Filters
> + *
> + * Filter drivers has drv->is_filter = true.

s/has/have/

> + *
> + * Filter driver has exactly one FILTERED|PRIMARY child, any may have other

s/Filter driver/A filter node/?

And s/any/and/, I think.

> + * children which must not have these bits (the example is copy-before-write
> + * filter that also has target DATA child).

Mild style suggestion: “one example is the copy-before write filter, 
which also has its target DATA child”

> + *
> + * Filter driver never has COW children.

Maybe “Filter nodes never have COW children.”?

> + *
> + * For all filters except for mirror_top and commit_top, the filtered child is
> + * linked in bs->file, bs->backing is NULL.
> + *
> + * For mirror_top and commit_top filtered child is linked in bs->backing and

s/commit_top filtered/commit_top, the filtered/ (like in the paragraph 
above)

> + * their bs->file is NULL. These two filters has drv->filtered_child_is_backing

s/has/have/

> + * = true.

This also applies to the two test drivers in test-bdrv-graph-mod; should 
that be mentioned, too?

Or should we just link to filtered_child_is_backing when it comes to the 
list of drivers for which this applies, e.g. by rephrasing the two 
paragraphs as follows:

For most filters, the filtered child is linked in bs->file, bs->backing 
is NULL.  For some filters (as an exception), it is the other way 
around; those drivers will have drv->filtered_child_is_backing set to 
true (see that field’s documentation for what drivers this concerns).

(Just so we don’t duplicate the list of drivers.)

> + *
> + * 2. "raw" driver (block/raw-format.c)
> + *
> + * Formally it's not a filter (drv->is_filter = false)
> + *
> + * bs->backing is always NULL
> + *
> + * Only has one child, linked in bs->file. It's role is either FILTERED|PRIMARY

s/it's/its/

> + * (like filter) either DATA|PRIMARY depending on options.

s/either/or/

> + *
> + * 3. Other drivers
> + *
> + * Doesn't have any FILTERED children.

s/Doesn't/Don't/ (because “drivers” was in plural)

> + *
> + * May have at most one COW child. In this case it's linked in bs->backing.
> + * Otherwise bs->backing is NULL. COW child is never PRIMARY.
> + *
> + * May have at most one PRIMARY child. In this case it's linked in bs->file.
> + * Otherwise bs->file is NULL.
> + *
> + * May also have some other children that don't have neither PRIMARY nor COW
> + * bits set.

I think either “that don't have the PRIMARY or COW bit set" or "that 
have neither the PRIMARY nor the COW bit set".

>    */
>   enum BdrvChildRoleBits {
>       /*

Aside from typo/style nit picks, sounds good!


