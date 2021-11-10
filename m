Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDE44C349
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:45:39 +0100 (CET)
Received: from localhost ([::1]:53362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkor4-0006a4-G1
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:45:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkopE-0004tP-PR
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:43:45 -0500
Received: from [2a00:1450:4864:20::42d] (port=42592
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkopD-0006iH-Ad
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:43:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id c4so4412264wrd.9
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 06:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k5xeZMA4nD8SR8uZ1oNgkVFfUpYW4cpJpvhQfqCyHkg=;
 b=hrhpG75vPx1EeNv8NTXMhs4BCNSXQWu2dsvXqEdrYwRpjQh0VleHUPT6lBM3lOvy3r
 0SxaD8B/C9SJWCfcFyTthK4b/GWBbj0fRq66+GN4uReCtYFBa5IpjnnsxhvbeezDJPw3
 FKoGNdE1tcihzmCProMLQzGR94YGl8e/Y7warBlmlxDjWJV/tzpfb88FUIVuIyUyPO6S
 nK6wWg9blfQucaKD2wh4u5oEMMZjN679it1hiEfWBz/uP8MkG5yY/jIAoN67v960RizS
 wqFYD8eWqLsoGOkZN3H2lvQBV6AXPOUEqI2qB5XXvokYSJG8W834LQPdzSp2YVJADSwN
 Dk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k5xeZMA4nD8SR8uZ1oNgkVFfUpYW4cpJpvhQfqCyHkg=;
 b=l97dseBjYqQRNoE+3Jv/fylt1ujQKZArPmBa7QJrUGURxyu/TazVSHgY70XyM1u7pG
 zo6wZDu8RLnlLhgR04nVIoL9MyczgX41dN/Nz8HFW+3fKvKJtN7OBnnKsv8jYDZgrHCd
 laRYxIHV8I2iYm7qiBarXy0ccmSfmXUzkwPbtBBxKvjkmpUyC1zTV/+GLvXFPfXnAUtR
 FmWVJwf4H7LMxgdFgL4NPJxMyvZJPlAD7j+uNOcv7PNCCVKCfV0QM4hE7Gv9UUtzrMmQ
 aFiW10EB/LhCnYh3pAHsSKIsRs4USgwayTzWTZo5tSBDj9h4T6zkEiDzPOVnDUr2iNik
 gbRA==
X-Gm-Message-State: AOAM530UWmlBY3oSf80l1KSxgQoRe6ihTEKURM+Hj48Vm8d/tDDzUvI3
 w/yDRoJQZhlM76l2bw0bL1UbfQ==
X-Google-Smtp-Source: ABdhPJwv5ZaK34eMni7tg+F5WyIL3O5TeBpwZfhgAfaDHJWvVtas2JF8f8ChO5h/NOVL7VX6d4XG7A==
X-Received: by 2002:adf:cc8d:: with SMTP id p13mr311547wrj.274.1636555421514; 
 Wed, 10 Nov 2021 06:43:41 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id m2sm5809484wml.15.2021.11.10.06.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 06:43:41 -0800 (PST)
Subject: Re: [PATCH v2 10/14] target/riscv: Adjust vector address with mask
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-11-zhiwei_liu@c-sky.com>
 <30642177-1f52-08fb-c3ed-77492fdc7cc8@linaro.org>
 <ffa9073a-92e7-657b-4b43-67a84bd20fb0@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0400a881-0084-e65e-ae59-2734a6ea97d1@linaro.org>
Date: Wed, 10 Nov 2021 15:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ffa9073a-92e7-657b-4b43-67a84bd20fb0@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.678,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 3:08 PM, LIU Zhiwei wrote:
>> You'll want to update the translator to use these new fields instead of using the 
>> [msu]pmmask / [msu]pmbase fields directly. (Which means that we will have fewer tcg 
>> variables, and need not copy the "current" into DisasContext.)
>>
> Do you mean we can remove the global TCG variables pm_mask[] and pc_base[]?
> If then how to transport env->cur_pmmask and env->cur_pmbase to DisasContext?

I mean replace the array of pm_mask/pm_base with scalar variables. Remove the cached array 
value in DisasContext, and use global variables for the tcg variables like we do for 
everything else.


r~

