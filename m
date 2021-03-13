Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9396533A0E8
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:08:47 +0100 (CET)
Received: from localhost ([::1]:60406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAZ4-0005iS-Kc
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLASp-0005oK-Uh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 15:02:20 -0500
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLASn-00044o-H9
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 15:02:19 -0500
Received: by mail-qt1-x831.google.com with SMTP id f12so6503428qtq.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 12:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2yJBltCUy1PIeoNavfskg9QQMWuXEzsKSIjzb909TLw=;
 b=INFAaFrSJJ+3Vjec6034zy5yUKVhXp7AaRV63IBclXDz8ZPs6Q+JHxiQQTz0cAueUn
 g6w6w1K0YWWYsXqICv7l28Xxrd4cqLFzfumJByt+9fwmyJQAqYi+F7g4y/6mjiSZ54BQ
 EVM/VxAKHxgYU0x8XZu3d2x93SOjhkCfvKxID7LBMiSWImYyigyCxNvx1Q+SOjq7E1Fs
 49zJoyYESCH2fuLRmmyFxSbI/2gwxjOJPOaxZwc1nbXt/yN+ZzdpkpwFat8Ek9aVVKbN
 6pqtXvb/VFp4LF7z3gJegDIs0sy8WuPkCf7AnNp7s9UBgviKzP+RR2anstCmAaYcN4m/
 /GEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2yJBltCUy1PIeoNavfskg9QQMWuXEzsKSIjzb909TLw=;
 b=RsQbJAQ2LGW99n7YFwVMAUixJy8gBC9pyAYeo6w3BLTNmhH3yhLDU3xQ0IT1ShQA87
 eS+Y3DLFFZ4AFfrUe5aPtjbeBhA0HR7hEd0qmjmw33xBAHMWUYgRvlEJA73T+YcX+3+e
 um9hmjazuPnR9zmBskhlWi3O9Qb1YDSxq4A5vOyT0O4xt/heVq+Um6X5I7qpmylyN9au
 9bjJEVA17ZwuqsxE1RS5qJMRTdrk4XExfRTUuAZR5FisM0Kxu2LeO/8qsGiGzSPEWhvd
 6YyNtT3frUzZT0PjArAwdm9s2RTOOj6yVD9QOcNNszNHrFMWqpyvoU3epp+7CEZtFOW+
 M4ww==
X-Gm-Message-State: AOAM532fdiA6YWOntdgIdlkhhj9iu8Ngm6e8hj9Y/B0bfxeb59PwS0lF
 sTFaw3U9j31jCQKzgJrFyXAFqQ==
X-Google-Smtp-Source: ABdhPJz0sfz/yagh4UoeLhfWhNlMuYJC7rAPcBNxvtlkYuaaC339W6AScLWERmXbghzLJflWjDJ67A==
X-Received: by 2002:ac8:568d:: with SMTP id h13mr17212469qta.139.1615665736177; 
 Sat, 13 Mar 2021 12:02:16 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id s6sm6639066qtn.15.2021.03.13.12.02.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 12:02:15 -0800 (PST)
Subject: Re: [PATCH 09/11] hw/avr/arduino: Replace magic number by
 gpio_port_index() call
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <630340c6-05ab-5d31-78e9-21231714a986@linaro.org>
Date: Sat, 13 Mar 2021 14:02:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x831.google.com
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
Cc: Thomas Huth <huth@tuxfamily.org>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/13/21 10:54 AM, Philippe Mathieu-Daudé wrote:
> +static unsigned gpio_port_index(char c)
> +{
> +    assert(c >= 'A' && c < 'A' + GPIO_MAX);
> +    return c - 'A';
> +}

If you're not going to use this for anything else, isn't

#define PORT_B 1

enough?


r~

