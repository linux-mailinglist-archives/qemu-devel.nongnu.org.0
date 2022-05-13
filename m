Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E393E525C69
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:38:48 +0200 (CEST)
Received: from localhost ([::1]:34628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npPst-0003dJ-CI
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPoW-0001O6-0r; Fri, 13 May 2022 03:34:16 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:34643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPoU-0001VB-2A; Fri, 13 May 2022 03:34:15 -0400
Received: by mail-ed1-x534.google.com with SMTP id a21so8965815edb.1;
 Fri, 13 May 2022 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZl3hR0F3OiL0tLxKLczid4qTaaNHxjJHWHByTNstOs=;
 b=jOstOIzng2tKuW8WALkuX6PmYCxN93x0+bGanjI8LpTSEdWNSnUMrWeFo0ur4Fv9V3
 4AyHnKr/MfJ7vLcCLfttV2x5IAy0cvj7vdUdXDx0B0q37SPq3Gxa5fCiyGFZwgyZ0Ww5
 31yWQT5eklN4rL2QvnRQfENMmg3+0bmlZJxKnOYOZrn9dapaMYeHzQoYOrHSdYcF79LB
 OjTryCydW7BTHWuEeZIkurjpgW4/CWnWXyxsAMnr6F2JteSpeiGZG6Q3VaiRDrnQCHh0
 8GIs3RAj642KhjEtC0sNEoa+s+bURBN/Y+Y8CHz8M7m5XIc95eWw7P2xlyk447QIy4kO
 SBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZl3hR0F3OiL0tLxKLczid4qTaaNHxjJHWHByTNstOs=;
 b=uV7eY8R0IGxH5qZFFMCw9L7I9u7VjCw4bHAZEi3VPB8uSQ4bvqxtLfGA4O4vzHMc6c
 tVOTIuEqNmFTbffY0midyDUmPwey0oUYGiILq9tuxCiyIbHFGOVYWlnHaEk/qQYL37RS
 xd+EaNoc+Jwww2iHMW7a1c1U+MBOPBDaUxqvCXifmH2e+n9t8qiW7b3nF4HYkDL7/CI9
 u6JRV+TNyRu+gtBHy5/TC+xDL/qlXnty2jsdZluXIB3smT28BRrH9RZPZIYlUOpNclz/
 T/IHnuA5WBOeBDW/ImoKHipVUp5LJkVKw0uksTTXoYKJgOi2SJuZcfICVoVGQuQz9Xwl
 j13Q==
X-Gm-Message-State: AOAM531kexfWNP61toihHXq/IUhooONUaGL0c+ri5GTTfY/MnHdKnGO4
 9YHG7GbgXccclYl2kIj00CA=
X-Google-Smtp-Source: ABdhPJxufMqU1FjpX+5JiGRPX3Ob1dojBp6mbBsRzbWuaXmvI8IdOXj7HbvhcG6ECW1wLJ24diKZ4A==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id
 eb14-20020a0564020d0e00b004133d99f2d6mr39540577edb.189.1652427251687; 
 Fri, 13 May 2022 00:34:11 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 zd20-20020a17090698d400b006f3ef214e0esm480332ejb.116.2022.05.13.00.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:34:11 -0700 (PDT)
Message-ID: <5939a7b1-f30d-88f5-1941-36a1e7bb3bf0@redhat.com>
Date: Fri, 13 May 2022 09:34:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 7/7] block: Add bdrv_co_pwrite_sync()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512235103.2224817-4-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220512235103.2224817-4-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 5/13/22 01:51, Alberto Faria wrote:
> Also convert bdrv_pwrite_sync() to being implemented using
> generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/io.c               | 5 +++--
>   include/block/block-io.h | 8 ++++++--
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/block/io.c b/block/io.c
> index ecd1c2a53c..19f9251c11 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1109,8 +1109,9 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
>    *
>    * Returns 0 on success, -errno in error cases.
>    */
> -int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
> -                     const void *buf, BdrvRequestFlags flags)
> +int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
> +                                     int64_t bytes, const void *buf,
> +                                     BdrvRequestFlags flags)
>   {
>       int ret;
>       IO_CODE();

Please change the implementation to use bdrv_co_ functions as well 
(bdrv_co_pwrite, bdrv_co_flush).

Some callers could be changed to bdrv_co_pwrite_sync, for example 
qcow2_shrink_reftable[1], but that can be done later (and preferably in 
a somewhat automated way).

Paolo

[1] qcow2_shrink_reftable could be a coroutine_fn because it is only 
called from qcow2_co_truncate

> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index c81739ad16..ae90d1e588 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -49,8 +49,12 @@ int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
>   int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
>                                        int64_t bytes, const void *buf,
>                                        BdrvRequestFlags flags);
> -int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
> -                     const void *buf, BdrvRequestFlags flags);
> +int generated_co_wrapper bdrv_pwrite_sync(BdrvChild *child, int64_t offset,
> +                                          int64_t bytes, const void *buf,
> +                                          BdrvRequestFlags flags);
> +int coroutine_fn bdrv_co_pwrite_sync(BdrvChild *child, int64_t offset,
> +                                     int64_t bytes, const void *buf,
> +                                     BdrvRequestFlags flags);
>   /*
>    * Efficiently zero a region of the disk image.  Note that this is a regular
>    * I/O request like read or write and should have a reasonable size.  This


