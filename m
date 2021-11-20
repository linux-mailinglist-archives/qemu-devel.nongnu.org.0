Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12D3457D1F
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Nov 2021 11:36:30 +0100 (CET)
Received: from localhost ([::1]:36020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moNjR-0003ap-NU
	for lists+qemu-devel@lfdr.de; Sat, 20 Nov 2021 05:36:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNie-0002tQ-7S
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:35:40 -0500
Received: from [2a00:1450:4864:20::431] (port=42835
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1moNiV-0003vJ-3s
 for qemu-devel@nongnu.org; Sat, 20 Nov 2021 05:35:39 -0500
Received: by mail-wr1-x431.google.com with SMTP id c4so22628336wrd.9
 for <qemu-devel@nongnu.org>; Sat, 20 Nov 2021 02:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AsuE6m0xNX+/2gT6lFTQdTA2tqCoxM96BAqw4qxUjzY=;
 b=lkQlR5hBNCAWpicDOOqsk4oYyghFo/t5fm3OEbfhM0KWlPssGlb8BL7ZsP9Rz98+ey
 fpLj1+BXMBVlz5TQycigUw7ug9PX54PriEyqlPJtWCQksC/XYaEl9xZ58XhZrWUkPJg0
 g8nR/V6AT/e/Ut2W0MEa4HzpJ1+R2udCriutr8xSEF96sRhDE43yto/l33iUYDO+oUZu
 3vHBK2+y5jmvP8y3Mh0Ztzpv8egVG8FX1G8vVzqhQkDhNqm09NUX/jhtDpOkpeImY3vI
 wOGMIuZo7hMaKYsl01Hkmgvjvhp5/0BJ2YkWaWdf906kPIhNegIcKT97+Pc6KNPKqdVq
 p/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AsuE6m0xNX+/2gT6lFTQdTA2tqCoxM96BAqw4qxUjzY=;
 b=XwWXKMTjPg+4DAkzEAZYICLj/8rQ1jP2v85RFYbxDEnJbXuYVXTNknI/OTpDIfZKg9
 sk0N6wHvl8lIsPrzCRQYOinJx1ygf61HogMZVh9DtB5F+/qB8synMwc1EivczPymRbOM
 BB3AfK781Oi99gkVqifXSejIPP9A1OB7xxhU0vPUbohEDS/qUy1bKxf37HXIySXNt7Wh
 wxm80LOfr6Panh3ZPFPhCDvOXUK0DQsliFO+/b0AJvnQ8yHpGZ64NT/XINmF6ICvtTiN
 lHmcQA2McfkR110cBOFqB7eO/45yTb5xJqXZA5nweeL8+z/HhySaIHUtEfpEaoMueDPu
 83sw==
X-Gm-Message-State: AOAM532mTIRS3agBh0umqfu5Vnpleatyc0CPhJSPnTXJ3c+bLu4cR4ev
 ODogra/+1Cc7SKt+oBCA9WmdkL2Yv1WvQzy+Sdg=
X-Google-Smtp-Source: ABdhPJz+zPOshUh4vP/q+44zphHNLOYzf1REb7neDsvSIKfdaWIoyrs+W2LLKg1CweSYHAcI0ef+ZA==
X-Received: by 2002:adf:f708:: with SMTP id r8mr16501743wrp.198.1637404523466; 
 Sat, 20 Nov 2021 02:35:23 -0800 (PST)
Received: from [192.168.8.104] (9.red-95-126-194.staticip.rima-tde.net.
 [95.126.194.9])
 by smtp.gmail.com with ESMTPSA id b14sm2787347wrd.24.2021.11.20.02.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Nov 2021 02:35:23 -0800 (PST)
Subject: Re: [PATCH v11 20/26] linux-user: Add LoongArch elf support
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
 <1637302410-24632-21-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ca066c1a-ff60-a728-01e9-d4ba9da87e80@linaro.org>
Date: Sat, 20 Nov 2021 11:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637302410-24632-21-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x431.google.com
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
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   include/elf.h                       |  2 ++
>   linux-user/elfload.c                | 58 +++++++++++++++++++++++++++++++++++++
>   linux-user/loongarch64/target_elf.h | 12 ++++++++
>   3 files changed, 72 insertions(+)
>   create mode 100644 linux-user/loongarch64/target_elf.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

