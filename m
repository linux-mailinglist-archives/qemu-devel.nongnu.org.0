Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41945EE9C8
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 00:57:11 +0200 (CEST)
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odfzK-0002R2-NF
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 18:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odfxH-0000kJ-Bz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:55:03 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:41908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odfxF-0004ul-Hp
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 18:55:02 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q15-20020a17090a304f00b002002ac83485so2913967pjl.0
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 15:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=wbpp1UArPUT0zXzYA0klWGc/8l5VI+cqbKXZDDtgp5E=;
 b=Iflhh+iagfXC3GqQ3Z5XJLtM9XVUnyGzqbVoIjcCvkl0ciB3qbGpULVYUbQNrgP1tv
 H6SFy9RQjF1v65/3My+9rOhUVuYx495T0MNnjidZO2dJRhRfxlKqUjIova7CqSC+OvEM
 49iX3nqVk4nCj09yH3en8Qn5UYdo3yuZHOSTDXlt20HIBKgTmxIs+wTw6vnvrzBODNXL
 W2bMYvdFsd1jCI6tk1QSxFzAyDk+pdewHZvzFg3NBay5OJIJw+CYUaCsJdLBYu0MU55a
 HTiA3Lu6HLHqmZBPfrPJVM8JLpB1trBNfRWtcTiGP1AkzRsoNuTfLnQ/8NDNpg3D2jEI
 W97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=wbpp1UArPUT0zXzYA0klWGc/8l5VI+cqbKXZDDtgp5E=;
 b=v4mcEu5YlVZLqGmSNu3hCW9y3NABctO6ffK4I5YJ49MN0VZeazavMzCy3HGZwGXlRP
 rxqbGdSgP5lFiesouT6Lp9dwQFWg6A+GpBfzzA2x274A/xPm6rQF55wCvbhOQt4Dgtn+
 A77hVZs9IYtfnnIGBkMAtVtwdt0NnfieCGkcsxHBdLUKhern38sR/gpsFQDgOIM/l3UW
 vf8RgraJEd3KMKOf/++KUE/MKMtA7X/CWiY0wF7AEr2YvWWdIvlHAghE3JhhtRTOBsz4
 P15EDknNdQvKZ1s4JvTjb9uUJUHkMD5B0J2AZtGpWF4IoMzjVr3D3bpJsZuXC2ASRM4K
 yMJg==
X-Gm-Message-State: ACrzQf39pe0tWbFwfQWz+IrR2VwJRxWyuR6jG9TQb/QFecSZx//70+ag
 bE9aYI0NJFqNhLnm2kZAUQN1aw==
X-Google-Smtp-Source: AMsMyM7j+Cqwtx+fi5WEpKikwqIdVrhMJxAq5zAbbOHCAg6Uw5fkGR8DopBmvpZ7oicyhUUGjygtJg==
X-Received: by 2002:a17:90b:2246:b0:201:d6d6:9809 with SMTP id
 hk6-20020a17090b224600b00201d6d69809mr286973pjb.159.1664405700010; 
 Wed, 28 Sep 2022 15:55:00 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 d190-20020a6336c7000000b0041cd2417c66sm4227756pga.18.2022.09.28.15.54.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 15:54:59 -0700 (PDT)
Message-ID: <cfada682-bc54-d904-c733-b973673074fd@linaro.org>
Date: Wed, 28 Sep 2022 15:54:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/10] tests/tcg: add memory-sve test for aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220921160801.1490125-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/21/22 09:07, Alex Bennée wrote:
> This will be helpful in debugging problems with tracking SVE memory
> accesses via the TCG plugins system.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Robert Henry <robhenry@microsoft.com>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
>   tests/tcg/aarch64/system/boot.S           | 3 ++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

