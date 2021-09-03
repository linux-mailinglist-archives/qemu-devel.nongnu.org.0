Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A6400742
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 23:07:23 +0200 (CEST)
Received: from localhost ([::1]:41238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMGPC-0006sp-Ew
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 17:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG56-0007HE-NL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:46:37 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMG4q-00054G-9B
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 16:46:36 -0400
Received: by mail-wr1-x429.google.com with SMTP id t15so391715wrg.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EeLb5Hv/3Gc14L0eutmwkS2gercWPN9q7BNvejpfSxs=;
 b=ceANaEO6DEbz1/y2JOe3xLvLEz2WYklhOYtbmC38JI0yr2vSnEKeDOUyH8xXxzOOI+
 kZas4HU1ZJkeJg3AkRHxaxeFv4es81Yl986wV+c6oCdOt0IJuu7mlHS+tqCCubrak0Ma
 Co8Hxxd2Zg1psZBAYxbUBiOS3sEGS1A9HfL7bIaPJbcfT4yehUf4S+IUtiJZ7POsqxfO
 n+8wo7n0PhnkEe4YqqQryCuQ8mXQvaegdJJLsYQHv6lXKG6z4LP0VNxEHMsfz/WhhPpi
 sQ16whJ9Ycn/LfjHs7Vr8Efxy6b1105V4+PbXqY/Mdl3JXMM1sVjfy1tWxxKxrL8f0cC
 CUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeLb5Hv/3Gc14L0eutmwkS2gercWPN9q7BNvejpfSxs=;
 b=gzPj+Kty5IDgv//xIhzUu9X+cn8JXV1qVmDK8/r6UyT/JfITExN6Zw7BBjulOnEn28
 +3Ba7ILt1UczKq3rqVRyNdwOvP+6zoLjTURXHI2vUGLDL+afAGUWfCQ/wb8n+TT1sYYd
 SFz56W0OZy9htvNYzzpsazF5pPEWZazWbK3AYO7WY8K/rXpq2KAZqofxlTJKJdO7biWc
 2NidFRZ4O16dNwvXJ1X2Kq0aZ8R1lBlN0MQyopHPDRdaYIJI/jzRqAyymqm2ByPM4PGz
 2/wvJA8yZA9+403/UqZUqbLmyTbYUSqRhq3c7JF4vUhlZxDmKgSX9d8PYmXQWqd9qgBq
 WGCw==
X-Gm-Message-State: AOAM530K1fdOeXgj5goRlvUTycw0K1iGOBPyuD0qSsxjdYc+LlL7QrbQ
 6B+aeQtgMQwTdRZQOXqr4I8hBQ==
X-Google-Smtp-Source: ABdhPJz0w2mehSdUouysA1zwmOdzLUYeHKuRFXDd1grkYAL8reMgOmR57N8xOaJWmTFehwTpKcpvaw==
X-Received: by 2002:a5d:6ca4:: with SMTP id a4mr908910wra.140.1630701978947;
 Fri, 03 Sep 2021 13:46:18 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id q85sm417173wme.23.2021.09.03.13.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:46:18 -0700 (PDT)
Subject: Re: [PATCH v3 27/30] target/sparc: Restrict has_work() handler to
 sysemu and TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181402.761372-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d523073a-68be-8cfa-f77c-a7a87faa81f2@linaro.org>
Date: Fri, 3 Sep 2021 22:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181402.761372-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/21 8:14 PM, Philippe Mathieu-Daudé wrote:
> Restrict has_work() to TCG sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/sparc/cpu.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Though I think the one existing reference to CONFIG_TCG for this target is a mistake,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

