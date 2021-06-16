Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A113D3AA39D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:54:04 +0200 (CEST)
Received: from localhost ([::1]:56182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltafr-00069Z-OR
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaYu-0003Jq-9M
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:46:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:50805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaYp-0006ue-1p
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:46:52 -0400
Received: by mail-pj1-x1034.google.com with SMTP id g4so2290010pjk.0
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uo4ybJevsfq7tsyZzkG//7dRkRO/oznKL295243n9Y0=;
 b=RxC8Rv5klHMSv6GAyqToqrdtjPejXPgw86sxkdkWX97lesKNAUTCAjxxqwf/bQc/rb
 LyVID11nQN2ehZC8ngahT9yCnWODO3m9uxhMwOF+DrUJP8d/AX6Vg1GpVBuyIrIvtC9g
 /sYPUYFc7pGXl2SafRt+psfp1jLwDyfPrmo5uVoT86bHLxUEMUqEiebqIZJJ9I6QYbob
 Q3skAfdYQh9GJo+0xay0c+nv0dKRrHwIRoIakfVbXu9RQ8w40kQwRCDso5ig32ErOKk+
 3O85li/lezmIn/LvhVKXPwoCeff2uspnKlMzSHe0N0SptUd9ul4RuJyjjOndKanB1v15
 94VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uo4ybJevsfq7tsyZzkG//7dRkRO/oznKL295243n9Y0=;
 b=RVJONudD3Z+5pyuzi5LfiRXVsOO7aR+HAhLbOAqxYf6B0ZOY7fn3zAzTYe8NtsOMKo
 hGhweJDhBkCP6OyoiFK7EA3mS6e0EVzdvafXENb5cm23rS2HjTV+nAU0eHP6wJ33Niim
 gJg4HM0D8jvlxWMBGXczHRoM9b5KK6RQo5dCqgC7ofAe4fRBspq58BxaQYR7vkSl5Gol
 bsbf5f+8vwv4LTCOZb1ResZynp3UFdsfyJdNP6ecVaMSN9yTwtBkZGVyY/RcMkUHLV1t
 SHRQINN8YtI6tbnOuNsUq2tgP9Ve61yIpNaPJk2oHaik5x/cA9W4uyQQqshp8sK7oO5T
 dBBA==
X-Gm-Message-State: AOAM532wW2ngzQKlpoCbNIJx2wlXmNboVLWcdPsshv8e9GOQd7hglVdF
 QLOJGr3+KpWcTgGgZ6zTrbO6Ag==
X-Google-Smtp-Source: ABdhPJwM8c5yzS3/xPqBxna3048iScGXUEf7Zk0xgtsIn2lT2qs0X0JAagCFSKBYibBQpVCJ0Kec6w==
X-Received: by 2002:a17:90a:640c:: with SMTP id
 g12mr12636068pjj.52.1623869205206; 
 Wed, 16 Jun 2021 11:46:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 g63sm2747485pfb.55.2021.06.16.11.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:46:44 -0700 (PDT)
Subject: Re: [PATCH v3 10/13] hw/misc/auxbus: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a45d89a-b710-12f7-6f82-75fdc6f0384d@linaro.org>
Date: Wed, 16 Jun 2021 11:46:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> @@ -161,12 +157,11 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>           }
>   
>           ret = AUX_I2C_ACK;
> -        while (len > 0) {
> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
> +        for (i = 0; i < len; i++) {
> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>                   ret = AUX_I2C_NACK;
>                   break;
>               }
> -            len--;
>           }

This form of updating ret is better than...

> @@ -200,14 +195,13 @@ AUXReply aux_request(AUXBus *bus, AUXCommand cmd, uint32_t address,
>   
>           bus->last_transaction = cmd;
>           bus->last_i2c_address = address;
> -        while (len > 0) {
> -            if (i2c_send_recv(i2c_bus, data++, true) < 0) {
> +        for (i = 0; i < len; i++) {
> +            if (i2c_send(i2c_bus, data[i]) < 0) {
>                   i2c_end_transfer(i2c_bus);
>                   break;
>               }
> -            len--;
>           }
> -        if (len == 0) {
> +        if (i == len) {
>               ret = AUX_I2C_ACK;
>           }

... this one.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

