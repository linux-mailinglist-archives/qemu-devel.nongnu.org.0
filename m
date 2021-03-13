Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32C33A0F3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:17:55 +0100 (CET)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAhu-0006pz-Ek
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:17:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAQG-0002ZG-E6
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:59:40 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:37491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLAQE-0002ry-Fs
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:59:40 -0500
Received: by mail-qk1-x72a.google.com with SMTP id s7so27954660qkg.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gIcng9HIpf0hHs/9LqmZsrof1vip5B75EDQga2W4kFs=;
 b=h0eORpI2iH0mSkURbY7/KcXy1Hswu3TUGsJ3o7GsgJyctGMrzbd9LhE1VdErwG20e4
 guynyP3xKc/xxhZh4ClAKT4mseQQZpuuqtuu1Lr6qIWMXqucKv2uLc0xikERdYoUmGqp
 HFgOS3Li2faBrQEs9bF3ri37PLmkWZdTdlRJxWV9L+Q+YF8wH0ZdPc/BevmrvwaM+Qv5
 He4FaC0ieA6+nXV2MHTLfOy6h3U2uJf/Nw05+KSZNlVxTupe03QWmCiYLBLaTiY1ncpJ
 Yna2pOfq7Q1+KoHroHEes9Yc+Sn02989Do4t7ACieimFiJ3kuGci8epWJAJ18MKzVVuT
 yqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gIcng9HIpf0hHs/9LqmZsrof1vip5B75EDQga2W4kFs=;
 b=d5pXZU7VNdjQ3EOBcvnygrlm7+tZjyH/4JqD96uJ4NfDhzF2JmxRC5OJWDyDNVm3ca
 4nN3ASgkQF/WBYhxuxRlguGusLlcTyh/nsbwNx6ZPLilQ7dV71wTtYQh2qv2vo3baC7u
 HeSTq3s7ap9gOe2LUHMxuUE+8/JpCKxxAhj16iGlptmdGPC4VX/MRYekgPVOeZRfMU5L
 z/IJi+3ugL+nchekUKcVDBQl/RsWzbxdkeDo2CwvGeWRNUbAZkA2IXmX7zAn1XJBYwsY
 cpncmqV9L96RYDjnJ07pWLsz89/JmYhJny/6+84oCj/U1G6oL2QRImH694R0Ddd6wrRF
 wSZQ==
X-Gm-Message-State: AOAM530xUbg/3crWIeWv++R4nIZPVxnU3v2xQubld7WrRjlABYzA5ZW+
 y/jmntlhle1lqxfwtlJ2rIM2lA==
X-Google-Smtp-Source: ABdhPJzwU2f7q3qys1+0YrO3OKhsH7iFPxtxKwa4quOheLJJjrRNhnIoYlwSs6WfWDLaGg4mzTTlqA==
X-Received: by 2002:a37:dd4:: with SMTP id 203mr12912745qkn.348.1615665577511; 
 Sat, 13 Mar 2021 11:59:37 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id a11sm6636929qti.22.2021.03.13.11.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 11:59:37 -0800 (PST)
Subject: Re: [PATCH 06/11] hw/gpio/avr_gpio: Simplify avr_gpio_write_port
 using extract32()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313165445.2113938-1-f4bug@amsat.org>
 <20210313165445.2113938-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f680b6e6-ab9e-1e73-c1c5-a00dcfa6b09e@linaro.org>
Date: Sat, 13 Mar 2021 13:59:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313165445.2113938-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/gpio/avr_gpio.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

