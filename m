Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99A8457D31
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:48:46 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNvJ-00065B-Hn
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:48:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNu8-0005Ee-9A
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:47:32 -0500
Received: from [2a00:1450:4864:20::32a] (port=53995
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNu6-0003y4-EM
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:47:31 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y196so10706975wmc.3
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 02:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4U9E3u4KmoxuyYBgj5xO2SaLRSr1rINkCHosqF6REOo=;
 b=dyAh3VkdYFG8oB1B00qA+xYSKOJDyojlIjhIezEVk1UCLuI6LduQj1A5bEASWV1Mqz
 1xio5Rzwyk+iUOijlMU3nf5sLJufFAs4iCMrbWw4abapVQH7GkRGrqw9Y4FQoeabepYf
 ptpvN1pJ88Bv58qP4O1VpzWZB2tL61cBymtL6OsLmDSjGJe0moSSNkfEW17NJRDteam4
 5Rt5xRe1SC/cmCd/LSq693++QWdkPkYhkX1pGvkrmLPdkMjM/QhXux8ZG6TIETH8Im4P
 tUOLzlvq85OIGGkGOsS1P++UPa9mrFLZZp7K60il6MmoaWAlTAdGOjzk651H5WCs3rWj
 A0aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4U9E3u4KmoxuyYBgj5xO2SaLRSr1rINkCHosqF6REOo=;
 b=cB+ARaFMXFh5w1ru4hjbTZuKq+d5kvzigSS9k1IQ0EV1B5PHRZdpTBxlvVWSehOcdu
 GTu95/gk2/zwWvms19OwlNxk7+icU9+SD6xI1M//q8da+EmDYHxZCrKMVIsbxxrHJsOV
 lxD0qFSZtzZyRR4gm4HedHTrF8TllRGjG+lfaBWI9lIMn2carUPfahFYPeBZjK8vi8/3
 h9vDG+AWoDyFyk4bFBSBaFfFUqDyhlXngpkUIF+9dw+j8h+pr/2QmZqKoNUgcb2OMMui
 S+GxKbc4iFZsvhLfaC+Z3yCES7GUK2ZF6Y9mL627rDgbS33PyUm6xos7y2nbAZtxSvQx
 dIXA==
X-Gm-Message-State: AOAM530p9C/8mbRa1pXkOePOplC1Fgq7KGQhDDXAPillDpwvxf/RcndM
 1z2NWXPNBSrTgf7CMHKvJ+X5yA==
X-Google-Smtp-Source: ABdhPJyxruPLqBxy6fFIluy24TeDVlzPU2i0z4ptPYoShfTzL7MvG9qUKon0acyWH22nx5QqMZPVhg==
X-Received: by 2002:a7b:ce83:: with SMTP id q3mr9106023wmj.37.1637405248861;
 Sat, 20 Nov 2021 02:47:28 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id t127sm15728294wma.9.2021.11.20.02.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 02:47:28 -0800 (PST)
Subject: Re: [PATCH v11 21/26] linux-user: Add LoongArch syscall support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-22-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <709e198c-9dd2-5ee5-4d3a-5cf163e02404@linaro.org>
Date: Sat, 20 Nov 2021 11:47:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-22-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.625,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/21 7:13 AM, Song Gao wrote:
> +static inline abi_ulong target_shmlba(CPULoongArchState *env)
> +{
> +    return 0x40000;
> +}

include/asm/shmparam.h:#define  SHMLBA  SZ_64K

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

