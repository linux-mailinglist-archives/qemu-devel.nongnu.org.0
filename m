Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86868D5ED
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 12:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMRX-000186-T3; Tue, 07 Feb 2023 06:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMRN-00015v-Dt
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:47:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pPMRL-0006N6-B3
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 06:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675770430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JwCQALvpEKnX+OHKmwHymoF2j4i3cEBmzyI9ayf2vw8=;
 b=KhG/WBqvZVFPZcl6j9ticO6eHNo1s2zn8AlilGvV1GxBeu9TcC+xKdvVdtWNUqUieXws2u
 HmoxcNG3ExXI9waMLqSMNiGZeNhp85rRAQ2ztrsIYWbwjzNrt48IjepfRZRVf6e5KZqgIS
 UfLzSTmMMpXgbqymW+adCS9SjyIjhhM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-kuHOBmUnM8KHlwrkwuRqlg-1; Tue, 07 Feb 2023 06:47:09 -0500
X-MC-Unique: kuHOBmUnM8KHlwrkwuRqlg-1
Received: by mail-wr1-f69.google.com with SMTP id
 o9-20020adfa109000000b002bfc062eaa8so2012365wro.20
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 03:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JwCQALvpEKnX+OHKmwHymoF2j4i3cEBmzyI9ayf2vw8=;
 b=oRieF8d2mhfHsy9KpYtpE0WiWBvj0AFtatTFw6ay9khr0fDQHzYAF554yIAiN3tRrU
 tlTsX1zHeDPcKGVXi1zJx9h5o2D5m0DienPsEBesxTWUHKy+XeQ39eq2gWrb5JFrhVNh
 X3TiYpb0vQ+2FlmngKnPdkI0HHJfB/VLMK6ss4vvRNp3gb6AWeFkM1P80KgO4rcNqwjV
 Ceom/s7dbuTx0ZxAQJwh0jqnCriBy+8pe1JmdyEnagFiU/qbRMEQJSzWD496FfJf81W+
 xw+zIaUDkY1nzirS5YfnoKCQ+AM6rxFAocQjIkUMyMpfTFtVCiUBr2j30Kl6UnmUYO27
 jaTQ==
X-Gm-Message-State: AO0yUKURCD+N2za/ABILEFHNcT3Dgz5UQUZHImEKldXYi76AepO1aMgB
 BRs4hMVvvbIn6Wa9UZrIL2wZ3fsW2rlnsXT8vqqL+AAS3+DdqieSacFv6+v4KWOJ5o41/RI9V2G
 qXfzxTB4KBKQnSUg=
X-Received: by 2002:adf:d08a:0:b0:236:695b:82d4 with SMTP id
 y10-20020adfd08a000000b00236695b82d4mr2544294wrh.30.1675770428119; 
 Tue, 07 Feb 2023 03:47:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/Ed+dsk89GxoT1tUx40sn0HlnOd5xKnAEiDbR+VcDKziHQJozWSNsXFvVSSRRQD5ZrUsRBKg==
X-Received: by 2002:adf:d08a:0:b0:236:695b:82d4 with SMTP id
 y10-20020adfd08a000000b00236695b82d4mr2544273wrh.30.1675770427893; 
 Tue, 07 Feb 2023 03:47:07 -0800 (PST)
Received: from ?IPV6:2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f?
 (p200300cfd7084b2cf69ddcc680c89f6f.dip0.t-ipconnect.de.
 [2003:cf:d708:4b2c:f69d:dcc6:80c8:9f6f])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a5d69c2000000b002c3de83be0csm8362332wrw.87.2023.02.07.03.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 03:47:07 -0800 (PST)
Message-ID: <dc546b88-9e0b-cc50-704a-64084fd91144@redhat.com>
Date: Tue, 7 Feb 2023 12:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 3/4] qemu-io: add -r option to register I/O buffer
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Fiona Ebner <f.ebner@proxmox.com>,
 Eric Blake <eblake@redhat.com>
References: <20230201152751.270508-1-stefanha@redhat.com>
 <20230201152751.270508-4-stefanha@redhat.com>
From: Hanna Czenczek <hreitz@redhat.com>
In-Reply-To: <20230201152751.270508-4-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 01.02.23 16:27, Stefan Hajnoczi wrote:
> The blk_register_buf() API is an optimization hint that allows some
> block drivers to avoid I/O buffer housekeeping or bounce buffers.
>
> Add an -r option to register the I/O buffer so that qemu-io can be used
> to test the blk_register_buf() API. The next commit will add a test that
> uses the new option.
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   qemu-io-cmds.c | 167 +++++++++++++++++++++++++++++++++----------------
>   1 file changed, 114 insertions(+), 53 deletions(-)
>
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index c0125d14c0..4b8dbef36d 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c

