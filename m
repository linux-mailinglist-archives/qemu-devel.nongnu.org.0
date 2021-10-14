Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5055B42E4DC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 01:46:17 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbAQS-0001Ba-B8
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 19:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAOJ-0007lj-E1
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:44:04 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:34652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbAOH-0005S0-UR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 19:44:03 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 133so6977042pgb.1
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 16:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4+OiaoFxtiUhATFQUnB1v2FKfo/kByITyJHI1GrQwgo=;
 b=vtrr69FT0Eyc0WQv+uOMcAiJEYJKCqnnJ6CkN8yLQs+k+p3nxkQZo4i1qgrPj7byAE
 6d8PylZt4Pm8FXtSXJysbEkpv+xWynIMZP4q/+XS2Bo/zgHZpvOLeYrpMECTcECCzA0j
 QEsn1LQwMvcxst3nLAgaXZjVL0nIwqZ4CU+LIL6BDlAxvALcbXbzDHwYREPYcmRUXJ+x
 Wdj0NZRozo+EWq8BcD5BhbLYYthDx7h9Sm0UuFGZ9YWQk4Q8hgO0wOZo5CAgcbHasWVo
 C5tPxE+53WLYEV7wKTOvQm15FleLBx/YvkEXDCIqjDvT3P1Ea0jAEZysT+Ws1acItsDd
 iMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4+OiaoFxtiUhATFQUnB1v2FKfo/kByITyJHI1GrQwgo=;
 b=BlKFVySR1ISRW0ojOFRaylxf8gA9/aiK+6SUC6SShazETaoSPT8B28W99FqGeXUGwh
 TtXwa5OEq3hd5E8xKldBCrDgaHzPajDcH9gQBStmQFzyZjJpZMVLxB9PcLIerU7LFrWm
 XCT/K5cwic5M62+ml4VMYSIYF+UmRSLDxM0F+lm+RWmqikU+E+NefT6dd/OF8ZzXZMw1
 tehnm/t8kF2+ZT9SVh5wL6kYE0BarlAK37wNfg//nGBunYScgrDU7RysKhDZpWmZYTxg
 24WgipmRxyG/P4S9BpFixi8h9KJduhwHu68aTbvUckDJCeZrQe05Mup8n6aUQu9ofJlR
 neWQ==
X-Gm-Message-State: AOAM531p8l4/EnkhOooDQe6THQxV2vkrEv73Bms5r1mMWBRv6XNS1RxL
 G9OmiYe+rLNsPJ2BC4K+3Qjt/A==
X-Google-Smtp-Source: ABdhPJzeVGgPcy20NuLjgEI7gL4FSuTRwqYCCHnI8/mUmUDoRB5HBRCblvV3lyxFHhda5c4fR18BbQ==
X-Received: by 2002:a63:6f83:: with SMTP id k125mr6440003pgc.162.1634255040544; 
 Thu, 14 Oct 2021 16:44:00 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j198sm3395773pgc.4.2021.10.14.16.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 16:44:00 -0700 (PDT)
Subject: Re: [PATCH 2/4] target/ppc: Fix XER access in gdbstub
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211014223234.127012-1-matheus.ferst@eldorado.org.br>
 <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4e6dea89-de7d-44ab-7fd0-83a6d9fa7f68@linaro.org>
Date: Thu, 14 Oct 2021 16:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014223234.127012-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: laurent@vivier.eu, groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 3:32 PM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> The value of XER is split in multiple fields of CPUPPCState, like
> env->xer and env->so. To get/set the whole register from gdb, we should
> use cpu_read_xer/cpu_write_xer.
> 
> Fixes: da91a00f191f ("target-ppc: Split out SO, OV, CA fields from XER")
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/gdbstub.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

