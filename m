Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ACE436F47
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 03:14:03 +0200 (CEST)
Received: from localhost ([::1]:53288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdj8D-0001uH-PI
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 21:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdj73-00015C-IY
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 21:12:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdj70-0001Qj-N3
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 21:12:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id o133so2200835pfg.7
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 18:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fH1dfwM7xll1AcDa9VHprTt1BbLXY6UN9GWnY4ITnYw=;
 b=rEgjcsn/4XfvmP4q3jGNcboCn1Ujmpg0K7lWsiJbx6apZtw6Rj6dp00+tTsEwd6eBt
 mdnKMBz6TKXh14D1+y8sHxjIBrthq1h6y/d/APp4qIDeeSLj11dAHbD7tRz7xUCh2ago
 6axbwkzCdJKX1WikV3gIU92O/HOzMniIKmwiy+UsuAF2kyqVxZch9cT6IgZcYmhKxpb/
 xrdf5ejAwt9Iv+aTv+O6QGwSiBdz9KPvrYxwV/wujmIo/2FGJuwC0Izt30ALXHcjN4ad
 MUcuI+Hg5BKqxuXptJZSlHt5taLNkVhYO7OFJlS9KdPu0IJUxaiGwRyvqrIXwFKb0AcM
 7Ybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fH1dfwM7xll1AcDa9VHprTt1BbLXY6UN9GWnY4ITnYw=;
 b=612rE971uwG3k69qdzfhv1CGdbVMV+AHOCC4UFhhmNfXBv0f8hpdttzTb4auw2Kjie
 fQZ4+taea6Uy3OnYdLwQIw+WexOBT37kPXOrKV/SBKyj/xVl447sdOx8RzvSJ/jUegJD
 NK/zbBieZUjXbewpmJcJSragEUGdWY/M7ZbQDb2jo8ATCZV1VFun+YwKSn7uZgrIo683
 hPkERM8jRKE/Nje9YnDhmBA1Vk34Iyq7kTherwPzmQsom4zHsHDo67g+CmY/71Qqh0cN
 hHkvl00jrBmW45/Vm9pTF/0rKOGuMGgGDmM1GU/PbZbZ0raUkD2a5KGOsS1si3Hd0nYt
 P2DQ==
X-Gm-Message-State: AOAM531/gx0p3mkp28GXel7eOpeO8AyexZ9PL8CUeDPBDEdM9TAqyt/Q
 2nGLn+cI5ZEENXT28uMo/sn5Mg==
X-Google-Smtp-Source: ABdhPJzDfix5YAAlciu+Zmij3nT1HYc36p1WsKkQ4g8NPe42grubi4UUpVieac6N4SkU37Bz7/okvw==
X-Received: by 2002:a63:7010:: with SMTP id l16mr7060500pgc.32.1634865164804; 
 Thu, 21 Oct 2021 18:12:44 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm7425623pfn.159.2021.10.21.18.12.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 18:12:44 -0700 (PDT)
Subject: Re: [RFC PATCH v5 3/3] riscv: Enable custom CSR support for Andes
 AX25 and A25 CPUs
To: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>, alistair23@gmail.com,
 wangjunqiang@iscas.ac.cn, bmeng.cn@gmail.com
References: <20211021150921.721630-1-ruinland@andestech.com>
 <20211021150921.721630-4-ruinland@andestech.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4f7798d8-944a-b2d9-ff27-8a1fdf86b4e0@linaro.org>
Date: Thu, 21 Oct 2021 18:12:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211021150921.721630-4-ruinland@andestech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.867,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, dylan@andestech.com, ycliang@andestech.com,
 qemu-devel@nongnu.org, alankao@andestech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 8:09 AM, Ruinland Chuan-Tzu Tsai wrote:
> diff --git a/target/riscv/csr_andes.c b/target/riscv/csr_andes.c
> new file mode 100644
> index 0000000000..8617f40483
> --- /dev/null
> +++ b/target/riscv/csr_andes.c
> @@ -0,0 +1,183 @@
> +/*
> + * Copyright (c) 2021 Andes Technology Corp.
> + * SPDX-License-Identifier: GPL-2.0+
> + * Andes custom CSR table and handling functions
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "cpu.h"
> +#include "qemu/main-loop.h"
> +#include "exec/exec-all.h"
> +#include "andes_cpu_bits.h"
> +
> +struct andes_csr_val {
> +    target_long uitb;
> +};

docs/devel/style.rst: Use a typedef and CamelCase.
And of course per review of patch 2, this needs to go elsewhere.

You need to add a subsection to machine.c to migrate this new state.  With respect to the 
custom instructions, I suggested adding an ext_andes field.  I would expect these CSRs, 
which go with those instructions, to use the same predicate.

> +riscv_custom_csr_operations andes_custom_csr_table[MAX_CUSTOM_CSR_NUM] = {
...
> +    {CSR_TXEVT,            { "csr_txevt",         any, read_zero, write_stub} },
> +    {0, { "", NULL, NULL, NULL } },
> +    };

Indentation here.

I think you should not export the array itself, but instead

void andes_setup_custom_csrs(RISCVCPUClass *cc)
{
     setup_custom_csrs(cc, andes_custom_csr_table,
                       ARRAY_SIZE(andes_custom_csr_table));
}


r~

