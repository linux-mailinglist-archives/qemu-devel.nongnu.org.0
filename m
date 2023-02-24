Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3796A142E
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 01:11:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVLg8-0000Lj-6G; Thu, 23 Feb 2023 19:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLg6-0000LQ-AT
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:11:10 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVLg4-00030O-0Q
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:11:10 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 qi12-20020a17090b274c00b002341621377cso1084178pjb.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 16:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kARi8cr10PRySmO5jl/2kueZ/rjsOX+ae874q8R+7DI=;
 b=ueEQolmRz6xMeGnb/pMfROILworxOPnHODMwjuhaQcJWHC56ZiWtmxEAX1+IfM4xp6
 8Nt8UmfGf3/XmEYNIJ9KJ8UidHMUU5d50d4YaM8vbLBvDocmUKu2rHWA6yNyuSnetusc
 3xWfJGPyF5c5NxK728/sgFkj0Zt1G31nJZMpkeAGSSL8DPR2DgrFRBMv2OP3H0GDLRls
 uKUfgw2RJIf5/oehnxfAs7RlIOyzFN18YC5gPiuSFXZ4FErvSIbX+l7pX4eQ1UNhZwaz
 UDTNiMOJKMbMOeAYmxw1r6W8AG97SORf439eMg8gIdZKYxQ/T+9bfpwmA3cUJqk3OZrd
 e40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kARi8cr10PRySmO5jl/2kueZ/rjsOX+ae874q8R+7DI=;
 b=V3X4QsTWYGp8HooOY7HrtJFVEB/G3CxZJ+vGzktH4DMm3J01vODrlirdRUlnW5jddN
 wIDeYZFxDzX47cEcPFpcQKsPYIfYA4xLyGprqHfxOGEee0eL9tuZlGc5pHk6jMziRzLU
 jFUgY4HWtzk2vq2efQgQ06Y229DADOTClfKE1pEMxgTOgt6iE5WUMQq3vf0kr5F7O0eT
 GAJCydc+GwwG7JFgi6PxAQa65ddDj7Z9tx6PrIeS1HnRBPxHvBSR7HLcRziGe5SI8N1e
 +OIEsqYPOiWkFlYFBqVnmtaavWc8JbwuGOks9uuSI5TvWETkpNjm+cDy2yUiYaseVnuI
 Drlw==
X-Gm-Message-State: AO0yUKV3NOFlcy9riMKilia8GomrDXZ9Xb9x4M7E6R8gfEbxFYTMnt5n
 BkI9EYB3RlPexHz67u25FYykgQ==
X-Google-Smtp-Source: AK7set9UVDjpeIgHfxIKCvuQZ3zHjElg2QuFIGPJpuoQQ+0bDPtobb0DbDCtIUq5lHGRQ78/AsHllA==
X-Received: by 2002:a17:902:dac6:b0:19b:c491:21be with SMTP id
 q6-20020a170902dac600b0019bc49121bemr16297129plx.64.1677197463358; 
 Thu, 23 Feb 2023 16:11:03 -0800 (PST)
Received: from [192.168.54.227] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 q7-20020a656a87000000b00503006d9b50sm760197pgu.92.2023.02.23.16.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 16:11:02 -0800 (PST)
Message-ID: <ab0f0f50-f8c4-05a2-5f37-bb7e5c4ace82@linaro.org>
Date: Thu, 23 Feb 2023 14:10:59 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v7 1/4] tcg: add 'size' param to probe_access_flags()
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng@tinylab.org,
 liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
References: <20230223234427.521114-1-dbarboza@ventanamicro.com>
 <20230223234427.521114-2-dbarboza@ventanamicro.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230223234427.521114-2-dbarboza@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

On 2/23/23 13:44, Daniel Henrique Barboza wrote:
> probe_access_flags() as it is today uses probe_access_full(), which in
> turn uses probe_access_internal() with size = 0. probe_access_internal()
> then uses the size to call the tlb_fill() callback for the given CPU.
> This size param ('fault_size' as probe_access_internal() calls it) is
> ignored by most existing .tlb_fill callback implementations, e.g.
> arm_cpu_tlb_fill(), ppc_cpu_tlb_fill(), x86_cpu_tlb_fill() and
> mips_cpu_tlb_fill() to name a few.
> 
> But RISC-V riscv_cpu_tlb_fill() actually uses it. The 'size' parameter
> is used to check for PMP (Physical Memory Protection) access. This is
> necessary because PMP does not make any guarantees about all the bytes
> of the same page having the same permissions, i.e. the same page can
> have different PMP properties, so we're forced to make sub-page range
> checks. To allow RISC-V emulation to do a probe_acess_flags() that
> covers PMP, we need to either add a 'size' param to the existing
> probe_acess_flags() or create a new interface (e.g.
> probe_access_range_flags).
> 
> There are quite a few probe_* APIs already, so let's add a 'size' param
> to probe_access_flags() and re-use this API. This is done by open coding
> what probe_access_full() does inside probe_acess_flags() and passing the
> 'size' param to probe_acess_internal(). Existing probe_access_flags()
> callers use size = 0 to not change their current API usage. 'size' is
> asserted to enforce single page access like probe_access() already does.
> 
> No behavioral changes intended.
> 
> Signed-off-by: Daniel Henrique Barboza<dbarboza@ventanamicro.com>
> ---
>   accel/stubs/tcg-stub.c        |  2 +-
>   accel/tcg/cputlb.c            | 17 ++++++++++++++---
>   accel/tcg/user-exec.c         |  5 +++--
>   include/exec/exec-all.h       |  3 ++-
>   semihosting/uaccess.c         |  2 +-
>   target/arm/ptw.c              |  2 +-
>   target/arm/sve_helper.c       |  2 +-
>   target/s390x/tcg/mem_helper.c |  6 +++---
>   8 files changed, 26 insertions(+), 13 deletions(-)

Queueing to tcg-next.

r~

