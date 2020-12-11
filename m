Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1E62D6D9E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 02:38:16 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knXNv-0007Le-3I
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 20:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knXMc-0006uj-FA
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:36:54 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1knXMY-0001oD-3t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 20:36:54 -0500
Received: by mail-ot1-x344.google.com with SMTP id j20so2385609otq.5
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 17:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=to0a5X2SEI1jMqJvPztqxtJWZ8sso8MEegiFoGYAdZY=;
 b=E+/Ge3x3amQ67xkUDkbVkXH1JK09BSHWrRsgswrNAmIg2/n2ZIQgRLRtNkbfCllGEG
 aj84Qax67dD3vRVnWy8hXfO7bXfrxSfmFOzxbrJ41dOx6HXOqLYXttX2xKwlEjJ2cVsX
 1alcLGgQOAyXJjCXN2pKTf5kuWECSbL/+Ux9t0sE7MKU8zbWbtOWSltiikzhKSDeWzYo
 6miSRU8tsOy4tySDcm79QI9k3iYe3MM1M73FHZ65cgG0yvhNp8sPovO6nQEokkTKl24+
 se5Cv70KEwSJWSaSLFtfpkuY95gebeIM2lPObIbYT05kGw29bC6oMQQBF/0uSAwk8llm
 e6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=to0a5X2SEI1jMqJvPztqxtJWZ8sso8MEegiFoGYAdZY=;
 b=p9C+nyObS/h/ruYTtQVzJ76yZQGK1o5Wdh/L5UQvVMoyizp9oS2jy86HsRmvp99ePy
 xGUsa+XHGyVsb/ECw5Lgup+Sx5VPyU9y400JK05oAOoDytw91a7FEulgZ2OHn6mek3o4
 ExaX1jZ8TiAvWjDuGx3qYNox8rptxn5qoBqbFQ1oPE9jrbIZwgKzC0jeff7eJCJZfyxL
 hTTUfG24lJqSIpSkUo+qZsjxRljDzbImDNr0XMOgjBthMwibFLePuMqYmh40N86B56e5
 NytR2AzM57TfOPe10WnDc8IQBh7WFR+NYpeSvAFgziECy6dt16+82fldueS3d0pmyBmB
 V2yw==
X-Gm-Message-State: AOAM533eOHt3LtHh+TU8++/YnLrquCXjxbvs1CvJGwsQiy7qiKU9mBCr
 dlfJQwqEiZmkriplPkf1KYhYlg==
X-Google-Smtp-Source: ABdhPJxw/p8IzM6LaDHko5lSPwS+gtQwQtSfoI3pDFkFTXgxM2oPQyCchDdHtUUW0b4ydWXyftZ2Vw==
X-Received: by 2002:a9d:7407:: with SMTP id n7mr7979473otk.189.1607650607592; 
 Thu, 10 Dec 2020 17:36:47 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z14sm1423772oot.5.2020.12.10.17.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 17:36:46 -0800 (PST)
Subject: Re: [PATCH 1/4] clock: Introduce clock_ticks_to_ns()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20201208181554.435-1-peter.maydell@linaro.org>
 <20201208181554.435-2-peter.maydell@linaro.org>
 <fc447673-dada-5f00-8c52-29d90e6db641@linaro.org>
 <CAFEAcA_keq-NV+YNwAyVWbkHxGYFR+Ud3hnh5b1KujpQXh68hw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fe28a52-40a2-47d5-9c3d-44e5ad9f95c3@linaro.org>
Date: Thu, 10 Dec 2020 19:36:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_keq-NV+YNwAyVWbkHxGYFR+Ud3hnh5b1KujpQXh68hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/10/20 2:47 PM, Peter Maydell wrote:
>> With the shift, you're discarding the high 32 bits of the result.  You'll lose
>> those same bits if you shift one of the inputs left by 32, and use only the
>> high part of the result, e.g.
>>
>>     mulu(&discard, &ret, clk->period, ticks << 32);
>>     return ret;
>>
>> Which on some hosts, e.g. aarch64, only requires umulh and not two multiply
>> instructions.
> 
> We can't do this if we want to allow a full 64-bit 'ticks' input, right?

Correct.

> So I think my plan for v2 of this series is just to add in the
> saturation-to-INT64_MAX logic.

Sounds good.

r~

