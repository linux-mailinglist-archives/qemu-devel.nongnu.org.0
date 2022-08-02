Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D466587786
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 09:07:35 +0200 (CEST)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIm05-0001Pj-Vl
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 03:07:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIlsz-0004vX-Ls
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:00:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oIlss-0007Jt-TD
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:00:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659423605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vxVpJPayAoomTJ/75URDrzNszeQjBE2PhvZPM+k54JM=;
 b=dDrjqZBLnxiHq9UbN4u+4ZDNXdQ8xVxolY6xfm5NNLBA3YSi78djegOD1anRn1vQ8TWtN4
 hfxP/ZJxZ30kZGTOSTvKtNz/3iHgmokqxsvCS+VjCIE9p21kudIOzrRijNJIPl4rBFOaHz
 CrvntsTIZskWcsh7rHFkUALvmV5/fjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-GVlGaBSjNjWQ4JT2vdaN6Q-1; Tue, 02 Aug 2022 03:00:04 -0400
X-MC-Unique: GVlGaBSjNjWQ4JT2vdaN6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0741885A588;
 Tue,  2 Aug 2022 07:00:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C97E0C15D4F;
 Tue,  2 Aug 2022 07:00:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 81D2D21E6930; Tue,  2 Aug 2022 09:00:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org,  darren.kenny@oracle.com
Subject: Re: [PATCH v3 1/1] monitor: Support specified vCPU registers
References: <20220802011756.1227808-1-pizhenwei@bytedance.com>
 <20220802011756.1227808-2-pizhenwei@bytedance.com>
Date: Tue, 02 Aug 2022 09:00:02 +0200
In-Reply-To: <20220802011756.1227808-2-pizhenwei@bytedance.com> (zhenwei pi's
 message of "Tue, 2 Aug 2022 09:17:56 +0800")
Message-ID: <87les79ll9.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>  hmp-commands-info.hx |  8 +++++---
>  monitor/misc.c       | 10 ++++++++--
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 188d9ece3b..dee072ac37 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -100,9 +100,11 @@ ERST
>  
>      {
>          .name       = "registers",
> -        .args_type  = "cpustate_all:-a",
> -        .params     = "[-a]",
> -        .help       = "show the cpu registers (-a: all - show register info for all cpus)",
> +        .args_type  = "cpustate_all:-a,vcpu:i?",
> +        .params     = "[-a|vcpu]",
> +        .help       = "show the cpu registers (-a: all - show register info for all cpus;"

Suggest to drop "all - ".

> +                      " vcpu: specific vCPU to query; show the current CPU's registers if"
> +                      " no argument is specified)",
>          .cmd        = hmp_info_registers,
>      },
>  
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..74f7c4ea36 100644
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
> @@ -315,13 +316,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>              cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>          }
>      } else {
> -        cs = mon_get_cpu(mon);
> +        cs = vcpu >= 0 ? qemu_get_cpu(vcpu) : mon_get_cpu(mon);
>  
>          if (!cs) {
> -            monitor_printf(mon, "No CPU available\n");
> +            if (vcpu >= 0) {
> +                monitor_printf(mon, "\nCPU#%d not available\n", vcpu);

Please drop the initial '\n'.

> +            } else {
> +                monitor_printf(mon, "No CPU available\n");
> +            }
>              return;
>          }
>  
> +        monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
>          cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
>      }
>  }

With the error message tweaked:
Reviewed-by: Markus Armbruster <armbru@redhat.com>


