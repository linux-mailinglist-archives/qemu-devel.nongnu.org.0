Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35699339E74
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 15:14:49 +0100 (CET)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL52W-0002EF-7o
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 09:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4zs-0000YJ-E5
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:12:04 -0500
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lL4zq-000801-Tr
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 09:12:04 -0500
Received: by mail-oi1-x234.google.com with SMTP id x135so25415375oia.9
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 06:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rYJABfEdBLIPJLLQ42A3bUXA2yWMKeeb3tyLGTrVZU4=;
 b=piDQL3FzwEcjgceo6DBxaXRtxCXQtJmxILFliFW2Nf9JEcDo4W2o+1YXPx+dYRFr+X
 IZeLEM7Z16gBxwa6TTGp/cSrH863xX3XEYX+imOApvLAIhBYWugfizlM5rsbiHsdRoAf
 7UbDLlPULqAR+emtgqqowLc4z0eR2yaa4YDGCCgKZW7Qc8GEBWRTO9xx2l3lkLDTo/P7
 Gef/mp6zKnnB8KDEeAzen0gNdv7373utsaA4ICmk0HaYaA1pfms30bEZSREJPdnXmlxD
 AA3Cue0mix7yxOlCZ9y+tW9jy6ZGO3UczlUYVRelzUodew1zW8hNr3RAbUguEyh096f4
 luYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rYJABfEdBLIPJLLQ42A3bUXA2yWMKeeb3tyLGTrVZU4=;
 b=c6DNq3+FUGJUl39REyVn8T+rcSXQVpPEg7jWgg7c9ozFdpEktu84txVP9J+zG1ipg2
 kSZn86MmLv2qAgZRiDlAQ3zISZbINcVXj7A8sHT2DtZTwBHEkk0wNusIU9PrmDSKHhHL
 NVr4vql+JteEoN7xJSPnc1hZaRxsrU+NCSZbRbOpRdb+NuWpn7XyOOYgZ0VdkNxjwEnn
 hUvlzRfxbfd+X/MUejCPYpLnQisIZfT1RvxPS30OKCDAQYEXVOYkU7r6RDv0sy9/Qf5G
 +JLbsotbewrCroSKrjWNDoIjjyDEpYULLn4dY7cvv+y7kuQBUeX6Z5zKSn5chYNksnio
 /7Ng==
X-Gm-Message-State: AOAM5323KxlJVR2v6QtFKSITHbRneNeI9Fx6J85tAK62Dqm4fpS1wgn8
 jTmAnSsSLsyidvimvHlfriAmDg==
X-Google-Smtp-Source: ABdhPJztBQ1x9JfiEJW1gk0I75Ntc4etpiRW0JeL6xiaNGxITD3tf9ss3aQExIodjp8uD6GBfB2ffQ==
X-Received: by 2002:a05:6808:1a:: with SMTP id
 u26mr13001465oic.37.1615644721711; 
 Sat, 13 Mar 2021 06:12:01 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id u8sm3374857oot.24.2021.03.13.06.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 06:12:01 -0800 (PST)
Subject: Re: [RFC PATCH v2 16/22] target/mips/tx79: Introduce PINTEH (Parallel
 Interleave Even Halfword)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210309145653.743937-1-f4bug@amsat.org>
 <20210309145653.743937-17-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22e1db1c-24ff-557f-e3e4-4d3c19183bd1@linaro.org>
Date: Sat, 13 Mar 2021 08:11:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210309145653.743937-17-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x234.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fredrik Noring <noring@nocrew.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 8:56 AM, Philippe Mathieu-Daudé wrote:
> +    tcg_gen_shli_i64(x, a, 8);
> +    tcg_gen_and_i64(x, x, mask);

I think these two lines need switching?

> +    tcg_gen_and_i64(y, b, mask);
> +    tcg_gen_or_i64(d, x, y);


r~

