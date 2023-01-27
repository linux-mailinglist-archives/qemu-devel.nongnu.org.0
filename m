Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A607467DDB0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 07:41:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLIP2-0001sb-M2; Fri, 27 Jan 2023 01:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLIOz-0001sF-3x
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 01:39:57 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLIOw-0004I0-Vq
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 01:39:56 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so7719977pjq.0
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 22:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WDCItuffIrR0kZhIzC+6lvCLUItgezt2rjbaKA0JD1E=;
 b=qt11sZqnTZFU0TyjMtkKyU5gjRwWwwSXKL0+K08oebYkQR9BRQ8lj6XIaipdbqe4aa
 cbZmjQrL9SWQakLM0IkH2oAW6peBp+6BvBAs8JhmfQOSKJzRP2ZCKpo/Xqk+7TdLlyHS
 tfkZcS6Vd70fnQ4K5XMWLl7iNljU8cajfRkNxrfVq3zfTdGmj+szRrGxKKjWx84ypm8j
 MgagU83oHBeXvhrzn9bHWwA7FhxERIyRqLbizcE6cpmXSE8bqmi06tbT1wn4VDTbOrB5
 EMAVGeMnLUnCJM4BHBJqLYfI0oOgp76eTiLzoRCPuwIfcbYB59fpYR98w/dPZUB+fMjL
 NrGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WDCItuffIrR0kZhIzC+6lvCLUItgezt2rjbaKA0JD1E=;
 b=29PcLcyVVYD5TF16A8SxclY/AaXcIDyYkKn9w9nYjygEhwFbirQ+Qbj3ds1P1YMadV
 hTpLX2EMtp9T5Nve0OqUe6A0FF3FBHi107dQyxW9o26nSr/0OjpUaHe8hFjHhEuVyCTV
 GjEJT7CLguks/yI8raJD1cFzYYDA/sxb0nKmVLug+1DaR0Moi5WqUodoG2bc18yDs9d8
 0Pwh0hpVRPQcZpCVv3MrxI653CzsZQLP4BA6T28KZGyGVdBO5Jd4raP7kdxe3aIO6Sng
 7QjLlqcVNls44D9kN5opvQF6Cm+NjXEO0jTKJo4iksNWgSmz8HGxiv4o+418VSkqfntt
 rVLA==
X-Gm-Message-State: AO0yUKUf11PdOse2mYQuxfXRR7pgZ1Q/Xz3q/l3RZHnwfq1Uq1et18KZ
 49wm3VBvu8GuVZouGeRQj92GmQ==
X-Google-Smtp-Source: AK7set9scw2LIyvwBZfbnsh++rnPi/gtcgW2xirytFIbBmTNUojE68/LX976MzOnU6briQXplBcigg==
X-Received: by 2002:a17:90a:1988:b0:22b:ffe6:3b86 with SMTP id
 8-20020a17090a198800b0022bffe63b86mr10947009pji.32.1674801592937; 
 Thu, 26 Jan 2023 22:39:52 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 c4-20020a17090a558400b0022bfbb26bbcsm2092960pji.0.2023.01.26.22.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 22:39:52 -0800 (PST)
Message-ID: <dac69504-368b-6e00-5561-d0e723ff11e4@linaro.org>
Date: Thu, 26 Jan 2023 20:39:46 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 16/36] tcg: Add tcg_gen_{non}atomic_cmpxchg_i128
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20230126043824.54819-1-richard.henderson@linaro.org>
 <20230126043824.54819-17-richard.henderson@linaro.org>
 <8b021470-b335-4b85-d516-906308ddea69@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <8b021470-b335-4b85-d516-906308ddea69@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.15,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/26/23 14:45, Philippe Mathieu-Daudé wrote:
>> +        /* Compare i128 */
>> +        tcg_gen_xor_i64(t0, TCGV128_LOW(oldv), TCGV128_LOW(cmpv));
>> +        tcg_gen_xor_i64(t1, TCGV128_HIGH(oldv), TCGV128_HIGH(cmpv));
>> +        tcg_gen_or_i64(t0, t0, t1);
> 
> Can we skip the OR ...
> 
>> +        /* tmpv = equal ? newv : oldv */
>> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_LOW(tmpv), t0, z,
>> +                            TCGV128_LOW(newv), TCGV128_LOW(oldv));
>> +        tcg_gen_movcond_i64(TCG_COND_EQ, TCGV128_HIGH(tmpv), t0, z,
> 
> ... and test t1 here to partially update LO/HI? (we could remove t1 and
> just use t0 as twice 'xor + movcond' but the code is less readable).

No.

We want equality on the entire 128-bit comparison to control the conditional moves.


r~

