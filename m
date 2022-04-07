Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FB4F76EC
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 09:11:07 +0200 (CEST)
Received: from localhost ([::1]:46198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncMIM-0008Jl-C1
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 03:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncMG0-00076R-Er
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ncMFx-0005uB-CG
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 03:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649315316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyLytIrNYO8966LTR5vqFU9obUy1nBt53AfFcYcvT4Q=;
 b=JtwTtducyhjGx+uWJ/LV81XSebrySv+odmGghbssDz1SaEEnpzmHex2KK0DOF+Q3XnJYkG
 EvkFj7mZnHGh/OClnSZ1pNDoczLupao3xnfExiXtroeZ7f8NyUfJWkkrg1Z3lTnzdXw5r1
 Qc9NvG6eevqFZ2W3Wj+BpFFI3mnZXOM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-CmTL1qvmP6yvXWecEgC21g-1; Thu, 07 Apr 2022 03:08:27 -0400
X-MC-Unique: CmTL1qvmP6yvXWecEgC21g-1
Received: by mail-ed1-f70.google.com with SMTP id
 l14-20020aa7cace000000b003f7f8e1cbbdso2423811edt.20
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 00:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GyLytIrNYO8966LTR5vqFU9obUy1nBt53AfFcYcvT4Q=;
 b=cWXMJfqIhRA5di2KCZPqiHV0HnDHZ7B9NYsn8+8w7KoF2ey2TOfhpAU2PfezmqF+7j
 kBkNfjfc72wyK0G2i2zxKPN0jy0ri14C8JT7wcK62gypK25yJdFXzUXfls4oAr8dorqK
 Pb4gmQ4ik0j/in009AZwfr7qUKvWlHI6RGeSNiUz34sZqkq5DKIHZpV/hhVzbQ1QN3ne
 mgKz0rNMDSHwDoaaGi3bQn2n2VWEoN+gxacpSZre3l0vrdpBsUn/PRM4kv/nIhQJNKug
 ejpuPCk8IzIZmhAvYm5/XN7JvPmFnKJYkDNNfmhtSCuUhXV/f3LbifJ7YiyfqbflXnQw
 OuBA==
X-Gm-Message-State: AOAM532XBi6Ms/lFhdwakgt/VfTt/cTCt7qut4f2oiVaTeSdvjTQf7w/
 WRd+SY0Hls0YlSrsgjd6XMyJ97LFg9WW2jlOK+IiW0E1C7puKVem+ZREIw1BVAfd1O6CD1JUn0r
 yzQk9fwD7STzwCvQ=
X-Received: by 2002:aa7:c307:0:b0:41c:d381:d60e with SMTP id
 l7-20020aa7c307000000b0041cd381d60emr12692635edq.184.1649315306593; 
 Thu, 07 Apr 2022 00:08:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYv3WOxt2HjI1oiolGciQK54KW9HlXpobaYGuJY1/wo57UpAQKYybA26fGpGmNu8aUzCstlQ==
X-Received: by 2002:aa7:c307:0:b0:41c:d381:d60e with SMTP id
 l7-20020aa7c307000000b0041cd381d60emr12692617edq.184.1649315306377; 
 Thu, 07 Apr 2022 00:08:26 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 g2-20020aa7dc42000000b00418ef55eabcsm8835774edu.83.2022.04.07.00.08.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 00:08:26 -0700 (PDT)
Message-ID: <0c2df44a-0fcd-0989-edb3-34c848d8e098@redhat.com>
Date: Thu, 7 Apr 2022 09:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/7] block/copy-before-write: refactor option parsing
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-2-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220406180801.374844-2-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, vsementsov@openvz.org,
 stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.04.22 20:07, Vladimir Sementsov-Ogievskiy wrote:
> We are going to add one more option of enum type. Let's refactor option
> parsing so that we can simply work with BlockdevOptionsCbw object.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/copy-before-write.c | 55 ++++++++++++++++++++-------------------
>   1 file changed, 28 insertions(+), 27 deletions(-)
>
> diff --git a/block/copy-before-write.c b/block/copy-before-write.c
> index a8a06fdc09..6877ff893a 100644
> --- a/block/copy-before-write.c
> +++ b/block/copy-before-write.c

[...]

> @@ -376,6 +365,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
>       BDRVCopyBeforeWriteState *s = bs->opaque;
>       BdrvDirtyBitmap *bitmap = NULL;
>       int64_t cluster_size;
> +    g_autoptr(BlockdevOptions) full_opts = NULL;
> +    BlockdevOptionsCbw *opts;
> +
> +    full_opts = cbw_parse_options(options, errp);
> +    if (!full_opts) {
> +        return -EINVAL;
> +    }
> +    opts = &full_opts->u.copy_before_write;

I would prefer an `assert(full_opts->driver == 
BLOCKDEV_DRIVER_COPY_BEFORE_WRITE);` here, but, either way:

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


