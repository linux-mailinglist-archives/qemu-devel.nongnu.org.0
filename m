Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840E64F65D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 01:34:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6L8p-0003Bd-Sb; Fri, 16 Dec 2022 19:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L8b-00035W-3u
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:33:22 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p6L8Z-0004GU-JJ
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 19:33:12 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f3so2857107pgc.2
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 16:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qf7kOZgfwRW4UmznFafI56mw+GRXVLN/jJZVYsxBY/8=;
 b=Pa97t0wrPJVdLGozFrUuJRrlbmFjWUkEiIGIpacSX0ygV/2NQav8JpbawCmPQcwQcp
 w8SN6HL0m+/7XBclrL8Cwuz1A1tdtq4F70gm9WWjkdtiSkf07uaoRQMDgnovkTdkkMeE
 K9LxiMG4a/5ucLiqLHBlelRhUuPt7FwuapBmPxF4HApxumoTlP+/5+2ehET35jQ4nucX
 0UidCgY3AVkljrzIZDxyH5EP67/3KXDx/5h/4lq46kHn0xt5dGBf/+R5/nMRhAYK8sci
 HrJB029ufqmAAFJF2OkOY0SGDR+i0x2TWqSg66uS7Xiskiei8fEJFbABvrIgwfOFWlTf
 HobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qf7kOZgfwRW4UmznFafI56mw+GRXVLN/jJZVYsxBY/8=;
 b=sUplTBwUK3+YXFnCvBImwZfkVCFl9QYkANDcQYNgTnStZFMDJQ/F4KsTlujezUze25
 3DHusCJpouBy/JvKsXUPUmMqkEeWKDxAWjg30QSEr9O/FLluydGMZhVmvqS/3I/6W6Py
 O8BvPh+5JrSlAQCbdM56pSITJ/bRJpcOJYzDeGb67uklrydaP60VRkOs4juIQvlnODlN
 6/H6XVjnDo+e2gpbt5K9X+Fu5gZAj9qKR8zBbVqDbqnVXrFTAm5ENru5Krbg87snipC0
 47Fob/4xpKhjaMHWyoCA6sgNQDeYZ06WmzOJCm78y3hiff4uLPaMQ798IVfMgB1Nn1Qu
 RLaQ==
X-Gm-Message-State: AFqh2krPBXlgbq0nCma5HmBoLJrGkeI2XkXe82hL+wE1j3Xx2L/P9P1a
 9IUoq6iVupQQWmWrPX3N38cATw==
X-Google-Smtp-Source: AMrXdXsVTipJoOABuzEk7qcybLdZHtvWh6MQhOsFI64hAatb6/Gt3rxpXI5x7NGH/kvjpzJ1LYHD+A==
X-Received: by 2002:a62:1707:0:b0:57d:8b30:db07 with SMTP id
 7-20020a621707000000b0057d8b30db07mr10301042pfx.21.1671237189725; 
 Fri, 16 Dec 2022 16:33:09 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:c606:9489:98df:6a3b?
 ([2602:47:d48c:8101:c606:9489:98df:6a3b])
 by smtp.gmail.com with ESMTPSA id
 c129-20020a624e87000000b0056cea9530b6sm2013687pfb.202.2022.12.16.16.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Dec 2022 16:33:09 -0800 (PST)
Message-ID: <58c1f981-2f91-87e2-d9e3-904e2d9831db@linaro.org>
Date: Fri, 16 Dec 2022 16:33:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/10] target/hexagon: Declare hexagon_regnames[] in
 "cpu.h"
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Greg Kurz <groug@kaod.org>, qemu-riscv@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>
References: <20221216220539.7065-1-philmd@linaro.org>
 <20221216220539.7065-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221216220539.7065-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 12/16/22 14:05, Philippe Mathieu-Daudé wrote:
> The hexagon_regnames array has TOTAL_PER_THREAD_REGS elements.
> TOTAL_PER_THREAD_REGS is defined in "cpu.h". Instead of pulling
> "cpu.h" in "internal.h", move the hexagon_regnames[] declaration
> to "cpu.h".

I don't think this is correct.
I would have expected cpu.h to already be included by all users of internal.h, thus any 
formal re-inclusion of cpu.h at the top of internal.h should be a no-op.


r~

