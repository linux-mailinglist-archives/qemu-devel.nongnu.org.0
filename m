Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E21629B
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 13:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNxza-00045G-JW
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 07:10:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNxyO-0003ho-Di
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hNxyM-00014Q-Qj
	for qemu-devel@nongnu.org; Tue, 07 May 2019 07:09:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53364)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hNxyM-00013h-Ie; Tue, 07 May 2019 07:09:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D9F0C04B2C0;
	Tue,  7 May 2019 11:09:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3D5F6063B;
	Tue,  7 May 2019 11:09:20 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id B80D31132B35; Tue,  7 May 2019 13:09:17 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
References: <20190501053522.10967-1-sjitindarsingh@gmail.com>
Date: Tue, 07 May 2019 13:09:17 +0200
In-Reply-To: <20190501053522.10967-1-sjitindarsingh@gmail.com> (Suraj Jitindar
	Singh's message of "Wed, 1 May 2019 15:35:21 +1000")
Message-ID: <87woj2cyhu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 11:09:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/2] monitor: Add dump-stack command
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:

> Add a monitor command "dump-stack" to be used to dump the stack for the
> current cpu.

I guess this is just for debugging.  Correct?

Shouldn't this be "info stack", to match "info registers" and "info
cpustats"?

>
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
> ---
>  hmp-commands.hx   | 13 +++++++++++++
>  hmp.h             |  1 +
>  include/qom/cpu.h | 10 ++++++++++
>  monitor.c         | 12 ++++++++++++
>  qom/cpu.c         | 10 ++++++++++
>  5 files changed, 46 insertions(+)
>
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 9b4035965c..965ccdea28 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -862,6 +862,19 @@ ETEXI
>      },
>  
>  STEXI
> +@item dump-stack
> +@findex dump-stack
> +dump stack of the cpu
> +ETEXI
> +    {
> +        .name           = "dump-stack",
> +        .args_type      = "",
> +        .params         = "",
> +        .help           = "dump stack",
> +        .cmd            = hmp_dumpstack,
> +    },
> +
> +STEXI
>  @item pmemsave @var{addr} @var{size} @var{file}
>  @findex pmemsave
>  save to disk physical memory dump starting at @var{addr} of size @var{size}.
> diff --git a/hmp.h b/hmp.h
> index 43617f2646..e6edf1215c 100644
> --- a/hmp.h
> +++ b/hmp.h
> @@ -51,6 +51,7 @@ void hmp_announce_self(Monitor *mon, const QDict *qdict);
>  void hmp_cpu(Monitor *mon, const QDict *qdict);
>  void hmp_memsave(Monitor *mon, const QDict *qdict);
>  void hmp_pmemsave(Monitor *mon, const QDict *qdict);
> +void hmp_dumpstack(Monitor *mon, const QDict *qdict);
>  void hmp_ringbuf_write(Monitor *mon, const QDict *qdict);
>  void hmp_ringbuf_read(Monitor *mon, const QDict *qdict);
>  void hmp_cont(Monitor *mon, const QDict *qdict);
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 08abcbd3fe..f2e83e9918 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -181,6 +181,7 @@ typedef struct CPUClass {
>      int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
>                             uint8_t *buf, int len, bool is_write);
>      void (*dump_state)(CPUState *cpu, FILE *, int flags);
> +    void (*dump_stack)(CPUState *cpu, FILE *f);
>      GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
>      void (*dump_statistics)(CPUState *cpu, int flags);
>      int64_t (*get_arch_id)(CPUState *cpu);
> @@ -568,6 +569,15 @@ enum CPUDumpFlags {
>  void cpu_dump_state(CPUState *cpu, FILE *f, int flags);
>  
>  /**
> + * cpu_dump_stack:
> + * @cpu: The CPU whose stack is to be dumped.
> + * @f: If non-null, dump to this stream, else to current print sink.
> + *
> + * Dumps CPU stack.
> + */
> +void cpu_dump_stack(CPUState *cpu, FILE *f);
> +
> +/**
>   * cpu_dump_statistics:
>   * @cpu: The CPU whose state is to be dumped.
>   * @flags: Flags what to dump.
> diff --git a/monitor.c b/monitor.c
> index 9b5f10b475..dbec2e4376 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -1299,6 +1299,18 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>      }
>  }
>  
> +void hmp_dumpstack(Monitor *mon, const QDict *qdict)
> +{
> +    CPUState *cs = mon_get_cpu();
> +
> +    if (!cs) {
> +        monitor_printf(mon, "No CPU available\n");
> +        return;
> +    }
> +
> +    cpu_dump_stack(cs, NULL);
> +}
> +
>  #ifdef CONFIG_TCG
>  static void hmp_info_jit(Monitor *mon, const QDict *qdict)
>  {
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 3c5493c96c..0dc10004f4 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -230,6 +230,16 @@ void cpu_dump_state(CPUState *cpu, FILE *f, int flags)
>      }
>  }
>  
> +void cpu_dump_stack(CPUState *cpu, FILE *f)
> +{
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +
> +    if (cc->dump_stack) {
> +        cpu_synchronize_state(cpu);
> +        cc->dump_stack(cpu, f);
> +    }
> +}

Silently does nothing when the CPU doesn't implement dump_stack().
Matches "info registers" and "info cpustats".  Awful UI, but at least
it's consistently awful.

> +
>  void cpu_dump_statistics(CPUState *cpu, int flags)
>  {
>      CPUClass *cc = CPU_GET_CLASS(cpu);

