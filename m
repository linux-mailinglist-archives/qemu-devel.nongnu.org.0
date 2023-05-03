Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991426F5202
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:42:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu73j-0000eU-TM; Wed, 03 May 2023 03:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu73U-0000MK-3b
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:37:40 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu73P-0001BL-85
 for qemu-devel@nongnu.org; Wed, 03 May 2023 03:37:36 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fde2879eabso4457325f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683099453; x=1685691453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRlW4216UHL7uR8RKL4sYuSk8/TSpELhMvc/f5vAgeU=;
 b=a5islW5/83V/kF9W5Ozv0QpYID5xRDMCaKlbQHcfHYQxWvfoKDWjoFAP/iLNPN1SK7
 rGZDMAwOsVqeukAQVjRkx93/W3mJl5FwabbSQix7V7ox+dWqPptbtAhAPGIQvQzIPd3F
 luE6gRnYmIok4xgr2j9pcknzy6SKriyG2sqDOlPpz13QOK8wcWPWwyD/1gx1IpzjCPTc
 61O7ov4xcCeOFYFSoj+pL7PP3gbO4eg1rMssymC66dEcWlO1rfS8VSnK3bPj1aUmlg6o
 Ic/2Io2LaRHvMMetA7eac9hZJOmOPYy8SKgeelzCFhjI6Y7kMlMArjsZtxX0xKsHSsqx
 UzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683099453; x=1685691453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FRlW4216UHL7uR8RKL4sYuSk8/TSpELhMvc/f5vAgeU=;
 b=hO+EkvOJK9eApO/66Ta5XzUM7VTtiar1azxo3yQ0oOoglCbp92QxqVS8VfuTxGsc8g
 7pDtbdPGtCIoZ76IkpXlW9RMTHNsD65ub+15wrX0H2Xl/XrPMBVhcQ0bnxWycxrVouQE
 h0ArXrd3Hh+OIAYJSNk6l1Xyh3k+mymQcKEc9V5k5DeuIjMPs1PuAISDSYzRd3+Rp9+d
 vLeW79yUyzSCDumODBZXayLZkyeYuF+c9iMn4MqVzl/nWuvQFG93+Dn5WmpJP1weR4uy
 vWGJz+Zls6oo1L4p9/7DXB5I+3ny17xJiaq57wsgOU4SvB6nZt0jE9SG+/NppGf0rO8f
 2yyQ==
X-Gm-Message-State: AC+VfDw1SwtyIxQ8B+OiNVlqbBbKPmsmerz6LBavjF/UOqtXIfob14Q7
 gkiBA2DQ9lgbZCA4fVR8URS7og==
X-Google-Smtp-Source: ACHHUZ7hyVpfQi2r9tySjbRZYBFtMSE64H3bZdr51zYsddWoo49BVUkzBELasHhMM3oQgPyM6xrKSA==
X-Received: by 2002:adf:fe8d:0:b0:2ff:6906:7169 with SMTP id
 l13-20020adffe8d000000b002ff69067169mr13100613wrr.68.1683099453565; 
 Wed, 03 May 2023 00:37:33 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a05600010ce00b0030627f58325sm9623830wrx.25.2023.05.03.00.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 00:37:33 -0700 (PDT)
Message-ID: <933ff5d8-3875-34ac-9bc4-ed06f74efad7@linaro.org>
Date: Wed, 3 May 2023 08:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/3] target/openrisc: Setup FPU for detecting tininess
 before rounding
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>
References: <20230502185731.3543420-1-shorne@gmail.com>
 <20230502185731.3543420-4-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230502185731.3543420-4-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/2/23 19:57, Stafford Horne wrote:
> OpenRISC defines tininess to be detected before rounding.  Setup qemu to
> obey this.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
>   target/openrisc/cpu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index 0ce4f796fa..cdbff26fb5 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -22,6 +22,7 @@
>   #include "qemu/qemu-print.h"
>   #include "cpu.h"
>   #include "exec/exec-all.h"
> +#include "fpu/softfloat-helpers.h"
>   #include "tcg/tcg.h"
>   
>   static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
> @@ -90,6 +91,10 @@ static void openrisc_cpu_reset_hold(Object *obj)
>       s->exception_index = -1;
>       cpu_set_fpcsr(&cpu->env, 0);
>   
> +    set_default_nan_mode(1, &cpu->env.fp_status);
> +    set_float_detect_tininess(float_tininess_before_rounding,
> +                              &cpu->env.fp_status);

You don't mention the nan change in the commit message.


r~

