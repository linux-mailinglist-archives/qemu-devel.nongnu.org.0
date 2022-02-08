Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0484E4AE484
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:36:46 +0100 (CET)
Received: from localhost ([::1]:60010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZ6L-0006kP-3s
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:36:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZ1O-0004h7-J4
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:31:39 -0500
Received: from [2607:f8b0:4864:20::1034] (port=42619
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZ1M-0003vf-B0
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:31:37 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so420752pjb.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mRN23hR4qmqlgJvFkoxtihXVNp1yqruBRnCivwMRN7I=;
 b=Um/Cb04ST55PpRmKpEFNbgL7JbdzVkkaY1jRgHh+zc8pOwvFpKQ/lMYDBuUdKCJ0b0
 Z9aZYTo35rmUUZp2KKl7FhtPRexh+MTV4oCdO8gMhyLzZTipVywaRJ9mYgPrLp0VbjQ/
 kc4DHOW3AFIIgV/FmTVeno8k7et18NGy8hzgSkRlShFp1yWiLm32ihobGBH/HkojfUVd
 QsNZhq0hs9D5m0SSJ70pqAj1YhHJZszk2l9N9qIM47Tfc/TLGhKCE5Q/GZmO8kKEdlrM
 N9p2JYtPgH9FfC8lvs65LcIx4sOIImSl2FMfmd9M4BQ0VrEv3TPGN3AGPpJVIQWAGTvi
 NI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mRN23hR4qmqlgJvFkoxtihXVNp1yqruBRnCivwMRN7I=;
 b=boAYkkQ+cUHG8ekm4gDtXLT29oCo4BkWEUs1WSGiXKa535shbrvzrqLQ9TJ54dYfoN
 thAT1zMbcGdFvD7lOswWW14zjT49ckqcQGSBhZqXNg2L/xq0sFrW453U7lOdWtqZiv3e
 xxXIbwkta/NtLaYiruvJ7gz3br/19+ZaxDz4C5IIk3DIrw6q2FJimidUze/hLmrLSjvb
 lA9m8sYOsMOqPkge2VqiNcQz4VVJYj3ZaHNbdlYo+ntxW22HRJHjb63i3FJPDQtMdqH0
 jr2p/pYnuoHBl1/rOy2ykdVOYIaIuhd6y1lk8hgdyE7uqtfBOWU+MA6AOEC6HXR94p7e
 b4aA==
X-Gm-Message-State: AOAM530cBXAJS81DyICc9GFpr8WN9T4h/rNAfRs9XGp4CIbw7ULZpNkT
 KuSwZK0s2WejdtgbHDkcACy8cw==
X-Google-Smtp-Source: ABdhPJx7dKkO8zRVm68xtXXNgAbxokTdfP0wO2AjEmrzU6NE1D3uq4k8q7Q3tHjKAAA+FVrvHZt2ag==
X-Received: by 2002:a17:90b:1b46:: with SMTP id
 nv6mr153634pjb.178.1644359493184; 
 Tue, 08 Feb 2022 14:31:33 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id a13sm11941332pgv.27.2022.02.08.14.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:31:32 -0800 (PST)
Message-ID: <5e57495a-e03a-3a30-50d1-a9040b8aa9dc@linaro.org>
Date: Wed, 9 Feb 2022 09:31:27 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 08/13] target: Include missing 'cpu.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-9-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> These target-specific files use the target-specific CPU state
> but lack to include "cpu.h"; i.e.:
> 
>      ../target/riscv/pmp.h:61:23: error: unknown type name 'CPURISCVState'
>      void pmpcfg_csr_write(CPURISCVState *env, uint32_t reg_index,
>                            ^
>      ../target/nios2/mmu.h:43:18: error: unknown type name 'CPUNios2State'
>      void mmu_flip_um(CPUNios2State *env, unsigned int um);
>                       ^
>      ../target/microblaze/mmu.h:88:19: error: unknown type name 'CPUMBState'; did you mean 'CPUState'?
>      uint32_t mmu_read(CPUMBState *env, bool ea, uint32_t rn);
>                        ^~~~~~~~~~
>                        CPUState
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/microblaze/mmu.h | 2 ++
>   target/mips/internal.h  | 1 +
>   target/nios2/mmu.h      | 2 ++
>   target/riscv/pmp.h      | 2 ++
>   4 files changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

