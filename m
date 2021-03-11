Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA84336A2B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 03:34:50 +0100 (CET)
Received: from localhost ([::1]:59978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKBA1-0004Rq-JY
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 21:34:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKB8f-00041Y-Ox
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:33:25 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:39148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKB8d-0007IC-3p
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 21:33:25 -0500
Received: by mail-oi1-x231.google.com with SMTP id u62so5730055oib.6
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 18:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5/uFv6KQCLRfPohLdWpHFlpjk2d6fczZnlkiCEmx6R8=;
 b=vEqao0hDXXU1Yif6uEemPvrJIPyaMUmKKSRri5GK9Mw2uLwF9So5qlWF1tv7m5NxXb
 OPlRn7moHNEFOy0RVK0UrdJ64s/E8hr1x0uDJLFZJ7kfUHhPaiWz1ZN7KKY6ZycGyFU3
 8M+FoPuA8G/qtxcF/JoFM6AXj4zhX9EMkPNs8Nhaq9AVv9wMk3DJ6nIzWL3QFZLendcn
 mA6c2dpLCY/xSIemSPRusfJrAy19lig8gNH5lrF3GdbGZ66uzEC+yQoZSjq8hkz2CajT
 tlK4Viig9AowkiXm8APffoIKuMcMUOfCWBR9c4ufis2UzAO0xI3e8iix8ZYZV28WwHzY
 odkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5/uFv6KQCLRfPohLdWpHFlpjk2d6fczZnlkiCEmx6R8=;
 b=Dd/gPTWeeyExRBU/uTs/jbTwHxYNEVL4MibWJ4BblnQbSfOCEBif+kT/cvePLvEw23
 ihsNeUnxCA2JUkwTAtlPot+93cDGHtF92BAaJAquVS9U0kixUWKSmQQX2OX/ZdQu0u7d
 kaA3qzZOWdUYsXrRRRNUALkSA/UW0eYKzSNt0n/QIIqKyMKgA3H3UfL080mLC6CjbARc
 k+0LREf7Blr7iQj6kRILxRn47pfKrr9sSOTUJlzdLhX/0ON0t1ub8cjS0afJbYInQNOH
 zD52AhBQY5lkFuqBtLbXfGa6ZgEACCWeRD2/CBLUYXtMk4Sg8yE2IfeQEH7RtW3tYed1
 fM5Q==
X-Gm-Message-State: AOAM5310jGHRs2APCy8bCDGzJu8kZO8khH6THW2RD0s8v8GF7SHlt71P
 UQxBq7h3jToa0RZo8Dzfvm6SpQ==
X-Google-Smtp-Source: ABdhPJxwUASfSoI4TeUAn7wQMRqDZY129G8ylRmsbLBWVU81FgJuCmq3jw5OQ7v4WRTHrpZuqNlTpA==
X-Received: by 2002:aca:39d5:: with SMTP id g204mr4789092oia.63.1615430000545; 
 Wed, 10 Mar 2021 18:33:20 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z32sm344931ota.81.2021.03.10.18.33.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 18:33:20 -0800 (PST)
Subject: Re: [PATCH v4 00/78] target/arm: Implement SVE2
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210309162041.23124-1-richard.henderson@linaro.org>
 <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fddc702d-1624-5a81-0f4a-011c477d0a96@linaro.org>
Date: Wed, 10 Mar 2021 20:33:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_36F6onzaBfG8WKF5ViZ4UrxXyB9fbeVbMah1CGiuPDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 2:17 PM, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 16:20, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> After a 6-month hiatus, sve2 is back.  This time, with RISU
>> testing vs FVP 11.13.36.
>>
>> Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
>> ("target/arm: sve1 fixes")
> 
> Are you hoping to squeeze this into 6.0, or can I delay
> review of it in favour of for-6.0 stuff ?

I didn't expect to get it into 6.0.  Too much too late.


r~


