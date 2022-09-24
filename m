Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DF55E8D72
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:45:05 +0200 (CEST)
Received: from localhost ([::1]:54854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6Ou-0001iM-Un
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:45:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Nj-0000Ab-On
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:43:55 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Nf-00043Y-7y
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:43:48 -0400
Received: by mail-qt1-x82a.google.com with SMTP id g12so1727757qts.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=l8l83Oa0T50eChJvCvXj3BtC3zurtY+aVoYFTUhKFuI=;
 b=Du+/MUeuEqYvCynvTWvJjK0L4figOQ+vCWiie2aCKY1Qu38HKDN/bFU08GVAo5A6/V
 sXj9TWIJEiPh7WPL/D65oYxTVsHj3dlYPKQwy/RUAjiQNIbCx0HQuCaK+nGBclY7P4U+
 gmOEnHVqp5IdCtlF3OJbUPETcNJTXie9ZS4mD5ZOMA7zbdoia6iwhdBjhG/tUHnBRwjR
 v3LzQcdF/njw6vVN2V/eenETNO38mAEo50DeBDJQBnrcJ3lBUa8xbP6cGjRza3bsMRXx
 fhPKrXgYWkhLsVTt0Q4gR+7KOF4dyNHS214hEb36+ldkE/WkPioAUK2NwqMn9Oanm3j+
 DY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=l8l83Oa0T50eChJvCvXj3BtC3zurtY+aVoYFTUhKFuI=;
 b=jD69ShO8O2H2bD/kYNOU1g0EmL4NochDAomHBOCjdobcci1rOrNlD7aB/gV/UoOKWm
 H6gCz3/rwSkDEZ4wwis6bLZ5LyTQ8wtoKGjfdenRkhKwNwz8oTEcfnPdlVWlzhMSZ4uP
 lQ+PNXF5Bhr5A1AEJQU17ulm4AP5CbS2DHcKitKN5whojkNIiOaBCymLBsNNJf6nZqgY
 HKosOHdGGqnpb3vJx277sen2B/TzjdsB+Z27L0wfU0vRnQixjPUgfyumB0hIQsVh7rhy
 jNzJarWtdHMN7RoGkOW6HKG6Te0JGaTgzY34/BQ4JJ6+9X1YskY102+A+rQJqXTTcGQQ
 c3tg==
X-Gm-Message-State: ACrzQf3gBhXUKH9oy5MNETsRKEwT02Gi8llMa3f5oBemBHGldFY/MVdL
 0fpfl5Hh7vxap5cmzf3JLGyBOCKdKWxgjft9
X-Google-Smtp-Source: AMsMyM4lFy9qD/dcHucOQEXbs4AFkcRqRZarrb/HMfSfnVN6OcZI7iOQl0x6Jy5j2OUz9VjQMyijOQ==
X-Received: by 2002:ac8:5a8c:0:b0:35b:b2f7:7e96 with SMTP id
 c12-20020ac85a8c000000b0035bb2f77e96mr11427580qtc.659.1664030625976; 
 Sat, 24 Sep 2022 07:43:45 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:1f12:b4b:2dff:20:54a0?
 ([2605:ef80:80b2:1f12:b4b:2dff:20:54a0])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05620a298a00b006bb366779a4sm8222605qkp.6.2022.09.24.07.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:43:45 -0700 (PDT)
Message-ID: <9c7d8aff-aaa9-357a-361f-c6ad8cabc3e2@linaro.org>
Date: Sat, 24 Sep 2022 14:43:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 09/12] target/ppc: Use gvec to decode XVCPSGN[SD]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-10-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-10-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +static void do_xvcpsgn_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
> +{
> +    TCGv_vec most_significant_bit = tcg_temp_new_vec_matching(t);
> +    uint64_t msb = (vece == MO_32) ? SGN_MASK_SP : SGN_MASK_DP;
> +    tcg_gen_dupi_vec(vece, most_significant_bit, msb);
> +    tcg_gen_and_vec(vece, a, a, most_significant_bit);
> +    tcg_gen_andc_vec(vece, b, b, most_significant_bit);
> +    tcg_gen_or_vec(vece, t, a, b);
> +    tcg_temp_free_vec(most_significant_bit);
> +}

tcg_constant_vec_matching, and tcg_gen_bitsel_vec.


r~

