Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6D9686F4F
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 20:53:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNJ9z-0000zx-07; Wed, 01 Feb 2023 14:52:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJ9x-0000zX-KY
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:52:45 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNJ9v-0004xQ-Sm
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 14:52:45 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so4071986pjq.1
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kXWbKerzXdO0RhERg5EsHrxhV4S2ENwJztjaWyeVpxY=;
 b=u282ijUdOIvmlNXL6BT4AiHDxd2Nk8KNDNP4G1EOPuZkNsU+RXgj9jKS3CUfVzHeXa
 drGtymWe7MqpNlfIq+XipNHuSG28KmZZfyai9YmL0JPoroBcjgSsz6aTWFVp+PYCDzIR
 tFnrkegkZiZioFnYIvd3NObEkn4cA5q5Z1EvLfJgF4uBaBoPRloVmEq+Yxa1EsfAx7Mo
 YCgZDYUK8IJeyf+gELw9Ye34xggvI8MHto98iUYQskIay7jghJT0sT0JesA+O9iYsqD6
 2qwCMluTTUTzz6f9YXRI7o7dMJMs3pZpP4eX1TC7d+/vVIzJhJdcS7fF87ErZPJx2+3n
 X9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kXWbKerzXdO0RhERg5EsHrxhV4S2ENwJztjaWyeVpxY=;
 b=IuKAGdm06yFuWoXaIF4EYV1R4v9z5DDRv1qFFAyjSk3VirsXruE66N3LKe3YBOAwNj
 S1yTGUXa0Qq0W6P5pn7S6kSmUb1kxK6Vjg/NYLjB/w51E6dNnHeKEIPvuyvo9Kwcfc1J
 JDg//FAfzxtJZcP9y+RWNwp4OV6iFqzuLmeBut5b5HIp8QQfHuA+je0UOGDj8GRaBhd6
 n8Wc4AT+V55KzJFO/bduMRTEW2xnJCXF0jTMy7ETMqtH1fF/u9vSe3CI/q3I5JU0bk73
 ZsbjMI4VERb6xaDUAu2CAgomots0tEREOoOiViMS8/+iuc41jmMZH94/0mvdWYvA69sj
 wcLA==
X-Gm-Message-State: AO0yUKU8P6vVNdcVZGdExeDjD9ktLj+KgD7CEHOvyrSH50cFDcC5sbca
 2iK+A76Xfejy9paWng0XEH0EyQ==
X-Google-Smtp-Source: AK7set+hxqgPJrJJGVFZdh7zegUmZ8yarUrxUIIvhX/UTUX6lu7SfSf7KSkrZDco79cpMXNd1gxcAg==
X-Received: by 2002:a17:902:e192:b0:192:bdf8:1a5c with SMTP id
 y18-20020a170902e19200b00192bdf81a5cmr3082908pla.33.1675281162252; 
 Wed, 01 Feb 2023 11:52:42 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 l2-20020a170903244200b00194bda5fe5asm12090905pls.115.2023.02.01.11.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 11:52:41 -0800 (PST)
Message-ID: <c8e4ab50-3024-0e9b-24c0-4e6e00370b35@linaro.org>
Date: Wed, 1 Feb 2023 09:52:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/4] tests/tcg/linux-test: Add linux-fork-trap test
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-devel@nongnu.org
References: <20230201004609.3005029-1-iii@linux.ibm.com>
 <20230201004609.3005029-5-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230201004609.3005029-5-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/31/23 14:46, Ilya Leoshkevich wrote:
> Check that dying due to a signal does not deadlock.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/multiarch/linux/linux-fork-trap.c | 48 +++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>   create mode 100644 tests/tcg/multiarch/linux/linux-fork-trap.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

