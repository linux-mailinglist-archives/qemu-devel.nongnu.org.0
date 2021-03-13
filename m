Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0592339F04
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 17:03:18 +0100 (CET)
Received: from localhost ([::1]:38542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL6jV-0000XF-5B
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 11:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL6gh-0007r7-9U
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:00:23 -0500
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830]:37840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL6gf-0006fY-KK
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 11:00:22 -0500
Received: by mail-qt1-x830.google.com with SMTP id f12so6223500qtq.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 08:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LtZ2JeFxwOBxoNhDWvVoLh6fy9ffG7j6o+lQyXTr+jE=;
 b=hG1nHtix4EETlnY1qoKVQg/nYpfT+s1zTjb8EmZaQul97y70VD2/tjHN1y0sY0BG7I
 656q6Z7j5Ek9OAALSM680gPZ9P8O0caIiBi9RnrcxuSRb8prOw/jMDZjjfARcZ5/ePl7
 EBcQkjNf+764kluHUX7wMmKjezLwQQGfvcVjax24VJ55ce/walwkBe4tDt1wsk81ltKX
 hyQt3fmftNhw4QQ9g3cS6Ff15rUtZsSrj+XTOhkglw7n89OGadeWRJ4VZOa9LxiVBiH2
 AikJFlpu5/Cc26ADwSb/NJGtqueP+1v7SPVvU69xerWMrnuvifbBbr4OF5mh0Oizhydg
 JCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LtZ2JeFxwOBxoNhDWvVoLh6fy9ffG7j6o+lQyXTr+jE=;
 b=oH3O8t+4vYuVrMuqMAOQwzbnLp05DOXtTlDV90h3xXjTf9Kv0SsJ1uxz4fOGzRMsFY
 h/OWRX/N0cX2ZmlrDEqMl+ka45mA1ch645+600rxHZcbMZZkdjXq33LaMT7PCVZa98/K
 Ks0v3Wz6U0Gtp4WX6p0x9AceKPtU7JQjjuS/K3tgux50N8AYhQsvM+Ta505wrG/xcgP5
 Gbo8utHQCRFMdDzpAqMFvKxH45fbe5DdwhazSRp4Q6zpqUpp2uGYg37NuYbcpgSIwolo
 KgCQK/BUu7ZGOJ4Hce2mQkSIC0ff9y19LKr+IDS1G+/XrUu/HJ0f5WJKoswGz045vTZ0
 TsbQ==
X-Gm-Message-State: AOAM5301ZBKoqzU8dX6xRULZP5kaHb8fvPBg/JX8uKqpdlxGrmVrndSS
 3ZGqmz1gpmtjY3nfudW0ah9u2A==
X-Google-Smtp-Source: ABdhPJyYCq3kFfRUgFXiOa7gDjr4rGRtG2t3enOBFVYOiaHZMzjFpboBzyG6ZLWywNoJ5ff7FqnXLA==
X-Received: by 2002:a05:622a:3ca:: with SMTP id
 k10mr16814599qtx.270.1615651220462; 
 Sat, 13 Mar 2021 08:00:20 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j30sm6285836qtv.90.2021.03.13.08.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 08:00:20 -0800 (PST)
Subject: Re: [PATCH 16/26] tcg: Move MAX_CODE_GEN_BUFFER_SIZE to tcg-target.h
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210311002156.253711-1-richard.henderson@linaro.org>
 <20210311002156.253711-17-richard.henderson@linaro.org>
 <c9ff5811-353-b226-d338-2df1a9fed4b@eik.bme.hu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a30db7a-b6df-2de4-069b-4d9f88d65b3f@linaro.org>
Date: Sat, 13 Mar 2021 10:00:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <c9ff5811-353-b226-d338-2df1a9fed4b@eik.bme.hu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x830.google.com
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
Cc: r.bolshakov@yadro.com, qemu-devel@nongnu.org, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 6:42 PM, BALATON Zoltan wrote:
>> -/* Minimum size of the code gen buffer.  This number is randomly chosen,
>> -   but not so small that we can't have a fair number of TB's live.  */
>> +/*
>> + * Minimum size of the code gen buffer.  This number is randomly chosen,
>> + * but not so small that we can't have a fair number of TB's live.
>> + *
>> + * Maximum size is defined in tcg-target.h.
>> + */
>> #define MIN_CODE_GEN_BUFFER_SIZE     (1 * MiB)
>>
>> -/* Maximum size of the code gen buffer we'd like to use.  Unless otherwise
>> -   indicated, this is constrained by the range of direct branches on the
>> -   host cpu, as used by the TCG implementation of goto_tb.  */
> 
> This comment about constraints seems to have been lost. Should it be preserved 
> above?

Done.


r~

