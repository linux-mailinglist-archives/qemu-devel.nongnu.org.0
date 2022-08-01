Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817B586C39
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 15:47:43 +0200 (CEST)
Received: from localhost ([::1]:45398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIVll-0004g7-B6
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 09:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIVYJ-0004vJ-IE
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:33:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIVYF-0002p8-6G
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 09:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659360822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F2eqYwL3ZWrMBehEPflCVp1/MA5FBoPg10z2gDOAqzI=;
 b=Y8MqOsgV2YOamUqh5vlT19HwdYV3dozU77VswKmuA5ktOtl5DlHJv3VcsbF8/2iSBC4OR6
 EIg8Ze4K5f2CrG6ZxOz+aJc+tsvOU8o761TGcwi1P0TRgG6czYjbgySbUPT/0ivRdzN/kI
 JqNwniGSpYUctxn7g30Q98zY2RbCFFk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-fFkcb2KzOTGJ1cckUnlOPw-1; Mon, 01 Aug 2022 09:33:38 -0400
X-MC-Unique: fFkcb2KzOTGJ1cckUnlOPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A953821C05;
 Mon,  1 Aug 2022 13:33:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C88B18EA8;
 Mon,  1 Aug 2022 13:33:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7429821E6930; Mon,  1 Aug 2022 15:33:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org,  armbru@redhat.com,  Darren
 Kenny <darren.kenny@oracle.com>
Subject: Re: [PATCH v2 1/1] monitor: Support specified vCPU registers
References: <20220727005123.1093478-1-pizhenwei@bytedance.com>
 <20220727005123.1093478-2-pizhenwei@bytedance.com>
Date: Mon, 01 Aug 2022 15:33:36 +0200
In-Reply-To: <20220727005123.1093478-2-pizhenwei@bytedance.com> (zhenwei pi's
 message of "Wed, 27 Jul 2022 08:51:23 +0800")
Message-ID: <877d3sdr67.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

zhenwei pi <pizhenwei@bytedance.com> writes:

> Originally we have to get all the vCPU registers and parse the
> specified one. To improve the performance of this usage, allow user
> specified vCPU id to query registers.
>
> Run a VM with 16 vCPU, use bcc tool to track the latency of
> 'hmp_info_registers':
> 'info registers -a' uses about 3ms;
> 'info registers 12' uses about 150us.
>
> Cc: Darren Kenny <darren.kenny@oracle.com>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  hmp-commands-info.hx |  7 ++++---
>  monitor/misc.c       | 18 ++++++++++++++++++
>  2 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 3ffa24bd67..7a00b4ded3 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,10 @@ ERST
>  
>      {
>          .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a|vcpu]",
> +        .help       = "show the cpu registers (-a: all - show register info for all cpus;"
> +                      " vcpu: specific vCPU to query)",

Recommend to document explicitly that it shows the current CPU's
registers when no argument is specified.

>          .cmd        = hmp_info_registers,
>      },
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..8e1d4840f2 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -307,6 +307,7 @@ int monitor_get_cpu_index(Monitor *mon)
>  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>  {
>      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> +    int vcpu = qdict_get_try_int(qdict, "vcpu", -1);
>      CPUState *cs;
>  
>      if (all_cpus) {
> @@ -314,6 +315,23 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
> +    } else if (vcpu >= 0) {
> +        CPUState *target_cs = NULL;
> +
> +        CPU_FOREACH(cs) {
> +            if (cs->cpu_index == vcpu) {
> +                target_cs = cs;
> +                break;
> +            }
> +        }

Please use qemu_get_cpu().

> +
> +        if (!target_cs) {
> +            monitor_printf(mon, "CPU#%d not available\n", vcpu);
> +            return;
> +        }
> +
> +        monitor_printf(mon, "\nCPU#%d\n", target_cs->cpu_index);
> +        cpu_dump_state(target_cs, NULL, CPU_DUMP_FPU);

We show the CPU number when the user asked for this number, but ...

>      } else {
>          cs = mon_get_cpu(mon);

           if (!cs) {
               monitor_printf(mon, "No CPU available\n");
               return;
           }

           cpu_dump_state(cs, NULL, CPU_DUMP_FPU);

... we don't show it when the user asked for the current CPU.  It's
arguably more relevant then.

       }
   }

Suggest something like

       } else {
           cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);

           if (!cs) {
               monitor_printf(mon, "CPU#%d not available\n", vcpu);
               return;
           }

           monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
           cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
       }


