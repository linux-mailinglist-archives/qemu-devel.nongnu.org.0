Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CAD471C3C
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 19:32:54 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwTeX-0002Zi-0N
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 13:32:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTcb-00011M-MX
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:30:54 -0500
Received: from [2607:f8b0:4864:20::102d] (port=36744
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwTca-0000Hg-7a
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 13:30:53 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so13109598pja.1
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 10:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JKKHagG8ufP0r6PxqN2dDi2HfWVv+BylaHHCTFTrh0g=;
 b=EPfHYby91x7WayrRIqMXSS71OufMbsHe2P5K4x099iNnWsOhEKagINcxlz+GFraMqJ
 TIXnab1VXBRoPiclwBNvrVo3KpTsBEXXVQI8gn8D+abB8XSLHucVeMMMoY+fm+5CMh2V
 G3zkoFE0jz1QThevw4h7ueaTlZCpd3P+Fr2npQmeHVsUkKuVe62tTBru0PuPXLNphfrB
 m+nNiwJ4Ahll988dwW0KJvAaBQpmdpWUiHm76IIn1rPAod23D36vRcMrV9uM9gfNRn55
 EErekkSF26BNoM90zx0eWE3/B7WqmgPi3IE1o47plsVlMTkkmyYn7S0N0pEuKqxshIpp
 1fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JKKHagG8ufP0r6PxqN2dDi2HfWVv+BylaHHCTFTrh0g=;
 b=FrkQb1YC5wa/TI4QbKrwN251Eb8fHjI+4GAewJyOJiKL15CQIIV+K5XqkTGtNZP9hS
 O3Ros4m8e5073RCxdF0VmvUUbI/JerrYA+gajNN0m+/FHb3G1+UZ8FHaPJWk9S34gNed
 i+7Q+4pZeBV08/rqMskqWA+AFxkoz55YPJ9HkPo99DqSHk1Mqt2nKKALxBIBnCK/+hIL
 sKkdTROpRAS3xhIPtTNVsSKRkIgB2Wr3Xh3UwCT54ma3c+PFKicxvnPtQGg7jY0Tuqzt
 3UVX/pMUj0leVuMvKKyP0E8vaobsuclPluF0jwq2OJ/5wgGj8En9s+m+WgJCp8B+rYcK
 btbQ==
X-Gm-Message-State: AOAM5319YEVc4SJFdMMrrsmOsEcziHO048SGjNTa3xaZHCgz0yOPK/gy
 MKjcDC+fi3CF8BKhcrOkc8QpoA==
X-Google-Smtp-Source: ABdhPJyoY2bWesdOn5IRvoieeIBEuiMIngm5LtVJW+XdUxUoKj9oBwVmOxMBFJkDRzvSmpIe3bT5RQ==
X-Received: by 2002:a17:902:b210:b0:143:789a:7418 with SMTP id
 t16-20020a170902b21000b00143789a7418mr90253853plr.38.1639333850115; 
 Sun, 12 Dec 2021 10:30:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id s28sm10756087pfg.147.2021.12.12.10.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 10:30:49 -0800 (PST)
Subject: Re: [PATCH 06/26] hw/intc/arm_gicv3_its: Reduce code duplication in
 extract_table_params()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b907d2e1-0c4a-7e0e-2518-1e000f4b8e44@linaro.org>
Date: Sun, 12 Dec 2021 10:30:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> The extract_table_params() decodes the fields in the GITS_BASER<n>
> registers into TableDesc structs.  Since the fields are the same for
> all the GITS_BASER<n> registers, there is currently a lot of code
> duplication within the switch (type) statement.  Refactor so that the
> cases include only what is genuinely different for each type:
> the calculation of the number of bits in the ID value that indexes
> into the table.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 97 +++++++++++++++++------------------------
>   1 file changed, 40 insertions(+), 57 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

