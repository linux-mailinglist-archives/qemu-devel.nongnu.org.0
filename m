Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E9605477
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 02:28:21 +0200 (CEST)
Received: from localhost ([::1]:44346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olJQ3-0005BB-MG
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 20:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olJO5-0003Pi-IC
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 20:26:18 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:38624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olJO2-0005Hy-3y
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 20:26:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id j12so123740plj.5
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 17:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hQ85fAgW1fP5LVD8k0bxHEXfYDXgVtYzGYdpLPDAII0=;
 b=Z/dTnKh3dgLBlNPhUNn8eQXDXU2FVdxg330vZi4EqDHvaxtjopAsGjUcXZ68B2skE8
 2myY/+PpqdeRN35htIJg6WqnhCUNn0/ijwW6sBgpDBjE7YPX30alGuiBQxrkUSqOglme
 RU2A9T7/rNAPgKIErD4iLjpd+RJ9zdG++cnkKAezdtzMEiVmnY212Y/HH8OZvzhvdvnf
 h8jSZ+DwIvRyx6oeHb/eeaNL/dqGSRKsMYoygVyF0eoWAga3xasvcFWRPt934s9K/X7d
 6f+4Hb7aztHBo6v73Q8sHckk56P7ENlt21wuTAqF8XIOsv5SZjtMfPsRFYLDjoDuiJxL
 Guew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQ85fAgW1fP5LVD8k0bxHEXfYDXgVtYzGYdpLPDAII0=;
 b=ZkGjE67zCQ9rjDdsLUtza5o2OmTGtPPwcjeIoRojbeW9tQh0fAIpIf1OajlvJpd2pr
 ZL8+PL4ebsKmnJf4QtVS8Fk2zPgAVimlExG1zUVA+QLjJdZBVw86E9oidQPdSO4fdoBD
 0Wkaph60BqBDbCwDwKnBw6PZF+6g5Q/egi6hddMAlJnIye2EnhC8pi1dYWzaLjBjmmpB
 fh8Tg58+2lWH0UCVqNihuDt61rA8J47M/GF3oLvHEW1Z8D4+U9KfCWpy6Rg8vdL2CGpi
 PyG9TM7vFDaAHfi5HSZQ4KhyZiiIEzvXwmT7LRkBlPF2bFa/ZCzQSyQsel1pq0Wdie9n
 jFIQ==
X-Gm-Message-State: ACrzQf0WKmdRJoofuV4CAoDuJVgNBiGdee9Dwa7HpZL0setD1SJEGP8Y
 YZQEqbWf9/eb7wy5iQQyCwsRkw==
X-Google-Smtp-Source: AMsMyM7BUC8fh76sCRThSeJD1uPe9Xf2BGavcgJkx92IQeIUrmaMqNKbaUkQDQzBEj3NEfwTNE9QPA==
X-Received: by 2002:a17:902:e80b:b0:183:7463:f628 with SMTP id
 u11-20020a170902e80b00b001837463f628mr11252427plg.19.1666225572412; 
 Wed, 19 Oct 2022 17:26:12 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a17090a8b9400b001fdcb792181sm473828pjn.43.2022.10.19.17.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 17:26:11 -0700 (PDT)
Message-ID: <827c8be9-ebc4-4236-65ae-c5c09aa2ccf4@linaro.org>
Date: Thu, 20 Oct 2022 10:25:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 12/12] target/ppc: Use gvec to decode XVTSTDC[DS]P
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
 <20221019125040.48028-13-lucas.araujo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019125040.48028-13-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/19/22 22:50, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)"<lucas.araujo@eldorado.org.br>
> 
> Used gvec to translate XVTSTDCSP and XVTSTDCDP.
> 
> xvtstdcsp:
> rept    loop    imm     master version  prev version        current version
> 25      4000    0       0,206200        0,040730 (-80.2%)    0,040740 (-80.2%)
> 25      4000    1       0,205120        0,053650 (-73.8%)    0,053510 (-73.9%)
> 25      4000    3       0,206160        0,058630 (-71.6%)    0,058570 (-71.6%)
> 25      4000    51      0,217110        0,191490 (-11.8%)    0,192320 (-11.4%)
> 25      4000    127     0,206160        0,191490 (-7.1%)     0,192640 (-6.6%)
> 8000    12      0       1,234719        0,418833 (-66.1%)    0,386365 (-68.7%)
> 8000    12      1       1,232417        1,435979 (+16.5%)    1,462792 (+18.7%)
> 8000    12      3       1,232760        1,766073 (+43.3%)    1,743990 (+41.5%)
> 8000    12      51      1,239281        1,319562 (+6.5%)     1,423479 (+14.9%)
> 8000    12      127     1,231708        1,315760 (+6.8%)     1,426667 (+15.8%)
> 
> xvtstdcdp:
> rept    loop    imm     master version  prev version    current version
> 25      4000    0       0,159930        0,040830 (-74.5%)    0,040610 (-74.6%)
> 25      4000    1       0,160640        0,053670 (-66.6%)    0,053480 (-66.7%)
> 25      4000    3       0,160020        0,063030 (-60.6%)    0,062960 (-60.7%)
> 25      4000    51      0,160410        0,128620 (-19.8%)    0,127470 (-20.5%)
> 25      4000    127     0,160330        0,127670 (-20.4%)    0,128690 (-19.7%)
> 8000    12      0       1,190365        0,422146 (-64.5%)    0,388417 (-67.4%)
> 8000    12      1       1,191292        1,445312 (+21.3%)    1,428698 (+19.9%)
> 8000    12      3       1,188687        1,980656 (+66.6%)    1,975354 (+66.2%)
> 8000    12      51      1,191250        1,264500 (+6.1%)     1,355083 (+13.8%)
> 8000    12      127     1,197313        1,266729 (+5.8%)     1,349156 (+12.7%)
> 
> Overall, these instructions are the hardest ones to measure performance
> as the gvec implementation is affected by the immediate. Above there are
> 5 different scenarios when it comes to immediate and 2 when it comes to
> rept/loop combination. The immediates scenarios are: all bits are 0
> therefore the target register should just be changed to 0, with 1 bit
> set, with 2 bits set in a combination the new implementation can deal
> with using gvec, 4 bits set and the new implementation can't deal with
> it using gvec and all bits set. The rept/loop scenarios are high loop
> and low rept (so it should spend more time executing it than translating
> it) and high rept low loop (so it should spend more time translating it
> than executing this code).
> These comparisons are between the upstream version, a previous similar
> implementation and a one with a cleaner code(this one).
> For a comparison with o previous different implementation:
> <20221010191356.83659-13-lucas.araujo@eldorado.org.br>
> 
> Signed-off-by: Lucas Mateus Castro (alqotel)<lucas.araujo@eldorado.org.br>
> ---
>   target/ppc/translate/vsx-impl.c.inc | 164 ++++++++++++++++++++++++++--
>   1 file changed, 154 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

