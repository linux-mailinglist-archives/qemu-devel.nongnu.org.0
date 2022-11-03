Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07778618A8B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 22:28:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqhko-0005tp-GL; Thu, 03 Nov 2022 17:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhkm-0005pE-2Y
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:28:00 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqhkk-000720-38
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 17:27:59 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 c15-20020a17090a1d0f00b0021365864446so2989752pjd.4
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 14:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sXQQyIT65bC2M538koSQDkAxNlFJjz168y3aMJbsqdw=;
 b=CPLW8dsQGcNT1WyYm8ZSiDQab5M+NViFnv2J3OOWLbLMO6ghh+Z0fb38y1JdLvzamu
 aZO9/t5ZFZ/OBtrXfYgyy1O20OQUoLKqxnfffgU2taiLRuKaOXW/a+1s+wrqS2EBU5jt
 60tEz77DLdYISLbm65LsN6d3zi0QaYWQT77tyLQwuhPKdlYFgg0J3UAMJICTh0q4otIG
 k2utk3NfoW3Fqnm1mlnL9EOH63/OtAobisEOAfVOqNB5mOq4cbnsnLTl1w6l3cxMulHP
 GC7pU3WTuEDRNNwU7JzTPma2hk8R53UiDGaKzLQ44kOn1/+oWTBLjRBbsWS8jHYliXBY
 kpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sXQQyIT65bC2M538koSQDkAxNlFJjz168y3aMJbsqdw=;
 b=VkwNgyoz/lu3+rrgnG+kLzh0FHAbQ5OnPvQz5fHvicICyTrlF+e6ukAzYXyVisHkpm
 H2mI4oQjbNh8k0qaQNicw5VadknEi8VIerXayArW9Fmn3weDUh3WpVSQVrmC2cIhqbrc
 Itt9aHRonCOpYac8cSeKgedH9U6FoYn9ScAfgDb7HFDzw21cjG2CBHBcBpfS8+huew/J
 J3BHqtEvuOmtumry+S3cXzwdHnY969Qd3eb51YnQx2h1CxoQnJaEea1+Fpch7h9kYhHJ
 G0B71ddi6q2wdSEUnUm/QkuoPie2FAGL5yaNWYDBrKjJ+u5z47FG9AVlABOAsW6+nczO
 6KxQ==
X-Gm-Message-State: ACrzQf1Ej+0oEPQmdFpnXWx0EE9wvQ89YZWpTRwKQdGMS3OqG/7YgxtT
 YQ9/JDqiaY65MZlIoh4glM1ilA==
X-Google-Smtp-Source: AMsMyM583CSyvzfW7hvLvS2YLzraRjiDIMgfcnhQn6MJJI5HzjlWw2/kXIDVrIO/EQRj+6pndv1ZFw==
X-Received: by 2002:a17:90a:46ce:b0:200:a7b4:6511 with SMTP id
 x14-20020a17090a46ce00b00200a7b46511mr191669pjg.101.1667510876328; 
 Thu, 03 Nov 2022 14:27:56 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a65590b000000b0046fd180640asm1209638pgu.24.2022.11.03.14.27.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 14:27:55 -0700 (PDT)
Message-ID: <e88339b1-7ffa-d044-2151-465409e61f90@linaro.org>
Date: Fri, 4 Nov 2022 08:27:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] meson: avoid unused arguments of main() in compiler tests
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, sw@weilnetz.de
References: <20221103172110.168235-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221103172110.168235-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 04:21, Paolo Bonzini wrote:
> meson.build has one test where "main" is declared unnecessarily
> with argc and argv arguments, but does not use them.  Because
> the test needs -Werror too, HAVE_BROKEN_SIZE_MAX is defined
> incorrectly.
> 
> Fix the test and, for consistency, remove argc and argv whenever
> they are not needed.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   meson.build | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

