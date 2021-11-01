Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DD14420AD
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:19:18 +0100 (CET)
Received: from localhost ([::1]:47596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcpw-00071t-Pb
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbFP-0003lm-1N
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:37:27 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:37626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbFN-0004mn-6K
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:37:26 -0400
Received: by mail-qt1-x836.google.com with SMTP id o12so5792841qtv.4
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UrMPL+t0RHs2F8DgflLkrPkspn1ngV5yUBMYYHb8yiQ=;
 b=jcKuimBtMG0SupljgS6D2EbCud8HV3w7jaxh7kbCRwOvw1nUcy1CkpW1/gHghwv5XL
 JGO2VoVgdAAVWsL+KrRVJh27w7DEaCdtPTvC1U0oNmf/tqIuShD5Dk8hAtM8GJoXDBp8
 LG1jjGEt0ZZwsFGf/DvZclwRWhl3UM8Gq2bYDUjGRBzEYCPCeHw1iZZuJCpKIPfFHkmg
 jjHM6RXzU2sShyth54zzo3JigH9wEcyF7+CQWtui0hyqRXaTXtSwdSxctyPt5SOe0sjN
 QYP22TXAQaUQMaEASiH8NaT16GV9eSfUXEvCQ+Phk64NRysWRhxGsofCFc95HpY3rfzL
 4fGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UrMPL+t0RHs2F8DgflLkrPkspn1ngV5yUBMYYHb8yiQ=;
 b=3SQQ9zkYMLJiKxAxPQ76/emyuCXf625g3tTqLvIPHNDuyHoMF1qJLYyfV6UhgSUfpb
 4b2w1v28n7DdCNvlyDSwTYjjwgRdwZNjXkC8b8ZtlEmSzncRA1mFtAmcGtEqQLoTxrtx
 iOq2zjULk3VWKKoLBWckIVUTzL8KCFMLvy26kvLwg44dLwxs/eIG33qB7qf78+2wkSIn
 M4LxP8CxqkHcj2OcAQsW3lyAiqbNwBq0qhJejc1iZ8G5MwB0GcNs02uM18OazgZ16zxS
 EOtniG7SJ8tdu/NKkR1sFCJTq9aRNk2irMGhYkNOIV9UtlwqNWTLHN3P9bFOpv4CuR4Q
 ai4w==
X-Gm-Message-State: AOAM531syHMf6iRpOXD8ulSXwKHwUQ5Mu5d6saT0pcKDcQkqdlNIJAcI
 Pw1dMRUCLGKtgfVcWnKT61JuEA==
X-Google-Smtp-Source: ABdhPJzNZNCIHhMAZqHmcWEByvhjbJ78XruSTzcZZ0JQYVbuTQc5a26iUm0qb+h+zFaaAU73Vq9EMQ==
X-Received: by 2002:ac8:7d0c:: with SMTP id g12mr30264967qtb.187.1635788244083; 
 Mon, 01 Nov 2021 10:37:24 -0700 (PDT)
Received: from [172.20.81.179] (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id o2sm11100077qtw.17.2021.11.01.10.37.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 10:37:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] hw/sd: add nuvoton MMC
To: Peter Maydell <peter.maydell@linaro.org>, Hao Wu <wuhaotsh@google.com>
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-2-wuhaotsh@google.com>
 <CAFEAcA_TcKcSsx5J+QqK1AM+ZwCvbSrSPgSD9XA35vVwJah9hA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <037d0f9b-b0f1-020c-8163-1fefeb357882@linaro.org>
Date: Mon, 1 Nov 2021 13:37:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TcKcSsx5J+QqK1AM+ZwCvbSrSPgSD9XA35vVwJah9hA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.14,
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 1:18 PM, Peter Maydell wrote:
> On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>>
>> From: Shengtan Mao <stmao@google.com>
>>
>> Signed-off-by: Shengtan Mao <stmao@google.com>
>> Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> Reviewed-by: Chris Rauer <crauer@google.com>
>> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>> Signed-off-by:  Hao Wu <wuhaotsh@google.com>
>> ---
> 
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI read of nonexist reg: 0x%02"
> 
> "nonexistent"
> 
>> +                      HWADDR_PRIx, addr);
>> +        break;
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void npcm7xx_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
>> +                                unsigned int size)
>> +{
>> +    NPCM7xxSDHCIState *s = opaque;
>> +
>> +    switch (addr) {
>> +    case NPCM7XX_BOOTTOCTRL:
>> +        s->regs.boottoctrl = val;
>> +        break;
>> +    default:
>> +        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI write of nonexist reg: 0x%02"
> 
> ditto

Fixed while applying.


r~