[...]

> @@ -347,17 +348,24 @@ static void *qemu_io_alloc(BlockBackend *blk, size_t len, int pattern)
>       }
>       buf = blk_blockalign(blk, len);
>       memset(buf, pattern, len);
> +    if (register_buf) {
> +        blk_register_buf(blk, buf, len, &error_abort);
> +    }
>       if (qemuio_misalign) {
>           buf += MISALIGN_OFFSET;
>       }
>       return buf;
>   }
>   
> -static void qemu_io_free(void *p)
> +static void qemu_io_free(BlockBackend *blk, void *p, size_t len,
> +                         bool unregister_buf)
>   {
>       if (qemuio_misalign) {
>           p -= MISALIGN_OFFSET;
>       }
> +    if (unregister_buf) {
> +        blk_unregister_buf(blk, p, len);

If `qemuio_misalign` is set, we must also increase `len` by 
`MISALIGN_OFFSET`, I think, or it won’t match what’s been used in 
`qemu_io_alloc()`.

> +    }
>       qemu_vfree(p);
>   }

[...]

> @@ -414,6 +423,10 @@ static void *qemu_io_alloc_from_file(BlockBackend *blk, size_t len,
>       fclose(f);
>       f = NULL;
>   
> +    if (register_buf) {
> +        blk_register_buf(blk, buf_origin, len, &error_abort);

`qemu_io_alloc()` registers the buffer before `MISALIGN_OFFSET` is/might 
be applied, and `qemu_io_free()` assumes this is the case (the buffer to 
be unregistered is passed after the offset has been subtracted again).  
Here, however, the offset has already been applied, so there’ll be a 
mismatch with `blk_unregister_buf()` when `qemu_io_free()` is called 
(and `qemuio_misalign` is set).

> +    }
> +
>       if (len > pattern_len) {
>           len -= pattern_len;
>           buf += pattern_len;

[...]

> @@ -750,6 +768,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
>       int64_t total = 0;
>       int pattern = 0;
>       int64_t pattern_offset = 0, pattern_count = 0;
> +    BdrvRequestFlags flags = 0;
>   
>       while ((c = getopt(argc, argv, "bCl:pP:qs:v")) != -1) {

I think we’ll need the "r" here.

>           switch (c) {

[...]

> @@ -1384,8 +1434,9 @@ static void aio_write_done(void *opaque, int ret)
>                    ctx->qiov.size, 1, ctx->Cflag);
>   out:
>       if (!ctx->zflag) {
> -        qemu_io_free(ctx->buf);
>           qemu_iovec_destroy(&ctx->qiov);
> +        qemu_io_free(ctx->blk, ctx->buf, ctx->qiov.size,
> +                     ctx->flags & BDRV_REQ_REGISTERED_BUF);

So far in this patch, you’ve always swapped the existing 
qemu_iovec_destroy(); qemu_io_free() combination to qemu_io_free(); 
qemu_iovec_destroy().  I think that is correct because 
qemu_iovec_destroy() overwrites the qiov by 0, so that accessing 
qiov.size will then read 0, regardless of what it was before.

Here, you’re swapping it the other way around, which means that 
`ctx->qiov.size` will read 0 when `qemu_io_free()` is called, which 
seems wrong.

>       }
>       g_free(ctx);
>   }

[...]

> @@ -1663,12 +1724,12 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
>           }
>   
>           ctx->qiov.size = count;
> -        blk_aio_pwrite_zeroes(blk, ctx->offset, count, flags, aio_write_done,
> -                              ctx);
> +        blk_aio_pwrite_zeroes(blk, ctx->offset, count, ctx->flags,
> +                              aio_write_done, ctx);

write_f() emits an error when -r is used together with -z – why doesn’t 
this function, too?  (Or, alternatively, why does write_f()?  Maybe we 
want to check what happens when you call a zero-writing function with 
that flag.  Or we don’t.)

Hanna

>       } else {
>           nr_iov = argc - optind;
>           ctx->buf = create_iovec(blk, &ctx->qiov, &argv[optind], nr_iov,
> -                                pattern);
> +                                pattern, ctx->flags & BDRV_REQ_REGISTERED_BUF);
>           if (ctx->buf == NULL) {
>               block_acct_invalid(blk_get_stats(blk), BLOCK_ACCT_WRITE);
>               g_free(ctx);


