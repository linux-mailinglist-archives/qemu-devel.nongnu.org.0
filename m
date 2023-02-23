Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 281856A13D4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 00:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVL5K-0005YN-T1; Thu, 23 Feb 2023 18:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL5G-0005X4-Pf
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:33:07 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVL5F-0005pT-8t
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 18:33:06 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so929951pja.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 15:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jhmy/q+NCbwqWJVh+mczv3ut7HLQRb4b25fEZ5jA0V0=;
 b=f2r598WKAx4H53bdh1cWmoQvZSgZuIYJ0PLKS3oJRDrAmRG68eG0RsHszpNRW/Ws1A
 EAsdC0KqQ9izxiSgP9UWwz+a8MqUXGn/PrARx0VSrqfh4u3a0cCHIU1cJgcAJCW1T/n3
 lrCIWjOVZrcq6vSTMz4VTzy6+HsW1c6MqGXXZnwT76SITv1r2bdJO6roqxuoJcYqJJ7P
 z0xyozO9nkKJX+TntBJeDPojQCk2O3v8n70VMuxBfSJsQHgGrTWNcCau82H9obPlqpaJ
 ktLHqv5A6IwWO9kvmBW0Ya0yIelpOLxvVmowqxCylUnMuVzm8e3ZYL+wDJrPog6LUcSs
 LomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jhmy/q+NCbwqWJVh+mczv3ut7HLQRb4b25fEZ5jA0V0=;
 b=NABjd5kpEROzPOaa5ij1hPVMg4l9LojN4prtJtgQ81dlWP9ol8cNDmS5fpjCGvZxlC
 jdMv3X4uL9G0vpKq2ttz5UW8cO37tnOkjXjhdNa6yRIYWx06RuegfWVoBZ5VH1W3SrrM
 pEwnCJq+EKW5hpN6IEb/yaLFCEYZVO+cJZNlV2VrU3kGjyEtWnDQ4qjwnQ+MTfl2iI5W
 +c1hvZFLWW34pXLQCNua9mjdSH7mpQb4STGNoyFgG2GUQ8DwD18tS3KAelOolPIfSHKA
 AyfTCeE4+XjtGZgzclb17gdzvkZGfHidfjoJ452c6pXvAi8MNXxFJqpmoD8hs3J08c/B
 3sGw==
X-Gm-Message-State: AO0yUKWE1Q7w3tIaNo/v/8RRpb03A/TtQygBJL/5Z1u+GUEo3MEf1yiB
 Eeq7I9jz+BXLUKuHmmTTGujuug==
X-Google-Smtp-Source: AK7set+WzBagLuvpDwqjNL/xhjg6O0huO8gtQOJPTf/qUQ8elBGiLLrGJ2UmSR5zAcsTqBTY4pS7QQ==
X-Received: by 2002:a17:90b:3b87:b0:233:fdfd:7122 with SMTP id
 pc7-20020a17090b3b8700b00233fdfd7122mr13639788pjb.37.1677195183631; 
 Thu, 23 Feb 2023 15:33:03 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a3e4200b00230befd3b2csm250907pjm.6.2023.02.23.15.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 15:33:03 -0800 (PST)
Message-ID: <a9fd3a94-aff3-1f8f-40f4-5cf39fac9d23@linaro.org>
Date: Thu, 23 Feb 2023 13:32:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 3/7] dump: Correct headers included
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223231755.81633-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 2/23/23 13:17, Philippe Mathieu-Daudé wrote:
> "qemu/win_dump_defs.h" is only required by win_dump.c,
> but win_dump.h requires "sysemu/dump.h" which declares
> the DumpState type.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   dump/win_dump.c | 1 +
>   dump/win_dump.h | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

