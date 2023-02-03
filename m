Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA7568A3C5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 21:47:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO2xD-0008O6-7G; Fri, 03 Feb 2023 15:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO2wu-0008M3-O5
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:46:29 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pO2wr-0006OB-QV
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 15:46:20 -0500
Received: by mail-pl1-x62f.google.com with SMTP id r8so6485727pls.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 12:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=90r2rH7VmupffwVD+Rrrr2U62ktUsW4af1IcWoBsIHc=;
 b=cAdR8yndVAnG5VibYma02cQlaT2uUofuD+mnwj+A2UocjAvr35AQrv6OdKQg5Cgcjk
 tinLMh/r0UKu6RPYUlrbJxLl5D4NSuPQWk0IAEoikzFQukCVk9QZbSq0679D9ZIZ0D2b
 gnds/9Fk53uQjebMyjQZTX0hcm5kkqlzdlxebcDtAb6FMZRBF7JZalKQ5Zmyt6izyPJ8
 2BEmxLH/qyRmI/tw9W0C7UHgWP9lOQ7Osif9DIzJgj+ANB9nP3fa8GVhOrXG4vRYbBFH
 BAdtx+tKMmHhGTK51UaR7mA6Fd2CA1UIlHcpMRUqySSil5/TXYJJTJscU9kkYT2VkWVt
 4TTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=90r2rH7VmupffwVD+Rrrr2U62ktUsW4af1IcWoBsIHc=;
 b=dbcQyatXr/y02nl3ODeUf8hHLQRwK+qimZX4xSRZ36r95d7LiONYQc8yYY+IpqtP9b
 siK2Q02LUI5x/XDIEzSmxnS0H87sAis/jpE1c4uMp/4IqGjzh7e8z12FJ5dkYLL27AIX
 Wrl/ipZ6mlauLbVknJHwWJz5BzlzFwmLrTxyA69k1rpASmIwDY7WMyznCTOsGcpbU9/P
 OOg3VUdYezkoexO+mZ17TZPSyKjM5aWnaL05S5aw0tA5USkBY4yphBPgdhtW6Nl87IvG
 ZvtX5Q9nS3kQlwhgqyQuCdihXZWjljdXJZCaRfl7GfuFhY+Nvabxf9nL+nGgJxEw4utV
 zEGg==
X-Gm-Message-State: AO0yUKWICPHcknLc9wFOHBvfCfVH7sJuW6gpLhqtqbNnG737MlvEZ/VI
 xayUOv/dtmsc+GIDWC2lJ98/hQ==
X-Google-Smtp-Source: AK7set+XSWNXwBxOmzdkfd9RMPqGN0H0LVwj8E6QnkeJX8r8pvjRCH3Na+UzHwMz+NYnLpd7jYCYRg==
X-Received: by 2002:a05:6a20:1442:b0:be:8fb1:9b11 with SMTP id
 a2-20020a056a20144200b000be8fb19b11mr15033890pzi.47.1675457176180; 
 Fri, 03 Feb 2023 12:46:16 -0800 (PST)
Received: from [192.168.50.177] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 a77-20020a621a50000000b0058e12658485sm2316671pfa.94.2023.02.03.12.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:46:15 -0800 (PST)
Message-ID: <6be1085e-1909-45a3-741d-b2c8e1baaed0@linaro.org>
Date: Fri, 3 Feb 2023 10:46:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/3/23 08:16, Alex Bennée wrote:
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
> 
>    Overall coverage rate:
>      lines......: 11.2% (59584 of 530123 lines)
>      functions..: 15.0% (7436 of 49443 functions)
>      branches...: 6.3% (19273 of 303933 branches)
> 
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
> 
>    Overall coverage rate:
>      lines......: 11.0% (58121 of 530123 lines)
>      functions..: 14.9% (7343 of 49443 functions)
>      branches...: 6.0% (18269 of 303933 branches)
> 
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> ---
>   tests/avocado/boot_linux.py           | 48 ++++----------------
>   tests/avocado/machine_aarch64_virt.py | 63 ++++++++++++++++++++++++---
>   2 files changed, 65 insertions(+), 46 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

