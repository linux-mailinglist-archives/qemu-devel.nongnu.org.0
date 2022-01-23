Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A1F4975B9
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 22:33:13 +0100 (CET)
Received: from localhost ([::1]:47872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBkU4-0001No-57
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 16:33:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkRg-0000U3-TI
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:30:44 -0500
Received: from [2607:f8b0:4864:20::529] (port=42823
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBkRX-0007PV-VH
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 16:30:43 -0500
Received: by mail-pg1-x529.google.com with SMTP id g2so13394521pgo.9
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 13:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iq4ZblXMLyMnOkOBNyu1MuShYV45asz2beHwIqePJCM=;
 b=rsFPL2y1IV4YQBqFiaRG4pZYDmLDsf59lN6QyMD0JYdL8R922MadVqCxxeQbHfZCiK
 bYPm5Ei098pghI/AK08aMrrA+gl4lAE4he5GAtSD2+cfViv3b5kQ7pEj6ZMHaNeyQd8X
 nJcl+6HyBGLfZgf/H3dno8idac/9t8yF6nJNWLHn6wQpCn/EsHV2ROEk7S/p3xtK3DKH
 Xx5ECb+W1V5FclkXyh0182Vp8nd1LcpljvmocucRBed1RYL7o0ZappNJzXR+KWHuYRcK
 Ec8g+YRB730lVDAqpE4cqfDNXOc6bQ/HuBzZ+r3ojBB7XXiIZ+wzXGEDhLAL4s0fRScy
 dh+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iq4ZblXMLyMnOkOBNyu1MuShYV45asz2beHwIqePJCM=;
 b=fPLOgZK3DnfJ48phom9jQ1hUED9zjft2tf+TK3j04VOJXmQTnJna4YyBjG2IPQplsz
 V8pZyFjs9uCakZCyHqtS+2GBjfgdkJ5GvUC5lUkMkgjX8y6U7QVrcnYA6rhJ/1fC73ol
 sdR8orD7hl6LD7xT8769Ea1VnjM5yM9280cKK7aDnIDKTM04X6/J99de6p+UgcR5/zJz
 aSfrpdx5YryIgbmFLvnlgtOczoaHrRVsPFWYtkjGQ1aPKM4eg9J+2TssEV4hV/ixal+G
 wjsv6uvuFdh8IE2hd/aiVA3aJUEtRDndAXX8FffZHZS9PZIlEM6zeBX9xZNjFxvi8biW
 s0cQ==
X-Gm-Message-State: AOAM530jdk+JDaJs2vs/qhlee1dv3kr/RsLb/YTDGj1B3O8L29xUw3Du
 FXrJMqxizx9JYRSJBSsA2xq29Q==
X-Google-Smtp-Source: ABdhPJxj2Uy/eNUGaamp0+niIFjzrqCoeVWILmi0xy9UWjhNOOsvY7tZpUBIZ5vZDZsmQPk4Zw6tkQ==
X-Received: by 2002:aa7:9151:0:b0:4c7:f577:d37b with SMTP id
 17-20020aa79151000000b004c7f577d37bmr6383986pfi.1.1642973424440; 
 Sun, 23 Jan 2022 13:30:24 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id c5sm8463239pfc.12.2022.01.23.13.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 13:30:23 -0800 (PST)
Subject: Re: [PATCH 01/30] bsd-user/arm/target_arch_cpu.h: Move EXCP_ATOMIC to
 match linux-user
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc5a8f4a-d042-5032-4e17-5639086bcc7d@linaro.org>
Date: Mon, 24 Jan 2022 08:30:19 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220109161923.85683-2-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 3:18 AM, Warner Losh wrote:
> Move the EXCP_ATOMIC case to match linux-user/arm/cpu_loop.c:cpu_loop
> ordering.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/arm/target_arch_cpu.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

