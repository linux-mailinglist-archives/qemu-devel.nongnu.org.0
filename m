Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD1867DF2F
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 09:31:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLK8V-0005g1-GH; Fri, 27 Jan 2023 03:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pLK8S-0005fS-W2
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:31:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pLK8R-0003lb-BE
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 03:31:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674808256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zm8Ocg33vwTsi+8l869ov4qfqiZvruUqAHKsNTptRZ0=;
 b=OkJkIdwikSLYTbaEDMyUZTXV37CjWjMny3R5uf6TUVp9VJr83JtO2fG6dWBtmpabFCVBtC
 jhnBLrSZQJ5mZKGG4BIvSQSoEDukakUvJJ/FGcwNyqVVnVaaN4/NA4YGlEfw5CTItz8yG3
 qWu7aGalMSS9E4qDPdBEtjP8Qh+DI/w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-85-SfS3B8UJPHi8BR6MkY0fGA-1; Fri, 27 Jan 2023 03:30:54 -0500
X-MC-Unique: SfS3B8UJPHi8BR6MkY0fGA-1
Received: by mail-qv1-f69.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso2470197qvr.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 00:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zm8Ocg33vwTsi+8l869ov4qfqiZvruUqAHKsNTptRZ0=;
 b=rUgN0/e5fdv7HgsGcBpdGc0fxuvIyUAmJa3zVyK8yVcWqwCMUosG8tKKV6QiSHARXV
 SCaD/V9loqP1mXEDBPUvnnDdDXTgptdvlG8WTpKQNyY8vOuGC1jF9E1bgEwOwZUoaKP6
 Dw4ZYFrEQU00h93eSXNme85A+0BNgY/Utd9EpRYf1lQv+LsXFcDOa0N/KYR4+6V+6mCJ
 ErrsFcpk4NBjol/aCHPu9GJYY+2rmA1jNI1UjAeVwsHtZw0wVN+hwI6enoZ7pwN1irm6
 DMgbKMK0YBzwpSHq2ycA1Ho61cisd05D/RUFFLcQK7RGI+ipYbCnR39k98pYYKD9Ez/q
 tcYQ==
X-Gm-Message-State: AFqh2kr35B1gW9IQeloMdZGyVWYda+a9F1MQtFESTZa9NpZrXT4iAPyw
 nqtwj7ZbhwhnYzMK8f1oAP1WJKGKy8BRtBvwyk1ZVsVMTVEgvspTpL8MYO9iYJL0GpaHe/JT+LQ
 U2CaUOzGu7MCjRTw=
X-Received: by 2002:a0c:fe46:0:b0:532:2fd0:5933 with SMTP id
 u6-20020a0cfe46000000b005322fd05933mr56645458qvs.19.1674808253770; 
 Fri, 27 Jan 2023 00:30:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuoZgPr7tKuR23bMbScQuKcNncSRoMMkfZWqaxxjo6+SMFbOJLw1Q5IZY8WY2u776h4iIub3Q==
X-Received: by 2002:a0c:fe46:0:b0:532:2fd0:5933 with SMTP id
 u6-20020a0cfe46000000b005322fd05933mr56645433qvs.19.1674808253490; 
 Fri, 27 Jan 2023 00:30:53 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 eb10-20020a05620a480a00b0071323d3e37fsm2390293qkb.133.2023.01.27.00.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 00:30:52 -0800 (PST)
Message-ID: <f46452da-89ec-5d04-3589-3baef89b2402@redhat.com>
Date: Fri, 27 Jan 2023 09:30:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/13] block: Fix bdrv_open*() calls from coroutine context
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: hreitz@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
References: <20230126172432.436111-1-kwolf@redhat.com>
Content-Language: de-CH
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20230126172432.436111-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.15, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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



Am 26/01/2023 um 18:24 schrieb Kevin Wolf:
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
> 
> Kevin Wolf (13):
>   block-coroutine-wrapper: Introduce no_co_wrapper
>   block: Create no_co_wrappers for open functions
>   luks: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   parallels: Fix .bdrv_co_create(_opts) to open images with
>     no_co_wrapper
>   qcow: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   qcow2: Fix open/create to open images with no_co_wrapper
>   qed: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   vdi: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   vhdx: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   vmdk: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   vpc: Fix .bdrv_co_create(_opts) to open images with no_co_wrapper
>   block: Fix bdrv_co_create_opts_simple() to open images with
>     no_co_wrapper
>   block: Assert non-coroutine context for bdrv_open_inherit()
> 

Apart from a small nitpick in patch 3 where the functions are not marked
as coroutine_fn (but I think this is because BDS callbacks usually don't
have such annotations), looks good to me.

Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

>  include/block/block-common.h                | 14 ++++
>  include/block/block-global-state.h          | 35 ++++++---
>  include/sysemu/block-backend-global-state.h | 21 +++++-
>  block.c                                     | 17 ++---
>  block/crypto.c                              | 10 +--
>  block/parallels.c                           | 10 +--
>  block/qcow.c                                | 10 +--
>  block/qcow2.c                               | 43 +++++------
>  block/qed.c                                 | 10 +--
>  block/vdi.c                                 | 10 +--
>  block/vhdx.c                                | 10 +--
>  block/vmdk.c                                | 22 +++---
>  block/vpc.c                                 | 10 +--
>  scripts/block-coroutine-wrapper.py          | 83 ++++++++++++++++++---
>  block/meson.build                           |  1 +
>  15 files changed, 207 insertions(+), 99 deletions(-)
> 


