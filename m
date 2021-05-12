Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C25837D3A1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 20:42:26 +0200 (CEST)
Received: from localhost ([::1]:48088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgtoP-0003dz-Lv
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 14:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtfn-0000CU-DV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:33:31 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:39529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgtfj-0002Qn-Nh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 14:33:31 -0400
Received: by mail-qk1-x734.google.com with SMTP id k127so23185279qkc.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 11:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PrtLMdCLrDvNSkRnEd7TW+fTSybfG9dSZ3XHSlLmP2U=;
 b=XW+QfNFv+ii/7xJl8qbZbD2sXQrGRZlG1aS//YIH1GyTgUrLB/9/KHmgHQ8682k2wd
 nCqN/hQo+M0ebjA87rv0tFl2CWbPrsdgO2mi9fYba7kfOfVnC/Fna3VH3U+r0dmrgo/H
 KMXs3kW6aeVDwdLsi1PQBphWfAfUfHdnDh2fEbTD0AGJ0a/b97tKS7g8QRlVVjbVU5Yy
 bDOVMj+mRtkSyBZwOhhwAm2fkAcja3tENQ14XYJ3E7AQ0PDYZAS+3mA9ZQgLy7Vgo2UF
 YbRTuoFMzzSdSiWFsFeDGTBCyQaQWQ1d1mDOadLH9Fv8oXZSk816l2c+iSOlzyMnHIYi
 0GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PrtLMdCLrDvNSkRnEd7TW+fTSybfG9dSZ3XHSlLmP2U=;
 b=OU832d8vyLH6MMo3vvKIj1grRCXY+MApqFftDPU1cCk5/CjImUd5+sVo05pp3LKdjV
 66sNrE9ptbkxXkUja5yFnshpHcqqSwd+lja3XghDs3xuYsWD10X5txA6N1xy5be9ur0m
 zomiqnNdqSj4ICZMdJANNbJCWA3Tv6RMIVcE365r0Je+j9JhPiZ0Hd5gzxZFE7vVRLYh
 E8IJqUnYucDW0ROha+vNA8WsZU76JiEZLJobOnYppuygXlW81aXLD0UNv86Fe+fJq9Fq
 Ta9vd8vW/803hJ6jheWV0FE3cBnjAvb1Jht/G9+/lC2lGqMi0fwR9z3C78ztv/JvGyob
 8fCQ==
X-Gm-Message-State: AOAM5308/GYCz2htc11ZLhz6NmdMKKnZlISNxVCJFBZfejxQfSmVlmNc
 Znm8+vNfvLIQrGqrgJWj5e5naA==
X-Google-Smtp-Source: ABdhPJwfsrz8D254Uub+PEHpigFo0ZRVoO4eT6+RQPQ8on7nePgj04rvWOgowVfyqYcVeh2q3+DWlw==
X-Received: by 2002:a05:620a:753:: with SMTP id
 i19mr19987922qki.320.1620844406602; 
 Wed, 12 May 2021 11:33:26 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id m190sm616227qke.107.2021.05.12.11.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 11:33:26 -0700 (PDT)
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
To: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>,
 qemu-devel@nongnu.org
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
Date: Wed, 12 May 2021 13:33:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x734.google.com
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
Cc: farosas@linux.ibm.com, luis.pires@eldorado.org.br,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index ba100793a7..ce287222ee 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
>   #define IN_HELPER_PROTO
>   
>   #include "helper.h"
> +#ifdef CONFIG_TCG
>   #include "trace/generated-helpers.h"
> +#endif
>   #include "accel/tcg/tcg-runtime.h"
>   #include "accel/tcg/plugin-helpers.h"
>   

Um.. this file is exclusively TCG already.
Are you missing some use of helper_foo()?


> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index d0fa219880..9d72dc49cf 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -1204,11 +1204,13 @@ static void register_BookE206_sprs(CPUPPCState *env, uint32_t mas_mask,
>       /* TLB assist registers */
>       /* XXX : not implemented */
>       for (i = 0; i < 8; i++) {
> +#ifdef CONFIG_TCG
>           void (*uea_write)(DisasContext *ctx, int sprn, int gprn) =
>               &spr_write_generic32;
>           if (i == 2 && (mas_mask & (1 << i)) && (env->insns_flags & PPC_64B)) {
>               uea_write = &spr_write_generic;
>           }
> +#endif

You could move this condition into

>           if (mas_mask & (1 << i)) {
>               spr_register(env, mas_sprn[i], mas_names[i],
>                            SPR_NOACCESS, SPR_NOACCESS,

... the call here, so that it all automatically compiles out:

   spr_register(env, ...,
                spr_read_generic,
                (i == 2 && (env->insns_flags & PPC_64B)
                 ? spr_write_generic : spr_write_generic32),
                0x00000000);

> @@ -8606,7 +8608,9 @@ static void ppc_cpu_realize(DeviceState *dev, Error **errp)
>           }
>       }
>   
> +#ifdef CONFIG_TCG
>       create_ppc_opcodes(cpu, &local_err);
> +#endif
>       if (local_err != NULL) {
>           error_propagate(errp, local_err);
>           goto unrealize;

Include the error checking into the ifdef.


> @@ -8799,7 +8803,9 @@ static void ppc_cpu_unrealize(DeviceState *dev)
>   
>       cpu_remove_sync(CPU(cpu));
>   
> +#ifdef CONFIG_TCG
>       destroy_ppc_opcodes(cpu);
> +#endif
>   }
>   
>   static gint ppc_cpu_compare_class_pvr(gconstpointer a, gconstpointer b)
> @@ -9297,7 +9303,9 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
>       cc->class_by_name = ppc_cpu_class_by_name;
>       cc->has_work = ppc_cpu_has_work;
>       cc->dump_state = ppc_cpu_dump_state;
> +#ifdef CONFIG_TCG
>       cc->dump_statistics = ppc_cpu_dump_statistics;
> +#endif

We should just drop this entirely.  It's supposedly a generic thing, but only 
used by ppc.  But even then only with source modification to enable 
DO_PPC_STATISTICS.  And even then as we convert to decodetree, said statistics 
will not be collected.

We should delete everything from cpu_dump_statistics on down.


r~

