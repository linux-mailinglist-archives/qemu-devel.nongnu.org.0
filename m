Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4B68606B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 08:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN657-0004B9-Nh; Wed, 01 Feb 2023 00:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pN654-0004Aa-Ed
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 00:54:50 -0500
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pN64t-0007qJ-4e
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 00:54:49 -0500
Received: by mail-vk1-xa2d.google.com with SMTP id v81so8586942vkv.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 21:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CoxCiFZz7Tvk6RjrddtljA7sOIkUA0Q7Lc6BrCdCTUc=;
 b=rGWAYbpfOgH0jBS8iPoax2C2V1kPCpNCxh5IYwVCIhJxSAKiQIJQTqbsGPzCad56Md
 tk9HL71zOvFrE7PqzpoQHiFALwC0Xx3vWIB39XCk4F1G6v2fpwrGAUf45eVtR+dYNsTB
 63yCSUtGhhssE0st3pKEmbfQ+1od4zf76F9uZe1DfahMUjn8P7Qgwdbk5oQwBpjJaSb/
 s0zRaxk3n/0+nMebW7ZGs0mp0cHiIGNlUERlIw+CRD1MtydgP0kgXwdUpbRZ5J1eEW9D
 nDJpsbLR+DdEevz8CsIrYmIEmQ46+hAQ16WC3fQiJDb0fYDuD3X6VB4rzoyjn/X2PWXd
 wSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CoxCiFZz7Tvk6RjrddtljA7sOIkUA0Q7Lc6BrCdCTUc=;
 b=DSdj3lfy0kBQzFcST/nkN+8HBCwV6PjnB1ErPmbwGPrCbqqvHztICd+8x/v+2bKswK
 tbL5XHjcUHE0Fmz7r3+j4cuL367/35GhIQ/ndu0i23R7WWG48/nb78sBUQdcRuqQe5y9
 58QcsqwfzGp20GA17kdtIOWdOs0kfjf1XYzNB0lQiJevvY0+Nyd/guQ/MFDeNtg2AH8e
 So1jexAYHaywoyBoBELC2zgfJ1hwJ4r9yvFJebSg+b8sv2VXozO7UqvJqypaI+AAvizU
 bu+NUg7RpfPUiqMdrMJijhUa4eXjisgo5IL+fSElFhu0FfxOmlT7LvU/GtkPxPiP0jmf
 h/Mg==
X-Gm-Message-State: AO0yUKWPs2u7cI9Ny15VEfpei8DxxpBYeCSmaaXg1Bye19xyAE8atnV/
 d1yknzGQS9wOAQg5qI1JudSj14Yw1mKUjuCZ
X-Google-Smtp-Source: AK7set+JKTUbm6WYKJst7pI+QGxIX4xQt579l9bPpcmeTGmsrrXrIXQNoYZ7rz9RhUhYqZCUqBueeA==
X-Received: by 2002:aa7:990a:0:b0:583:9b05:d1f0 with SMTP id
 z10-20020aa7990a000000b005839b05d1f0mr1242453pff.33.1675230341736; 
 Tue, 31 Jan 2023 21:45:41 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 i26-20020aa796fa000000b00593edee1af6sm2548827pfq.67.2023.01.31.21.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 21:45:41 -0800 (PST)
Message-ID: <1d6b1894-9c45-2d70-abde-9c10c1b3b93f@linaro.org>
Date: Tue, 31 Jan 2023 19:45:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: accel/tcg/translator.c question about translator_access
Content-Language: en-US
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Mark Burton <mburton@qti.qualcomm.com>, Brian Cain <bcain@quicinc.com>,
 Matheus Bernardino <mathbern@qti.qualcomm.com>
References: <BYAPR02MB55094EC2D6BD8354B3313894BED19@BYAPR02MB5509.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BYAPR02MB55094EC2D6BD8354B3313894BED19@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/31/23 17:06, Sid Manning wrote:
> There is an assert in translator_access that I hit while running on a version of QEMU 
> integrated into a Virtual Platform.
> 
> Since this function can return null anyway I tried the following experiment:
...
> -            assert(phys_page != -1);
> +            if(phys_page == -1) {
> +                return NULL;
> +            }
...
> which avoided the issue and the test ran to completion.  What is this assert trying to catch?


One half of the instruction in ram and the other half of the instruction in mmio.

If the entire instruction is in mmio, then we correctly translate, but do not cache the 
result (since the io can produce different results on every access).  But if we have 
started caching the result, because we start in ram, then we will incorrectly cache the 
mmio access.

This really should never happen.  How did it occur?


r~

