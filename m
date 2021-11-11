Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA4544D8D7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:03:21 +0100 (CET)
Received: from localhost ([::1]:42088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBbk-0004kE-Dn
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlBZ4-0001mW-PV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:00:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlBZ2-0004lw-FT
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:00:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636642830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E+ZzvzTUoBny6pqvvsrnvCj3GTvggJXorl658c0Jooc=;
 b=Tgy4YWxIYT0H/Oh+YMM3wFPzeZUU9bJ1WsijTPNQ3NuH0sgVxRXPYqC0waZSF7IYvPr+H0
 kNvUMGaWmHqQkLKysxST5ekv4w4Vogkej3ChY4cB1+LCpEI6Lqli2Joc77Tssjb+gJrxxe
 uExF+p/VP8IER2DKo8h741w/rZ+BsLM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-J7Dw2cBkO7uhm3OaH1S4tw-1; Thu, 11 Nov 2021 10:00:29 -0500
X-MC-Unique: J7Dw2cBkO7uhm3OaH1S4tw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b133-20020a1c808b000000b0032cdd691994so4922991wmd.1
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:00:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E+ZzvzTUoBny6pqvvsrnvCj3GTvggJXorl658c0Jooc=;
 b=504MsyYATctpTv40LRpwxwuug+LYnNnayz06rSnz1NzADwP0vic6MioyCXUyFt1Fgt
 uesnwaduQBiF6APIRILHJZw/yuPGtMUASBUA5SCoFIqYwfFkQ5q8BjvtmnFK3BxnhJRP
 ORWktNZE77BCbz0WnRNadVxmEJqne7xShrt9yTPEowCNN7Xf5GKuC+S+pfZGNP9Txovi
 ap6Q4UkPmK1tlz7TgRGov4CYLHxF5gueyjQ7M+oOKCwz+JMtgt16mEKStw+3lGjRJqPc
 xZNeJO6dqMe3/azFuWztg/5MpxutEbPwk5zydgGHz2Opz5AaSG+pYDkwgDUZ4e34McXS
 rfSA==
X-Gm-Message-State: AOAM533cYeC416e2tI7hLKjqSf+T3KYiVtK2ZAoi4WevrO8jtWFHlyrr
 svokIFU4tApWB3/0uzgbYc8v/RdSPrKaT+B7wH9uiTn9/mT/apqxI8axG5pzBchDs9XyU7lP10W
 yQb2dQ3d5gn44R5s=
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr9544082wrq.411.1636642828104; 
 Thu, 11 Nov 2021 07:00:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/5t4x3NbAL8CIowOrCkuV5p1zv0xMRFyyYDnZqgHw6jd3DZMc4aydRkgzxK4BDaiHkRKVtA==
X-Received: by 2002:a05:6000:18c7:: with SMTP id
 w7mr9544018wrq.411.1636642827812; 
 Thu, 11 Nov 2021 07:00:27 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id k27sm9857090wms.41.2021.11.11.07.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 07:00:27 -0800 (PST)
Message-ID: <7cf8a28a-5765-cff8-192e-0fe92fc1ac45@redhat.com>
Date: Thu, 11 Nov 2021 16:00:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-3-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
> block.h currently contains a mix of functions:
> some of them run under the BQL and modify the block layer graph,
> others are instead thread-safe and perform I/O in iothreads.
> It is not easy to understand which function is part of which
> group (I/O vs GS), and this patch aims to clarify it.
>
> The "GS" functions need the BQL, and often use
> aio_context_acquire/release and/or drain to be sure they
> can modify the graph safely.
> The I/O function are instead thread safe, and can run in
> any AioContext.
>
> By splitting the header in two files, block-io.h
> and block-global-state.h we have a clearer view on what
> needs what kind of protection. block-common.h
> contains common structures shared by both headers.
>
> block.h is left there for legacy and to avoid changing
> all includes in all c files that use the block APIs.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c                            |   3 +
>   block/meson.build                  |   7 +-
>   include/block/block-common.h       | 389 +++++++++++++
>   include/block/block-global-state.h | 286 ++++++++++
>   include/block/block-io.h           | 306 ++++++++++
>   include/block/block.h              | 878 +----------------------------
>   6 files changed, 1012 insertions(+), 857 deletions(-)
>   create mode 100644 include/block/block-common.h
>   create mode 100644 include/block/block-global-state.h
>   create mode 100644 include/block/block-io.h

[...]

> diff --git a/include/block/block-io.h b/include/block/block-io.h
> new file mode 100644
> index 0000000000..9af4609ccb
> --- /dev/null
> +++ b/include/block/block-io.h

[...]

> +/*
> + * I/O API functions. These functions are thread-safe, and therefore
> + * can run in any thread as long as the thread has called
> + * aio_context_acquire/release().
> + */
> +
> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
> +                          Error **errp);

Why is this function here?  Naïvely, I would’ve assumed as a 
graph-modifying function it should be in block-global-state.h.

I mean, perhaps it’s thread-safe and then it can fit here, too. Still, 
it surprises me a bit to find this here.

Hanna


