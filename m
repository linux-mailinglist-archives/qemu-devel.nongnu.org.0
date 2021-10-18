Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6224B430FC7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 07:41:47 +0200 (CEST)
Received: from localhost ([::1]:54798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcLP8-0003zL-G5
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 01:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLLb-0002Bt-0v
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:38:09 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:34544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mcLLZ-0003c2-5c
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 01:38:06 -0400
Received: by mail-pg1-x529.google.com with SMTP id 133so14933451pgb.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 22:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T7DuePYMagLmWMRCFxTqJu+OfsEy0d7ZebPwQhtJqJQ=;
 b=qtA2Wwt23acSpA2GAFjHo4BRFm6tu2VN/atwJzZzzXju5SQPzTk6ZKUwSCAf+YkqoT
 fDm+mkG7G0GxqIl3k6svOsWGIfEOSIk58Uw92RhOaObZvk75k0jVZfKfls+qWKUf4W6L
 ugMxhwmoa2q/QnLfRQs7MYhMm7RlvYlKobDpUgluX8AvtHoT4zgTvsntCEbJvzL5VkJL
 GaQ1BvyHcbeJ6NzDhm/n1cE0L6aiwjGBe8PmvP/+3D06GSmdBJTPRor73zRVXfNhdcfF
 XuKSHezzaFJcKzGXEiSM4/6N4tc5WSZScC2/FpKk6E7SLOFyDHRs6bD6X6+JHrZz4JPT
 En1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T7DuePYMagLmWMRCFxTqJu+OfsEy0d7ZebPwQhtJqJQ=;
 b=wfezBucF2dAMSJ3mdTFUK1hL8q9qOl2fq4sQ99bF2PXnwizTDl1qIlQEWRYjhVNtut
 44/8nNz1+l6HMQVehtMoLq0SVkw2xPOv+Kb71280fO3BT/GX6gTMSKInQaUeE8Ilp51+
 0Z9J0KmF2O1zBIpCg7S7QZ5hdkTMsT2tHr/k/TFl1ahNaMSLf1aRibRegcX+R+mGOb9v
 sOwhvTU0gtPCvF5srYkJd2lDl2+S76yuzhrFw93NqPtPHvM1Z/3+/d0gyXmQC+6Ta53X
 b8UYYYclxhKROiTiJW5dJPlOpuQWu/xLThKCZcVHzpC0DBSHzRTKOwks7sgxurgN+VT3
 2AEQ==
X-Gm-Message-State: AOAM532NpMlLDPFr+u2a4wDu1FgQ7TXD2Tahznb6XyBGxiFt73ZTnR+n
 C8hex87ablYtd/VjMxYPSLfE8vreHYb90w==
X-Google-Smtp-Source: ABdhPJxyJCJ1kUWjQp8gkIm17iE5u0pPl9eVtsEMTzo2b7kzbfBwzPf7aQ+1b71a+FriYWlJ3U8IJg==
X-Received: by 2002:a62:61c3:0:b0:44d:2518:cdf1 with SMTP id
 v186-20020a6261c3000000b0044d2518cdf1mr26142187pfb.31.1634535483485; 
 Sun, 17 Oct 2021 22:38:03 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id s62sm11532226pgc.5.2021.10.17.22.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Oct 2021 22:38:03 -0700 (PDT)
Subject: Re: [PATCH v8 01/78] target/riscv: fix TB_FLAGS bits overlapping bug
 for rvv/rvh
To: Alistair Francis <alistair23@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
 <20211015074627.3957162-2-frank.chang@sifive.com>
 <CAKmqyKP8rx_vmO2MpVzxacUhx-H6W0+zDEfd0r5qrFtg+kiTEA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59c4f142-9027-307a-5054-6e2b1039bd08@linaro.org>
Date: Sun, 17 Oct 2021 22:38:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKP8rx_vmO2MpVzxacUhx-H6W0+zDEfd0r5qrFtg+kiTEA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/17/21 3:55 PM, Alistair Francis wrote:
> On Fri, Oct 15, 2021 at 5:50 PM <frank.chang@sifive.com> wrote:
>>
>> From: Frank Chang <frank.chang@sifive.com>
>>
>> TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
>> commit: c445593, but other TB_FLAGS bits for rvv and rvh were
>> not shift as well so these bits may overlap with each other when
>> rvv is enabled.
>>
>> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

BTW, Alistair, I think this bug fix should be cherry-picked out of this patch set right away.


r~

