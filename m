Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CD1457E04
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 13:32:57 +0100 (CET)
Received: from localhost ([::1]:41562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moPY7-00032T-Ua
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 07:32:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPSD-0005Dg-Ak
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:26:49 -0500
Received: from [2a00:1450:4864:20::332] (port=39600
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moPSB-0007iO-HB
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 07:26:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso12589977wmr.4
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 04:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=79tgbNES0Gmj8AUlEa3DT3uOtkq7uO0OdcIXOwF01rM=;
 b=DjVilvhUMB6VQzvu5/BRuqUin0O6SaBCan1kKLt9sjSiMjBeXU8fgxk1fxL9SFTDq1
 y8CY45mxue1wIqoBtGtVsb3DXwUGhZuxBz1Pu+a8Or+sOEu71vCCmJjmZPeBNF4Zg71m
 vGx86LIh8gMoVwsAyNIDiNRu7pHsji3CY6J27+T3QQc5xvNGYv4de8H4u6UR9pQqKciM
 o3KjRs+xBtqJaVNrvP6rQmfx/EyJlxEjum2Zsiho9g5DNFtHG3jMgL2Hp+z2btI/jPU6
 lG0SSdYT4Sx78/pB6IJiux30T/3x7mYd7HUWQAFN1jgbpHoSdLHYnA6AY9PUf4TbboCk
 bLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=79tgbNES0Gmj8AUlEa3DT3uOtkq7uO0OdcIXOwF01rM=;
 b=Kob/cXS3jpz5be4Ajw8lDk1AP9vYOjP9R6APfj9y+BakmqgYc06lLCL5DXLpcHHaGT
 N9Fn7N1VtHJv4pUJoCXYYVvNqQ7uLSGFbIemg3nutEQSV+otvbVQJ5f0eetOrftKLpfQ
 z71BJ9I7n5JqFnjG1kzGkLXNCKaRL+Hey643hbvmGj9RNtNgizTrmezbsXw/BBOhg3c4
 yuznPQqI2W4lmjFDEJoOstj95YMRTITu1ihuYiYGd/FCl0gtXT+MNl6OwA589EnFlBcA
 okfk7pcvKmsTqc3GO93NH+Aig6brsAf0y3GiFwZIvR1XvPNDHUjBj/kYuclFRv233Giz
 9pDw==
X-Gm-Message-State: AOAM532vHGmDXvC0i+GslnVeaWFNjp2j+H2gYQsVUVrhKTj/kvExwF+w
 lIof+wA8eT+4TFLXFPbH2B5o3Q==
X-Google-Smtp-Source: ABdhPJx65nVRiNyQ8h53/GSTTE3bGjD6/TYcCr4J5COvQbGqsieKa0gb6+LBZRTUNvoiavLoJ2kYGQ==
X-Received: by 2002:a05:600c:3505:: with SMTP id
 h5mr9566895wmq.22.1637411206042; 
 Sat, 20 Nov 2021 04:26:46 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id y142sm2820413wmc.40.2021.11.20.04.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 04:26:45 -0800 (PST)
Subject: Re: [PATCH 03/11] multifd: Fill offset and block for reception
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
References: <20211119165903.18813-1-quintela@redhat.com>
 <20211119165903.18813-4-quintela@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cd4f7997-7860-8145-0200-ad0d7df92c6c@linaro.org>
Date: Sat, 20 Nov 2021 13:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211119165903.18813-4-quintela@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 5:58 PM, Juan Quintela wrote:
> We were using the iov directly, but we will need this info on the
> following patch.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/multifd.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 7c9deb1921..e2adcdffa1 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -364,6 +364,8 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
>                          offset, block->used_length);
>               return -1;
>           }
> +        p->pages->offset[i] = offset;
> +        p->pages->block = block;
>           p->pages->iov[i].iov_base = block->host + offset;
>           p->pages->iov[i].iov_len = qemu_target_page_size();
>       }
> 

Block should be stored one outside the loop.


r~

