Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A48474D22
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 22:15:46 +0100 (CET)
Received: from localhost ([::1]:40134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxF9G-0004yD-1T
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 16:15:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF7b-00033f-7g
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:14:03 -0500
Received: from [2607:f8b0:4864:20::633] (port=45678
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxF7Z-0001cd-9d
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 16:14:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id w24so1887696ply.12
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 13:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/RJgQIN144AnxNs0T6g1xC7YS00CVY733YPmVMPuWb0=;
 b=VDdgcTC80s+nem8XM5/e28p3z6YBRwlZfGLlIEaASGZLGUBUBj4JpAV6Hpo2tl9O1E
 sIyu1IMU3bJfSPNRsvFQOb0Z8VyZEm3ZgEG2tdpRgDv16b9jfpwyloZ0yLV4okALlAKq
 +dZd004lcoXl69uF5iuod1ufzsNb0U7nTcyw+AKYTcHbmwYmUBfCEjoycmIh9kp2nEt8
 qBvCsyPetcHx71oNbwfbK8rrXKo7FyIVYwhz9Cxy8apSA2KcjAwBGKM43+fJ9SdLx6MG
 aMRIWoaySGthihiW2crUhUgHRI9vyQrgWMahAiglkQ1+1bML/0N0Hn/qI5ReAU5XGagO
 BbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RJgQIN144AnxNs0T6g1xC7YS00CVY733YPmVMPuWb0=;
 b=ONSG0FkTgZCkblWrEkL3WCMOAIbyv7CHu/t1EmlaVZvyN426NjX/kjHPAw8Bwpq0r4
 ougHRYpuUUG5n26XjeuK086RsQvYJynE0UHf9tRHXVgbDj340b/l8UmM/hguzQVfYyOk
 PR1y+63xicTydqmb6VlDbZvOWJ6McazMb+8lOpabBuvuaS8HeqDLQSyhEpCxyq4IBT29
 86Y6WegZpziaXn06n3Pmgj1oQocIGqwj3WDfdDdt1LS7j34txH7Dw9nLcLdzb0+or/UP
 D7ar2ipu2g6Du0dHIrKcpPudWYcYU/Bys/MAww+LztybX/ljzZVgCxi646SFLVu9Ksn1
 RiFQ==
X-Gm-Message-State: AOAM533oKeF8qsb1JCLl993YjZvDQ1CSwJlToDWb0ICEI2WX/hk4teZ1
 gqHHFmVXMRMkcZtb6MYqWgtS6g==
X-Google-Smtp-Source: ABdhPJw+IIgGlSiByOtNXwzYbfPrxtjHjX5HPHooyvfmF7Fh7QsOB2E8rh6Zqy3/9jPeDHtTYl72Gw==
X-Received: by 2002:a17:902:8b86:b0:148:a2af:4ab4 with SMTP id
 ay6-20020a1709028b8600b00148a2af4ab4mr1510359plb.73.1639516438856; 
 Tue, 14 Dec 2021 13:13:58 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id e7sm11658pfv.156.2021.12.14.13.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 13:13:58 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: fix no pmp illegal intrs
From: Richard Henderson <richard.henderson@linaro.org>
To: Nikita Shubin <nikita.shubin@maquefel.me>
References: <20211214092659.15709-1-nikita.shubin@maquefel.me>
 <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Message-ID: <b165ef0f-3336-f4e5-61ee-b3d8cf9e02c0@linaro.org>
Date: Tue, 14 Dec 2021 13:13:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <6a13ed88-e109-93e4-9254-62b6b04f5913@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Nikita Shubin <n.shubin@yadro.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, atishp@atishpatra.org,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 1:12 PM, Richard Henderson wrote:
> On 12/14/21 1:26 AM, Nikita Shubin wrote:
>> -    if (!pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
>> +    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
>> +        !pmp_get_num_rules(env) && (prev_priv != PRV_M)) {
> 
> When would the number of rules become non-zero with PMP disabled?
> When does this test make a difference?

Oh, nevermind, I see what you mean.


r~


