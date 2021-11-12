Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C9A44E666
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:32:02 +0100 (CET)
Received: from localhost ([::1]:54908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVir-0003YI-Cm
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:32:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVhX-0002jF-TL
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:30:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVhW-0001hz-2T
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636720237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ed5rdzvGKGIDyWa0w+gGqCyvD9zDl1auFtkLMUWnQek=;
 b=RV3zRifW0z8X4uJVBbELhSy8yHht61S7Bxl23ksd2ZXjYU5nC2ae+Y3HJ/w5TuXIIzWMjC
 BN7Ka09GnA+Y+UwFScutPvjVN4gxyTs+vEa9ZaGkd54Ykudgpl7OshnvEX46ZpYhkkVnvJ
 XypKwHP3vbo6SeFr1hZRrKwTDZApFes=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-YD_Nwv8JPmiAHQCS0_Z_sg-1; Fri, 12 Nov 2021 07:30:36 -0500
X-MC-Unique: YD_Nwv8JPmiAHQCS0_Z_sg-1
Received: by mail-wm1-f70.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso6231932wms.4
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 04:30:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ed5rdzvGKGIDyWa0w+gGqCyvD9zDl1auFtkLMUWnQek=;
 b=fzoOJyGXTMCBnUWZC2PJyxZwZC9/pkfzjMYC26S0TBAOi1vd7Bhc8bEhzy1jvY6teU
 ZxSfusnw+8Cpe3eE9+8DVnythdA3jFUIJoYh170CDneNgWfNTShb5wiQcOJ4DiQ0ON5V
 QbGC2do8tirLO7y91M+K8frVZKkUDDldz9f/ngBntCnewdCu6tNUT4BHlT3GZpcpiqtI
 DLmC2wwJyfzOzgx3LuF07djrQzmk4jn0iXOlOYSvgiyxPH9zbYBBFcRDWj5da1rBy53Q
 GIzHD+TKTq1uAUeofTjVo5viUp0Z3SxfUkbECwFHpcR/57ggJYQuOah+ZQb5NG8u6Jbj
 Puvw==
X-Gm-Message-State: AOAM532p37KEx/fXG6lrJBKoFpax1phi2ciN/Ksi3FtAlaENsckAvsA9
 KpOekRTPKMe0RpQYaTAa+rBV7GM71Hf0OMQPMvPS266L4ktCAlW4E5QBMy1nB0YSatPWaGd5cKg
 nRjowESLgB0nk0t4=
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr18667283wrs.266.1636720234931; 
 Fri, 12 Nov 2021 04:30:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVXnsUbIQyyoSs059FXh7lXIgXQe1zAW1Kc4KaO+N3knWcWAZZiYhNbfrfz5sVFBgffY9J1g==
X-Received: by 2002:a5d:6d84:: with SMTP id l4mr18667231wrs.266.1636720234617; 
 Fri, 12 Nov 2021 04:30:34 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id n32sm13225948wms.1.2021.11.12.04.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 04:30:34 -0800 (PST)
Message-ID: <5a92135c-5d41-96e4-bcd1-68f0cbb0e0b4@redhat.com>
Date: Fri, 12 Nov 2021 13:30:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-5-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-5-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> Similarly to the previous patches, split block-backend.h
> in block-backend-io.h and block-backend-global-state.h
>
> In addition, remove "block/block.h" include as it seems
> it is not necessary anymore, together with "qemu/iov.h"
>
> block-backend-common.h contains the structures shared between
> the two headers, and the functions that can't be categorized as
> I/O or global state.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c                       |   9 +-
>   include/sysemu/block-backend-common.h       |  74 ++++++
>   include/sysemu/block-backend-global-state.h | 122 +++++++++
>   include/sysemu/block-backend-io.h           | 139 ++++++++++
>   include/sysemu/block-backend.h              | 269 +-------------------
>   5 files changed, 344 insertions(+), 269 deletions(-)
>   create mode 100644 include/sysemu/block-backend-common.h
>   create mode 100644 include/sysemu/block-backend-global-state.h
>   create mode 100644 include/sysemu/block-backend-io.h

[...]

> diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
> index e5e1524f06..038be9fc40 100644
> --- a/include/sysemu/block-backend.h
> +++ b/include/sysemu/block-backend.h
> @@ -13,272 +13,9 @@
>   #ifndef BLOCK_BACKEND_H
>   #define BLOCK_BACKEND_H
>   
> -#include "qemu/iov.h"
> -#include "block/throttle-groups.h"
> +#include "block-backend-global-state.h"
> +#include "block-backend-io.h"
>   
> -/*
> - * TODO Have to include block/block.h for a bunch of block layer
> - * types.  Unfortunately, this pulls in the whole BlockDriverState
> - * API, which we don't want used by many BlockBackend users.  Some of
> - * the types belong here, and the rest should be split into a common
> - * header and one for the BlockDriverState API.
> - */
> -#include "block/block.h"

This note and the include is gone.  Sounds like something positive, but 
why is this possible?

Hanna


