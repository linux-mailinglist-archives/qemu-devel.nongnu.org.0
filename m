Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA56AE7E6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 18:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZalb-0000tH-Ew; Tue, 07 Mar 2023 12:06:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZalZ-0000qj-7u
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:06:21 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZalX-0004eE-Oe
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:06:21 -0500
Received: by mail-pg1-x531.google.com with SMTP id 16so7990947pge.11
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678208778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sM9mzhwMpxvqc17xoOdvEiXjlDhBIgSrv1BU/zZq9bk=;
 b=WeyiKyFem4A9WXdq4RDoCXuabLw7tHJQw9CW6W6VX1yLf33FiJuvj2Mt+0yMmgxNxA
 1ZaLTnSx7sEvW4OU6jhEurZCuv2McSg2/ZH6HALnV2q2VxCPmj5RnXdr2+nE3JADKg0g
 wrJA7MtIcZuKF9uIXFdHqXwmk0EsWZu9/5yq3dLB9lVlf4dqo+xgc63blvwSL51vDDb+
 uQwPQjcIg+FlI0YYgB4wpHPWWpALncJG75M8mKzG2Ntg75pn1jzSaSnXr15xQA6xzNoM
 iwOywJ9MoEILTONSD5Akj3jlcU1yC0Haw9tbe1Vg9XkgH3T+9fxIOJuKaFp5EcMEwe4V
 NPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678208778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sM9mzhwMpxvqc17xoOdvEiXjlDhBIgSrv1BU/zZq9bk=;
 b=z+IXZt+h/ffQYFov/kfHM0b7zZ5XlDSRXJ/48yGk4ShZyJSIgTJ+GpSbJ6AZu9sgt6
 h8MTP+l9PS+DOC134yh8cpdvEdbIaxTpsiOzKtQ4iNAiNQ0AvQBzVbYcXbbR2GheMN95
 ud+GiOjpZcTZ9NiFRHb1o20JU50luVs975exHYTNPsGe3enGtpyyNS/gma+Tpb4E7cGS
 LtL5kbr4SE2hWAKvrKUekOn8Tb1Ulo5Cxzr4MSO1eieHh/DrVdGhYwjWMt4hWmOQYBTq
 3hxt7GvxbiWzAXXf+Wb0PuYNwrXeL3Py1QhN2CSQvrrmFtQsIelNon9/GD4qszZpWYuC
 MkMw==
X-Gm-Message-State: AO0yUKVKzv8lC8rxWIk5OikrJs9lKgbHoIppPGjiR3E64UQpYry5Ylk0
 /6/kyPog2DpTP02T6pi1+YXWIA==
X-Google-Smtp-Source: AK7set8jdyZtTx8+ztU0JpTj0upf5NKVsptdBPoZ8PEkDKL9kTEGuDcfqCByBx6UivwTkoReFzJVvA==
X-Received: by 2002:a62:644:0:b0:5d5:9350:ae05 with SMTP id
 65-20020a620644000000b005d59350ae05mr11228503pfg.32.1678208777913; 
 Tue, 07 Mar 2023 09:06:17 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb?
 ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b005e5861932c9sm8137079pfd.129.2023.03.07.09.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 09:06:17 -0800 (PST)
Message-ID: <f90610f8-d6ab-f9b1-1375-5941a621ee42@linaro.org>
Date: Tue, 7 Mar 2023 09:06:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] stubs: split semihosting_get_target from system only
 stubs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
References: <20230307170405.796822-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230307170405.796822-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/7/23 09:04, Alex Bennée wrote:
> As we are about to have a common syscalls.c for gdbstub we need to
> stub out one semihosting helper function for all targets.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> ---
>   stubs/semihost-all.c | 17 +++++++++++++++++
>   stubs/semihost.c     |  5 -----
>   stubs/meson.build    |  1 +
>   3 files changed, 18 insertions(+), 5 deletions(-)
>   create mode 100644 stubs/semihost-all.c

We could name the file after the function that it implements, rather than "all".  But 
either way,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

