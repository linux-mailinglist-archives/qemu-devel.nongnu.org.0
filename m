Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DF6AA074
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 21:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYBeY-0004dT-JK; Fri, 03 Mar 2023 15:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBeW-0004cr-Fs
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:05:16 -0500
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pYBeU-00019B-SH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 15:05:16 -0500
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-176261d7f45so4218872fac.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 12:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677873913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N1B6/pXnldAgnrh+84ND4QzxbqUfbkSAsr/VmeenwT0=;
 b=cSWU86OKLokiPsEl3/nClHWH8qgXwVNcuRe0Qenl6bPNPlgV4PBbBDj6mVGSzP0H51
 prcmLrvg304rqbaA34jxDahM2BF6lLAF+m+Kmo1OyAfGSy17dkxjn6DYINQFX3b9wCLg
 0Z4FBWiMXALVOhWMxssVssthqlCy42DCefgPtoZaeULHKHlcFvFtB5sSNeau7S2jl8F2
 kigAdsJa9thWz2taqrUKaYrAwPtvZVslUcDuDZNEayM2LZHHOH8kVqT/vF49UOgye94Z
 XYdeBXRPRdprFq7QDD4Um0KN4wMs1o30Xc3eSVOg6wLqakOFiGv2QhSRg8HvBGkw7eTm
 xAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677873913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N1B6/pXnldAgnrh+84ND4QzxbqUfbkSAsr/VmeenwT0=;
 b=gY90D/gm/IxpZAANgHx1uwTAqlQdI1yGPfQ0ZufkwD6SSpK8KJreo5nY3wn4/k5rZq
 6NHybCa/G4uVlHhuQWUrInTBlcJ6T/znKYIMkUG1UQvzraDDYMiCng1bax1oa5/LEtXJ
 14qNhADmYS6ka2KRCtTJpqRy8CNJ3cFf7H6SYgIn3hqPoKqYsHhXTO5Wqo218dAFTeiM
 aUtepP6ctRyi4Iq/djq5r/jCHtxk3QPJt2s6i15ODypBKmMo+CAoWs3LgzcbX9FrFRS0
 lDID9wxSxohbYbJODLPIqnu1fXy75PcvqUv02B1XxX5MUyw1NliW9xm3CUsivgA/8OEK
 xp5Q==
X-Gm-Message-State: AO0yUKWOwL/NORWm63lLxyn4aw7ag9oMR1IEDYGqBa6KG/d6gV389pE9
 Qzf7Ue+kojY/Ka/31/cKDBob3w==
X-Google-Smtp-Source: AK7set9ycpopG6uesZXZnDGXloGrCHMnyCBfeIgm5u7y4eBSs9CeYhD9meHaZb8HomDql+z6BEgvAg==
X-Received: by 2002:a05:6871:806:b0:176:1fd8:d144 with SMTP id
 q6-20020a056871080600b001761fd8d144mr3935789oap.26.1677873913404; 
 Fri, 03 Mar 2023 12:05:13 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a9d60ce000000b00690e42f0da8sm1471518otk.24.2023.03.03.12.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 12:05:12 -0800 (PST)
Message-ID: <09db99bd-894a-bf17-3d3d-f8bd100fb5be@ventanamicro.com>
Date: Fri, 3 Mar 2023 17:05:08 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] target/riscv: cpu: Implement get_arch_id callback
To: Mayuresh Chitale <mchitale@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair.francis@wdc.com, Anup Patel <apatel@ventanamicro.com>
References: <20230303065055.915652-1-mchitale@ventanamicro.com>
 <20230303065055.915652-2-mchitale@ventanamicro.com>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230303065055.915652-2-mchitale@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x35.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 3/3/23 03:50, Mayuresh Chitale wrote:
> 
> Implement the callback for getting the architecture-dependent CPU ID ie
> mhartid.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   target/riscv/cpu.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 0dd2f0c753..467d8467a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -1243,6 +1243,13 @@ static const char *riscv_gdb_get_dynamic_xml(CPUState *cs, const char *xmlname)
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> +static int64_t riscv_get_arch_id(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +
> +    return cpu->env.mhartid;
> +}
> +
>   #include "hw/core/sysemu-cpu-ops.h"
>   
>   static const struct SysemuCPUOps riscv_sysemu_ops = {
> @@ -1297,6 +1304,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>       cc->disas_set_info = riscv_cpu_disas_set_info;
>   #ifndef CONFIG_USER_ONLY
>       cc->sysemu_ops = &riscv_sysemu_ops;
> +    cc->get_arch_id = riscv_get_arch_id;
>   #endif
>       cc->gdb_arch_name = riscv_gdb_arch_name;
>       cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;

