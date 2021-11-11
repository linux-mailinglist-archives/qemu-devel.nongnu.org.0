Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6164A44D75E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 14:38:09 +0100 (CET)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAHI-0005Ch-HZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 08:38:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAFc-00025x-7M
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:36:24 -0500
Received: from [2a00:1450:4864:20::334] (port=45659
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAFa-00009L-DA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 08:36:23 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so4413444wme.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 05:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zOJL7ZOhQNwKjDj9tP1c8yfpUGaZGjnsnvziFOIUEEw=;
 b=gIdzprSeyLt+vB9W3YZcnj2euAAYFYAJtPrrA1E5CpNcp9eZT1xwXf1Ps9aiTW1yV1
 7HYsdA2IpPdLKk1c5wMqmM3T5IO2ImGKoLYMSBhuLIjRMjmI6iIUQZluYmt8fIQZAdoK
 04TahpIWgpVwciHbkNgYMWA1Jdln4EFU6Slea3BjefkA5ujbv8u/IXhsoHM4r6RSsaM7
 PoW6ezFEhL5hjeqpF3vqdG/mbhD7Jq5E9bgqyrNwhUs5a0EbtkXpvifJBriXDYHwXCCY
 MDpD7FarAMLB0+L8C4INf8zyv5/fJ10OEJyP1zkzPhSZjNb/37OwlgCyb90bA+WRq2Bk
 pasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zOJL7ZOhQNwKjDj9tP1c8yfpUGaZGjnsnvziFOIUEEw=;
 b=VffWhjAOGHyVdlAfXg7/ya5U0CV6AXHP3vqhOQ5co233+gkpa0SOt3Y0POO7/DqvSP
 ZaYJ+78xbo0eEUX2TnyYPKZ1VDeN18mrYVCKvkaWoCIKr99Mmf1Yx5JT1GYRky+F/CbC
 GwmYF7IHXBJNNOpjcLO2hdLkEcQoyEZpvp1cyoHS5Ac1pvpG0R2urug8n838pVJlIfY3
 mTsGJqd+dBx4W2mWSvkSkjS6Fk/UTqdCs/iwEk2JBxkXFKIyw8UOerBYj/XtvNlbCZ+U
 mLpE67S9y/TGkVG59j6R+6d8FyJuQt5HFN+vDjFZGkzlt5Mo3K4fN9UXBgXndXrK+5f0
 /fFw==
X-Gm-Message-State: AOAM530vYpgTMbmVJX7DJmMnSYxB7cKriG/fPGJkuHXZdizesrJnfmJ2
 wGc/QZ3WaAKNmlXqe19B7UDJRA==
X-Google-Smtp-Source: ABdhPJzzzbkDELkFsm4Dbim/hMIma0wevTQDU5dysX+Am6qC4QOMNkIVFTfbOLZsJ/FoJjyuHP3OGA==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr25881341wmg.17.1636637780937; 
 Thu, 11 Nov 2021 05:36:20 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id e18sm2909236wrs.48.2021.11.11.05.36.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 05:36:20 -0800 (PST)
Subject: Re: [RFC PATCH v2 04/30] target/loongarch: Define exceptions for
 LoongArch.
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-5-git-send-email-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0604327e-4434-8ebf-ecbf-b4e55dec5e78@linaro.org>
Date: Thu, 11 Nov 2021 14:36:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1636594528-8175-5-git-send-email-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 UPPERCASE_50_75=0.008 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 2:35 AM, Xiaojuan Yang wrote:
> +++ b/target/loongarch/cpu.h
> @@ -369,8 +369,21 @@ enum {
>       EXCP_BREAK,
>       EXCP_INE,
>       EXCP_FPE,
> -
> -    EXCP_LAST = EXCP_FPE,
> +    EXCP_IPE,
> +    EXCP_TLBL,
> +    EXCP_TLBS,
> +    EXCP_INST_NOTAVAIL,
> +    EXCP_TLBM,
> +    EXCP_TLBPE,
> +    EXCP_TLBNX,
> +    EXCP_TLBNR,
> +    EXCP_EXT_INTERRUPT,
> +    EXCP_DBP,
> +    EXCP_IBE,
> +    EXCP_DBE,
> +    EXCP_DINT,
> +
> +    EXCP_LAST = EXCP_DINT,

Surely this is (essentially) a duplicate of EXCCODE_*.
I think we should have only one copy of this.


r~

