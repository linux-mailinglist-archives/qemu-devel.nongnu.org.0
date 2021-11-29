Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1968F461C2F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 17:53:08 +0100 (CET)
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrjtq-0002Wl-Ue
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 11:53:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrjsn-0001pz-Dh
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:52:01 -0500
Received: from [2a00:1450:4864:20::430] (port=35416
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrjsi-0006mm-BQ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 11:52:01 -0500
Received: by mail-wr1-x430.google.com with SMTP id i5so38265817wrb.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oammaVzilb9tLcyIj8T6teLfWBbpS3fROTQa5/HCyzE=;
 b=R1BQhpsZUwTLB08e2Tapcb8M94CDj398J7VW4/y43dHj1Ufn3VNW7thAJ45hAo4tx0
 9D48zPt5aWoFP+ghss1MsUuslFMv0pT83sVOofpJaptMXBBLbIpPR/lFHGN48er8lpSh
 Jq1ktez6bd0rsAZLbq4q7AX7mntbbvlaqVdOYTdzb/qrcva8HasNEhRrf+bHvaZxR/Jz
 T4Hq/TRdqypHI+qAFt91wxXQA5KXOQfVyMNF5+GkFJQqKj55NjLMxuMxXZWSsCxs/D1H
 SHFHsNe8y+n6U8uE7hAmJrJ8Jtbt3klAz5VBeA4UuVFLtd8F7TKwypDyz54HnaChaaTD
 zuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oammaVzilb9tLcyIj8T6teLfWBbpS3fROTQa5/HCyzE=;
 b=pmiKMW6vGS/no0cj1KcwhS1JsIzdatG9vyf1gwm65o7HYT9QKvwgz4+/JmKBa74iBY
 Ykx8MwKpAQLwLEMklhIMk3a9fLxtyHztkWjJ5wzT4F9/DQcH/+0XyGNihNa+z5mxIu1I
 dCTzKnk8UHwJytVged9IlxFeOYYGab2hx4gC7DVho1pI+X8TzIVgUg0DGgvPbWqnPlZp
 WxYskrqNl0NBslFvkL4t26OqyBbYB4AQgre+WsndutR082dKHctAZdQXQzwCyRScj6Sd
 GsCKlEa70cTfgUDvaLyoUSaE0UFx4PKh15DSuRpuTrRL2ysMh3qcRKdybgb4K1jYPyxk
 CyUw==
X-Gm-Message-State: AOAM532M1oplcm/5bQCq4FmRfS4x7vF+0b+xyzkXAYp5vonGrON9GYAG
 uWk2qpqxU5TAghENcIgBq3/Cvg==
X-Google-Smtp-Source: ABdhPJz8JC68AX2FbLD7VsV3hBjCjWwHOiISAT2RK9urqGfQAOdstX6OOaJHI+QrDvrJwCJuYPXXqw==
X-Received: by 2002:a5d:5272:: with SMTP id l18mr35495479wrc.208.1638204714655; 
 Mon, 29 Nov 2021 08:51:54 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id b10sm14362178wrt.36.2021.11.29.08.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 08:51:54 -0800 (PST)
Subject: Re: [PATCH v6 04/16] linux-user/host/mips: Add safe-syscall.inc.S
To: Peter Maydell <peter.maydell@linaro.org>
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-5-richard.henderson@linaro.org>
 <CAFEAcA9F772qY4GBvqUmVcd=2o1bFQ7VFFw5AmyFnugfctBxjw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1c4e296a-5225-3c1c-a73a-d7f3fabd48c8@linaro.org>
Date: Mon, 29 Nov 2021 17:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9F772qY4GBvqUmVcd=2o1bFQ7VFFw5AmyFnugfctBxjw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/29/21 5:40 PM, Peter Maydell wrote:
>> +        lw      a2, 16(sp)
>> +        lw      a3, 20(sp)
>> +        lw      t4, 24(sp)
>> +        lw      t5, 28(sp)
>> +        lw      t6, 32(sp)
>> +        lw      t7, 40(sp)
>> +        sw      t4, 16(sp)
>> +        sw      t5, 20(sp)
>> +        sw      t6, 24(sp)
>> +        sw      t7, 28(sp)
> 
> This is a varargs call, so (unless I'm confused, which is
> quite possible) the caller will only allocate enough stack
> space for the arguments we're actually passed, right? That
> means that unless the syscall actually has 3 or more arguments
> the memory at 16(sp) will be whatever the caller had on the
> stack above the argument-passing area, and we can't write to
> it. I think we need to actually move sp down here so we have
> some space we know we can scribble on.

Yep, good catch.


r~

