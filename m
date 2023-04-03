Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B46D3E11
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:27:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEZc-000536-Gl; Mon, 03 Apr 2023 03:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEZZ-00052q-Jx
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:25:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjEZY-0003W5-4A
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:25:49 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 u11-20020a05600c19cb00b003edcc414997so17452157wmq.3
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680506745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E25WhWnmLEsErYrxKS6MOfGlhcBCmtDkm21jQA76bWo=;
 b=y7DG9GLc5SImDArEsI8npSExqTyRyRJbGoJCE3of1gYvUGY89pPXC3/Mk3md5rqvWA
 KKqs75pQYk2E5q5c0d7aCXu3N2JShidoC64J0kjuPMcflEvng3khpZr7geEY67n4/rDd
 67emNBbUFAJdslHRNoMzjjeNnlPeBrxPoF/tify3tuAhITiUqJKlQtxcsovoV4nkyCjs
 8LxAJmtR0+r92R6kmMWTtpEz7JE+ZGvcwPUgpK5N3JCabAMg/hYGKE5YfZH6iox+Eu8T
 phVl5R8c3yaeuhpTocp6jNwfxYjyJmd3f1BxH8JtBuHW3VJp0Q7XPiD5FPNE+76/X0rL
 nqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680506745;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E25WhWnmLEsErYrxKS6MOfGlhcBCmtDkm21jQA76bWo=;
 b=S3SnLtSGdYNhMThR0r2lmR/MC7BafUkrr0h2nZpq+dAVjjpx5uZWG2E6WzlgqL0UMH
 2XkX3vjFe5q+1ciD5yL8QzhhY/icSpaXtiRfBA6EXhT8U03fQqlSKTwW05waN86LHvfN
 sMnxVXyvvSBy6WdbTVOK2oAI5afXZ2KZexJsGg2Xa2HlHqlDhvO1Z6FQJe/baKt8BK+5
 JPWxO6eDONXSN5TuWSL/sSs6nlu853nnEoUXiEcnIUPdyLz4BRXvlWTI/l1MGdYB7gXQ
 il7NC4vX3ldihHgcLb3Yd6BAKyc6TFQCTMWO8lp+UdPx5HCz9q5ws41JLjCKljH/tFt5
 lpag==
X-Gm-Message-State: AO0yUKXyxZ2LQcC2yremd9fac7gvmQ0Q+iuzvOI5uvoDjr2vcnIHl44B
 IPWzWr0O55KngFKzB4K4FZqrkA==
X-Google-Smtp-Source: AK7set/mkvIREOck244dkuARe519BXYWsqAsy759LP6qZeItsuOovVxCoPbqftYwadTQXCbIm34mhA==
X-Received: by 2002:a7b:c850:0:b0:3ee:93c8:4a6f with SMTP id
 c16-20020a7bc850000000b003ee93c84a6fmr26333902wml.32.1680506745390; 
 Mon, 03 Apr 2023 00:25:45 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 s15-20020a05600c45cf00b003eb2e33f327sm28943902wmo.2.2023.04.03.00.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Apr 2023 00:25:44 -0700 (PDT)
Message-ID: <a7f32544-1633-c3fa-8115-cbf5f2cc2876@linaro.org>
Date: Mon, 3 Apr 2023 09:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 01/14] ram.c: Let the compress threads return a
 CompressResult enum
Content-Language: en-US
To: Lukas Straub <lukasstraub2@web.de>, qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
References: <cover.1680457764.git.lukasstraub2@web.de>
 <18ad4a56517e3d63411e7cb8df6b47fe0162c406.1680457764.git.lukasstraub2@web.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <18ad4a56517e3d63411e7cb8df6b47fe0162c406.1680457764.git.lukasstraub2@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/4/23 19:56, Lukas Straub wrote:
> This will be used in the next commits to move save_page_header()
> out of compress code.
> 
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
> ---
>   migration/ram.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 9d1817ab7b..ca561e62bd 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -493,10 +493,17 @@ MigrationOps *migration_ops;
> 
>   CompressionStats compression_counters;
> 
> +enum CompressResult {
> +    RES_NONE = 0,

What about RES_INVALID?

> +    RES_ZEROPAGE = 1,
> +    RES_COMPRESS = 2
> +};


> -static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
> -                                 ram_addr_t offset, uint8_t *source_buf)
> +static CompressResult do_compress_ram_page(QEMUFile *f, z_stream *stream,
> +                                           RAMBlock *block, ram_addr_t offset,
> +                                           uint8_t *source_buf)
>   {


>       if (ret < 0) {
>           qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
>           error_report("compressed data failed!");
> +        return RES_NONE;
>       }
> -    return false;
> +    return RES_COMPRESS;
>   }


