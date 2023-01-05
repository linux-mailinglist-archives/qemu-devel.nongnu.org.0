Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C673665E535
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 06:43:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDJ0q-0005UG-3o; Thu, 05 Jan 2023 00:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDJ0o-0005U3-HA
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:41:58 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDJ0m-00022p-Tx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 00:41:58 -0500
Received: by mail-pj1-x102a.google.com with SMTP id v23so38774348pju.3
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 21:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1yhk/T4NYW5fKyx7h9IiuJtkLssmwFIfM2Q7iJp/f+0=;
 b=FeLARY2Gs72NfSSZWM2o2Mgn1I+oeDZu1pNcsP5blfZcrk8+FYRuvd7v9yixNc5bxD
 zIYNgS8UIB83qTzkAR9Xwk98QCS7qXbSN8FcCfx0AsbP+IZH95hWJhqcaNXR7+jLCaEQ
 2OumcCyzo35eEGeX862SNj1BuOX0DbkZivBQ4iq8XXd8A2BRtkGjeLpfkeZ8pYoODVmD
 EySgiLffmOQEoskpq37v+q2z7DibqIPKXArsvK2f8SSlaG+n81K4o8n9e8YtJL9JpI0n
 FvLTMU5ELHDK2XOWlBHe4QIQNcHaU3SnF7BRsesIGce8N0V32L/8NIwpqGa9pgKT1z/f
 xr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1yhk/T4NYW5fKyx7h9IiuJtkLssmwFIfM2Q7iJp/f+0=;
 b=nvoVSOhrKiEKRis1Jo8LvccAq8P2lKipn+/+wyLUotEi0cgBQtn4u2WfG4mzHz5cRl
 zYqBigYt4n8hvYHpJQpQC86yS2IZCrwRI6ZRh73jNX05nmQXoHJ+YFBUU6qxcHvXLaln
 xXIUkTVvdfCIo/asvYAoL3Hc2UZK2M2+Dqt6y6JHdmdqH4l8XMSWbnCv6TDcEiHAGUfO
 y5LgwQXTsnuyXcWGCF3UuTIG7TH7xsSH+ruMcQKpdCfGqyJZxjHqxJSVmrK6VhV0iWlG
 NNAsrjdLATR35769BJv1VmqyLzQNqyHZNh2gFBZUtxvRVDB90rxcVFLQoGpc9dqyxYyA
 Lkbw==
X-Gm-Message-State: AFqh2krZ1H0Yny6EtsGDx8nOOZR0YYJ9bkjzc/wLUxd4G1HeCXW15LhW
 8AlHELqN9NM7qB7thPED1lfezA==
X-Google-Smtp-Source: AMrXdXt95q1obFLYIKvPsTF9oyYC0aj53fVZWSxd5iK3aZ2LLAXllmWo9LBn5TsLNyesy0XlVx68aA==
X-Received: by 2002:a17:902:b116:b0:191:1131:da2 with SMTP id
 q22-20020a170902b11600b0019111310da2mr50485979plr.27.1672897311629; 
 Wed, 04 Jan 2023 21:41:51 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:5a62:efe5:94a2:1dee?
 ([2602:47:d48c:8101:5a62:efe5:94a2:1dee])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a170902f15300b00189fdadef9csm25217490plb.107.2023.01.04.21.41.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 21:41:51 -0800 (PST)
Message-ID: <a07b1be0-7ee2-9b7b-a2d7-7d2435f25007@linaro.org>
Date: Wed, 4 Jan 2023 21:41:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: ARM: ptw.c:S1_ptw_translate
Content-Language: en-US
To: Sid Manning <sidneym@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "philmd@linaro.org" <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>
References: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <BYAPR02MB550905E891B95879D05846B9BEF59@BYAPR02MB5509.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 1/4/23 08:55, Sid Manning wrote:
> ptw.c:S1_ptw_translate
> 
> After migrating to v7.2.0, an issue was found where we were not getting the correct 
> virtual address from a load insn.  Reading the address used in the load insn from the 
> debugger resulted in the execution of the insn getting the correct value but simply 
> stepping over the insn did not.
> 
> This is the instruction:
> 
> ldr           x0, [x1, #24]
> 
> The debug path varies based on the regime and if regime is NOT stage two out_phys is set 
> to addr if the regime is stage 2 then out_phys is set to s2.f.phys_addr.  In the non-debug 
> path out_phys is always set to full->phys_addr.
> 
> I got around this by only using full->phys_addr if regime_is_stage2 was true:
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> 
> index 3745ac9723..87bc6754a6 100644
> 
> --- a/target/arm/ptw.c
> 
> +++ b/target/arm/ptw.c
> 
> @@ -266,7 +266,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
> 
>           if (unlikely(flags & TLB_INVALID_MASK)) {
> 
>               goto fail;
> 
>           }
> 
> -        ptw->out_phys = full->phys_addr;
> 
> +
> 
> +        if (regime_is_stage2(s2_mmu_idx)) {
> 
> +            ptw->out_phys = full->phys_addr;
> 
> +        } else {
> 
> +            ptw->out_phys = addr;
> 
> +        }
> 
>           ptw->out_rw = full->prot & PAGE_WRITE;
> 
>           pte_attrs = full->pte_attrs;
> 
>           pte_secure = full->attrs.secure;
> 
> This change got me the answer I wanted but I’m not familiar enough with the code to know 
> if this is correct or not.

This is incorrect.  If you are getting the wrong value here, then something has gone wrong 
elsewhere, as the s2_mmu_idx result was logged.

Do you have a test case you can share?


r~

