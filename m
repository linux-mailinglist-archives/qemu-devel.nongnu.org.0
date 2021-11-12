Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4844E54F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 12:03:21 +0100 (CET)
Received: from localhost ([::1]:52458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlUL2-0003zd-3d
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 06:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlUJU-0002yy-Dj
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:01:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlUJR-0005b2-Gy
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 06:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636714900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgPWJhSVr+bHwAQzZOJWTR2/DFQRQEkrG0sF53DBTJE=;
 b=YFinweZzX2Jp7EjLEmc3NqNT5RSXyACBbPDj9d9NWBQczxoaSw9rmtbrLT6U/mtCxNxOTQ
 fXthVVYw6vYGr51+PxCoeLZTyJ+c3CzE+R/rtbC2nbcknwzVM7l81tXUzkGClLO57PX60F
 W9W0vw+2Vj1hEFX8cV0+jUTHF3hKZcQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-Oozv3cZkOE6m6ib-shVkxQ-1; Fri, 12 Nov 2021 06:01:39 -0500
X-MC-Unique: Oozv3cZkOE6m6ib-shVkxQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 m1-20020a1ca301000000b003231d5b3c4cso6118814wme.5
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 03:01:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xgPWJhSVr+bHwAQzZOJWTR2/DFQRQEkrG0sF53DBTJE=;
 b=UwGcQfFjt1W11nx+OkKPtO2eVJyDmmq5tJl+8cyijrXMW4D71n03Yi+E9Xwh75kTXh
 rofHtYwyfFBMQMxlC1gIrRrgGWONTP+WRB8EGaOTy6k1ssRW8JMd8p8OrPqg5xoBuCg3
 3eja4i3fmoDcmQlaF+BC380iwz2gtZIIoqjK+FEPVHRHj8dEO7XT0mJ+LhOaqRMaaaB3
 Pp1ChyQ2Ena/V3tzEiJgezbN5oPtG7YISQ9QtWIyARUwoJGm7vfEWXFxPySfmk0z9pD/
 kvlTN+qjx8mrqBX/WUKxi35EBZFKNYndBYvQiMFh8sbq1sVUF75IK0xjupuy3xsaes1T
 buKQ==
X-Gm-Message-State: AOAM531iT+PL8H1lobj5kdrY53vJMqJKx0UMEg3CI3Z6nGYZbW7Wd/3n
 E01c0XGw8naOOwaNnj1OcLM3viJv2M1KFfNSSkuTsHY4OTFLT195n5kKGaHoHJ97ej6AMxzlY9/
 s+ND666VamIAiCoE=
X-Received: by 2002:a5d:6481:: with SMTP id o1mr18065903wri.305.1636714898365; 
 Fri, 12 Nov 2021 03:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbnV3WsU3KLAbE8v71cWkr2IEC8roqywAvSHWH4dIAiQOPaOIH7f7ef6cj5upKbK6GfbsFqQ==
X-Received: by 2002:a5d:6481:: with SMTP id o1mr18065845wri.305.1636714898066; 
 Fri, 12 Nov 2021 03:01:38 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id z15sm5307936wrr.65.2021.11.12.03.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 03:01:37 -0800 (PST)
Message-ID: <af4875d8-33aa-1ba2-0559-3ecdc963d3bf@redhat.com>
Date: Fri, 12 Nov 2021 12:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 05/25] block/block-backend.c: assertions for
 block-backend
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-6-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-6-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/block-backend.c  | 90 +++++++++++++++++++++++++++++++++++++++++-
>   softmmu/qdev-monitor.c |  2 +
>   2 files changed, 91 insertions(+), 1 deletion(-)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 0afc03fd66..ed45576007 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c

[...]

> @@ -1550,6 +1596,7 @@ BlockAIOCB *blk_aio_pwritev(BlockBackend *blk, int64_t offset,
>   
>   void blk_aio_cancel(BlockAIOCB *acb)
>   {
> +    assert(qemu_in_main_thread());
>       bdrv_aio_cancel(acb);
>   }
>   

This function is in block-backend-io.h, though.

[...]

> @@ -1879,7 +1936,6 @@ void blk_invalidate_cache(BlockBackend *blk, Error **errp)
>   bool blk_is_inserted(BlockBackend *blk)
>   {
>       BlockDriverState *bs = blk_bs(blk);
> -
>       return bs && bdrv_is_inserted(bs);
>   }

Seems like an unrelated hunk.

[...]

> @@ -2443,11 +2529,13 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,

[…]

>   int blk_make_empty(BlockBackend *blk, Error **errp)
>   {
> +    assert(qemu_in_main_thread());
>       if (!blk_is_available(blk)) {
>           error_setg(errp, "No medium inserted");
>           return -ENOMEDIUM;

This function too is in block-backend-io.h.

Hanna


