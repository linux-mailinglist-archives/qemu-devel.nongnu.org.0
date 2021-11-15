Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85992450789
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:50:12 +0100 (CET)
Received: from localhost ([::1]:36840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdJD-0004pI-LY
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:50:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmdHW-0003jU-Vw
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmdHU-0006xg-9v
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:48:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636987703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8teoTd6mLJ9YVaRsBuXpIQFrqZkIxbahtZJ2Q/HgQAM=;
 b=WF2zdaohlUh3w/thzOrM0ENy7tPvaEd7s9bxa9/LzmchPCDXSi4JwIEu1D9OmEEVT0CrZm
 oZa6kh9MrHIub3jxvaAPRh3XJJ4if08IEGyqRoZDBfDkw+AGhRnq8lvAc4uQQul9e6U8S1
 nOOnqy9octCUsqEyG/57KkAEtka5B8U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-thxKDePdONuYRKGI8f-UBg-1; Mon, 15 Nov 2021 09:48:20 -0500
X-MC-Unique: thxKDePdONuYRKGI8f-UBg-1
Received: by mail-wr1-f72.google.com with SMTP id
 v18-20020a5d5912000000b001815910d2c0so3635965wrd.1
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 06:48:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8teoTd6mLJ9YVaRsBuXpIQFrqZkIxbahtZJ2Q/HgQAM=;
 b=NYFNPasj8q+VOQoECt/hWArVpO++HNyTZxDWoZbC/pCUs3wNzC1CzE5EoxLDiw2ITy
 gxszRU9uBJIYu57lWF80I94PGm65N1pXevRGwr7ByIEwwnt83+3zqIwkPmPE5eeroxhT
 KJyEtdp0bAsOT+zZ2OznXcE+rEubEdCJvqj49lgFsA9Ir17nSFh2UxPvRgdEHbI/1Nqf
 uLzY0Htcfa3KPBRcK9hTxUzl0LadvqFQIVeOYYleVCaFzYtNqHS252nCQJJsBHE9j2mJ
 u7XcIxBaeXBV0lmrj/s0Y2Cal+I7Fg9VCQYlrEwb1HHwQVEcW8TiRU7FcLj0crOkUfqf
 O9SQ==
X-Gm-Message-State: AOAM533u18WH65FTZg9Sbgsy1LK2xmGIb9NbuKNXAAolH9zTNoP+7ZUn
 rUn8REbLRMNPZYMjOebY7WWQW+YPZzdiMh9yQw7voV5GvEUM9zluSa7pRqn+SkH3Z+eHUDlGOYX
 d4qwSibLUA6tfjhs=
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr42075663wmq.168.1636987699203; 
 Mon, 15 Nov 2021 06:48:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlDlC+NnSuZAhv0uS8o/ZRHXMK97F20SPgqI+WY/0jW84Cu8aWmjSZ6p+8eduSXJ69N9qnIw==
X-Received: by 2002:a05:600c:4f87:: with SMTP id
 n7mr42075632wmq.168.1636987699054; 
 Mon, 15 Nov 2021 06:48:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id c6sm24554039wmq.46.2021.11.15.06.48.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 06:48:18 -0800 (PST)
Message-ID: <a97edfb2-9b02-3dc5-d419-c59635c33162@redhat.com>
Date: Mon, 15 Nov 2021 15:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 22/25] block_int-common.h: assertions in the callers of
 BdrvChildClass function pointers
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-23-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-23-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/block.c b/block.c
> index 40c4729b8d..da80e89ad4 100644
> --- a/block.c
> +++ b/block.c

[...]

> @@ -7173,6 +7182,7 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
>           return true;
>       }
>       *ignore = g_slist_prepend(*ignore, c);
> +    assert(qemu_in_main_thread());

It definitely isn’t wrong to place the assert() here, of course, but 
it’s an interesting place nonetheless.  In other places it seemed like 
you’d prefer to place it above the first non-declaration statement.  
Absolutely no need to change it if you don’t want to, just something 
that I noticed.

Hanna


