Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FA14FDD3C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 13:08:38 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neENx-0004sF-4v
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 07:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neEKc-0001iR-WB
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:05:11 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neEKZ-0004gW-1U
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 07:05:10 -0400
Received: by mail-wr1-x434.google.com with SMTP id c10so6055317wrb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 04:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CJvU4zGekh+N/kt1H06KFuHWrUB2ucqhBdko4CKac4M=;
 b=DbAPJKzrPQotjIbvOpvnbwbMWHnl2t06n/0as4dwX+klYdnvCJPs6G02+TQeq82R/h
 QWmVwJqUA/sbQGEQIUzeJ/jwuZ7Yl00jbFNWzlCQgBRAhZ9Islr78JjfY0tr4iYdvMKM
 BOcyFkk4wjVBZZzKUkt3PUHsoM13lfGiDp7O1Xk6ByFTfTfS8BsgNlgdIrsSsVlQLc/g
 +45bF/unCzIeKm03HNWWT40OwBkMgCCZgfuRqJfwaFeoHi+G1pnenVkErwFOUqOitcZ9
 Zy6RXMjMrk8Zr7GQngbNVYSA17mZ2aqHTPAZQGf3WbS6/YNR+GahRYm5V/FYilPDVLOE
 WyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CJvU4zGekh+N/kt1H06KFuHWrUB2ucqhBdko4CKac4M=;
 b=o5PRYTphY9qsw2q/S3+UlQy7jO29No+1pkAV2MzddGIPNLSfKrI+gQyEbz/akkThLm
 hovkFUzl4S/nBmvCKLA/EIwd+k9FcDLcOlUQKWreAB5pgl6yBJiM6rup8Qq2zacCs2st
 Nq2nA/GAVCu3URIuvWIgQDAtPK2+mtBwFBF5wfCH6fZqn/urkl0UBtWUwMz1O3HEGxcA
 zfyONOMhx8ZI7g0qwwC4YyOIPswOzU7vpQDzAU3/26iUsPkvPhey+lSrPZxpVj6l8XOm
 s65eQLIi05+SW5z5rIgkhb7/CVAsa7ZeT9zbh74koRrOGu3nqdNnLuHrZtaBgLfXYJqb
 m2cg==
X-Gm-Message-State: AOAM53360dD2NWdepRxMemVhGrzOTHCkHY2LQZjOE70dDCyl0C1LPLo8
 YvTMP/bpn6/4bzMfsxDOX8gh0uiHmBnUMQ==
X-Google-Smtp-Source: ABdhPJzY0P3t2w0b+I1oXoGF9h8Z/p5p8EGhQT2IrTgvR/Ig4RwGyiqNsNRcRCc1bbebSWlLBQFnMA==
X-Received: by 2002:a5d:6dd1:0:b0:207:92c4:eaef with SMTP id
 d17-20020a5d6dd1000000b0020792c4eaefmr17272382wrz.498.1649761502268; 
 Tue, 12 Apr 2022 04:05:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 p3-20020adfaa03000000b00207a1db96cfsm7919946wrd.71.2022.04.12.04.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 04:05:01 -0700 (PDT)
Message-ID: <01492470-4870-b5cd-465a-7b6a84e389e1@redhat.com>
Date: Tue, 12 Apr 2022 13:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] block: fix core for unlock not permitted
Content-Language: en-US
To: suruifeng <suruifeng1@huawei.com>, qemu-devel@nongnu.org
References: <20220412071323.580078-1-suruifeng1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220412071323.580078-1-suruifeng1@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
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

