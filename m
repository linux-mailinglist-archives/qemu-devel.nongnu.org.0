Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84352A4D3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:28:01 +0200 (CEST)
Received: from localhost ([::1]:49808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyB6-0001Qt-Bu
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy9E-0007hZ-FR; Tue, 17 May 2022 10:26:04 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy9C-0007gD-S4; Tue, 17 May 2022 10:26:04 -0400
Received: by mail-ej1-x630.google.com with SMTP id tk15so11545528ejc.6;
 Tue, 17 May 2022 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QVqoDcPQw4FjZj8AR3kD9JFshwrS/RzghNtVGsphOo0=;
 b=eWqeDEnZnxno1q4zxNogPy6kv/4wDeE6CV2hxwCT87kdjEd1ywD6IhjIPqJnVrs4LN
 jDsYXrdQZKh9CoohKloKmSXw5Pwdh13ZSZ7hIJcxrGemC6mWmnGPcKSsh33ebLueQwLV
 fD2TPwG49POaKXnmUjL7GLgFFMIlxxBDU0047MGImOsVGeC7GQX/dLmykKDf2HAOL65k
 xYBbWhE23Jx34SBDjvaCZ4BdJxdiVLVtB7W22NBpbM1EfSmoTXyELZJkltA7wiIqrZnb
 cPCUixq2pLxA+3sprF2q32NgzzUafJpVWnHt2kJVYYmSmiem2Zgbc/KMPR/n/F2XRGAf
 iwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QVqoDcPQw4FjZj8AR3kD9JFshwrS/RzghNtVGsphOo0=;
 b=Szp1EtXqUpUF5mnqtimrYEiOH/HzeHI2hcl2Cw8GVq+hk1wGJkAQ0hpj1xB3wkNBwl
 k6I+60B62P081NKIwiu3kfS3O1b3rV92afaMbPnqYTA5DAXO1GIFxkAMOEpr0FF/O8k7
 745TAYxXD61XhA2lYSZMc8DkbMQbFh5CaES21iwaI6IVgUb+munCdakxUgxQmLULGEeg
 bVO3VnCogXm568TyBGDWvtCVWTOfJrLR9LNvl437ot8xK5FhDAZphJhZceeYvqPI1mtC
 TN+3BrHlb1l5APVw1LgT4IvDtulopg4a2VFw7F0y981ExHH8+wt5bTq1zqyjWDp9bPbE
 DUqg==
X-Gm-Message-State: AOAM530zj32B1jLUv93KQZga0ILlh3jZXHqfcvzBdhmWJxe38dgt4PXU
 E92gd3JUGp+L49eNozeFL/8=
X-Google-Smtp-Source: ABdhPJwens/MtwUvPo84CPfsYM5yCDFVPArr5clIHZEXEkUdkGhjl7mpC6tDcWD6R+A2ArrkdpHATg==
X-Received: by 2002:a17:907:970a:b0:6f4:5ad2:5e66 with SMTP id
 jg10-20020a170907970a00b006f45ad25e66mr19700895ejc.698.1652797560620; 
 Tue, 17 May 2022 07:26:00 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a50e68c000000b0042617ba6389sm7179332edm.19.2022.05.17.07.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:26:00 -0700 (PDT)
Message-ID: <7081aadd-a1a1-dd9a-c0e4-07ade750d547@redhat.com>
Date: Tue, 17 May 2022 16:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 10/18] block: Change blk_pwrite_compressed() param order
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-6-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-6-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
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

On 5/17/22 13:38, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with other I/O functions.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> ---
>   block/block-backend.c             | 4 ++--
>   include/sysemu/block-backend-io.h | 4 ++--
>   qemu-img.c                        | 2 +-
>   qemu-io-cmds.c                    | 2 +-
>   4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 35bf35aadd..ddb1d4e179 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -2324,8 +2324,8 @@ int coroutine_fn blk_co_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                             flags | BDRV_REQ_ZERO_WRITE);
>   }
>   
> -int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
> -                          int64_t bytes)
> +int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                          const void *buf)
>   {
>       QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
>       IO_OR_GS_CODE();
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 31ebd8b6cf..c64207cdcb 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -168,8 +168,8 @@ int blk_flush(BlockBackend *blk);
>   
>   int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
>   
> -int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, const void *buf,
> -                          int64_t bytes);
> +int blk_pwrite_compressed(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                          const void *buf);
>   int blk_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes);
>   int blk_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                         int64_t bytes, BdrvRequestFlags flags);
> diff --git a/qemu-img.c b/qemu-img.c
> index 8d214e649e..52f3aeed9b 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -2114,7 +2114,7 @@ static int convert_do_copy(ImgConvertState *s)
>   
>       if (s->compressed && !s->ret) {
>           /* signal EOF to align */
> -        ret = blk_pwrite_compressed(s->target, 0, NULL, 0);
> +        ret = blk_pwrite_compressed(s->target, 0, 0, NULL);
>           if (ret < 0) {
>               return ret;
>           }
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index c8cbaed0cd..952dc940f1 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -631,7 +631,7 @@ static int do_write_compressed(BlockBackend *blk, char *buf, int64_t offset,
>           return -ERANGE;
>       }
>   
> -    ret = blk_pwrite_compressed(blk, offset, buf, bytes);
> +    ret = blk_pwrite_compressed(blk, offset, bytes, buf);
>       if (ret < 0) {
>           return ret;
>       }


