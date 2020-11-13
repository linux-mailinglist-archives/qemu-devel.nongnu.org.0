Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554F2B1815
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:21:12 +0100 (CET)
Received: from localhost ([::1]:36258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVGZ-0003Zd-F2
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVDw-0001pX-EO
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:18:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVDu-0007iH-I2
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605259105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bnz3pAvkPtlawDlSH72tjgJ7Z1m9ku7cylXL0vIdg7g=;
 b=bdLkrEFDhiLAKjE74OJNJ033OtESix+s/FJX59PxlFOhdPE7osc5/xc9Xb6sN3ghh0Rv8D
 cYGHCE9kgL18ZjYvjI4uS3qu0vL0XVBdS0xQUDmaDWKuNvfIc6Cn5b75/JUA9fwd0EXGVJ
 q5cyXq4XWZVxXqft8Z2+LjmYXIyzvsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-nOjAxVxzMLqIF4445mgAZQ-1; Fri, 13 Nov 2020 04:18:23 -0500
X-MC-Unique: nOjAxVxzMLqIF4445mgAZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13ED0807326;
 Fri, 13 Nov 2020 09:18:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 417626EF6D;
 Fri, 13 Nov 2020 09:18:19 +0000 (UTC)
Date: Fri, 13 Nov 2020 10:18:18 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: lichun <lichun@ruijie.com.cn>
Subject: Re: [PATCH] hmp: Update current monitor acts on the entire
 handle_hmp_command()
Message-ID: <20201113091818.GA5834@merkur.fritz.box>
References: <1605266020-51470-1-git-send-email-lichun@ruijie.com.cn>
MIME-Version: 1.0
In-Reply-To: <1605266020-51470-1-git-send-email-lichun@ruijie.com.cn>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.11.2020 um 12:13 hat lichun geschrieben:
> monitor_parse_arguments() also need to known the current monitoar:
>  (gdb) bt
>  #0  0x0000555555ac6a6d in mon_get_cpu_sync (mon=0x0, synchronize=synchronize@entry=true) at ../monitor/misc.c:270
>  #1  0x0000555555ac6b4a in mon_get_cpu () at ../monitor/misc.c:294
>  #2  0x0000555555ac80fd in get_monitor_def (pval=pval@entry=0x7fffffffcc78, name=name@entry=0x7fffffffcc80 "pc") at ../monitor/misc.c:1669
>  #3  0x000055555583fa8a in expr_unary (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:387
>  #4  0x000055555583fb32 in expr_prod (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:421
>  #5  0x000055555583fbcc in expr_logic (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:455
>  #6  0x000055555583f82c in expr_sum (mon=mon@entry=0x5555568a75a0) at ../monitor/hmp.c:484
>  #7  0x000055555583fc97 in get_expr (mon=mon@entry=0x5555568a75a0, pval=pval@entry=0x7fffffffce18, pp=pp@entry=0x7fffffffce08) at ../monitor/hmp.c:511
>  #8  0x00005555558409b1 in monitor_parse_arguments (mon=mon@entry=0x5555568a75a0, cmd=0x555556561e40 <hmp_cmds+7040>, cmd=0x555556561e40 <hmp_cmds+7040>, endp=0x7fffffffd288) at ../monitor/hmp.c:876
>  #9  0x0000555555841796 in handle_hmp_command (mon=mon@entry=0x5555568a75a0, cmdline=0x5555568b12b3 "$pc", cmdline@entry=0x5555568b12b0 "xp $pc") at ../monitor/hmp.c:1073
> Therefore update current monitor as soon as possible to avoid
> hmp/xp command failure.
> 
> Fixes: ff04108a0e36 ("hmp: Update current monitor only in handle_hmp_command()")
> Signed-off-by: lichun <lichun@ruijie.com.cn>
> ---
>  monitor/hmp.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index c5cd9d3..ee5413e 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -1072,52 +1072,52 @@ static void handle_hmp_command_co(void *opaque)
>  }
>  
>  void handle_hmp_command(MonitorHMP *mon, const char *cmdline)
>  {
>      QDict *qdict;
>      const HMPCommand *cmd;
>      const char *cmd_start = cmdline;
>  
>      trace_handle_hmp_command(mon, cmdline);
>  
> +    /* old_mon is non-NULL when called from qmp_human_monitor_command() */
> +    Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
> +
>      cmd = monitor_parse_command(mon, cmdline, &cmdline, hmp_cmds);
>      if (!cmd) {
>          return;
>      }

Now the monitor isn't changed back in all early return cases.

>  
>      qdict = monitor_parse_arguments(&mon->common, &cmdline, cmd);
>      if (!qdict) {
>          while (cmdline > cmd_start && qemu_isspace(cmdline[-1])) {
>              cmdline--;
>          }
>          monitor_printf(&mon->common, "Try \"help %.*s\" for more information\n",
>                         (int)(cmdline - cmd_start), cmd_start);
>          return;
>      }
>  
>      if (!cmd->coroutine) {
> -        /* old_mon is non-NULL when called from qmp_human_monitor_command() */
> -        Monitor *old_mon = monitor_set_cur(qemu_coroutine_self(), &mon->common);
>          cmd->cmd(&mon->common, qdict);
> -        monitor_set_cur(qemu_coroutine_self(), old_mon);
>      } else {
>          HandleHmpCommandCo data = {
>              .mon = &mon->common,
>              .cmd = cmd,
>              .qdict = qdict,
>              .done = false,
>          };
>          Coroutine *co = qemu_coroutine_create(handle_hmp_command_co, &data);
> -        monitor_set_cur(co, &mon->common);

Removing this line is wrong, we still need to set the current monitor
for co, which is not qemu_coroutine_self() self.

>          aio_co_enter(qemu_get_aio_context(), co);
>          AIO_WAIT_WHILE(qemu_get_aio_context(), !data.done);
>      }
> +    monitor_set_cur(qemu_coroutine_self(), old_mon);
>  
>      qobject_unref(qdict);
>  }

With the above bugs fixed, this approach is one option to fix the bug.

Personally, if it's possible with reasonable effort, I would prefer the
other way, which is making sure that monitor_cur() isn't used, but the
Monitor pointer is just passed down.  This would be a bigger change, but
it wouldn't only fix the bug, but also clean up the code and make it
more maintainable.

I can try to write a patch series to do it this way and see how it goes.

Kevin


