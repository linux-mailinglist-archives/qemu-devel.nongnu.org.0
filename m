Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ABA52A50E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:37:58 +0200 (CEST)
Received: from localhost ([::1]:43408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyKj-0008DX-HW
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyIE-0005Ii-JQ; Tue, 17 May 2022 10:35:25 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqyIA-0000ib-QY; Tue, 17 May 2022 10:35:22 -0400
Received: by mail-ed1-x52c.google.com with SMTP id i40so7695437eda.7;
 Tue, 17 May 2022 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f7N5lUhlcB9ZM4kj+SZULKbYAlgKvgr83fZj4M3tFCQ=;
 b=KGrWT6ninFstJF5UK2oC5s/ujpiBzf2kVwR9Lvcx/tZJ6ltp5gGnSX7aJSLF7MO5H+
 hE5qOes6X+LlCvHSm2jBJJPknog51zxnlKi0i8UQeL8Isa0aTwjvH5G4mF1N0oJOj3ko
 HKbwNmqSqSp2LOD12BeWdwtMKBABEIFq3K/Zzwb5OPW7/oQiGl+tuV9Q2LhTmAiVPRXN
 KfkMHzdsgPoHiBZ+0hoaiV6KKXAvnqE71jbwY6RbbF2EDPAZ6wQn9QYc8yK+8UKUCWfj
 xoGap0kDe1Xf3j/Y5BX2XFIHvK6gLQMwycdPM8VLg5PGBQ5vmqZGZLsx19IfmjgyM7Xk
 T6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=f7N5lUhlcB9ZM4kj+SZULKbYAlgKvgr83fZj4M3tFCQ=;
 b=mPpGD/h5VAot9Sr7lxQnPh1Yxe5YlYKql3IpB1De+ToTy1GKvWnBk0cNPtKsIZ2V8M
 g0UQuGfw2ywV4h0tRG+CzSYrlhHLHtDzd/i0PhECiZ90v2zWcfyO/6rqQkfbaqsa4p5Y
 qyVm8q6aVVKqvhJ1bikUN7+JtO4PUKcaWrKFD7ErC1tz/xIATomDMnImv7ukOR52zXcJ
 b+/Ge9cisVdZPQw9B2MmcNHlbUJrw3Yv0hMn4UfO/A007N71v2MtL2l0UvvYf0sSamqN
 xhPZDMUELQ1Y7gE0EcT1jci804R18iNhpXLO+WT/R2VsrtMIAj13LFLFyGzAyRvYOUNj
 2e2Q==
X-Gm-Message-State: AOAM532t9y2CXWcmSafw8/+o6EAFjag7/YUn3vifUTBhb/O1ABP49yNr
 8iCEE0dwvrN301ceT6r5ZFo=
X-Google-Smtp-Source: ABdhPJwKwUfFvTA15qQW5ctl4DBXB/Cxu6VEHDUciJu6jdhgK+197KTz1Svo+uvF2AnnKCPTeHYa+w==
X-Received: by 2002:a50:d0d5:0:b0:42a:ab4d:5635 with SMTP id
 g21-20020a50d0d5000000b0042aab4d5635mr13658873edf.271.1652798110827; 
 Tue, 17 May 2022 07:35:10 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 h12-20020a170906530c00b006f3ef214e4asm1100579ejo.176.2022.05.17.07.35.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:35:10 -0700 (PDT)
Message-ID: <cf4677b0-594f-e286-58b9-b16df9304b20@redhat.com>
Date: Tue, 17 May 2022 16:35:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 07/18] block: Add blk_{preadv,pwritev}()
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113837.199696-3-afaria@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220517113837.199696-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
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
> Implement them using generated_co_wrapper.
> 
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   include/sysemu/block-backend-io.h |  6 +++++
>   tests/unit/test-block-iothread.c  | 42 ++++++++++++++++++++++++++++++-
>   2 files changed, 47 insertions(+), 1 deletion(-)

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

> diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-backend-io.h
> index 0804ce1c1d..3b548a8ae1 100644
> --- a/include/sysemu/block-backend-io.h
> +++ b/include/sysemu/block-backend-io.h
> @@ -108,6 +108,9 @@ int generated_co_wrapper blk_pread(BlockBackend *blk, int64_t offset,
>   int generated_co_wrapper blk_pwrite(BlockBackend *blk, int64_t offset,
>                                       int64_t bytes, const void *buf,
>                                       BdrvRequestFlags flags);
> +int generated_co_wrapper blk_preadv(BlockBackend *blk, int64_t offset,
> +                                    int64_t bytes, QEMUIOVector *qiov,
> +                                    BdrvRequestFlags flags);
>   int coroutine_fn blk_co_preadv(BlockBackend *blk, int64_t offset,
>                                  int64_t bytes, QEMUIOVector *qiov,
>                                  BdrvRequestFlags flags);
> @@ -115,6 +118,9 @@ int coroutine_fn blk_co_pwritev_part(BlockBackend *blk, int64_t offset,
>                                        int64_t bytes,
>                                        QEMUIOVector *qiov, size_t qiov_offset,
>                                        BdrvRequestFlags flags);
> +int generated_co_wrapper blk_pwritev(BlockBackend *blk, int64_t offset,
> +                                     int64_t bytes, QEMUIOVector *qiov,
> +                                     BdrvRequestFlags flags);
>   int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
>                                   int64_t bytes, QEMUIOVector *qiov,
>                                   BdrvRequestFlags flags);
> diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
> index 0ced5333ff..b9c5da3a87 100644
> --- a/tests/unit/test-block-iothread.c
> +++ b/tests/unit/test-block-iothread.c
> @@ -138,6 +138,36 @@ static void test_sync_op_blk_pwrite(BlockBackend *blk)
>       g_assert_cmpint(ret, ==, -EIO);
>   }
>   
> +static void test_sync_op_blk_preadv(BlockBackend *blk)
> +{
> +    uint8_t buf[512];
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
> +    int ret;
> +
> +    /* Success */
> +    ret = blk_preadv(blk, 0, sizeof(buf), &qiov, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* Early error: Negative offset */
> +    ret = blk_preadv(blk, -2, sizeof(buf), &qiov, 0);
> +    g_assert_cmpint(ret, ==, -EIO);
> +}
> +
> +static void test_sync_op_blk_pwritev(BlockBackend *blk)
> +{
> +    uint8_t buf[512] = { 0 };
> +    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, sizeof(buf));
> +    int ret;
> +
> +    /* Success */
> +    ret = blk_pwritev(blk, 0, sizeof(buf), &qiov, 0);
> +    g_assert_cmpint(ret, ==, 0);
> +
> +    /* Early error: Negative offset */
> +    ret = blk_pwritev(blk, -2, sizeof(buf), &qiov, 0);
> +    g_assert_cmpint(ret, ==, -EIO);
> +}
> +
>   static void test_sync_op_load_vmstate(BdrvChild *c)
>   {
>       uint8_t buf[512];
> @@ -301,6 +331,14 @@ const SyncOpTest sync_op_tests[] = {
>           .name   = "/sync-op/pwrite",
>           .fn     = test_sync_op_pwrite,
>           .blkfn  = test_sync_op_blk_pwrite,
> +    }, {
> +        .name   = "/sync-op/preadv",
> +        .fn     = NULL,
> +        .blkfn  = test_sync_op_blk_preadv,
> +    }, {
> +        .name   = "/sync-op/pwritev",
> +        .fn     = NULL,
> +        .blkfn  = test_sync_op_blk_pwritev,
>       }, {
>           .name   = "/sync-op/load_vmstate",
>           .fn     = test_sync_op_load_vmstate,
> @@ -349,7 +387,9 @@ static void test_sync_op(const void *opaque)
>   
>       blk_set_aio_context(blk, ctx, &error_abort);
>       aio_context_acquire(ctx);
> -    t->fn(c);
> +    if (t->fn) {
> +        t->fn(c);
> +    }
>       if (t->blkfn) {
>           t->blkfn(blk);
>       }


