Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBB8484B00
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 00:03:01 +0100 (CET)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4spY-0006We-Ji
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 18:03:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4soG-0005fx-1H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:01:40 -0500
Received: from [2607:f8b0:4864:20::434] (port=46009
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4soE-0000P7-E8
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 18:01:39 -0500
Received: by mail-pf1-x434.google.com with SMTP id u20so33488854pfi.12
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 15:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pk8w6qncCgdHMzrnDbmNrooS3UnQCSR7w7VU/EtymDg=;
 b=JAcSisFWeNB1tD7mPTvVXCMy5rQomhw/orMy9yzLtimjnY+CNnzReU3d9dL1Okgp4V
 B7cReOix+i/A9Kw6vOxd7fJkznFPU79LpGxoCgkKamrTiXwykJfg/mpeOdRgaho397ji
 OitmK9U+mdfJjzVSvcgdiJEjWOE8mlZ6KfcGYrih0rcULAl215v3r/ieJvXzTrRLopUZ
 WUmNe4s5+OumbID4CidrGE5kKq2A6NjiQ3ymzRKPTwPWmHZSB4yM+JmxQCzr69yUoXzV
 GjvL59O9z4L3/3jnAvQOykc/CTm0/7T/d5yxbUWFdaXDJuXMNxob968/TpqpX3m8fVuJ
 Cqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pk8w6qncCgdHMzrnDbmNrooS3UnQCSR7w7VU/EtymDg=;
 b=O45xr6t90aASBc8611rPo+9/sUy9i5oIs92z/fOxFCa7/4tiRXJ/gd7VL2bK3fXmbB
 WPDYjutznGfOkTaNyBtd0fTMP6T5vJD6xy/kTARMyHLO47W+ksvdR/0Z1etokrxWsuYg
 wbNWMKWBEKQutkityoUXPshT8M8Qs27X5yXNOgPx/jjBWfmM5+n3ZQs/aMl9FM0m9po7
 bB3o8cMo1GKOfkI2CQ39GQSsZlFelrvl4ULnh5hy5eIQ0uP5IqrYS5h4i33Sp9Fq+0Zp
 h6RrB/eYrgIwtktSEnDCG7+wiNf5Bjs3z7zFeedUNYmrbPCFLnVrtVXmDZojT4MWzUPh
 FnNQ==
X-Gm-Message-State: AOAM530l3c4rv10M6IXdbBZJl9EHjnU6Ic0GsNKEPwTlnwT+fLzf84Zf
 S9hGrYv3TB11k1PS8RW35TQQlw==
X-Google-Smtp-Source: ABdhPJxbqrVOxxhoCmvHLb2V+bJIvhJKFLqPSHtXcKulsgDkOBo6bZDwbwL9KEHX2SfEMBwF8Ho/DQ==
X-Received: by 2002:a05:6a00:d6f:b0:4bc:df41:d0d4 with SMTP id
 n47-20020a056a000d6f00b004bcdf41d0d4mr396872pfv.74.1641337296819; 
 Tue, 04 Jan 2022 15:01:36 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id z11sm350641pjr.39.2022.01.04.15.01.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 15:01:35 -0800 (PST)
Subject: Re: [PATCH v2 4/5] RISC-V: Typed CSRs in gdbserver
To: Konrad Schwarz <konrad.schwarz@siemens.com>, qemu-devel@nongnu.org
References: <00a79b65-288f-f17c-abe4-fcfd3f7971fd@oth-regensburg.de>
 <cover.1641309725.git.konrad.schwarz@siemens.com>
 <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <676fcd9a-4a1a-2c03-e0c6-60128e3a50ae@linaro.org>
Date: Tue, 4 Jan 2022 15:01:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <79194a3cf9e3bd1df41401eeee901055b8702c7b.1641309725.git.konrad.schwarz@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 7:51 AM, Konrad Schwarz wrote:
> +++ b/target/riscv/csr32-op-gdbserver.h
...
> +++ b/target/riscv/csr64-op-gdbserver.h

There is a *lot* of overlap between these two files.
Why not add this data to the main csr_ops array?
That would put all the info for each csr in one place.

> +  [CSR_CYCLE] { .gdb_type = "uint64", .gdb_group = "user" },

I think you should be able to use "unsigned long" as a proxy for the native register size.

> +char const riscv_gdb_csr_types[] =
> +#ifdef TARGET_RISCV32
...
> +#elif defined TARGET_RISCV64
...
> +# endif
> +;

Ideally we shouldn't use ifdefs for this -- we should choose one or the other depending on 
the startup env->misa_mxl_max.  We are still using an ifdef for the main 
riscv-*-virtual.xml, but that could be considered a bug to fix.


r~

