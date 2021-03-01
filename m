Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B153276B4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 05:38:15 +0100 (CET)
Received: from localhost ([::1]:45646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGaJy-00057R-9j
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 23:38:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaIy-0004b6-DA
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:37:12 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaIw-00040g-Rw
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 23:37:12 -0500
Received: by mail-pg1-x52a.google.com with SMTP id x29so2449170pgk.6
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 20:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MdrXeexqNLgAz3eu8Spqv0t0Fs14gnmfENVh7nxd7xk=;
 b=lcOhpUqClXTgdWSH8JYjJVfDESqfitfKYeBLkAlw0quDHlQu6f1k/1mYtkHOTVEh1E
 IG6ulVRhE8vnMAigTRCmXdj5Z+ia3ndPFH3ER/LtlIoQamg/bqX5u8gY5CE82EdZlip3
 YoUtVxpgS/Q5UHaYcX50KS0PlDjQeka3weG4lF/UQHpQlgbblHM0jdMkqY8RtW6fOwu5
 YBQi/+Gw2GKUfny7WuxAoNFL1me1c0z1Dwnt3baqfnMqYazQbHXcuD9UbLRwsjReACV2
 3wqDhEqfKonOzO5PjJtVMbq1nmlcbToI7bVzaia9+KXPjrOhEu5q3X5bhU5nL2AbCM50
 ySqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MdrXeexqNLgAz3eu8Spqv0t0Fs14gnmfENVh7nxd7xk=;
 b=XjOSikLGziSobPD/hULRjnG5Y9L2s3C2HlVfKl0+KMs4RCN2aCYAKzYMYtMyMl/ZEb
 hFSO1JNZIjZyGjdSWkA4xxZ9qoEdqmo5Lcy/D+d5I+fAHdHaS3ZLX3VrZ6HSKwLuULVu
 cGy/D5QY3ydkmcUZRz+OezKEN/nga+XDk2Ac7IuQ6xBoG/uk33zRYzNHHxVCYflZ8ZYN
 91hd+wZ3s1rBZ2FAiaRON2/XsrZuSScFFhxQIBv74wwDLEwiv2vZ4qBYC7L2eAe+nab/
 l/djXuq8kmQd6SzteqLmw8fXt3WP1TZ8C24zKUbfjCX3V/br5CnC7kpn6e+whZ/yc0vW
 Nv1w==
X-Gm-Message-State: AOAM532mncBCKzzogM0QPFOCC25d7VgcuMAWC4L9ur1iorLZFUFi/ZY5
 CIvFdyey/dOQkMHsCVpJJTnOyQ==
X-Google-Smtp-Source: ABdhPJwO60fdrGHEY/Nb7/8BhdmhoCcUFFjc1Dw89OJ4gy2KQVESO8kjZseFqHHkL6HYpo9EN7UQ1A==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr12191107pgv.36.1614573429258; 
 Sun, 28 Feb 2021 20:37:09 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id z13sm16988784pfk.178.2021.02.28.20.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:37:08 -0800 (PST)
Subject: Re: [PATCH v2 15/24] hw/arm/mps2-tz: Allow boards to have different
 PPCInfo data
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <466496c0-5725-4aff-46d7-35b6fc1527f0@linaro.org>
Date: Sun, 28 Feb 2021 20:37:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 3:51 AM, Peter Maydell wrote:
> @@ -544,7 +546,7 @@ static void mps2tz_common_init(MachineState *machine)
>        *  + wire up the PPC's control lines to the IoTKit object
>        */
>   
> -    const PPCInfo ppcs[] = { {
> +    const PPCInfo an505_ppcs[] = { {
>               .name = "apb_ppcexp0",
>               .ports = {
>                   { "ssram-0", make_mpc, &mms->ssram_mpc[0], 0x58007000, 0x1000 },

Existing nit, but about to be exacerbated by another array.  I'm not a fan of 
large, initialized, on-stack arrays.  Do you really need the pointer into the 
runtime variable mms?  Perhaps arrange for it to be an offsetof?  Then the 
whole thing can be static const.

That said, the change in this patch is ok.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


