Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9576C3A089D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 02:47:50 +0200 (CEST)
Received: from localhost ([::1]:39824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqmNo-00045F-TQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 20:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMQ-0002zV-NC
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:46:22 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmMO-0003ov-Ao
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 20:46:22 -0400
Received: by mail-pj1-x102d.google.com with SMTP id k5so363233pjj.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 17:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=s2XdMit8vn/3WbXQWkJvy1hkun3zTaphutThYkCKagI=;
 b=GCXkMELMNulFfr0sXr+BvNZneBC9x5HFcfWF/EKSsb0HIjtw6cwav5XRniVkj8CU0A
 MhVnXs6g4jti2UOShASwqglb87LNHCQvjUQHlSDu1dovqFfEcW7ICmw+fbGdlP5+9Kgv
 XS+VBoF4+rFlK/Dkq9mmcGwA/eMFy0mqUJkNEE0Q1w32FWG6bCDRff0UF12GpYg9MuXA
 LNBPFURp+KWP8l9WGB4PGI3L95JGz75jE2DHm8MjdKp6JzIR+tSq66QkKa0uhcOjo6B1
 N5J8JqJIqUhSDJk7XevS6URcKVPT2GtlJMR4W09tISkaCWAKu7e5gJKs0D/IBzDGxuVV
 /1ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=s2XdMit8vn/3WbXQWkJvy1hkun3zTaphutThYkCKagI=;
 b=PPDkEFhHwwcwDT9GlRRL/wXdEVaXmr/F3dJn6tTu08MuCWcIT70vhO1qb6aICqUhnC
 FZCuxlhGNCQ0ShVMbXsPD8I5fxt3g/6Yi5ejkuMwKG/1lZJJUrRWozuVKG26yH1Q7IhF
 R8U2Hx0ZlxFxiohdVPUi9oNh/euhEolYb2Fj2M/UvlYa7qgmu5inHPyuUEOqCYpFXDg2
 fwHy0qpXCGa8332ifHHmNE59W3kZKM8qfXp43fHyC6M/HZ2B2rRUEH8Z4zhZI//5WTzr
 ie5+g6CCFXBgNVBNtZXw2G4xMhaDnNjwHm/a5paljYMj0+PJE2bM4vBS0ReW2SdKMRKh
 6naQ==
X-Gm-Message-State: AOAM531GVPd111MVf88p8Ea+JkXMXFKeYERpSnIEbZK1buNC8FJX7lDa
 uCsun0diYFa3VcXIKpk6lDBGJWcheuWWbA==
X-Google-Smtp-Source: ABdhPJwvDhTOQvkdWbOMeVE6dcn7R6q8wPSemq0iglYAXMz/zL6NtjcCUSHDt3ToqRt82Q4T5Xd/NQ==
X-Received: by 2002:a17:902:6a84:b029:f3:f285:7d8 with SMTP id
 n4-20020a1709026a84b02900f3f28507d8mr2744870plk.57.1623199578724; 
 Tue, 08 Jun 2021 17:46:18 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 f13sm11796645pfa.207.2021.06.08.17.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 17:46:18 -0700 (PDT)
Subject: Re: [PATCH 29/55] target/arm: Implement MVE VMLALDAV
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-30-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbee92b2-f12b-3523-b977-059418a1c642@linaro.org>
Date: Tue, 8 Jun 2021 17:46:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-30-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VMLALDAV insn, which multiplies pairs of integer
> elements, accumulating them into a 64-bit result in a pair of
> general-purpose registers.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |   8 +++
>   target/arm/translate.h     |  10 ++++
>   target/arm/mve.decode      |  15 ++++++
>   target/arm/mve_helper.c    |  32 ++++++++++++
>   target/arm/translate-mve.c | 100 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 165 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

