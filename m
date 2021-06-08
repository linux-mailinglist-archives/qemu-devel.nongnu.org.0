Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D53A073C
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:41:10 +0200 (CEST)
Received: from localhost ([::1]:52446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqkPF-0006rX-0E
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkOQ-00060N-1J
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:40:18 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqkOL-0000Ep-Ma
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:40:17 -0400
Received: by mail-pl1-x62a.google.com with SMTP id x19so4357219pln.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BAlczLpcZLY5g25RcbL32zRn8w2rKKFFVu6N9I0TimY=;
 b=JkX7X1KfPdFY09WwqJDbSjBbCESPe05GyhmQdY85P2WLuqtxSK/01VVJlsEzfP840i
 6hAXyGNvUA/5noOeVmo7gcjPLsCHzUfgPXtXRiJwCmxhDFDcrsKwgwTvizgFwNGW8ByH
 Sfv4hp3CdvXoXWJOYPvNBDS2bhjD3f7nYNh/KnzIxzr23JqRnRKTKdhVyYuG1kuVgi2b
 IwMBbpTq5wb+hUWRKpoR2kU8HF3bvdHSNNpY9VVuuJ/7JBy0aybm82w7hJPP+cPwa3nK
 L6nNuhEl92tqNz76Rp++C9NNdfAj0mBp89VJVT5TbqQYdWtALJ3OByTynBmi55kCf0Ap
 l1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BAlczLpcZLY5g25RcbL32zRn8w2rKKFFVu6N9I0TimY=;
 b=E4Mqey5sDYbQknv9w6/1nmIMsdbPKT8qAoxMGiv8NMyCoCpur56zK8Z9RDg3tfp+fc
 s9qF3ENClZQfXTNCDDniRM2q+TskQLDOBNlfsvnqDzy93iDusoDImKDyc6jW5aVrLgyy
 VdB55/h6NduiwG8PwRa0IBwu4A2hhmrW3kFmKwuGwPhaByyZMa+wMXZZtcc0qnTy364O
 dSI0JZQIlrZhYatVJO350XkQ3PIdTELbcFJRVfYo3vuUFFHdbLQ8Q8iwb7bCo+DkZMmD
 rK6RdIlw8lrTO95EV3ry/rAJdcRryWu2j/L8+Bjxc98fzQEmi1jD4puaiw/vdyFD15Du
 W22Q==
X-Gm-Message-State: AOAM5326Tix6jDK2JJSvWfnfi5UPkVcy1Qx0hiboicLn++bZpw31LPtz
 sjCZMrB2xh3lm+/txgNNaPzBWBBLq1xZiQ==
X-Google-Smtp-Source: ABdhPJyt4tiUlxPIjx4EuRbmSM6S2zf9mzdNnEIHhkXDGsOkOTSLLejBmOw4CgF4UIFv2kPrbiYAiQ==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id
 y5mr8969490pjw.37.1623192010016; 
 Tue, 08 Jun 2021 15:40:10 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 z18sm9128114pfn.37.2021.06.08.15.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:40:09 -0700 (PDT)
Subject: Re: [PATCH 19/55] target/arm: Implement MVE VNEG
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8caf6a9-33de-4f0b-4fc8-71a32c5e62e4@linaro.org>
Date: Tue, 8 Jun 2021 15:40:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_NEG(N)    (-(N))
> +#define DO_FNEG(N)    ((N) ^ ~((__typeof(N))-1 >> 1))
> +
> +DO_1OP(vnegb, 1, int8_t, H1, DO_NEG)
> +DO_1OP(vnegh, 2, int16_t, H2, DO_NEG)
> +DO_1OP(vnegw, 4, int32_t, H4, DO_NEG)
> +
> +DO_1OP(vfnegh, 2, uint16_t, H2, DO_FNEG)
> +DO_1OP(vfnegs, 4, uint32_t, H4, DO_FNEG)

Similar comments to abs.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

