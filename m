Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352463230BC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:29:05 +0100 (CET)
Received: from localhost ([::1]:57802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcQi-0003jt-7v
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcMl-00084S-Mo
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:59 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEcMk-0006uA-30
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:24:59 -0500
Received: by mail-pl1-x632.google.com with SMTP id d16so1486858plg.0
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 10:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xblsp+0U5++nmN462knhbrXa6iHsXKROBcjF9UkN4iE=;
 b=uuzKSlujAH7walMlNTcIe2Ps6x8OwJGL8iwKs3ZNT2Lgketh5xKwW3RcK7x3OqmIG9
 Qr0Dtv+7rJ+YRgoL6ziMPZuDR43Et+Wh80EJXPZXFCaKgCRw8YjtCVkte01jLkvs+RPE
 L/+/4uJIfulEGuHzl8HdnRmmGBXkRc/BDwZR31LkgYe3NetSCAb0fLVNYJkmzZfTVrD2
 FmDW/GvN1SOzEZC+kD1mpYXnkwXj75af6CISxn6kmGkQCu48ywtU30FSdPpB/0T25r0d
 6lN2gDfldzwUJltkWTLhDnYsReB+02Iqn/3TmNCygSPWp4ohWnpLWoYGzxSEtGWt7jfK
 NVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xblsp+0U5++nmN462knhbrXa6iHsXKROBcjF9UkN4iE=;
 b=oI8yPLy6QZFBYVF0IWy4/x3FwPIHwQSFJVfRKe/pDonGRjMyyBdCwWgQVAXTqd9JR2
 r78KIjy5TwcjX6j8qTGGY476QeUOjf4Hj3aCNXa4CriM8FiQZXCjlV+agcyhYNF4G4xO
 3l8Y04n1x5sY0fIeUwcSNxBT8KRxsjinVgAL2XUMgmNXKzsxQc8csa1/r+Hf82fbyHPp
 gK150KPXGWcw3tBTpx9pXXL/x2miuJv7B+fh/xgXPQQY+yGBuaO/0UObLZLO/DTn4HVL
 zzIwfyHnhoaSANfkjRJ26AQFiyexp4AKH4Q6yNgJdx7ufPFyQq7+V93Ul9hrU+nZKQJ0
 jUFQ==
X-Gm-Message-State: AOAM531Fgi3favgdXPdwTj4ylRgP48Ls7+dt8iJj8lHwBuliL2WqXSy0
 oP6RSt6R2CV3yzgeaqWGYRZKsQ==
X-Google-Smtp-Source: ABdhPJwOvF83lkFXgn/sAVAGBr0jq2d6M6Hf2P7XEpW5x97G4ya0XFJYXlLAvwXY/XbF5fKz+yCaRg==
X-Received: by 2002:a17:90a:1616:: with SMTP id
 n22mr80504pja.110.1614104696629; 
 Tue, 23 Feb 2021 10:24:56 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c8sm4255701pjv.18.2021.02.23.10.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 10:24:56 -0800 (PST)
Subject: Re: [PATCH v2] target/riscv: fix TB_FLAGS bits overlapping bug for
 rvv/rvh
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20210223081951.20226-1-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <500b1f4a-1fe8-9e4f-cdee-2c2b35a53edb@linaro.org>
Date: Tue, 23 Feb 2021 10:24:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210223081951.20226-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/23/21 12:19 AM, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> TB_FLAGS mem_idx bits was extended from 2 bits to 3 bits in
> commit: c445593, but other TB_FLAGS bits for rvv and rvh were
> not shift as well so these bits may overlap with each other when
> rvv is enabled.
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -#define TB_FLAGS_MMU_MASK   7
>  #define TB_FLAGS_PRIV_MMU_MASK                3
>  #define TB_FLAGS_PRIV_HYP_ACCESS_MASK   (1 << 2)
>  #define TB_FLAGS_MSTATUS_FS MSTATUS_FS
...
> +FIELD(TB_FLAGS, MEM_IDX, 0, 3)
> +FIELD(TB_FLAGS, VL_EQ_VLMAX, 3, 1)
> +FIELD(TB_FLAGS, LMUL, 4, 2)
> +FIELD(TB_FLAGS, SEW, 6, 3)
> +FIELD(TB_FLAGS, VILL, 9, 1)
>  /* Is a Hypervisor instruction load/store allowed? */
> -FIELD(TB_FLAGS, HLSX, 9, 1)
> +FIELD(TB_FLAGS, HLSX, 10, 1)

The only other thing that I'd add at this point is a comment about MSTATUS_FS
-- a 2-bit field at bit 13 -- for the benefit of the next person that adds
something to TB_FLAGS.


r~

