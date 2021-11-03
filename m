Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D480D4444BD
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:39:21 +0100 (CET)
Received: from localhost ([::1]:54382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIMC-0002qm-QG
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miIL7-0001sE-EN
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:38:13 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:33344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miIKy-0000Pz-Ov
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:38:13 -0400
Received: by mail-qk1-x72d.google.com with SMTP id p17so1589844qkj.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a6NKCFHb+4LRrSC1E1++lSmnR8HI+Y1kHevCAFgYz88=;
 b=KHtN1AkQDrftNppq9sA39fcGO0WANASohCm5LcR630EJ7oh47jmZXzB0ZKR7csPgfZ
 SGi/f16Ip8yyFNuA2057T3mU9mqwCZUcuYuHofSCtiO0SpQxVjY3j+bHbWgStUwwLNJb
 2Fl+Hl4dwJ9+a/A4XOKZX7P2ZR0/KVTkVvLZno2X6pOV3WSr1cDNNMPBr+2lyDseOAdq
 rSR3KdW0pQ2ah8Q5pt31Gyh0XqM7NkN1nS5xQtLrakjADNoLOidoplS7Lv1lRkZw+WzU
 F0bs7yJJW3rKXKE1SUfwbM9mYp6sbLyLPW7k+6uEQJ3+dXeYFWMkPQ/OeTD+sRf+C0l1
 MfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a6NKCFHb+4LRrSC1E1++lSmnR8HI+Y1kHevCAFgYz88=;
 b=W+c537geZX+FKCSKSKQgOzPNM2TaRXCiawMuH4eXwHuD5suWdbQRFgFvlot8pjFA0X
 8AVhl2ljBRkHU5zByOYPrCU5VMXKX1g7+pZ/RKJEFVJRrBw2B8NLjDM6KDCFxA0dXHHy
 q+LahSIYcm4iR1eVT6SRNkOA9T1l2g7K049SfeHUuW6VYTC8qakm49uHf7Agzh0s9wBB
 3UZJxbznabgaij66uDZ54VgqxPgeR+SyheWmCloTXisk0ZzkIqk9/6KaXTxsBEdzqtF2
 2doTVIfSf+4/Hmij4vEl0w8Zlzp8d/zgNcAeQXvv3dcMLO24f6OroesdUj2FuWpqBb0k
 1+PQ==
X-Gm-Message-State: AOAM5321tornD8qKmzxWRKbYCKVUmc/GKkTVEgHLX1ycFau5KqzHqHWT
 VRtWD6QMhOikkLm/mk/Zqm9qvg==
X-Google-Smtp-Source: ABdhPJzi8KNhhIy1CX/6yYOYLdsFzfkNAM+dg+OZuEfHCzdtZaQl3ajx5cdyyOMrAatu6UOxqljiSQ==
X-Received: by 2002:a05:620a:280a:: with SMTP id
 f10mr35309292qkp.118.1635953883625; 
 Wed, 03 Nov 2021 08:38:03 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id r10sm1891473qta.27.2021.11.03.08.38.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 08:38:03 -0700 (PDT)
Subject: Re: [PATCH v3 15/23] target/mips: Extract break code into
 env->error_code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211103140847.454070-1-richard.henderson@linaro.org>
 <20211103140847.454070-16-richard.henderson@linaro.org>
 <6fb43925-c350-ad38-ed4f-37b236e755fc@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3086c9e2-3452-2f4b-766d-be40c3d4ba1f@linaro.org>
Date: Wed, 3 Nov 2021 11:38:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6fb43925-c350-ad38-ed4f-37b236e755fc@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.528,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/21 11:11 AM, Philippe Mathieu-Daudé wrote:
>> +            /*
>> +             * As described in the original Linux kernel code, the below
>> +             * checks on 'code' are to work around an old assembly bug.
>> +             */
>> +            code = env->error_code;
>> +            if (code >= (1 << 10)) {
>> +                code >>= 10;
> 
> Shouldn't we also move this to the translation (not in R6_BREAK16)?

No, because it's a kernel thing, not a cpu thing:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/mips/kernel/traps.c#n1056


r~


PS: Just above, it looks like the kernel would need to grow support for R6_BREAK.  At 
present it only handles mips16e and micromips.

