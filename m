Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B82362894
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:24:44 +0200 (CEST)
Received: from localhost ([::1]:54246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXU55-0002xT-FB
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXU3j-0001vc-9a
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:23:19 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXU3f-0008Oo-Bk
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:23:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id q11so1404692plx.2
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yvXP0DEZu2ocm3h4PNhcWdJSeoaoP97Mlm1Jb02MxgI=;
 b=f0DWXn8FCqim7SqYLb9r1taP1RA0itMinumi1syTXG/EkVqetlB9nFWBLM3luO8Iwl
 QH9ogX7mGVvbaagGH4JglZ/aImTctVE7eEDgUzcCJwAZqm7fU3NcnrHfaEqWZ1pa7saa
 GquQKBN+WLwIddGDt4qp0ZzRRwdf3ocAHxhbimqpSKukZz0p520pyO7JuxRPDKCXOl3+
 j+Az2r2VmE+4Y1+SlE7PtfYXOKm20Xgf1ajXYD5E08ggTzVDEccolj+4hliInqU04fwy
 8u6/ZfxYuTaG0T3vngKYFWDf3+pb/+Ga/7SNhvU8uBwYZTnNfB2KuUxloTAhl5IB+4Aw
 CPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yvXP0DEZu2ocm3h4PNhcWdJSeoaoP97Mlm1Jb02MxgI=;
 b=tohe5kUcn1FgBOmEUyLu+cBGodaU84BhRB+Lqi0i7SkTyHaOZkGwsr+zz4zLLLCKkA
 fEPfPG8NwDg9Xg+k5pLs+2scRRtwKYX6rsr+EM8VTMefU2ej0PUP/rauSH+dYk5BQaxM
 ekCL5rDstb0Rfd6++W05v9+/dYhfPrl4sEY0sJfqvTZr+7TmeJVxF20r7ZNd7Umha/Gm
 n4Lxmzkq5PJXbr4qXsVeeUx8Rj4WuH0E5CfWTlUguX7jGoGZve+G5Xp4eXb8+x7s8A55
 WXx6/cBTSFC5UnVkCOk2Hqmb+G8juRRfBpUiYQe/ze0zL6IZhqzKbIbLgCHk3JEAn4au
 p6Ag==
X-Gm-Message-State: AOAM530/7raW9AlsLfupbbGWUn0nw3GymXkrKAopjTEUTp4dWevv7p8r
 31B7+t+TG4DFhQNTD3NpwqNL6g==
X-Google-Smtp-Source: ABdhPJyvhMRZkzBcZANC3io49xFGbl49ibdiTKR7zQ0ECK7foaRKk615AauNl0sV7MJCQKGVIbY5Qw==
X-Received: by 2002:a17:90a:fb4c:: with SMTP id
 iq12mr11191269pjb.121.1618600993725; 
 Fri, 16 Apr 2021 12:23:13 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q22sm5150601pfk.2.2021.04.16.12.23.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 12:23:13 -0700 (PDT)
Subject: Re: [PATCH v4 for-6.1 00/39] target/arm: enforce alignment
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <CAFEAcA94XeExOTYxF8owHUjKN_dbpXx19OonuEMGGTNBksPg2Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02fb9bfa-dfcc-f504-bc1b-087b4e75b7f3@linaro.org>
Date: Fri, 16 Apr 2021 12:23:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA94XeExOTYxF8owHUjKN_dbpXx19OonuEMGGTNBksPg2Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/21 12:17 PM, Peter Maydell wrote:
> On Fri, 16 Apr 2021 at 20:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Based-on: 20210416183106.1516563-1-richard.henderson@linaro.org
>> ("[PATCH v5 for-6.1 0/9] target/arm mte fixes")
> 
> Subject says 00/39 but...
> 
>> Richard Henderson (30):
> 
> ...only 30 patches actually sent. Are some missing ?

Oops, no.

The other 9 patches are in the mte patch set.

I wrote the first cover letter, then realized that I had generated against 
master.  Then I regenerated against the mte patch set, but pasted the cover 
letter text back in.

Irritating.


r~

