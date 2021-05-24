Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3F38E8C9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:33:57 +0200 (CEST)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBeV-000640-VJ
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:33:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBTS-0001rH-M8
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:22:30 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:33382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llBTQ-0007mj-4G
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:22:30 -0400
Received: by mail-pf1-x42d.google.com with SMTP id f22so12585808pfn.0
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UkZk2aqd6d9EsYJsH01tTywxceXzda9KgFKwD1XuqPM=;
 b=CyDor0juiOO700o9N6/goo7qavVPY/ln0ijG47ZKMZKgSdlUrlNGV03kwaBKplr5Ek
 2Q0WDwR/fMDQhwbxvW9TLGRy0P2wnnVVBf9RQXykM6TFhp9q9GMjVb/VBHiYRfHYcOa9
 AM9xz9po8iezUW49HyrMQsCChPmPjLau0UMvspVWiWE3GsiV8eAU1U6bhGBC9hvIMZmP
 7ZkeCHuicIstDWKKMDS7N7T6yh8+dZZWPAgGpVHmvtyCs6EMV3G5eomOo6s9zvtBxdjQ
 UiYT/erLk3FRnhqePyvcvKhPiDYRsISUdN2BIBEJXvAC879lt8j1rABEMXlXalYxgeNZ
 4X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UkZk2aqd6d9EsYJsH01tTywxceXzda9KgFKwD1XuqPM=;
 b=cB5qfogI6Xjb6PhNP+qRbz3lUr7seyAyJ5ICSkHvVUW3iR15Wllw9qHTySUJ0p6J/A
 aaREAJQ9MiSl+YpdYow2W3E0E2G1+SmjAoWu5CR9YsYfpm5xCBbvOHTj4uJBRPk92jZ/
 +Y8IBnimhXG1V/Z46tzxfwMyR0F1F6wVLIf56CRL/IwsjZleWnGOmoEKHrrGiJ50g2hb
 6YVlENtcuYu7YXaLDR2t8Ue26SndcR7JfN/CUMKJwOUk1hw2v5H6G0tltknvlqdpihFh
 AlmrMvl0q+bDu9UBC+vywxGzqQyKCCVgVHKySX6CRCSsH1dhAIv0cQmQ6pjiLoCIQvZD
 MfuA==
X-Gm-Message-State: AOAM533q7sEU1yNK/yCRyLYsFGKyTiDMOLJ8lN2zOnogV/5jrJ//3wUK
 jmrehvS1hthWTGKn9wowiSFtVg==
X-Google-Smtp-Source: ABdhPJwgNk9/bJdXlSLol/kpOXY7+jVqyyzwhY5Iuluzrx5WThpYwQcFjyyDwIo/8ahf5xfFM+kz1Q==
X-Received: by 2002:a63:5158:: with SMTP id r24mr13791687pgl.41.1621866146520; 
 Mon, 24 May 2021 07:22:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m2sm11689958pgu.85.2021.05.24.07.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 May 2021 07:22:26 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/arm/mps2-tz: Allow board to specify a boot RAM size
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210510190844.17799-1-peter.maydell@linaro.org>
 <20210510190844.17799-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <583ca871-e53a-aac7-ea0f-2a4e7812b03c@linaro.org>
Date: Mon, 24 May 2021 07:22:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510190844.17799-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Devaraj Ranganna <devaraj.ranganna@linaro.org>,
 Kumar Gala <kumar.gala@linaro.org>, Kevin Townsend <kevin.townsend@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/10/21 12:08 PM, Peter Maydell wrote:
> Currently we model the ITCM in the AN547's RAMInfo list. This is incorrect
> because this RAM is really a part of the SSE-300. We can't just delete
> it from the RAMInfo list, though, because this would make boot_ram_size()
> assert because it wouldn't be able to find an entry in the list covering
> guest address 0.
> 
> Allow a board to specify a boot RAM size manually if it doesn't have
> any RAM itself at address 0 and is relying on the SSE for that, and
> set the correct value for the AN547. The other boards can continue
> to use the "look it up from the RAMInfo list" logic.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

