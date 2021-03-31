Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B562835043B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 18:13:47 +0200 (CEST)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRdTW-0000UL-Ny
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 12:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRdO2-0004Mt-4R
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:06 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRdNy-0005c9-NW
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 12:08:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 ot17-20020a17090b3b51b0290109c9ac3c34so1416050pjb.4
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XMSZkEk0OoaY+VPkeJwsIkntCr7MDUwFdmbpdWCKjG8=;
 b=zhDP8f0Uo3fMmVXoj/qOI/ExmjQYbsLlANuSV/5jxJtspCh9yTRkH34Egc4Dd2qkiO
 6N/bwHWC5GNWhVTprfKKpjzIAWa81VtcEKrwYrlg6LRtRrVgQV/6b8y2hkorFBEBSIUK
 2RZGyIumpsIaucfI32WpD39xlQ/aG3a4UG7c8KNXY7k9Yy7wwvUDaszub/F5Bdls84p3
 PrZe5QIejkO/G0XQzaLxw22kUlGUTibfQJNSqJODbOV0BMNUkQIZap7MIH+OmajQmURq
 MbV2zZHyI3lkBbWfqSCA7Lm08AlnBlVhB1A7TWmsWlOrNK2WNnWRjYevDyQKJtoBF72s
 xEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XMSZkEk0OoaY+VPkeJwsIkntCr7MDUwFdmbpdWCKjG8=;
 b=d70dWfSekWaaqJumsWWxFBmaontHKxgQRmCCxrQA16iiogUPd7rnErOXuMrWpCWElc
 YOy4IEjY0USL2JytRkBNIYNofec0JoXA/mCVCTOe4yqfCd3606HkvgXW+ue5PfnHGGBK
 JescYeZCjwT4P7UVf6e7zznDbrB03JY7+mHmDp242gF+nasJLMlzcMTfB63Q5fba5A2R
 +ne8FcqJMGpU4IypexvRmursc/YU4ch8r58TOC7GnubaWX8UvQmOBW+k/1QCq4OW6PMd
 NdAfp611SNFIkrr56zOj5jbcln7g1IxEoD5hOMhUAHQuV6adqljwzSXAEFywChHbAERf
 Q4eg==
X-Gm-Message-State: AOAM530paOyUOhWNNsyDZoJTkQsvONGHuDuWOO+OcJPq9qC25JNyCnZO
 Gt/Pwoee9VtgQ0muWoDXKwIkaw==
X-Google-Smtp-Source: ABdhPJyFpt9fqdCz495GIskAyiyEIKvyWDBpxBAq0hAE8jj7baoSNRcJXXvaGz5DC2plgCU56Fxt1Q==
X-Received: by 2002:a17:90a:c909:: with SMTP id
 v9mr4262342pjt.218.1617206881123; 
 Wed, 31 Mar 2021 09:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id k21sm2837719pfi.28.2021.03.31.09.08.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 09:08:00 -0700 (PDT)
Subject: Re: [PATCH 1/8] hw/riscv: sifive_u: Switch to use
 qemu_fdt_setprop_string_array() helper
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210329170818.23139-1-bmeng.cn@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2fee25ee-e944-90b2-ef95-3a6545aac699@linaro.org>
Date: Wed, 31 Mar 2021 09:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329170818.23139-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 10:08 AM, Bin Meng wrote:
> -    char ethclk_names[] = "pclk\0hclk";
> +    const char *ethclk_names[2] = { "pclk", "hclk" };

static const char * const ethclk_names[2]


r~

