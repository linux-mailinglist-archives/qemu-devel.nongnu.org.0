Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE33525CA3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:56:03 +0200 (CEST)
Received: from localhost ([::1]:53100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQ9a-0008SL-7P
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPvX-0008Bz-80; Fri, 13 May 2022 03:41:31 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1npPvV-0002jq-HQ; Fri, 13 May 2022 03:41:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id c12so8931828edv.10;
 Fri, 13 May 2022 00:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ad8OvmMDUwpyGIsDFNlcv/Wgv2gQpYDlbO0vKPJnGU=;
 b=TjRjV9MP9AJaXuThraTKmHuX9LLZPyUJwgXSkZc2VaQMJfROZpcNglCuqgfwbvKTon
 +C64IZKlIukGTX02WwUhsaY5Tqs7kvHyFPjISNuyQp6WhmUkl14pK/8foX/L4MAPFtj2
 K3EILcX8KpVkTP2M88XKhWniwsaiuaKn5m9YlfN0lY/GzE5nu8X6E2G7x/m3+FeyJYEj
 TtsrRENOfxjR5t5Us8DBjHWgZGc0xXBmR50VbTN+UJp9Kg3dWPEQ814YnyLJ1koPprzw
 ntN1IWBf5S5w8sO93UepRKDE23tWdZmctXtTnTW0JFT1nnbqJI0LwgZk2FjGCu1dHeSC
 1cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8ad8OvmMDUwpyGIsDFNlcv/Wgv2gQpYDlbO0vKPJnGU=;
 b=chlpfL7vDk7zhXNzImiHuEA30gRYFUaXxzewpnpDVFDUMLnLBLATcClyK7tYw7q6Va
 fkTS34mt17rUX3t3mRTcpZmehmpvTJcuIhnFj2dmNMIkL70FNTkjZjYlJn8/DG14F5Ls
 L8wfnlY7WfBTdsjHxqhYSNiOnOMrCoaNcjgrm8Y10Q0dqBnBPcGr3bUQZWT7n5cZhlE1
 YRUMFrJCdecgb8Z9/BN7J6/jG9M2jH5fXRYNkg7axOgngKe4d0dch/7GqxeTGw5hs4Jx
 a9c872XM8jEtcGMolluBrqmBmBZ2Xbln0kXKO9dtVzih+qD/JUt3EAAD6UKVmi73F7Cl
 PQVw==
X-Gm-Message-State: AOAM531kr2SdKdKgDbi0hItOq8RkMezxKyMPUkWz3UxZJBoazVKggsLM
 p9rKc0JRNzMiO/bLF8QdOwM=
X-Google-Smtp-Source: ABdhPJyaER8GyLn5xl6gr7654ozW+nZRNNUNi6TECKfoQ7URevnd7PqEw28NoAjy1FAJD0wcFu/9sg==
X-Received: by 2002:a05:6402:516:b0:425:c896:b1b8 with SMTP id
 m22-20020a056402051600b00425c896b1b8mr38015301edv.212.1652427687169; 
 Fri, 13 May 2022 00:41:27 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 hz13-20020a1709072ced00b006f3ef214de9sm494921ejc.79.2022.05.13.00.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:41:26 -0700 (PDT)
Message-ID: <934aef85-7400-d870-dfae-3f869552e47c@redhat.com>
Date: Fri, 13 May 2022 09:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 6/7] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512235103.2224817-3-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220512235103.2224817-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/io.c               | 41 ----------------------------------------
>   include/block/block-io.h | 15 +++++++++------
>   2 files changed, 9 insertions(+), 47 deletions(-)
>
> diff --git a/block/io.c b/block/io.c
> index 78a289192e..ecd1c2a53c 100644
> --- a/block/io.c
> +++ b/block/io.c
> @@ -1061,14 +1061,6 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
>       return 0;
>   }
>   
> -int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
> -                       int64_t bytes, BdrvRequestFlags flags)
> -{
> -    IO_CODE();
> -    return bdrv_pwritev(child, offset, bytes, NULL,
> -                        BDRV_REQ_ZERO_WRITE | flags);
> -}

This is different from bdrv_co_pwrite_zeroes in that it does not clear 
BDRV_REQ_MAY_UNMAP; but that's a bugfix really.

It also doesn't call trace_bdrv_co_pwrite_zeroes, which is another bugfix.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

>   /*
>    * Completely zero out a block device with the help of bdrv_pwrite_zeroes.
>    * The operation is sped up by checking the block status and only writing
> @@ -1111,39 +1103,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
>       }
>   }
>   
> -/* See bdrv_pwrite() for the return codes */
> -int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
> -               BdrvRequestFlags flags)
> -{
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_CODE();
> -
> -    if (bytes < 0) {
> -        return -EINVAL;
> -    }
> -
> -    return bdrv_preadv(child, offset, bytes, &qiov, flags);
> -}
> -
> -/* Return no. of bytes on success or < 0 on error. Important errors are:
> -  -EIO         generic I/O error (may happen for all errors)
> -  -ENOMEDIUM   No media inserted.
> -  -EINVAL      Invalid offset or number of bytes
> -  -EACCES      Trying to write a read-only device
> -*/
> -int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
> -                const void *buf, BdrvRequestFlags flags)
> -{
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_CODE();
> -
> -    if (bytes < 0) {
> -        return -EINVAL;
> -    }
> -
> -    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
> -}
> -
>   /*
>    * Writes to the file and ensures that no writes are reordered across this
>    * request (acts as a barrier)
> diff --git a/include/block/block-io.h b/include/block/block-io.h
> index 879221cebe..c81739ad16 100644
> --- a/include/block/block-io.h
> +++ b/include/block/block-io.h
> @@ -39,13 +39,16 @@
>    * to catch when they are accidentally called by the wrong API.
>    */
>   
> -int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
> -                       int64_t bytes, BdrvRequestFlags flags);
> +int generated_co_wrapper bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
> +                                            int64_t bytes,
> +                                            BdrvRequestFlags flags);
>   int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
> -int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
> -               BdrvRequestFlags flags);
> -int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
> -                const void *buf, BdrvRequestFlags flags);
> +int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
> +                                    int64_t bytes, void *buf,
> +                                    BdrvRequestFlags flags);
> +int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
> +                                     int64_t bytes, const void *buf,
> +                                     BdrvRequestFlags flags);
>   int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
>                        const void *buf, BdrvRequestFlags flags);
>   /*


