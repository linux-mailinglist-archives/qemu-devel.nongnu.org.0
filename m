Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F39482858
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Jan 2022 20:49:00 +0100 (CET)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3kN8-0002nW-TR
	for lists+qemu-devel@lfdr.de; Sat, 01 Jan 2022 14:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kKr-0001cn-VD
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 14:46:37 -0500
Received: from [2607:f8b0:4864:20::62a] (port=42905
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n3kKq-0005RX-9b
 for qemu-devel@nongnu.org; Sat, 01 Jan 2022 14:46:37 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u16so22207043plg.9
 for <qemu-devel@nongnu.org>; Sat, 01 Jan 2022 11:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8969tUHfXRWgTbX6sm68tXRe/102EeKxQ84VJR272Bw=;
 b=CDTYetogW7wZJbF6adxSObh5UqDdX5DNTxCXrcpDF00TQmEUObjVlb72Nc3n3gBqyu
 nfVnkLMm30NV3tAVDh9wj3L70DQgqnmxeka/UUvWbaQPsKXlmHzjnR6olbK3pXUwIvRe
 061tiAcf7bwGCE3iX0WOQsN9yhduNKwONAyJ9x73wKUYRl5syKpMQJ9YkOeep8xJ3ko5
 4uX8vUcnoCSSqFXb/8Dl647A8ZtrDwDXhN/ZK+lQGGThQvQa+Dv2P7gQaM+VuLKKM2VE
 C6sjd6/f7MkIzgF4Is/oHDJ39y6AqHt4x0cy7/w0AFK7iaxTPslq3J270ORcv+aJvCo9
 k3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8969tUHfXRWgTbX6sm68tXRe/102EeKxQ84VJR272Bw=;
 b=w1YaMZlnz2/lyDNQz2O8I3nIJCbyPLRaP3ZLCk4vz537wj2tmTBNa3TK6DldHphgvX
 olDqRRd71MccqUJe6FKjwT8AIXTCIGAoGEgYZB5XKAruUfqHM7gppwtCqqOtLtmazQPH
 Wtk4JeSo0e6evUAae6ghePMw8+ZiOt0xqPg3MMXK7r5fccrQTaUrDoIvAs4Oto7lv/0X
 Ubgo5qrLcdKMlPuDIW6HY2SLmX6MPNcreMpFDGQuUPivWicXsdC4OF8AP0/i7if4MuPC
 U77XCY8S48Bp2lJL0xwZcvGs+lvhUNFxVCC7eJOSD5YcsoQd3Rw4P04f2wJchm2BFShl
 rsFA==
X-Gm-Message-State: AOAM532WEHeZL1ZNHgWq5ipO6iszAUXHFsWrVKz/vqderDodXF49XjYa
 8FL+Bf3yExaqDBxiQ7BaImzDcA==
X-Google-Smtp-Source: ABdhPJz9nhhia3nllvcZUUU6DUeXw7Qi+/8V+wgdYUNR5kBQLkoQth7q4EzeIuObgmXoktFgY5+FXA==
X-Received: by 2002:a17:90a:c087:: with SMTP id
 o7mr48109218pjs.91.1641066394391; 
 Sat, 01 Jan 2022 11:46:34 -0800 (PST)
Received: from ?IPv6:2601:1c0:6101:be80:ffc3:704e:e577:9222?
 ([2601:1c0:6101:be80:ffc3:704e:e577:9222])
 by smtp.gmail.com with ESMTPSA id h13sm17762364pgq.63.2022.01.01.11.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Jan 2022 11:46:33 -0800 (PST)
Subject: Re: [PATCH v2 2/6] target/riscv: hardwire mstatus.FS to zero when
 enable zfinx
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20211231032337.15579-1-liweiwei@iscas.ac.cn>
 <20211231032337.15579-3-liweiwei@iscas.ac.cn>
 <09ecdc1d-2f51-d5bf-1ecd-9ab6c132fd2e@linaro.org>
 <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43631cc8-64c1-9998-f693-51bff18b0671@linaro.org>
Date: Sat, 1 Jan 2022 11:46:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4b38e2e8-f288-f53a-71a6-f34feafb18b4@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, ardxwe@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 9:55 PM, Weiwei Li wrote:
>> This shouldn't be necessary because it should never have been set.
> Yes, I think so. However, I have a question about MSTATUS_MIE and MSTATUS_MPRV, will they 
> be set before cpu reset?

Yes, via warm reset.

>> I would think it would be more correct to have a positive test for RVF, rather than a 
>> negative test for ZFINX?
> It may  deviate from the original value of mstatus_mask with a positive test for RVF.

Oh, you mean misa_ext?  Hmm.  Interesting point.

When F extension is not implemented, FS is either hardwired to zero (without S-mode) or 
optionally zero.  So this looks like an existing bug to be fixed.


r~


