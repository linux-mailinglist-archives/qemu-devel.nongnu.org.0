Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396316AE65E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZa5i-0003KL-JT; Tue, 07 Mar 2023 11:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZa5g-0003Fv-ML
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:23:04 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZa5e-0007PL-Vl
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:23:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id g3so12712376wri.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678206181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VIrWk4nWVqSR5TEG7FXgNEWAkkmhywsMHnAZ1uAxCT0=;
 b=hpHTQUQDkCLPM8JiOVwmIqboJYVjmss/CCNT+uDSEVtX/rp9dsth6ABGQuQJ5hWVbp
 s5h8+aa5qT/3w3wJTiVGsF6EwCcSqNtpeBqHPB3xmaitF/0r18Q6KHep15cX+n9WGw7V
 wWERoV/of3qRsqY7fknAhKef0ayQZrWurl+jgBlI6GNf+ZHb2Nwf9MrrFvAxA9jVyuZP
 iVNVxlABEh+jnOUYHssJUql/hkfmTrJRJLecNStNvbF0mU9KIDn5cfA5AVez4gm0trx2
 clTPkq3/PG3ECVnAZTN2pQVSIpVWPY9Yk/esBfOCOPLpke5IzwCG3n4APDj3fIOghC/G
 Naqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678206181;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VIrWk4nWVqSR5TEG7FXgNEWAkkmhywsMHnAZ1uAxCT0=;
 b=FHZbQRlZqasIMSBZuhqI3c26Q+re+jNFxFAOB1ermWKnN888hojh7F6wmcxKRYuVmy
 8QNDWCq75OUcT4qg6zxFaKi4peTC//Mj7akRv0iIFZ3kmK1VjUHnPe3OMe/ZI1j9RV97
 DAbvLYkwYsA54b7nRv1PSYSnn13j/gOs+vW39RcZ/dvuS+iiPs2MX6gJuKOJ+aJQhDlW
 RNgNPqDgOxQ247FkJmuT1Pcnf4xh8wwWQVST5FOeqwn1CrwOUDkZKdpe9s0GkkMPHPbQ
 9vZVGTv4+Yg+w1bO7VxSKLaHuBpk3nQ0ceWSNvHr0wEKQCXr68/14UsidE3ipSvNE8hD
 /RDg==
X-Gm-Message-State: AO0yUKWnZA3eCRWaLYa4hihm6gGSK2AIMgFu3C73/vJ0HUTWkI3YZtMc
 NL/OheqfNY8/k+gFoyshNehiBhMJwcNZlJsLUN4=
X-Google-Smtp-Source: AK7set/VwWbUitFvF8cf46dXoYAjO9cERgzYopGzagCFRJ43wqVIHXvy8ar/mydffdFTkFQPWGyXSw==
X-Received: by 2002:adf:f6c6:0:b0:2c5:5d15:4e25 with SMTP id
 y6-20020adff6c6000000b002c55d154e25mr9288814wrp.16.1678206181530; 
 Tue, 07 Mar 2023 08:23:01 -0800 (PST)
Received: from [192.168.248.175] (131.red-95-127-34.staticip.rima-tde.net.
 [95.127.34.131]) by smtp.gmail.com with ESMTPSA id
 p13-20020a5d48cd000000b002c5598c14acsm12929544wrs.6.2023.03.07.08.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:23:01 -0800 (PST)
Message-ID: <be44cfd0-d107-76a3-abe5-fba82d15a646@linaro.org>
Date: Tue, 7 Mar 2023 17:22:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 2/5] pflash: Fix blk_pread_nonzeroes()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>
References: <20230307155528.3655534-1-clg@kaod.org>
 <20230307155528.3655534-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307155528.3655534-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 16:55, Cédric Le Goater wrote:
> From: Kevin Wolf <kwolf@redhat.com>
> 
> Commit a4b15a8b introduced a new function blk_pread_nonzeroes(). Instead
> of reading directly from the root node of the BlockBackend, it reads
> from its 'file' child node. This can happen to mostly work for raw
> images (as long as the 'raw' format driver is in use, but not actually
> doing anything), but it breaks everything else.
> 
> Fix it to read from the root node instead.
> 
> Fixes: a4b15a8b9ef25b44fa92a4825312622600c1f37c

You missed:

Tested-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Fixes: a4b15a8b9e ("pflash: Only read non-zero parts of backend image")

by 3min:
https://lore.kernel.org/qemu-devel/c5c82d88-df2a-e968-4d81-0da1cfa2ab09@maciej.szmigiero.name/

> Reported-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> Message-Id: <20230307140230.59158-1-kwolf@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/block/block.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/hw/block/block.c b/hw/block/block.c
> index af0710e477..9f52ee6e72 100644
> --- a/hw/block/block.c
> +++ b/hw/block/block.c
> @@ -39,8 +39,7 @@ static int blk_pread_nonzeroes(BlockBackend *blk, hwaddr size, void *buf)
>               return ret;
>           }
>           if (!(ret & BDRV_BLOCK_ZERO)) {
> -            ret = bdrv_pread(bs->file, offset, bytes,
> -                             (uint8_t *) buf + offset, 0);
> +            ret = blk_pread(blk, offset, bytes, (uint8_t *) buf + offset, 0);
>               if (ret < 0) {
>                   return ret;
>               }


