Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A842E1543
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 03:52:07 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kruFx-0005hY-LB
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 21:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kruDy-0004nV-PZ
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 21:50:02 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kruDx-0001MB-3U
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 21:50:02 -0500
Received: by mail-pl1-x634.google.com with SMTP id j1so8420627pld.3
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 18:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R3lZEqiM3eLdoDDvDusX9cVsUvokxlNHFQJNhN0h2eI=;
 b=vGtENUikTPTDYw6XmZSdPwtnpmYO0p7jT8IzLA5L9PO0AJEDJtZC7cn2pymxCRNrEv
 FrpcRKU4fYHu6QUPt8AnfUWoAIVhnLtZRSkV2vn+rkshhssxR50q8mZsNT6Q2D58ro2y
 GN02dUWw5732czvERvxdJ6eMISFvduDLNZ6LXA1Kd6LhWSE6bZBjYmNIR9zh91/gtlYS
 JJ9lIHP3KOw6BygRZiwXP8XIwQon3Ryqs+L7pM1WhISiZK/+8b/V2oIR+9oe0rwEWoug
 kGCAJwPnm0dXCeGOjq8SLoREd9gqRWhmpd3dKXU5hwC9mMeGuuiuUwOBo0Z20QoeOBx/
 ky6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R3lZEqiM3eLdoDDvDusX9cVsUvokxlNHFQJNhN0h2eI=;
 b=eBPTL8gLa8BSQvw6krwSoOoN+3+UCF0hWJFMrihv1YiKM1UYp51cSN9pAeNY0JATf8
 pucrSGVOLId8KKpAob47kCo7gmCyXiyxnK+pL3kdkAzw/m9ah64ld36SQ0rHa/cV2IfE
 A4+cuR0k8tWh6BtrtTbtA3y+HhqRBMCVRPYUesI1k39tG6nH9q9QiPiOYpaCyBrcLsYn
 lf8APXuawJTSAOs04imyKVSKPKvLINAaWpS7IMn6FkpU940wgf+7KkEwt+HnR40/6R56
 mg1qOP6nLKr1TaIgbGMXtX0LFFemI+2D+vNkhK2SwkWbmHOsN01R9wNNQR7jEGR4HyRw
 Im8A==
X-Gm-Message-State: AOAM532bHMh+u7XEx7+jTC5AsqBT2b7X+sbzXjTzBWwHM3sElrZ9vHtE
 DA+c/5ZJZnYmpMpC9ebqpVAU5A==
X-Google-Smtp-Source: ABdhPJw2SfbM9rwixSd/sREQOB+3/+nk3clCKUxsRdPwtY4zm74oB9/D1TvbezSb8CGaypToEEcWuQ==
X-Received: by 2002:a17:90b:215:: with SMTP id
 fy21mr24725110pjb.227.1608691799007; 
 Tue, 22 Dec 2020 18:49:59 -0800 (PST)
Received: from [192.168.1.11] (174-21-139-177.tukw.qwest.net. [174.21.139.177])
 by smtp.gmail.com with ESMTPSA id bf3sm21114858pjb.45.2020.12.22.18.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 18:49:58 -0800 (PST)
Subject: Re: [PATCH] target/riscv/pmp: Raise exception if no PMP entry is
 configured
To: Atish Patra <atish.patra@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20201223012158.4146439-1-atish.patra@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8b4471a-dc22-2dba-a3fb-cc13c308c236@linaro.org>
Date: Tue, 22 Dec 2020 18:49:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201223012158.4146439-1-atish.patra@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.521,
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Anup Patel <anup.patel@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 5:21 PM, Atish Patra wrote:
> +++ b/target/riscv/pmp.c
> @@ -74,7 +74,7 @@ static inline int pmp_is_locked(CPURISCVState *env, uint32_t pmp_index)
>  /*
>   * Count the number of active rules.
>   */
> -static inline uint32_t pmp_get_num_rules(CPURISCVState *env)
> +inline uint32_t pmp_get_num_rules(CPURISCVState *env)
>  {
>       return env->pmp_state.num_rules;
>  }
...
> --- a/target/riscv/pmp.h
> +++ b/target/riscv/pmp.h
> @@ -64,5 +64,6 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr tlb_sa,
>                           target_ulong *tlb_size);
>  void pmp_update_rule_addr(CPURISCVState *env, uint32_t pmp_index);
>  void pmp_update_rule_nums(CPURISCVState *env);
> +uint32_t pmp_get_num_rules(CPURISCVState *env);

You need to remove the inline as well.


r~

