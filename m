Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8763A68C645
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 19:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6gM-0006YQ-FL; Mon, 06 Feb 2023 13:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6gC-0006OR-Nz
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:57:32 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6gB-0006Kj-8d
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:57:28 -0500
Received: by mail-pg1-x536.google.com with SMTP id v3so8860461pgh.4
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fkid5CyfGq/kNr+S1VVUqa/YmCt0u0b2MJ9buGyJAUM=;
 b=yrYXAe5hXpqT9QMcuLoi/ahVgyAKDdXFkhfqEpIukxzzXrY/itP7Zs7Gw505SJLzJs
 Lx2Rj0k9VXIxJj5q7LkzgTC4/NOVSgJue4es7FF7jqMkKK1hc2Sbi0sRg15cQ0V9EE+P
 HMAudyE6uvw1NqxEg03QgxsRD+tX2fDItVF1S0QiUiF4IcCE+nTPVeJLEfHCDgjVq2sb
 YnmSbhtKfEJG2tuHmq/JTKjnmXrQFO+K2XDfkciT+sKl9SThakkEWfjSucNxe+iQfHjo
 5s181satupTBbVKED2+dWpmwg0irKu4TVvERaE4A8o12HdNbponr4dRJam6tvL0+HEmO
 yuVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fkid5CyfGq/kNr+S1VVUqa/YmCt0u0b2MJ9buGyJAUM=;
 b=JRkwo3vpxya2g2CpeynfnrGWU2WN3sBV9wHwFoT617hGP91ZCne7Q5WkmqM4EGup5k
 PYc48w6sCioaMAeqEZmH9AujcOJerq8kpaBNcYm8mvKq24tFApLmhikPzrerCq6wPlPS
 mBa9+qupxLdh+0/Ps8tQwevZY6d5CMSW2/gaBOm9hZVkFxTQ7JEoNaLYTYyjETsfLTt6
 ML0IoWNsIETxraVNIFtSAX2GFkWDomj1uZkTuMuYtVwubuemXvudiM64SB/HHD/bNTRh
 UXHNQ6Di6VTya+r8RKb1nVGGzWEYvNk0ScgttSs5E6r3wrlFdXN0dmcNaMi5vgcHHG6p
 YpUA==
X-Gm-Message-State: AO0yUKWPuAr6/cVBAGBaZtntTysEmSMABfcTLFwT903p/NPn6czg81iA
 n1+5uGHU6p3yI7aSu23fXxcaTQ==
X-Google-Smtp-Source: AK7set+jIaB5f9irTrn7WTG4h9Zvd9H+XYMN5LRwWaXqYUSBTbA4wX8qhutbK7KDp21Ph152ueM/UQ==
X-Received: by 2002:a62:648c:0:b0:593:b309:aa55 with SMTP id
 y134-20020a62648c000000b00593b309aa55mr371741pfb.28.1675709845632; 
 Mon, 06 Feb 2023 10:57:25 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 g4-20020aa78744000000b00582579cb0e0sm7435787pfo.129.2023.02.06.10.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:57:25 -0800 (PST)
Message-ID: <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
Date: Mon, 6 Feb 2023 08:57:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> There is no point in using a void pointer to access the NVIC.
> Use the real type to avoid casting it while debugging.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

This is doing several things at once.  The nvic interface change needn't be done 
simultaneously.


r~

