Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDB4D8C3C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:21:37 +0100 (CET)
Received: from localhost ([::1]:46206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqG8-0002Mz-2B
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:21:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqDd-0000kV-BY
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:19:01 -0400
Received: from [2607:f8b0:4864:20::102e] (port=35339
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTqDb-00072m-P4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 15:19:00 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso227215pjb.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 12:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EPpD/CxdNqxLFk0YnzkuJ081fTFAFFXvL20TxvP/Pt8=;
 b=sJ+G4yWJxxLTvgPinj8SeENG/E+C9IjNYZfjV894wfnL3jIS2l/fdYjpYP5XNyvXzB
 eajF71RnMGyI6+mEV1ydjKxqnDCFBzQaj0g6odc4LPljolZxNisAqjvatmtwChK/de1c
 IJyxClfxX8Df1YFtfHY3Hot316atmRQK6l9PCioWGE2rDZv6fM7XpHpX95fJmgBGHrra
 yrCeQYcs9i9TVe+4/rZX4/N4E9Yt3P8CiKssku5M8cDJUtNGbqRC3yBmODsFatoM2LVL
 0KNsiZ+nH1r2O+9mQMKLSDZpbgSnKjMLg1+yAVfaUy/N1G0b3RLHS3jaxeIy/D/wktVC
 X+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EPpD/CxdNqxLFk0YnzkuJ081fTFAFFXvL20TxvP/Pt8=;
 b=rYFkfRCPW314kteLJI+t+Oyll44Q2mXinJda77TgrWNF93lOHDDJZAGdRpvgOnKtZM
 sw9S4ijeo/XY+fUr5SlIeiK4FPF1cxrLjIGG3WhDPQhMuVxnZJDMBM1kbAMuMbpVeCFz
 pCJH9zZwOd2eVZeF5m+dzM0s4VQv0iEqerykTnyTH1l2m7V+zWrNG8H0ixtFjGhzGXWJ
 inuucNfBhL7jO20vkisZ/lob39zaZY3pwXC5qfpOTn6G0GvKYhV3fWZzPpydhpIABhPL
 iTAQE1UZ3bLRCL8HkxftYPwZozlej9nWwQRaTWHDDZgbnGCdkCSmL9vEY+m41k542ZT6
 prbQ==
X-Gm-Message-State: AOAM5310ImHDPk0UOu1a/ETjAgPkgh4pxV9lI6B68vXeIhJvZgiBVG8L
 4o4vdQABzoCc1+ENpxUW1S9hSQ==
X-Google-Smtp-Source: ABdhPJzqm3jGPqLNygBrTdBnylT0Z0GPVtPInSTh3kc918/vFrPuvUBEsmtwKv7M36IsMi678wBgQw==
X-Received: by 2002:a17:90a:c08d:b0:1bf:315d:c291 with SMTP id
 o13-20020a17090ac08d00b001bf315dc291mr686139pjs.121.1647285538338; 
 Mon, 14 Mar 2022 12:18:58 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a056a0014d100b004f79bb37b54sm11497459pfu.195.2022.03.14.12.18.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 12:18:57 -0700 (PDT)
Message-ID: <fbdc391c-c16f-d07c-e9ca-a5d7a5b13580@linaro.org>
Date: Mon, 14 Mar 2022 12:18:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] ppc: Include asm/ptrace.h for pt_regs struct definition
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, qemu-devel@nongnu.org
References: <20220314172508.816110-1-raj.khem@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220314172508.816110-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/14/22 10:25, Khem Raj wrote:
> Fixes
> ../qemu-6.2.0/linux-user/host/ppc64/../ppc/host-signal.h:16:32: error: incomplete definition of type 'struct pt_regs'
>      return uc->uc_mcontext.regs->nip;
>             ~~~~~~~~~~~~~~~~~~~~^
> 
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> Cc: Peter Maydell<peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Cc: Richard Henderson<richard.henderson@linaro.org>
> ---
> v2: Drop ifdef __powerpc__
> 
>   linux-user/include/host/ppc/host-signal.h | 3 +++
>   1 file changed, 3 insertions(+)

As per late conversation vs version 1, instead of the include, we should update the code 
to avoid the pt_regs indirection and instead reference gp_regs directly.

We should also move the file to ../ppc64/, leaving ppc/ empty.


r~

