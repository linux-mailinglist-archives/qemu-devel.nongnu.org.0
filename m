Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F342484A87
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 23:13:39 +0100 (CET)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4s3l-0007T7-S0
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 17:13:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4s2U-0006bO-Hz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:12:18 -0500
Received: from [2607:f8b0:4864:20::102d] (port=45814
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4s2S-0000i1-Uk
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 17:12:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso4533361pjg.4
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 14:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P6xhGYYr91lnNxeqlRVVxNtY1H9DPDkhgfonaLuaVr4=;
 b=ibE2UE8Vx2/YuigWRBPkRhdKPWpdgO1ydiDWrg5VhFK7RLZ2WheWCZxQYftxe8dnPC
 244jftfESleNyZGJn19OjakArAl6sVszHTp7to3cI85YffhVGfri9LbMCSYC6SyW5Gck
 Bos8/K+mOabqN1nxxpxW0iUC4Rq8S8j0YTsQ1nyAuWCoGLkulm3n8KoypHTCpQzD02iu
 7hsAp2LIDE18zmhgwhBDJ++C6DBDdbFQ+x3x0CRdTgbonUGMMXE/E5w0tP67GmWJ7JMU
 4af1cVj2NII5j5kTuYvjXGNvSUK3r2m2arim9g3GPoueOqG8t9GGHyw6q+S/QMMNzFpV
 C4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P6xhGYYr91lnNxeqlRVVxNtY1H9DPDkhgfonaLuaVr4=;
 b=SdiKcNoEg9MIyevM2Q0RkqDVTw9IOMXGO5k3OU3FDPqOBvrxd+wdP0ax4FTuHlyvDA
 feXJQkGDZmJJdVqKrf4PN/R6IuG98MsKUSUUHT560psa9fFWOe7vGfe1uwZh6HpnZ/+2
 1l3e4L4CKZJ3odN4fePZNh2HYb/z/MUhBHEUai/Kfkb97NVv7LJCriGZ43kmNDMpG40q
 LUO6vrmSpM67nBBF9y+yT+XpSEWopMhelKHGtSjOSV7XtXBVXha0GuqCnofkxgTk+7ZN
 +DCZGMY58JLIgFznCpr9hqaXKyDTWkeI3tavFYpUB7ub0eOhnxTLOZHJNzzTu2mqCSF0
 d7NQ==
X-Gm-Message-State: AOAM5313s5jD4LrS2oO8Q8OkIz9jz5A41NpBSqCqZEel7Wjvzbcl2O+C
 cBWDgJzCDaQV2j1JaVAUVa02hA==
X-Google-Smtp-Source: ABdhPJzc5aQPfPlfJcDIniJfe32ydmj+xpMYKbDhiEqUmqaFXr4pmggzejjarc8O10CSmq+lsOs+4Q==
X-Received: by 2002:a17:90a:d3c2:: with SMTP id
 d2mr480621pjw.219.1641334335334; 
 Tue, 04 Jan 2022 14:12:15 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id lw5sm305333pjb.13.2022.01.04.14.12.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 14:12:15 -0800 (PST)
Subject: Re: [PATCH v2 1/2] linux-user/ppc: deliver SIGTRAP on
 POWERPC_EXCP_TRAP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220104210015.457468-1-matheus.ferst@eldorado.org.br>
 <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eebcc0ab-8585-7521-7ddc-b8e85c97aa02@linaro.org>
Date: Tue, 4 Jan 2022 14:12:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104210015.457468-2-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/22 1:00 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
> The si_code comes from do_program_check in the kernel source file
> arch/powerpc/kernel/traps.c
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   linux-user/ppc/cpu_loop.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

