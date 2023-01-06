Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49927660689
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 19:44:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDrga-00039A-0j; Fri, 06 Jan 2023 13:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrgX-00038n-EP
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:43:21 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDrgV-0002Dx-MV
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 13:43:21 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso6000790pjp.4
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 10:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q69JNUO2Umxk4Wznuro4ovWAeGmdTY+3/L+4ZaI0oFY=;
 b=AMey/jQgSPJorbqzG9slgCsWkaZUc5SJJiJoCCRKUCBwkFiCLTOEsFtglC7sslmxJh
 xg5WoYr2LU7/bZ+uW/rZKcnFzcjUHAeOYG2R2luUlWpeLLA3Jbh3uFyBoDnJaSSgCPKZ
 Fgzz6VnmqLcyDpFz3axr0np4IAjwwrDjF819ZUYo76TCwka1L0aKvSLjymNLDVolzIlC
 F1b131FPhb1ywCB8InddhPn6fh7BnT8NycK+1Mslvb95qrG+uRUJUG7cRauE26hk5Cfr
 v6T2OIyU8P1IWpc/7Rqka6S89avLb6KFTnregvImEDeUQ+Ts/KwWc41r+I8nqVCU8Szu
 hqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q69JNUO2Umxk4Wznuro4ovWAeGmdTY+3/L+4ZaI0oFY=;
 b=3s5frdinAJLwQQeMYY01s3SrhwE0ed4njA3kjqSPLiFCTjS448EMi0vJenneN7Xwf8
 vDyWkgY221yuqNkzFkMmTwVIQqtAcjBPV0pWm0N/WNGR7/FafoxoR9La0J8TRMC+WxMK
 hxwMS683Bc9iQFv+MZs+eVdKA9jNtnWj3U4iZiMeRIRMtL9e3JnYXQZDhXyLc0lBy0k8
 2gQRGrwl5Rumdm3v7vLw+Br5euUmLdM+Viw7NjUxqLQzbwSrrFtuSZfnpYEf9uFQRI2c
 BlD26/r1dSBQHY3EtFL5YOVm73t54bhVYuQrSCFFVJlKmngst9S4B2pnmxGC8Nmip32i
 0ybw==
X-Gm-Message-State: AFqh2krtMUkFzqEqKuLLbXAmJ3f5s8fdGUuaDLNfZ/6nsCFvWv5rBTp5
 iRTPI3oi0UPKOu4xiu4UtX3ddg==
X-Google-Smtp-Source: AMrXdXtWUebS2Rfv6lw95cmAyyzsiE5BBHmYP3iN50uqHrqoGgU+5FdEcbCmKZ51xXrlETyAS6k4uw==
X-Received: by 2002:a05:6a20:4d94:b0:af:ac38:911a with SMTP id
 gj20-20020a056a204d9400b000afac38911amr61842306pzb.59.1673030597965; 
 Fri, 06 Jan 2023 10:43:17 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:9d81:5b04:51d7:acae?
 ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a63d803000000b00477bfac06b7sm1216935pgh.34.2023.01.06.10.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 10:43:17 -0800 (PST)
Message-ID: <97efbf2c-c6a0-f556-807f-8a683d09fc9d@linaro.org>
Date: Fri, 6 Jan 2023 10:43:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/8] hw/pci-host/bonito: Convert to 3-phase reset
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow
 <shentey@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20230105130710.49264-1-philmd@linaro.org>
 <20230105130710.49264-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230105130710.49264-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 1/5/23 05:07, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<philmd@redhat.com>
> 
> Convert the TYPE_PCI_BONITO class to use 3-phase reset.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/pci-host/bonito.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

