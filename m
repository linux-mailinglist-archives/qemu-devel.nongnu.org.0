Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0F644EABC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:42:41 +0100 (CET)
Received: from localhost ([::1]:59794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYhM-0007Am-O5
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:42:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYg7-0006A5-9p
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:41:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYg5-000339-Dq
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636731680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULCgYqNfuZncLMcsUwtrcHVs0kdWj+5em5WxY2UzzJs=;
 b=VeuPhhWZXWMr3a+NxleLXFOevS//LfhqqLWpnOJRsxFIVsqLZthtkgE/nBnqDJYRukT7Sw
 hMcMgr2g+iMSIwnyuDl7VMQYlHg+NflYHiEPgMNSzckwc+aN7LDIsfRRkmHLVw94Xjwn11
 6YpMuYgJoRP1QCQ5lr08a++u4Oa5WIc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-6FzNMvScOvauyoYDOThgbA-1; Fri, 12 Nov 2021 10:41:19 -0500
X-MC-Unique: 6FzNMvScOvauyoYDOThgbA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c1-20020a05600c0ac100b00322fcaa2bc7so4460117wmr.4
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ULCgYqNfuZncLMcsUwtrcHVs0kdWj+5em5WxY2UzzJs=;
 b=0XJygXB9FKu0bhcCPb5MNb7G42U9rVZFIfFUycyHUDRFfHIGQmBz0lBH0fxbdZuRcu
 xbsyOP68YgSnZ1wrSHOXKUwUuGzv0/2NOKO+s6PrdWjA3eNU6tHJ+wn9/Pfe/ndvxaA+
 SNKRLnVpqagh/VetPkKXFOd5aPVRhAiA2sL3deggp/HQpFvl1Zov1drMSN5hPUhLnHfZ
 AD7TgcZnRWInFb/dp1G0RE5J6NSGthuGymIMhsm904jSkiP3hUhwCg0rZQHFv9gnjJXB
 CGYFNI4MXgdhQZQhXJsqXlOjOdxSut51d/jNKBWGCMYZrHF96DOu6DpsFA4qaPG9Nx22
 5Jkw==
X-Gm-Message-State: AOAM533FO/Hby0xuC1MaZCaAqV4CZS2xbjeLut4E80HK/Z84HG2i01f0
 RaPaPIqrFZCdR8gtaGZtgEgKXIa+3frqcyqT7Dy0DuzXufaybZBOs45UewxywYUzI/tIac25qBB
 LiEB+k5hZc6CLEe8=
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr20082078wri.350.1636731678413; 
 Fri, 12 Nov 2021 07:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWV7pxXmBROnoAHefzntJ3B4+V6QVqpPmem7oqx7Q77gCv9d6XueSw+oI5JZKK2tqBizDl1Q==
X-Received: by 2002:a5d:64e7:: with SMTP id g7mr20082038wri.350.1636731678214; 
 Fri, 12 Nov 2021 07:41:18 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id y6sm6525221wrh.18.2021.11.12.07.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:41:17 -0800 (PST)
Message-ID: <206c5528-1159-db71-9e58-bb615fe95eae@redhat.com>
Date: Fri, 12 Nov 2021 16:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 13/25] include/sysemu/blockdev.h: move drive_add and
 inline drive_def
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-14-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-14-eesposit@redhat.com>
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
> drive_add is only used in softmmu/vl.c, so it can be a static
> function there,and drive_def is only a particular use case of
> qemu_opts_parse_noisily, so it can be inlined.
>
> Also remove drive_mark_claimed_by_board, as it is only defined
> but not implemented (nor used) anywhere.
>
> This also helps simplifying next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block/monitor/block-hmp-cmds.c |  2 +-
>   blockdev.c                     | 27 +--------------------------
>   include/sysemu/blockdev.h      |  6 ++----
>   softmmu/vl.c                   | 25 ++++++++++++++++++++++++-
>   4 files changed, 28 insertions(+), 32 deletions(-)

[...]

> diff --git a/blockdev.c b/blockdev.c
> index c1f6171c6c..1bf49ef610 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -73,7 +73,7 @@ void bdrv_set_monitor_owned(BlockDriverState *bs)
>       QTAILQ_INSERT_TAIL(&monitor_bdrv_states, bs, monitor_list);
>   }
>   
> -static const char *const if_name[IF_COUNT] = {
> +const char *const if_name[IF_COUNT] = {

When making this global, I’d give its name a prefix, like 
`block_if_name` (or even `block_if_type_to_name`).

Hanna

>       [IF_NONE] = "none",
>       [IF_IDE] = "ide",
>       [IF_SCSI] = "scsi",


