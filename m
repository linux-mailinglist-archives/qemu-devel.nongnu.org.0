Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1475FE0FE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 20:21:20 +0200 (CEST)
Received: from localhost ([::1]:33752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj2pb-00046p-MD
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 14:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2lR-00020g-IV
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:17:07 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:35370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oj2lP-0006Xj-Np
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 14:17:01 -0400
Received: by mail-pl1-x636.google.com with SMTP id h10so2560153plb.2
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 11:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iJeu/I31b6hVJSCC8AsqCZpMYRa3PtYLoTet6p+YpGA=;
 b=Vg0t8Y+Lk4K08y5s/mQwgRn09L5i2n5Hu0BzO3XPZxsMLTK+dNB3SAgubXXR4/CKwX
 shc6ZQ396q9FVtx3mzGNz99rnuORtt4xCUYUeSaGgUoRthUun1mklJjF0M5kHJuH0rq0
 rRC6F10QGU2Gaf9+fJmTu9dPYWxITE7QBJE7+Vxnj/yWlXmI2WHUX0Vhj8Bxgb9uCCeO
 ART45ttbn4sgjmwvnFwBNrFN8fDwIHvMInSDt8OGfuhCRYcVxQ73S4mdT38Upl7tUGXH
 ADIA5PjkImRfK+UTLgjN0XGyfoUgG23FZQEJ2MSxxRolej7aNkhK7KvTVcVJ/Xvj6NX4
 UpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iJeu/I31b6hVJSCC8AsqCZpMYRa3PtYLoTet6p+YpGA=;
 b=igUdYbChhCIQIx3Dkrs5GkPHBkrmzPwNFR4Htn4hMf9pt0fWue4mumeLhyA6jMVW0D
 anhjHL+wc2GC1gMPTvMdGg1Eam3+yL9/sQd8qSWHDvC+oijyEmX6o5jeGqtkq5yR02rd
 BOfCPGGwFVuwUerKJc38FEFuJLLLv8XVGBBFTGsTz0+YTVdgzbnxYKECq8Hp+rl3Yqfy
 9R21X28Z2JeLRJZMCgo2FWSRBv/dr9DhOAHB4Oc6w4wyE+mcEPn/4MVpqrgg6otIiDG8
 4dgZsZotPLL+7lIXqsKkKGzVjgFT+ZxufLp5rN/1l734FtTPfSLkF782PwxOkSD6NWj+
 pNHw==
X-Gm-Message-State: ACrzQf3byh2poeDapcs9H2xKaq5Qnp68xO8YQy6AJYSd+HKXtDwmmH7l
 LKd2gMFvNf6bYUZoPgx2LkXFXQ==
X-Google-Smtp-Source: AMsMyM66stNhRsBtUyVzFhSvI2TTHt8VWE7GxQAVdBYYa2xp8Cg9Flhi5C9u1LOSEeaeAIueuW3o4w==
X-Received: by 2002:a17:902:c952:b0:184:ba4f:af39 with SMTP id
 i18-20020a170902c95200b00184ba4faf39mr1167159pla.58.1665685018156; 
 Thu, 13 Oct 2022 11:16:58 -0700 (PDT)
Received: from [10.1.28.222] (110-175-13-142.static.tpgi.com.au.
 [110.175.13.142]) by smtp.gmail.com with ESMTPSA id
 b124-20020a62cf82000000b00562b752b38asm6734pfg.145.2022.10.13.11.16.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 11:16:57 -0700 (PDT)
Message-ID: <24a38a9e-b8e3-9076-8e5e-05b24ada5e34@linaro.org>
Date: Fri, 14 Oct 2022 05:16:50 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/riscv: pmp: Fixup TLB size calculation
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
References: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/22 18:14, Alistair Francis wrote:
> From: Alistair Francis<alistair.francis@wdc.com>
> 
> Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
> have been seeing this assert
> 
>      ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_power_of_2(size)' failed.
> 
> When running Tock on the OpenTitan machine.
> 
> The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
> a power of 2. The size was also smaller then TARGET_PAGE_SIZE.
> 
> This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
> rounded down to 1 to ensure it's a valid size.
> 
> Signed-off-by: Alistair Francis<alistair.francis@wdc.com>
> ---
> This is based on advice from Richard:
> https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.110653-9-richard.henderson@linaro.org/#25043166
> 
>   target/riscv/pmp.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

