Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19DF4C04B3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:36:18 +0100 (CET)
Received: from localhost ([::1]:60668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdlZ-0004Gi-QL
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:36:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdjR-0002W3-40
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:34:05 -0500
Received: from [2607:f8b0:4864:20::529] (port=34512
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMdjC-0000rH-TR
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:34:04 -0500
Received: by mail-pg1-x529.google.com with SMTP id 139so18222264pge.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=D87Ub5jJ5nU1q3ImLfRhTxq/wa/otdXy3hl6Qc0IDdM=;
 b=zQ+E4/7V3TDfpXVOGApLisCZPW/nnZqn+aROGUX9d3BUnp6wiuz+rDRLhzZk2tPbzU
 djghyQz9e8J5wO4bfESAW/jaj1zQnPkPD5HzGOWcSQJZN5tfvp2bzXcTBK3kGZislgHV
 mHmCfIEiJpvJunp1U8DcKwmQEk5h7HC/hOa2YWVzRv5252Fbtj/86JUEQzNPhp+n8/me
 v4eZAwHLgFfrv8v9CbbyNMzbKdOb+LTwNFpTC6G8tJx2j8rfT5yY7lJG0p0uU1qjYReO
 dxM2ZdYeIJk5GZ7Av7JQ4EK1zVUgLoO4Mb9DyMbsM3p1YkBGKfAG3VQ9V8uMnreubkwd
 Jrwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=D87Ub5jJ5nU1q3ImLfRhTxq/wa/otdXy3hl6Qc0IDdM=;
 b=SlhukgvSWSNHHnh2dxIRNGJCvAXCzQWsSHue28NSWeizNT9/mHoEI9cdg8ZRkDeAj1
 Qg+Ig0EB4kqjBBiuNbG7K7U9q/t+pKArLhsut6VOZP0sjjyRgTFtjBBNVZ8/sSIZKHxn
 kMMXvhIuy8wiBZuHFPSySndRDdBzZLMz53UuzSYanG+Sz0gI+kHLkytHiBTH2gLQiTcY
 Tb6iPKNOiL7BU3TwNBRq4nVUI0A5nD/fczGnSswaBMbtKOJ/FVbq3D+vlLAR3wRVgYCU
 BGOvaNzLbgp37i9K9ANvohGKxPdg1CQjQpypP5Kx2pWLe7nnVP7njxjR67g2EuwqNE5Z
 Pm2Q==
X-Gm-Message-State: AOAM530b80Na3xqtOo6WF/ZWlsSTEvkw4mLj8wI3eIASiXJ1j4Ysu4qV
 UlH5HAhrcUtmfO+sBIP1MYySnw==
X-Google-Smtp-Source: ABdhPJxj6K/OpKTjB/Uh9S4Yvcf2d6uMFLy+vuZaQI8qrzvTkb5TAdCN8653tRypjbsHEpFsY2SnjQ==
X-Received: by 2002:a63:ba5e:0:b0:372:9bb2:c12d with SMTP id
 l30-20020a63ba5e000000b003729bb2c12dmr21830747pgu.380.1645569222597; 
 Tue, 22 Feb 2022 14:33:42 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id h15sm19124810pfh.143.2022.02.22.14.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 14:33:42 -0800 (PST)
Message-ID: <3c51dc7a-47a8-574f-6fe7-27d51a5885f3@linaro.org>
Date: Tue, 22 Feb 2022 12:33:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 25/47] target/ppc: implement vrlq
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-26-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-26-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
> v4:
>   -  New in v4.
> ---
>   target/ppc/insn32.decode            |  1 +
>   target/ppc/translate/vmx-impl.c.inc | 49 +++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
...
> +    tcg_gen_andi_i64(n, n, 0x7F);
> +
> +    tcg_gen_mov_i64(t0, ah);
> +    tcg_gen_movcond_i64(TCG_COND_GE, ah, n, sf, al, ah);
> +    tcg_gen_movcond_i64(TCG_COND_GE, al, n, sf, t0, al);

Similar comment re (n & 64) != 0.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