On 4/12/22 09:13, suruifeng via wrote:
> qemu coredump:
>    0x00007f9e7205c81b in raise () from /usr/lib64/libc.so.6
>    0x00007f9e7205db41 in abort () from /usr/lib64/libc.so.6
>    0x00007f9e71ddbe94 in error_exit (err=<optimized out>, msg=msg@entry=0x7f9e71ec1b50 <__func__.20287> "qemu_mutex_unlock_impl")
>      at /usr/src/debug/qemu-4.1.0-170.x86_64/util/qemu-thread-posix.c:36
>    0x00007f9e71ddc61f in qemu_mutex_unlock_impl (mutex=mutex@entry=0x5559850b0b90, file=file@entry=0x7f9e71ec0978 "/home/abuild/rpmbuild/BUILD/qemu-4.1.0/util/async.c",
>      line=line@entry=524) at /usr/src/debug/qemu-4.1.0-170.x86_64/util/qemu-thread-posix.c:108
>    0x00007f9e71dd5bb5 in aio_context_release (ctx=ctx@entry=0x5559850b0b30) at /usr/src/debug/qemu-4.1.0-170.x86_64/util/async.c:524
>    0x00007f9e70dfed28 in bdrv_flush (bs=bs@entry=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block/io.c:2778
>    0x00007f9e70e37f63 in bdrv_close (bs=bs@entry=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:4025
>    0x00007f9e70e38193 in bdrv_delete (bs=0x5559851f0a20) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:4271
>    0x00007f9e70e38225 in bdrv_unref (bs=<optimized out>) at /usr/src/debug/qemu-4.1.0-170.x86_64/block.c:5612
>    0x00007f9e70df9a92 in bdrv_next (it=it@entry=0x7ffc5e3547a0) at /usr/src/debug/qemu-4.1.0-170.x86_64/block/block-backend.c:576
>    0x00007f9e70dfee76 in bdrv_flush_all () at /usr/src/debug/qemu-4.1.0-170.x86_64/block/io.c:2074
>    0x00007f9e71e3a08f in do_vm_stop (state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) at /usr/src/debug/qemu-4.1.0-170.x86_64/cpus.c:1140
>    0x00007f9e71e3a14c in vm_shutdown () at /usr/src/debug/qemu-4.1.0-170.x86_64/cpus.c:1151
> 
> During mirror job run, the VM is shutdown. During the shutdown, the mirror job I/O error triggers mirror_exit_commom.
> In bdrv_flush_all(), bdrv_next() increase the ref to mirror_top_bs first,
> and then bdrv_flush(bs) call BDRV_POLL_WHILE and executes mirror_exit_common() decreases ref to mirror_top_bs,
> and finally bdrv_next() decreases the ref to mirror_top_bs, resulting in release mirror_top_bs.
> 
> Let's fix this by adding aio_context_acquire() and aio_context_release() to bdrv_next().

Hi,

is this reproducible with a more recent version of QEMU?  In particular, 
bdrv_next does not have bdrv_unref anymore.

Paolo

> Signed-off-by: suruifeng <suruifeng1@huawei.com>
> ---
>   block/block-backend.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/block/block-backend.c b/block/block-backend.c
> index e0e1aff4b1..5ae745c0ab 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -593,6 +593,7 @@ BlockBackend *blk_next(BlockBackend *blk)
>   BlockDriverState *bdrv_next(BdrvNextIterator *it)
>   {
>       BlockDriverState *bs, *old_bs;
> +    AioContext *ctx = NULL;
>   
>       /* Must be called from the main loop */
>       assert(qemu_get_current_aio_context() == qemu_get_aio_context());
> @@ -613,11 +614,17 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
>           if (it->blk) {
>               blk_ref(it->blk);
>           }
> +	ctx = blk_get_aio_context(old_blk);
> +	aio_context_acquire(ctx);
>           blk_unref(old_blk);
> +	aio_context_release(ctx);
>   
>           if (bs) {
>               bdrv_ref(bs);
> +	    ctx = bdrv_get_aio_context(old_bs);
> +	    aio_context_acquire(ctx);
>               bdrv_unref(old_bs);
> +	    aio_context_release(ctx);
>               return bs;
>           }
>           it->phase = BDRV_NEXT_MONITOR_OWNED;
> @@ -636,7 +643,10 @@ BlockDriverState *bdrv_next(BdrvNextIterator *it)
>       if (bs) {
>           bdrv_ref(bs);
>       }
> +    ctx = bdrv_get_aio_context(old_bs);
> +    aio_context_acquire(ctx);
>       bdrv_unref(old_bs);
> +    aio_context_release(ctx);
>   
>       return bs;
>   }


