Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E11ED68DC78
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:08:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPPYy-00010n-UA; Tue, 07 Feb 2023 10:07:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPPYw-000101-KP
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:07:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPPYu-0007Ji-4M
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:07:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675782430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qyOcUB1C5vlkOxgJnTPeTFdMsOGBzb/pp2rjHVDWb2A=;
 b=YYzAEeRXsptIEj2de98E6GSTehgeH0pxA4gTxt7liasnpNmZzrzSCKvhoyhzEH6ryHCiUO
 ty0oLx1Qs+oHrYm+AxHIW3KDu1n6aUULHn9qgoEayEgm+mphco0BoruLpVyjp2Gyi4r4KM
 GCe9pjFpOC4pf9/Uq09AsrIvtJPNZU0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-161-Bu6ZJ9PHMKWC1xZubDk3Mw-1; Tue, 07 Feb 2023 10:07:09 -0500
X-MC-Unique: Bu6ZJ9PHMKWC1xZubDk3Mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 d18-20020a05600c34d200b003df901ab982so7348445wmq.4
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qyOcUB1C5vlkOxgJnTPeTFdMsOGBzb/pp2rjHVDWb2A=;
 b=twLPxbnjMnECNZKXep2FUum5PkwI+yQFrpw1R62gd75LGVIxffcfzdfxoGU1lYKLZM
 7VZjRRsN/hMrWx/PG/t2YOse5fdvca5PnQdKLPq+DGgBI7gpfyxvadBEbgMH/U7MzMzs
 HTxkI0nUJcAsgIDkVdX4tiFvRgxA9nuqtg6sy3GqsGtOLL2KHXWrFvA7mP522eA2ZcLs
 MnnkEiYgMVjMP1vqOfdYZtoBkLHnbfC82ecYtUBcad6h7/8sTRcvLGNoQQ9BjKRrnu3S
 dzRHtGo5F3Id6KPYa5Cwi1zkMklfXiPvQZGFdMsFOBtlLzM9J1iDmXiFK0gBF+cs4B4k
 hWBA==
X-Gm-Message-State: AO0yUKXBKDMFsvqQGhZlIKRelAehmNDH7bBObTIU8cjcEY15ZqHxO5zN
 vdfWBM2TzB4RkZEVvKm6TvU1b4p0BSFJ7gcXAAL+7gbx2Rblti7N1OawY11TqOA/+u9FwFfDgzs
 1cra2Onli39BraNU=
X-Received: by 2002:adf:e3c3:0:b0:2bf:ae19:d8e4 with SMTP id
 k3-20020adfe3c3000000b002bfae19d8e4mr3126402wrm.16.1675782428036; 
 Tue, 07 Feb 2023 07:07:08 -0800 (PST)
X-Google-Smtp-Source: AK7set93SAPrjsRjCGXScBqeGBX1tBxNgtc3E7NhAu2HzqBCZKpxCuuJUyAHj6hDUePErsCZJ8BQ9g==
X-Received: by 2002:adf:e3c3:0:b0:2bf:ae19:d8e4 with SMTP id
 k3-20020adfe3c3000000b002bfae19d8e4mr3126372wrm.16.1675782427708; 
 Tue, 07 Feb 2023 07:07:07 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 a10-20020adfdd0a000000b002c3f7dfd15csm1264100wrm.32.2023.02.07.07.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:07:06 -0800 (PST)
Message-ID: <7fac7a1c-3710-33e7-9ac3-856dce33ca03@redhat.com>
Date: Tue, 7 Feb 2023 16:07:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 00/13] block: Fix bdrv_open*() calls from coroutine context
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: eesposit@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230126172432.436111-1-kwolf@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 26.01.23 18:24, Kevin Wolf wrote:
> bdrv_open*() must not be called from coroutine context, amongst others
> because it modifies the block graph. However, some functions - in
> particular all .bdrv_co_create* implementations of image formats - do
> call it from coroutine context. This is already wrong today, but when we
> add locking, it actually becomes visible.
>
> This series adds no_co_wrapper functions, which are automatically
> generated wrappers that run in coroutine context and use a BH to call
> the wrapped function outside of coroutine context. It then uses these
> wrappers to fix the problematic bdrv_open*() calls.

Reviewed-by: Hanna Czenczek <hreitz@redhat.com>


