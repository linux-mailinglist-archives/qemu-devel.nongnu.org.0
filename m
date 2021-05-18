Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CB387B79
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:42:53 +0200 (CEST)
Received: from localhost ([::1]:48208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0vs-0004zZ-9j
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0rd-0000Ox-5M
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:38:29 -0400
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e]:42876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lj0rb-0007Zb-4K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 10:38:28 -0400
Received: by mail-vs1-xe2e.google.com with SMTP id j12so2911vsq.9
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yy9io/j9VnOzvoelhKC7fs7Fm4iFXmnQKIwyGd6Cfas=;
 b=odQk4KDTQLmCpa30kKLkwsUVSJRzjwbo7jKwbY8XcOO7teOlNfNul3uGNT9gdl+mWq
 /7vSM4RmWrQYY34FikyD8yAZ0Qtszx1YKHwKkoGetEWhlja950JVrM9f9evc8THqq4/P
 JvW4xhkaw38v/QSaR7hvGoo8OW1yrMAQ6jyTYjjbrC1289W5pKQ3hSaHZeQ7dPpNywK/
 W9FOE5+25Q/2wJ7wGmogLOBW4wA+thWI1EhZDNdjWjY1dqrFE84nZcMdbmWEdOtHOXx/
 xGxrzoJr4X0CpfvC1pPBlDepGvo9Zo68vsDRyQp5KrdQLCEFGwGieKinGdcbFcAv9nRP
 sEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yy9io/j9VnOzvoelhKC7fs7Fm4iFXmnQKIwyGd6Cfas=;
 b=XfglHR6xe+uuP+/9voVflH29nuPYdO7nE+kGQA2YFoW2Ehg7g8MHMiuNGiGpJ9kmc5
 9/5RNA+b5NjZhXTbc7FDptMENWANH75q2+ilMnnFAxRY10o+pQu1EkOuStn3WPxQTuGf
 DKmikrxU6BpeF6mzFbXF2REvmPzG93TRANk335qHoM25exnAem+FMlRlEZ4zwr1wNBNi
 no9VJjuSDDgWUKM9rS11znmZU9+ZBNywgUKL+2MdHUVJ5ZHcFQKBShqShWp25d7UuDpO
 uvZPbqPeVupaejhtsCt3w75hxjF7B0nX7FaJs6mgIeifTuK9j3H/CtiCgeFV57yWn1Mh
 KUTg==
X-Gm-Message-State: AOAM5303TA0OpuT/+uxm4bTceiaXJyz7rUe5s5wIvceU1Rrc8sKA41vs
 MLOejrQ1av03jD/ymiPBBIhTJA==
X-Google-Smtp-Source: ABdhPJx0mi03H028M950dwtVGqydEwCzW7HrnptFMuCeiNoQqcUxTDoJle4S+XDOx1507AEYDCcY3w==
X-Received: by 2002:a67:6a02:: with SMTP id f2mr6743501vsc.49.1621348705204;
 Tue, 18 May 2021 07:38:25 -0700 (PDT)
Received: from [172.16.22.144] ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id v8sm2784213vkv.51.2021.05.18.07.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 07:38:24 -0700 (PDT)
Subject: Re: [PATCH v1 07/11] target/arm: Implement bfloat16 dot product
 (indexed)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-8-richard.henderson@linaro.org>
 <CAFEAcA-casxqgg-GJEckyTxRp3c2=kguU7YcOhvSYiFrnBvt-Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf64216c-c42f-4057-fd61-aeeb0c227411@linaro.org>
Date: Tue, 18 May 2021 09:38:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-casxqgg-GJEckyTxRp3c2=kguU7YcOhvSYiFrnBvt-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2e;
 envelope-from=richard.henderson@linaro.org; helo=mail-vs1-xe2e.google.com
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

On 5/18/21 7:24 AM, Peter Maydell wrote:
>> -    case 0x0f: /* SUDOT, USDOT */
>> -        gen_gvec_op4_ool(s, is_q, rd, rn, rm, rd, index,
>> -                         extract32(insn, 23, 1)
>> -                         ? gen_helper_gvec_usdot_idx_b
>> -                         : gen_helper_gvec_sudot_idx_b);
>> -        return;
>> -
>> +    case 0x0f:
>> +        switch (extract32(insn, 22, 2)) {
> 
> You already have bits [23:22] in 'size' at this point, I think.

Irritatingly not.  For 0xf [23:22] is opcode, and size has been squashed to 
MO_32 in order to get the indexing correct in the middle of this function. 
It's just outside the patch context here.  Later it will be moved inside a 
switch for BFMLAL.

One of the many ways in which decodetree would be better here.


r~

