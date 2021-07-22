Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5683D2C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 20:54:35 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6dq5-0004qa-QR
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 14:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6doy-0004AP-EE
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:53:24 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6dox-0000Y3-1n
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 14:53:24 -0400
Received: by mail-pl1-x634.google.com with SMTP id a14so269465plh.5
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hBKzQSzK7IGm4exstYvNNwBZaWb3yR8ZhJlzx378LE8=;
 b=FIwSZy3mcCiOVMqtWq74BP44Rs3jEw1hXyqtjI5Nyy6RGYvo39iR/wED6pigQ2Wnqx
 AwVeu9fuoMJmiWyDsqah4Rsel66akUgc1Bv9NesnkeLhaoPIS4LylG83OGRBBV/unKZf
 dZq3qca19OAXAArPcVT7X/1qCZgtVESBIX5/AASZ0ZouQ9s2duVjZr0gTscWsyH27zCJ
 O93cZULkoJIsKsNb7BKW3BKl4xSB+3tRF6NeMfxzRJNoERjyAB90Bq30BJUAzrIM+fFv
 0PsaDw5twYae+UZBe6ha9R9d1e2FsyueqK7P9F+8Jc1gkI2bEs8xGmZKooeH/30NI+Vy
 7tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hBKzQSzK7IGm4exstYvNNwBZaWb3yR8ZhJlzx378LE8=;
 b=kCpc9H6dJHmbwDMRaZP2SE+WBVGJuvF3Hl+tL1fUqsA92ocNhyhanDQMham2hvXm1I
 OjeppRIKKEo+XYEj+wna7Cj6Auz5ynFnj1QAY31h0kJ7JlEtf4oum4gfI6U6pcg7U0K/
 8xqTptdmCNwzPzTDic4SzYnMenVEZ/MgG5PHAl8QNtWK7bbkj8Rz/D4VBaRGRwgQS4Rj
 zMFOi5bpyuM0eprcs9UQjOJdVuxUngwU5q5YqfkdtBuQm3QQN+Q6k4uWZJaaS+deyfPf
 0wFKXXp/nPy9NDHZru34B0oKAnmJuRAp5cUM5NZo3Jdd21OF3lFVDGmFBkoylLJ9wnEs
 0Hzg==
X-Gm-Message-State: AOAM531HYpGi46WpGHtwk74/JEDT0VkgMBDbocGdbGc7coSswJXjFdNh
 bNZzC8dA5P5kyC0yBrUA+Ye95A==
X-Google-Smtp-Source: ABdhPJw5TF4kH117H6z1NYk7G8MhFpeOh0IbZ9MQhAzIgSTpKhshIlrijp1Mdj1EOJjj6uN5FGZKFg==
X-Received: by 2002:a63:ef45:: with SMTP id c5mr1395853pgk.78.1626980001072;
 Thu, 22 Jul 2021 11:53:21 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id s195sm6544155pfs.119.2021.07.22.11.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 11:53:20 -0700 (PDT)
Subject: Re: Prefetches in buffer_zero_*
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <YPlCJpMIOb2Umc+Z@work-vm>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <092f9b8b-4a14-d059-49be-010b760828aa@linaro.org>
Date: Thu, 22 Jul 2021 08:53:17 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPlCJpMIOb2Umc+Z@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
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
Cc: qemu-devel@nongnu.org, jmario@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/22/21 12:02 AM, Dr. David Alan Gilbert wrote:
> Hi Richard,
>    I think you were the last person to fiddle with the prefetching
> in buffer_zero_avx2 and friends; Joe (cc'd) wondered if explicit
> prefetching still made sense on modern CPUs, and that their hardware
> generally figures stuff out better on simple increments.
> 
>    What was your thinking on this, and did you actually measure
> any improvement?

Ah, well, that was 5 years ago so I have no particular memory of this.  It wouldn't 
surprise me if you can't measure any improvement on modern hardware.

Do you now measure an improvement with the prefetches gone?


r~

