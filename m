Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1301623B69
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 06:42:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot0Jx-0000c0-Sd; Thu, 10 Nov 2022 00:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Jv-0000Xg-Fy
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:41:47 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ot0Jt-0003dS-Jt
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 00:41:47 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so4848408pjh.1
 for <qemu-devel@nongnu.org>; Wed, 09 Nov 2022 21:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rQXhA4Oyy0yFYYRexi166bjice8R7QX7i1WuCZtn2+Q=;
 b=yx0rOMhCFoSAd4qE/sf66RIoVvekeK1Drwy6DBQz5gLdAcspcsRxO89RbZerSt9qRD
 uPJbOaNNyLKWn3qOAGVuvRStl9f2dXm3gtrAJhMRp/KFA25GAKgtA1RmN0pCf1Z7ZbnW
 jVFXrywVRH28pujtVtLfjJOe5yM9OEz4G7BR7iyXx3/kQYZwjz7ijO7YzBcP6IIyP4oz
 aIPd5w2DOvPK0FU5G2mYQ9gXDGcpDvN9V4X9M1LxXUOzmYr2JNK3rWJaD6oXv4tLDubH
 bC1AKTREaLl7TRLVCGbnkmKjU93qeoPpRXrc20IKQwttUU5hY3bNIZ/TgKEED0CclO48
 XGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rQXhA4Oyy0yFYYRexi166bjice8R7QX7i1WuCZtn2+Q=;
 b=Mt/otx/hwd9tOwHnrVSMuH3GJZ88O237vHxfVRHf3/kr1JZwO93tFRVOTfhd3CHpzL
 /eaV4S86dI4HSAvJy7lO2VTvsr5SsLRUThmRlKwLRorwHa/4MyCe5lW0txk6xtKtGHsR
 234+CjcMHE4jem95Br37gAvtYpX1YCn5BUBSoRgtHHk7T+SEzqjyN0GTcKq7H6Yj5s9N
 BnZz56gA2TPnJ8hxzFO5yciVeCTOGNe/iWRA7k4awW/k5UH5z1kgaAxz38DEheFAiOYM
 9GMqOE0iDI6bUHtokkyYwngt0NAxakyghKdPfCK2XdY62OYgAXD3yl9SgwmP3UrQo5rA
 5ytA==
X-Gm-Message-State: ACrzQf0iYHKYhxH96W5dYr/SqtyNWsdbZbWunUhm8PxBY6jm+8B6VmK0
 7wBZFuOq7iIiuTYVENxCiIAIOw==
X-Google-Smtp-Source: AMsMyM5lruCVLETPsBEGoxSBmvqHaBkDphwLxdprY5cgjz22eDRa5InB23xWhrSRUoRDb9+bvyRZvw==
X-Received: by 2002:a17:90a:b383:b0:216:df8f:3c3 with SMTP id
 e3-20020a17090ab38300b00216df8f03c3mr33241274pjr.8.1668058904258; 
 Wed, 09 Nov 2022 21:41:44 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca?
 (2001-44b8-2176-c800-cc47-10aa-3fa4-e6ca.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:cc47:10aa:3fa4:e6ca])
 by smtp.gmail.com with ESMTPSA id
 a7-20020aa78e87000000b0056b9c2699cesm9235405pfr.46.2022.11.09.21.41.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 21:41:43 -0800 (PST)
Message-ID: <4eeae5b0-dd1b-c724-ae8d-950cc047389c@linaro.org>
Date: Thu, 10 Nov 2022 16:41:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221109161444.3397405-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/10/22 03:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
> reset method doesn't do anything that's invalid in the hold phase, so
> the conversion only requires changing it to a hold phase method, and
> using the 3-phase versions of the "save the parent reset method and
> chain to it" code.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/smmuv3.h |  2 +-
>   hw/arm/smmuv3.c         | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

