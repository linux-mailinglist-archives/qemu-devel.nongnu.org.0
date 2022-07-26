Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF45808BD
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 02:30:45 +0200 (CEST)
Received: from localhost ([::1]:47788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG8TD-0004tf-Jx
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 20:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oG8Qg-0003R4-Im
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 20:28:06 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oG8Qa-00083H-DW
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 20:28:02 -0400
Received: by mail-pl1-x635.google.com with SMTP id d7so11870703plr.9
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 17:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Qz/cy3HL/RoAGnL/jYBGSG5Z76juYn9PE+BUIdkwQ3E=;
 b=5SCgoDSbB8hE1vZ2RCdm+H6iRCZbTQq4BBitchNQWGpNqjbnwd4vep2ghrsC5dtrR3
 PwBzYpxXVUYfBI/mzeDaWBvX8h/LAkeOGxhpQWiLKQtXxC0/K0YHiQQk46U3XpgqBDc1
 MO8Ir+tVXR+FFdoHM68f7MkohlmJ04t6UnQCpqz9+J141QQfObzaCSWKZPGZ8fk5YsOO
 ZdpOIdHm2IFugXjNTKcVEKWLHztvvTs/WB1Ke/VA1W5N+bKcFz7+kvSRnXot1XMDsv31
 3agSMYEO//BW0yJGIVjgCPU5TXVJj5Lld1FIjXpSxmYx05Sblf9ryABWqF5eubo/jRAc
 gBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Qz/cy3HL/RoAGnL/jYBGSG5Z76juYn9PE+BUIdkwQ3E=;
 b=7qHdw0GWbuqks0QKv2L12a9Uv/Ok32kTBLjAiZS9XnGB8WFJHX1jpE7zpX531GTADD
 8Uw2LjsWla3HrKlCmaZozBTm5+L/DsMZkjYOtij3M9S/CZV1lMpk790Q5zxy+xOe9Icr
 ty1IpzNKlK6+SjKDnBz/xa5S58PfKUJIHtlVamJ7v3GEiZuYKSVHOI9nLL5GX3PowpU4
 zeiMzLzEZXQa99EllapoSJtAhW7/5ML0ezrFeaJqZvkwJZXsXoGREpZtKYIpcW3phUnl
 NMvE7gOk71WjBvQs+KU/W3lkLZu7gbmfEqg81QVDrZ6IhgPCdiAMJlVE9oG23Bqrc0L8
 3Q3A==
X-Gm-Message-State: AJIora8oSYS9bHPIzbBS2uMHQuCI0Anlco3f54T29Ws9D1Tr/Qr/AaOk
 +WKJbk9e458gkmPEqSpEAVEoPw==
X-Google-Smtp-Source: AGRyM1vIfFX/RMsArp9PLP4WlcKvgmxoKXcwPklFhPkV3e4lOxxzX6YfEt27D3SZ9dE4l9NFJno5zw==
X-Received: by 2002:a17:903:1209:b0:16c:ece7:f68b with SMTP id
 l9-20020a170903120900b0016cece7f68bmr14522554plh.112.1658795277705; 
 Mon, 25 Jul 2022 17:27:57 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 y28-20020aa7943c000000b0052b94e757ecsm10161835pfo.213.2022.07.25.17.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 17:27:57 -0700 (PDT)
Message-ID: <e61bdd4f-7799-5c87-cdab-1988c4613900@bytedance.com>
Date: Tue, 26 Jul 2022 08:22:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: PING: [PATCH] monitor: Support specified vCPU registers
Content-Language: en-US
To: dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, armbru@redhat.com
References: <20220719075544.932927-1-pizhenwei@bytedance.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20220719075544.932927-1-pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PING!

On 7/19/22 15:55, zhenwei pi wrote:
> Originally we have to get all the vCPU registers and parse the
> specified one. To improve the performance of this usage, allow user
> specified vCPU id to query registers.
> 
> Run a VM with 16 vCPU, use bcc tool to track the latency of
> 'hmp_info_registers':
> 'info registers -a' uses about 3ms;
> 'info register 12' uses about 150us.
> 
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>   hmp-commands-info.hx |  6 +++---
>   monitor/misc.c       | 19 +++++++++++++++++++
>   2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 3ffa24bd67..6023e2b5c5 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,9 @@ ERST
>   
>       {
>           .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a] [vcpu]",
> +        .help       = "show the cpu registers (-a: all - show register info for all cpus; vcpu: vCPU to query)",
>           .cmd        = hmp_info_registers,
>       },
>   
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..b12309faad 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>   static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>   {
>       bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>       CPUState *cs;
>   
>       if (all_cpus) {
> @@ -314,6 +315,24 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>               monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>               cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>           }
> +    } else if (vcpu >= 0) {
> +        CPUState *target_cs = NULL;
> +
> +        CPU_FOREACH(cs) {
> +            if (cs->cpu_index == vcpu) {
> +                target_cs = cs;
> +                break;
> +            }
> +        }
> +
> +        if (!target_cs) {
> +            monitor_printf(mon, "CPU#%d not available\n", vcpu);
> +            return;
> +        }
> +
> +        monitor_printf(mon, "\nCPU#%d\n", target_cs->cpu_index);
> +        cpu_dump_state(target_cs, NULL, CPU_DUMP_FPU);
> +        return;
>       } else {
>           cs = mon_get_cpu(mon);
>   

-- 
zhenwei pi

