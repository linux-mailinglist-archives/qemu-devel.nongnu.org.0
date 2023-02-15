Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3E69842A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSN9m-00068a-UN; Wed, 15 Feb 2023 14:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN9g-0005rt-LE
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:09:25 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSN9f-0004J5-5t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:09:24 -0500
Received: by mail-pf1-x433.google.com with SMTP id g9so13412148pfo.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TPeVawXwApykQkPdm3n5Wa+8Zfy9ob1UYnst6fO0biQ=;
 b=XSS/vXAqgrHCQHRMzi0WjS9kwDszE7xU2qhPcwd2ldwaN2nphNJtY2GczErCecim35
 cwOLP14A4du5vWgB3BSvRwiGvv6llvgYfV8CvIjYJK9VUchD/Mu7ZtgsX6rkzAwgkMkn
 UTrPnsntYrcUmbnM97ECgUcgtfvrGjrM2Y6TbDoF/pwvUujj+VpN2wCCqO6N6EoOyPmu
 b2+0Z+7JleC+5qLLqYhZQdQhkTRzUtD5UzWtIGl12Apk9weKddGDvfyXJbi4nZ6JxsYF
 +Ff4Qf3ffxjmUn/QbCMFV+uATmWPbTzAVTZupRVPh2kTOOw+Anaazp/JnY2bqn2pR5o8
 Seqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPeVawXwApykQkPdm3n5Wa+8Zfy9ob1UYnst6fO0biQ=;
 b=7LoO3EVWaVGVT2WN+wxyqTJnaq7LxqC+2vssyX2pVZcRKRQWiIKPRqTTPlVQqnwkc1
 fR2Aw13957USSgaj7q1B/pj2bbj7Np+dwN5fqntUWO+G+WdICZ7abv3vC5gVkM5sg+0S
 JvyTOGLoEroQ67+Bng2QO3cj0hiUVzN2xE3wKVcYXMaeFmkYisrjcJYECZlE4X0thIS5
 yln60Fff9BtHeMsd6kM/9lobOIYWR5F3WWrX6Lj7Wty9jLF7/YLDec4WCcrwavdW1p6w
 bOFhrYvNlqT8cm9jMsqFFcRWk/Lt+HI1+wd9yCpyzCd8ujL94WkkHLvZ0jgyXrf+XYW2
 1nYg==
X-Gm-Message-State: AO0yUKVVIgjFOH3X6rFt6L5an/D12oZxXc4Z9di5ghTCqV5rH6g7Mums
 mICdxJodaX7DtASJ5VhgFtqyEA==
X-Google-Smtp-Source: AK7set+eMMtK9Wmu0ZziexBSp4VFv80UPU4NtycRMd0EvAcDF7a9ATlHwej1FnRAG+AWtqz1z32Lyg==
X-Received: by 2002:aa7:9ad9:0:b0:5a8:b07b:82dc with SMTP id
 x25-20020aa79ad9000000b005a8b07b82dcmr2563828pfp.0.1676488162372; 
 Wed, 15 Feb 2023 11:09:22 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 a2-20020aa78642000000b005a8e97fc71bsm2662376pfo.84.2023.02.15.11.09.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 11:09:21 -0800 (PST)
Message-ID: <b7f36a82-2593-0f20-0de8-a8bc2a192df9@linaro.org>
Date: Wed, 15 Feb 2023 09:09:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 06/20] hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>
References: <20230215112712.23110-1-philmd@linaro.org>
 <20230215112712.23110-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230215112712.23110-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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

On 2/15/23 01:26, Philippe Mathieu-Daudé wrote:
> Only atapi.c requires the SCSI constants. No need to include
> it in all files including "hw/ide/internal.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/ide/atapi.c            | 1 +
>   include/hw/ide/internal.h | 1 -
>   2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

