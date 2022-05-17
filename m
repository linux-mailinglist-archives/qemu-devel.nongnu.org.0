Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC852A5A4
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 17:07:36 +0200 (CEST)
Received: from localhost ([::1]:42124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqynP-00063S-6o
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 11:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyDc-0006zR-LB; Tue, 17 May 2022 10:30:37 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyDa-0008P5-Rs; Tue, 17 May 2022 10:30:36 -0400
Received: by mail-ed1-x52b.google.com with SMTP id en5so8565450edb.1;
 Tue, 17 May 2022 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTuHQIP+M9Sn0GsQly2EezoFahobF5nVD9pQE1gw5tg=;
 b=JIN1Xg2vjQ5MwURckR4dI701+3SMGoNp6oCF5sbhDWOZQllsxtChCBBZg8h795d5GR
 l9G0ganZE3Voi2KdP/E823zM5ocsb2VT/GTNXsH+VnNd8soCLOEJmuPnJjMLq0DKMBPH
 mxlnls31DrXJWJwRKj9NTxYu/VEZompe8cQnKtSMEBv021CgRQyaJHpykpZcqSybSj8Z
 hoe/Cka/WbLF3FoHq4OBrPfoc6ObaCCw7lmo/NGLbA7p7VK7ITusq6A7IxLIPLEWbHE3
 Iox2c8vJXvQ9CIzGwkJqYCDUaEbaYYGRy0kKA5iHoyroo7CytbgmxTEAkl5Q/C0Gy6+W
 5iuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RTuHQIP+M9Sn0GsQly2EezoFahobF5nVD9pQE1gw5tg=;
 b=29ePJfrUvV4rLysxJJpSCK/249kLb0DKgoYJrgyxjK6Nauwez2RYvV+9MO6rc/jEJB
 TDUVZ1t1VDFTkDGNgiOadgRpWUaURzMG9XD21M0gh7DXLHtJuVfPth5qVc9OcajN5Hah
 autVWsbWSGHSK5/Csml1KaXdKdPYm/N4AO9bvs9A24f580uDs5xQlgRadyyap3Hv18N7
 Im5Fu+SO/F2vRC9H8v5pg+6wv1dWUPX7CsDXHH4bt3R9TnYa/+akdM/r+YG2aEaY6byz
 ma5wTSlxqD6z1Y3MCx17jwGaTL/06aaZuzQxLFEAtNsJfrSXS+QagFG9SyVc9CT+dqCq
 8s6w==
X-Gm-Message-State: AOAM530dooZoCnPiR83AGo1n73o3iuF/HNEwGNE3sz4NnFr5nk6Uc70R
 01ooLs10Vac7Wry2HGw6Xcs=
X-Google-Smtp-Source: ABdhPJzH2aeotuNmuwKPlwJ/72QEUBHJdflEewXcwrSHJSZe7Ba3JgtTb9wQD2TEMtMljXuTM4cdQA==
X-Received: by 2002:a50:f69c:0:b0:42a:b933:d1d with SMTP id
 d28-20020a50f69c000000b0042ab9330d1dmr8391704edn.365.1652797832659; 
 Tue, 17 May 2022 07:30:32 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 v21-20020aa7dbd5000000b0042ac6410ca1sm1265828edt.16.2022.05.17.07.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:30:32 -0700 (PDT)
Message-ID: <48afad56-5f0d-22a6-df64-bbe9cc7d1944@redhat.com>
Date: Tue, 17 May 2022 16:30:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 08/18] block: Add blk_[co_]preadv_part()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-4-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-4-afaria@redhat.com>
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
> Implement blk_preadv_part() using generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 30 +++++++++++++++++++++++-------
>   block/coroutines.h                |  5 -----
>   include/sysemu/block-backend-io.h |  7 +++++++
>   tests/unit/test-block-iothread.c  | 19 +++++++++++++++++++
>   4 files changed, 49 insertions(+), 12 deletions(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/block/block-backend.c b/block/block-backend.c
> index c2a4c44a99..3920e1f45e 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -1284,9 +1284,10 @@ static void coroutine_fn blk_wait_while_drained(BlockBackend *blk)
>   }
>   
>   /* To be called between exactly one pair of blk_inc/dec_in_flight() */
> -int coroutine_fn
> -blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
> -                 QEMUIOVector *qiov, BdrvRequestFlags flags)
> +static int coroutine_fn
> +blk_co_do_preadv_part(BlockBackend *blk, int64_t offset, int64_t bytes,
> +                      QEMUIOVector *qiov, size_t qiov_offset,
> +                      BdrvRequestFlags flags)
>   {
>       int ret;
>       BlockDriverState *bs;
> @@ -1311,7 +1312,8 @@ blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
>                   bytes, false);
>       }
>   
> -    ret = bdrv_co_preadv(blk->root, offset, bytes, qiov, flags);
> +    ret = bdrv_co_preadv_part(blk->root, offset, bytes, qiov, qiov_offset,
> +                              flags);
>       bdrv_dec_in_flight(bs);
>       return ret;
>   }
> @@ -1324,7 +1326,21 @@ int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>       IO_OR_GS_CODE();
>   
>       blk_inc_in_flight(blk);
> -    ret = blk_co_do_preadv(blk, offset, bytes, qiov, flags);
> +    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, 0, flags);
> +    blk_dec_in_flight(blk);
> +
> +    return ret;
> +}
> +
> +int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, QEMUIOVector *qiov,
> +                                    size_t qiov_offset, BdrvRequestFlags flags)
> +{
> +    int ret;
> +    IO_OR_GS_CODE();
> +
> +    blk_inc_in_flight(blk);
> +    ret = blk_co_do_preadv_part(blk, offset, bytes, qiov, qiov_offset, flags);
>       blk_dec_in_flight(blk);
>   
>       return ret;
> @@ -1541,8 +1557,8 @@ static void blk_aio_read_entry(void *opaque)
>       QEMUIOVector *qiov = rwco->iobuf;
>   
>       assert(qiov->size == acb->bytes);
> -    rwco->ret = blk_co_do_preadv(rwco->blk, rwco->offset, acb->bytes,
> -                                 qiov, rwco->flags);
> +    rwco->ret = blk_co_do_preadv_part(rwco->blk, rwco->offset, acb->bytes, qiov,
> +                                      0, rwco->flags);
>       blk_aio_complete(acb);
>   }
>   
> diff --git a/block/coroutines.h b/block/coroutines.h
> index 443ef2f2e6..85423f8db6 100644
> --- a/block/coroutines.h
> +++ b/block/coroutines.h
> @@ -63,11 +63,6 @@ nbd_co_do_establish_connection(BlockDriverState *bs, bool blocking,
>                                  Error **errp);
>   
>   
> -int coroutine_fn
> -blk_co_do_preadv(BlockBackend *blk, int64_t offset, int64_t bytes,
> -                 QEMUIOVector *qiov, BdrvRequestFlags flags);
> -
> -
>   int coroutine_fn
>   blk_co_do_pwritev_part(BlockBackend *blk, int64_t offset, int64_t bytes,
>                          QEMUIOVector *qiov, size_t qiov_offset,
> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 3b548a8ae1..29954a466c 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -108,6 +108,13 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
>   int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
>                                       int64_t bytes, const void *buf,
>                                       BdrvRequestFlags flags);
> +int generated_co_wrapper blk_preadv_part(BlockBackend *blk, int64_t offset,
> +                                         int64_t bytes, QEMUIOVector *qiov,
> +                                         size_t qiov_offset,
> +                                         BdrvRequestFlags flags);
> +int coroutine_fn blk_co_preadv_part(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, QEMUIOVector *qiov,
> +                                    size_t qiov_offset, BdrvRequestFlags flags);
>   int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
>                                       int64_t bytes, QEMUIOVector *qiov,
>                                       BdrvRequestFlags flags);
> diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
> index b9c5da3a87..2fa1248445 100644
> --- a/tests/unit/test-block-iothread.c
> +++ b/tests/unit/test-block-iothread.c
> @@ -168,6 +168,21 @@ static void test_sync_op_blk_pwritev(BlockBackend *blk)
>       g_assert_cmpint(ret, ==, -EIO);
>   }
>   
> +static void test_sync_op_blk_preadv_part(BlockBackend *blk)
> +{
> +    uint8_t buf[512];
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
> +    int ret;
> +
> +    /* Success */
> +    ret = blk_preadv_part(blk, 0, sizeof(buf), &qiov, 0, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* Early error: Negative offset */
> +    ret = blk_preadv_part(blk, -2, sizeof(buf), &qiov, 0, 0);
> +    g_assert_cmpint(ret, ==, -EIO);
> +}
> +
>   static void test_sync_op_load_vmstate(BdrvChild *c)
>   {
>       uint8_t buf[512];
> @@ -339,6 +354,10 @@ const SyncOpTest sync_op_tests[] = {
>           .name   = "/sync-op/pwritev",
>           .fn     = NULL,
>           .blkfn  = test_sync_op_blk_pwritev,
> +    }, {
> +        .name   = "/sync-op/preadv_part",
> +        .fn     = NULL,
> +        .blkfn  = test_sync_op_blk_preadv_part,
>       }, {
>           .name   = "/sync-op/load_vmstate",
>           .fn     = test_sync_op_load_vmstate,


