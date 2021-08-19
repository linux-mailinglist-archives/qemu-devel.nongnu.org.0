Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5C3F102A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 04:03:00 +0200 (CEST)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGXOU-0001UT-Of
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 22:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGXN1-0000Qc-BT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 22:01:27 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:36859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGXMz-0000ot-Q0
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 22:01:26 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so10286438pjr.1
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 19:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=knKjiCC6/j+JobsnbbtyeLLSFxaiTN3u5jndQ+eQxXs=;
 b=JzbthldYF36kWrOUqCtLhUgdJ5HSSJqLAIagiFm8+ayHXcR1tlvJPD4oei08wCMHBn
 BYRMx1mthsgEwKsxmlCztia0RACsRZXpmjcHNFtLK6lBAzd6oszVbw2abTEI9GrLpk+0
 jiRhtjXw2JULtxhrJyCkAeaRMFK63B17X/qz0DxYgr+m5G+6Bf20hKVGhG3tnxwUFx8L
 QxKAY1agCrdAJF3BhLbWMJ7fG4gKHM9wY7DMxUcOab1VDpdHAFGJ16RRSE518vexuojK
 Ji7Q2hnaCsFaCU7HP5JbYH6SQGRIR/8PQlTbbjR/lSWRFqCeXvQFJqwGGuOS09bAHN6y
 xk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=knKjiCC6/j+JobsnbbtyeLLSFxaiTN3u5jndQ+eQxXs=;
 b=d8jSHJaqiNmlxk33LNbJA5Pka3R3RqtkKSt3163jg8dq2Op/xq5mWZJB97kRHOtbBk
 y6V/puIctVWUqaHBUCh5wxX/t6PftPtW9pdfg21lpOz9WyoPv2RpADUiRk82VlvUeVKP
 BIKLj7oJA5Mwwx3xPPPvtLodK2H9j95XoTxskgrtN1QRiCqPdzdFmnngAU72gNvTfSHV
 yL7yvVdhfYOUF+MLiL/Sr2U/lE8xVhJUknU7onA3y2MBITJsSiSM4T6yumhpA7HApgnH
 wnT4ilal6aL2fPUW/Pm8219C6DMJU/EsW9hRfqCLwpn9UTqNyQNgXDNRyLSTQdNQpA0W
 8jlA==
X-Gm-Message-State: AOAM531Yyeyb2mpDFSmKy7uuC+j2QXU2A6iomx1O8A0tsbfhaj7qkVY2
 ftORPAoqyVyQhL/aafClsbgKtg==
X-Google-Smtp-Source: ABdhPJzWLw08gywoORUWwuckV287cHYqyHYZnYHoF7HLNlHIhIInZxE91q4egEZMCLbtyr8VXp4c7Q==
X-Received: by 2002:a17:90a:6f61:: with SMTP id
 d88mr12691831pjk.139.1629338483840; 
 Wed, 18 Aug 2021 19:01:23 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id t22sm1241021pgv.35.2021.08.18.19.01.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 19:01:23 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] target/riscv: Introduce DisasExtend and new
 helpers
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210817211803.283639-1-richard.henderson@linaro.org>
 <20210817211803.283639-5-richard.henderson@linaro.org>
 <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a7fb816-57de-3846-f025-a10bfee514e3@linaro.org>
Date: Wed, 18 Aug 2021 16:01:19 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXT-Hbrm6YJMuyBtuQrB3D0wt3pkQHNpPCqB8m0Ek3PFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 liuzhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/18/21 12:58 AM, Bin Meng wrote:
>> +    TCGv temp[4];
> 
> Why is 4? Is it enough? Perhaps a comment here is needed here?

It's a round number that will cover three operands plus an extra for address computation.

r~

