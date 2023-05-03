Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5A6F55D1
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:18:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9YJ-0005P3-Oc; Wed, 03 May 2023 06:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9YF-0005AN-IC
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:17:35 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9YA-0006OZ-O8
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:17:32 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1728c2a57so49689795e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683109049; x=1685701049;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mFhEf2Xct3blsIBirhA7/zQHX8V2+si+2t2//Fhhox0=;
 b=G9pMq9GEJUvKQKp6F40FSwbeRKq2LPBt9A0cONyVgM13Zo5cG1fe4QjjUlx0gkLRkH
 iEmZ/Abuyut9xjI76cGzR09aCVr5KQvZEzUg50EZbhlGPrCKazw1OznNstlZk92y5Ckv
 XgAoZDUNKSzXGRcFnTqmuM2BBmN4An9CIqCmWOOfcOpR/rC6AN7rSw/NrQvP4sFtWwJR
 noWmVnC1Y66YjJhz3lhojcjc2NS4WNSyf2s8j1LT7TRMfcMpjaWD3bdI77qkaIyH9Rp/
 +M01sLvKlqch1s8CiTA3pU3FXPjhoLecvww1uwOMQgQNqmBaUCmDciG4YKozttQSNpSY
 9GMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109049; x=1685701049;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mFhEf2Xct3blsIBirhA7/zQHX8V2+si+2t2//Fhhox0=;
 b=eD6NIV/372ugF+FWvi4F0ffmByW3BgvOncGfkTFeKkWUKSkxg1UWyoSglLIFnrR43o
 KQzKbPtP6Vs6NeJeVOB5VQ3PeoafcsbpI5YPDJBRjfhkWC2EMNWIAETiJbs4aCsomQWm
 LjnDetihTmjS5anBWNUD8UA8jITn6KovLCi5tqh+AT8EvaHWJIQWIZ41vw+L6hlD6eNF
 Dftv/9O/Erf/avAdzSWvK+x8qmbYVwlfIpS7bVHe28O3atuG3a51isXordNvfrwkGu9B
 lsskgDvTUgI702x+0fDq5G4Ht4pLIKsnvxeWST5ipTZa8xMC/7uFQwYnaWgP+qCt1AtL
 zDbQ==
X-Gm-Message-State: AC+VfDw6PXEYcLZqIRIkcLsVAIlSAoLZUX5qI+X1lwMiQmkzw32H/vfp
 d3qEOvZPNDmQwwrZcQAAoC7iIJwX7vN+j2zFCpqhWg==
X-Google-Smtp-Source: ACHHUZ5jo6HIzdwuN1+ISe+6RlG5dFXpLfmnn52Af1XYqGIVSKqprwIiPSyN2P3APAvVY3li578rVw==
X-Received: by 2002:a1c:7317:0:b0:3f0:46ca:f201 with SMTP id
 d23-20020a1c7317000000b003f046caf201mr14269848wmb.1.1683109049043; 
 Wed, 03 May 2023 03:17:29 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 u24-20020a7bc058000000b003f173987ec2sm1424018wmc.22.2023.05.03.03.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:17:28 -0700 (PDT)
Message-ID: <5cc40719-dcbb-248b-87d5-c249da7d40e9@linaro.org>
Date: Wed, 3 May 2023 11:17:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091244.1450613-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:12, Alex Bennée wrote:
> From: Fabiano Rosas<farosas@suse.de>
> 
> The 'virt' machine uses virtio-net-pci as a fallback when no other
> network driver has been selected via command line. Select VIRTIO_NET
> and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
> (due to e.g. --without-default-devices):
> 
> $ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
> qemu-system-aarch64: Unsupported NIC model: virtio-net-pci
> 
> Reviewed-by: Thomas Huth<thuth@redhat.com>
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20230208192654.8854-6-farosas@suse.de>
> ---
>   hw/arm/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

