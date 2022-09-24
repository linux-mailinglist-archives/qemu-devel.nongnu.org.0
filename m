Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6565E8D66
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 16:43:17 +0200 (CEST)
Received: from localhost ([::1]:49486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc6NA-0008UM-G6
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 10:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Kh-0006O1-K5
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:40:43 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:34748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oc6Kf-0003fD-Nz
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 10:40:43 -0400
Received: by mail-qt1-x833.google.com with SMTP id g12so1724812qts.1
 for <qemu-devel@nongnu.org>; Sat, 24 Sep 2022 07:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VvweXk8fdVKKhkOTP7oUebPYN1dzhNS9AG3P8wavmO0=;
 b=ZwiNXnTKauHPPKWSm8oDSZSBm2NaSrg9gFqmLr1F5xK+h/uGrg0KxNEFV8Kq7WJHN1
 nKHFNF0ktmUG/8oWOjpcFSNqK+SY/RCe8XSjQh7FMHoH+K+lOSk2MBW8P/P37V3T8uyC
 IGLTpRkSecbaUBz7cu8WPh4mhdwCWdIGdv1LW9NDdHBKkTY5yaX/uzP0/xofncSCe93e
 2OGMHQHBZFYKz9Iba7kRcf98AKyLfy9OxaVS6zIguXwlisdX2duylTGD2wzDmDkzXTZD
 gG2Zk1RF4jgTHe10+aU0Qw9zKQgoGq8yaunYmwos09XdZy1YEEo4uJzSS1aNVIdrnvpm
 X4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VvweXk8fdVKKhkOTP7oUebPYN1dzhNS9AG3P8wavmO0=;
 b=fEC1SSX9zR8saEp1mBywLlWL7n5ednmNwid/Y60Eqiy2n/VHBcA2Z5cgFSuzzKMg6L
 P6drSyRjVifiCGoV67eVqLpnbq9q+Yrd1jn2Dd44lPmGL4f9tMgU5b/wZQzRwaFwymWl
 CaOGPY6Br02llttY4ilAfUclx/zUKJbqloCB1ieasCwKPYeMAsfvjk5MF/u/PAeWPdS8
 Mflf7nziTsdZgvCeVl5mMAjpTl/5755vgp3QAc7Oa2j34H2nK6giTxjjcvMxZmZMDgLJ
 UdlfRUNxV6U87p3ST1V4y9dMKrVOs9b68baknDDGo1JAVXHZOhQxSY04IARcuLSgK12X
 xRpw==
X-Gm-Message-State: ACrzQf1JnvyfxRyvTxQw1lK8q9VLzmQZkvKl+MMMKPj824FLIisQrMMF
 ZrSFWaZtoUFC1mJS9MVY9Nn6Ug==
X-Google-Smtp-Source: AMsMyM6qNRI3O1xUzNiaj/HKt69Qjn6Wug1oE95FcysiZ1P0JQMihlKEzJavVugzgahvjv9Q0kqb6A==
X-Received: by 2002:ac8:5e51:0:b0:35c:e40f:d898 with SMTP id
 i17-20020ac85e51000000b0035ce40fd898mr11360252qtx.685.1664030440224; 
 Sat, 24 Sep 2022 07:40:40 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80b2:880d:1e7d:befa:a019:1dbe?
 ([2605:ef80:80b2:880d:1e7d:befa:a019:1dbe])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac8110f000000b0035bbb0fe90bsm7255069qtj.47.2022.09.24.07.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Sep 2022 07:40:39 -0700 (PDT)
Message-ID: <6d795b4b-4315-a5c6-0f93-e5fb70dc6c0b@linaro.org>
Date: Sat, 24 Sep 2022 14:40:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 08/12] target/ppc: Use gvec to decode
 XV[N]ABS[DS]P/XVNEG[DS]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20220923214754.217819-1-lucas.araujo@eldorado.org.br>
 <20220923214754.217819-9-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220923214754.217819-9-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.118,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/22 21:47, Lucas Mateus Castro(alqotel) wrote:
> +static void xv_msb_op1(unsigned vece, TCGv_vec t, TCGv_vec b,
> +                 void (*tcg_gen_op_vec)(unsigned, TCGv_vec, TCGv_vec, TCGv_vec))
> +{
> +    TCGv_vec most_significant_bit = tcg_temp_new_vec_matching(t);
> +    uint64_t msb = (vece == MO_32) ? SGN_MASK_SP : SGN_MASK_DP;
> +    tcg_gen_dupi_vec(vece, most_significant_bit, msb);
> +    tcg_gen_op_vec(vece, t, b, most_significant_bit);
> +    tcg_temp_free_vec(most_significant_bit);
> +}

tcg_constant_vec_matching.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

