Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765C4623DB6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 09:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot3AI-0007m7-82; Thu, 10 Nov 2022 03:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3AG-0007lr-Qa
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:44:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ot3AF-0004V3-9s
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668069838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mu6PGWHQAyPMFcNUp3QJ1FXg4Kaja9xBtnLCpW11UIw=;
 b=OV13HqJ4uIU8HVuOOutq4umKyuLSNOBa9STZGfp9lwHX+v1RHrnTqg4brtVOmBmcBebzr6
 7tQGaLwedxh3PqcbqZzcibikgOZKlvNW8X7/+J3yhcdPyxE+WU7yZdE5n7E+wafXJ/yPdf
 PK93XTHyWh7WwYxhw0EtLovkCfZ8oZU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-I4IDYZ6JN4aKSgWAT0kJXg-1; Thu, 10 Nov 2022 03:43:54 -0500
X-MC-Unique: I4IDYZ6JN4aKSgWAT0kJXg-1
Received: by mail-pl1-f197.google.com with SMTP id
 q10-20020a170902f34a00b00186c5448b01so981370ple.4
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 00:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mu6PGWHQAyPMFcNUp3QJ1FXg4Kaja9xBtnLCpW11UIw=;
 b=7Sa87Xu3kZttZSFISLB3dvfIR9p6neHy39PRgloUi9SVZV5KZkipvusm+HsxVcYE6v
 BtjL9zCPwuYR+L9BfcDokBWBJmaFaX8Iw5AAshHHLtx4HyUCSaPhXsWCBJwujvcsfQ/7
 NTOCUqUaHmVQmhyHn36Qy7CmadnnDPKPa6Rers/xa6/XvOOOCghcq5T8mff1J61Q2w72
 b8fPrTr4loYA/BB796DJS87V8QXaMcCqU99/ms8HgIOIhLK9wZhYBVYQ6NtKi65mKfYy
 UFDjo2eL9VtTtQ4v5VcIleyOvyuYdi7BHQuksowkkXG3aLdHcFCscCFwdf4rDzahgxH/
 pXvA==
X-Gm-Message-State: ACrzQf0KQx2yp3rlfMMhaP5HobjMPT7/TAf4jiOvAdwS8Yehg+pb7NdN
 RSHF9tol3P90uInmBLxyWXs8b5NWezAHbW+cSaN/aAt+Rb7q1fCeuD/YeAFs1rmqjGgpwkgVbiN
 brRXz18WzGHy4q1g=
X-Received: by 2002:a63:5b23:0:b0:46f:6d7d:cd10 with SMTP id
 p35-20020a635b23000000b0046f6d7dcd10mr55438481pgb.194.1668069833341; 
 Thu, 10 Nov 2022 00:43:53 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5Z0x8uON5pKSr2Mbe281jCa3lorJbzeEfJpBECJXPdQK9FI9Acyf6mfPa16rapGrUzDDc7ow==
X-Received: by 2002:a63:5b23:0:b0:46f:6d7d:cd10 with SMTP id
 p35-20020a635b23000000b0046f6d7dcd10mr55438474pgb.194.1668069833098; 
 Thu, 10 Nov 2022 00:43:53 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a632210000000b0043a18cef977sm8537526pgi.13.2022.11.10.00.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 00:43:52 -0800 (PST)
Message-ID: <31162033-52ac-5548-2ae3-184282b6d889@redhat.com>
Date: Thu, 10 Nov 2022 09:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] qemu-img: remove unused variable
Content-Language: en-US
To: mrezanin@redhat.com, qemu-devel@nongnu.org, Kevin Wolf
 <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <cover.1668009030.git.mrezanin@redhat.com>
 <e86d5b57f9d13bde995c616a533b876f1fb8a527.1668009030.git.mrezanin@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e86d5b57f9d13bde995c616a533b876f1fb8a527.1668009030.git.mrezanin@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 09/11/2022 16.57, mrezanin@redhat.com wrote:
> From: Miroslav Rezanina <mrezanin@redhat.com>
> 
> Variable block_count used in img_dd function is only incremented but never read.
> This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.
> 
> Removing the variable to prevent the warning.
> 
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
>   qemu-img.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index a3b64c88af..a9b3a8103c 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -4922,7 +4922,7 @@ static int img_dd(int argc, char **argv)
>       const char *out_fmt = "raw";
>       const char *fmt = NULL;
>       int64_t size = 0;
> -    int64_t block_count = 0, out_pos, in_pos;
> +    int64_t out_pos, in_pos;
>       bool force_share = false;
>       struct DdInfo dd = {
>           .flags = 0,
> @@ -5122,7 +5122,7 @@ static int img_dd(int argc, char **argv)
>   
>       in.buf = g_new(uint8_t, in.bsz);
>   
> -    for (out_pos = 0; in_pos < size; block_count++) {
> +    for (out_pos = 0; in_pos < size; ) {
>           int bytes = (in_pos + in.bsz > size) ? size - in_pos : in.bsz;
>   
>           ret = blk_pread(blk1, in_pos, bytes, in.buf, 0);

Reviewed-by: Thomas Huth <thuth@redhat.com>


