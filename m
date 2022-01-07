Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 641E9486FB6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 02:28:10 +0100 (CET)
Received: from localhost ([::1]:50998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5e37-0008JT-3o
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 20:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5e0m-0007Kp-Ee
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:25:44 -0500
Received: from [2607:f8b0:4864:20::1034] (port=36677
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n5e0k-0004B1-QB
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 20:25:43 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so10440850pjd.1
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 17:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5DocmTehJBloY7vDxORMh33IoGBmiNc2Xu9fT6rggcc=;
 b=nMfSag1yMn5gs2JijKAxm/7lwU3pDQKdjMetz0t9ZObZcGORYxK/n0Obs2QxbmClDQ
 vRoWHfIbkdAKZVr2v5yt47Z3mDD0ncjjUNArBmlIVh2snhUG3Es4tTjX+r/iTnL31BJL
 9zPUQqnwWE7DGuuIdlXMznyy1fqEm9rzj0/kqaexJAgGJ8gAuDqtavmW+UyRQB/TiIBu
 Uz7+mJOKS7NxvugU68el6sljN9uFmvctzzSwSmYghnWrmG5fBnTzkrDOeMFa8kIXH0vc
 Yhhji+9nCcfKxwKHb/wKIg6u0SLiYhCoK6h6h/drLEux7vO8dJNWKvtSqCTBYO/jaYRg
 cOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5DocmTehJBloY7vDxORMh33IoGBmiNc2Xu9fT6rggcc=;
 b=4uqsivCLMmb/Cxs1FAYTybHugQsjh7Dq0bt1eLzX3ONBsYZnM6ORO/X7KXH30Mjor4
 Vk6fCOCKFa1dRYD2VvkIXBeVJNOwhXsvBAoQtr79FA/CmlqJVQcaCOHa+90sp48NQ0J/
 NQT/VPBN89EG8NMxV3liuTfXR4Cl0OeKRVMeBGpX45FE4/U9w/YI2JfU61z0U4qXhA4D
 d6NIT+orpOliS0LRNJRFJJJeVMujNNL8SN5RNjob0mZE2qC6niImuiWGfk8ggJors2DJ
 E9XWvKE1I7NTIBx+MzVfYVqlnjdck+FuKb9iZ4afIGVHsWDJ3GZzaOimtW2zwuo9a86M
 UDtw==
X-Gm-Message-State: AOAM530aPd90jJAEM4tiUTNndkCj6tXLR2Vf/EVU432ULXWmZOshRhtO
 KfB48x0PvC3lBeybPaiRvTXabingikApDA==
X-Google-Smtp-Source: ABdhPJyqsPsOZzMDrDfRB3sQPfCoAIsZaXCeWwx7zYut4XiRRO31XD26KkNFmmwRTSDtfgyVF4Z6ng==
X-Received: by 2002:a17:903:1110:b0:149:a428:19f1 with SMTP id
 n16-20020a170903111000b00149a42819f1mr35122216plh.120.1641518741235; 
 Thu, 06 Jan 2022 17:25:41 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e16sm3464535pfd.38.2022.01.06.17.25.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 17:25:40 -0800 (PST)
Subject: Re: [PATCH] target/arm: Add missing FEAT_TLBIOS instructions
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20211231103928.1455657-1-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0570193f-7a2b-9fd2-ac4e-76aeb671f2e9@linaro.org>
Date: Thu, 6 Jan 2022 17:25:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211231103928.1455657-1-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 2:39 AM, Idan Horowitz wrote:
> Some of the instructions added by the FEAT_TLBIOS extension were forgotten
> when the extension was originally added to QEMU.
> 
> Fixes: 7113d618505b ("target/arm: Add support for FEAT_TLBIOS")
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

