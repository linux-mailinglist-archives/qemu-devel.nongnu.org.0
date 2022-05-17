Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C195652A4BE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:23:51 +0200 (CEST)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqy74-0004LU-Hv
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy5w-0002VD-4G; Tue, 17 May 2022 10:22:41 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy5q-00076Y-6W; Tue, 17 May 2022 10:22:39 -0400
Received: by mail-ed1-x52b.google.com with SMTP id en5so8534233edb.1;
 Tue, 17 May 2022 07:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AxO60nuep1SBxedD2h9ciqMF6ZsR9WEIKE3D2JQ+E3o=;
 b=FpjWW4+zBeLASl8pnbNLzYEydoAyI21Cmj7/g2gYBnupKqwKpjV+jfKvl/n561Uwhy
 GGiguqVtYCVZilmzqLWZma9dWqcFdfSMds679oLdPn+IqcrYuu+t3bBfP9rOfpkQ3aRz
 liI/mzO5vsUO06hE11TIJBL9PH8dxkVu7Z8wObx9RfdfOBs5B4n8tDau6PmSVYKEid3N
 PI+FaYCSrZ0hNvTPriAIsj0VeoMCAbEWawXwJTSwGCQ3qL0rFFlgyuhietVH1x++8Lfb
 naHtjVRrTaGhDTBzO2xtEQgzfwm1of6mCm7e8o91kko0E5IpAZuiYgw/Ui7TnMI/UAh0
 yrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AxO60nuep1SBxedD2h9ciqMF6ZsR9WEIKE3D2JQ+E3o=;
 b=bNIynLk5beth4umIhbfD0A3uQvfQDA6VqEmdu7fK5koN6H+xGnLGJz+PUmNIzpArw+
 DG/NTSszsePeH67hwpOWV5Xjz0lo2JqRb95d+k6u31nvPDhbIyHd/lDOpQhkI69PHPfR
 LiJl0JV9zKEusfiESZ6OwraAt4ac7P+0WnQDNiZ7tIQ1vVzYLgo/ol5Za38kido5eeD+
 SA71uafFQ9J8dn848ewPSt0y1tOZySFUaKr0E3Sg2XKJ8TbT3VYuU3gx5Z+9y4UuOT/J
 myoJOYJ0/YQ1TnI62fGhCE05HKL5HiNw6M8qJdqnRfhTwknx7JdkNIUfyLN4VMjfOGjj
 tYAQ==
X-Gm-Message-State: AOAM533UwSsAUkdWsWxaffhDlyr7lncMe6LTmaKFsLYzwm35yW4dHDfb
 rIrAXjiorsqEHkpuTcOfa+g=
X-Google-Smtp-Source: ABdhPJzQOqUYBxKpr9bugj02gTFEBXIpxAE1vT5OWmxeLWtmZDVQzYlOvujD/h/A+5p7/Iz80h457A==
X-Received: by 2002:a05:6402:4310:b0:427:f6e9:76b3 with SMTP id
 m16-20020a056402431000b00427f6e976b3mr19399246edc.324.1652797352485; 
 Tue, 17 May 2022 07:22:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 y21-20020a056402171500b0042617ba639esm6894202edu.40.2022.05.17.07.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:22:32 -0700 (PDT)
Message-ID: <0a27845b-0b9a-992a-3360-a7cf16892a08@redhat.com>
Date: Tue, 17 May 2022 16:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 06/18] block: Implement blk_{pread, pwrite}() using
 generated_co_wrapper
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-2-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-2-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
> We need to add include/sysemu/block-backend-io.h to the inputs of the
> block-gen.c target defined in block/meson.build.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>

Emanuele is looking it cleaning this up, so you two need to coordinate.

Emanuele, can you separate/post the initial patches to clean up the 
includes of block/coroutines.h and block/block-gen.c?

Apart from that, fewer block/coroutines.h declarations is only good stuff.

Thanks,

Paolo

> ---
>   block/block-backend.c             | 23 -----------------------
>   block/coroutines.h                |  4 ----
>   block/meson.build                 |  1 +
>   include/sysemu/block-backend-io.h | 10 ++++++----
>   4 files changed, 7 insertions(+), 31 deletions(-)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 5b9706c443..c2a4c44a99 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1567,29 +1567,6 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
>                           flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
>   }
>   
> -int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
> -              BdrvRequestFlags flags)
> -{
> -    int ret;
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_OR_GS_CODE();
> -
> -    blk_inc_in_flight(blk);
> -    ret = blk_do_preadv(blk, offset, bytes, &qiov, flags);
> -    blk_dec_in_flight(blk);
> -
> -    return ret;
> -}
> -
> -int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
> -               const void *buf, BdrvRequestFlags flags)
> -{
> -    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
> -    IO_OR_GS_CODE();
> -
> -    return blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);
> -}
> -
>   int64_t blk_getlength(BlockBackend *blk)
>   {
>       IO_CODE();
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 3f41238b33..443ef2f2e6 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -112,10 +112,6 @@ bdrv_common_block_status_above(BlockDriverState *bs,
>   int generated_co_wrapper
>   nbd_do_establish_connection(BlockDriverState *bs, bool blocking, Error **errp);
>   
> -int generated_co_wrapper
> -blk_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
> -              QEMUIOVector *qiov, BdrvRequestFlags flags);
> -
>   int generated_co_wrapper
>   blk_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
>                       QEMUIOVector *qiov, size_t qiov_offset,
> diff --git a/block/meson.build b/block/meson.build
> index 0b2a60c99b..60bc305597 100644
> --- a/block/meson.build
> +++ b/block/meson.build
> @@ -136,6 +136,7 @@ block_gen_c = custom_target('block-gen.c',
>                               input: files(
>                                         '../include/block/block-io.h',
>                                         '../include/block/block-global-state.h',
> +                                      '../include/sysemu/block-backend-io.h',
>                                         'coroutines.h'
>                                         ),
>                               command: [wrapper_py, '@OUTPUT@', '@INPUT@'])
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 6440e92028..0804ce1c1d 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -102,10 +102,12 @@ int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
>    * the "I/O or GS" API.
>    */
>   
> -int blk_pread(BlockBackend *blk, int64_t offset, int64_t bytes, void *buf,
> -              BdrvRequestFlags flags);
> -int blk_pwrite(BlockBackend *blk, int64_t offset, int64_t bytes,
> -               const void *buf, BdrvRequestFlags flags);
> +int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
> +                                   int64_t bytes, void *buf,
> +                                   BdrvRequestFlags flags);
> +int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, const void *buf,
> +                                    BdrvRequestFlags flags);
>   int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>                                  int64_t bytes, QEMUIOVector *qiov,
>                                  BdrvRequestFlags flags);


