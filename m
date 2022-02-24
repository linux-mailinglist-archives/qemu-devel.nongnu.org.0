Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E985D4C37B3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 22:28:03 +0100 (CET)
Received: from localhost ([::1]:33950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNLec-0001Dp-On
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 16:28:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLdZ-0000Hh-SO
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:26:57 -0500
Received: from [2607:f8b0:4864:20::531] (port=46059
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNLdX-0006mk-TM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 16:26:57 -0500
Received: by mail-pg1-x531.google.com with SMTP id z4so2805691pgh.12
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1q+c91hK6pI88ypUQk9UTcNRPVqisaMvE/tZeXrByec=;
 b=P1/+MuNg1NYQZA37Vin0UJaipr4RS22QpktU5e956Awy+7ZnrPMYGFQ3OkAQjZD5Ug
 aVVDshrK303Nwhyb4qOBamOXiu0tXGuZaX/uka136ljSg/7DQ/p/BuoNP9+mpT9zpS8X
 E63FNCODaCykVSaVqbuWMYC4atu+RO9rn+8FtaUhkIIICxqjWrFhKkSb3PLkx2x/yLYm
 gdeeA7q8wkdCCkSiDWj0sKDLyCvl3pyg8J1z4lYw+VBuMg4rD9odyKyKC6untfZgcYwK
 SbBTAN8oxrqrmWq1rukmzhJq/BkUBhE0hv3YPigDMgupcfSbapO+u+slgPZNoJ9Nmcbz
 DI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1q+c91hK6pI88ypUQk9UTcNRPVqisaMvE/tZeXrByec=;
 b=S8zVP9udfvEsG52hL4YwxLxtjmBIdHp61Ar8jA9q5KECTnNBlG4W+F6vwzPWQw0lA9
 ZXiyJUbKFaueXRsGcJvF6wGfwxOJUh4jvYSujoowr4SnqsuKMQjHsjlYyitDm2CaMLJZ
 WvEfwgRoE5ozFy4uebL0LaEvbJ+bAlUW3fGyXMCgUlDCfAR+S1pSZNjMvsXZsW7gPxzz
 Hf3nAKzsH9aXPzAQB/QcWXUt0rxE7yOISNNxUSbQANKAFOZaU3IyHcjM8Yk4vogPLVE8
 Iu7b1a9bBx66JIWE9arGAWxORtTVnn0WSPodR88jobHtC1u6WI2ta3jbW/YDQ0w4CBlD
 gVrQ==
X-Gm-Message-State: AOAM5331uNDI8qHcquTGHskpR4pxuoq3mZwQ1L9aUCLEhd5FcKECGjoV
 GajdsC/lNnW74FL2fhUPFX6nog==
X-Google-Smtp-Source: ABdhPJy0SvK6eA8+oG605ImftnRkwS71tdY3TDZa2QEjIAPcHc6Rs7VDDiYRGG3962k/WVLEphdoQA==
X-Received: by 2002:a05:6a00:2313:b0:4e0:ffa7:bbe0 with SMTP id
 h19-20020a056a00231300b004e0ffa7bbe0mr4618459pfh.53.1645738014548; 
 Thu, 24 Feb 2022 13:26:54 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 s17-20020a056a0008d100b004cce703d042sm444875pfu.32.2022.02.24.13.26.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 13:26:54 -0800 (PST)
Message-ID: <75a54255-246b-3d7f-9ded-9f5be061cd40@linaro.org>
Date: Thu, 24 Feb 2022 11:26:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 24/47] target/ppc: move vrl[bhwd]nm/vrl[bhwd]mi to
 decodetree
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-25-matheus.ferst@eldorado.org.br>
 <9111db3b-f238-7780-a5dd-4350721146b3@linaro.org>
 <a77fcbaa-6810-ada8-3aef-2beb140c00d3@eldorado.org.br>
 <cf26c57f-ec5e-daec-b129-cd3f49112c3b@linaro.org>
 <ad35a0d1-c11d-ee5f-8ef3-922f581de607@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ad35a0d1-c11d-ee5f-8ef3-922f581de607@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 10:23, Matheus K. Ferst wrote:
>> You don't want to use tcg_gen_rotlv_vec directly, but tcg_gen_rotlv_vec.
>>
> 
> I guess there is a typo here. Did you mean tcg_gen_gvec_rotlv? Or tcg_gen_rotlv_mod_vec?

Dangit.  Paste-paste error.  The first: tcg_gen_gvec_rotlv.


r~

