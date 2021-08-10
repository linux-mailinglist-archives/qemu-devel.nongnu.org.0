Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265F3E52BC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 07:20:46 +0200 (CEST)
Received: from localhost ([::1]:46974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDKBx-0002iu-9f
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 01:20:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDKB2-0001Kq-LP
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:19:48 -0400
Received: from mailout04.t-online.de ([194.25.134.18]:44946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1mDKB0-0004jA-6t
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 01:19:48 -0400
Received: from fwd14.aul.t-online.de (fwd14.aul.t-online.de [172.20.26.242])
 by mailout04.t-online.de (Postfix) with SMTP id 51ECF616E;
 Tue, 10 Aug 2021 07:18:24 +0200 (CEST)
Received: from [192.168.211.200]
 (VT8lHTZXQhueBoouvOi+fdPeVyJR+zey1PuUCsGKoKlgq36vuTQrexF6SbJpYN8w95@[79.208.26.7])
 by fwd14.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1mDK9U-2Fqk9A0; Tue, 10 Aug 2021 07:18:12 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] monitor/hmp: schedule qemu_chr_fe_accept_input() after
 read
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <70e3486e-b486-887b-4d57-44a3fd9766ad@t-online.de>
 <20210807192910.26283-1-vr_qemu@t-online.de>
 <CAJ+F1C+xz_R6gPV6NH0QfsoNLC2hndF8d0FvLqXmL6FJFq9v5g@mail.gmail.com>
Message-ID: <1ff59e4a-b520-c365-a017-0f8095a64e25@t-online.de>
Date: Tue, 10 Aug 2021 07:18:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1C+xz_R6gPV6NH0QfsoNLC2hndF8d0FvLqXmL6FJFq9v5g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ID: VT8lHTZXQhueBoouvOi+fdPeVyJR+zey1PuUCsGKoKlgq36vuTQrexF6SbJpYN8w95
X-TOI-EXPURGATEID: 150726::1628572692-00000BC0-D7CD0B33/0/0 CLEAN NORMAL
X-TOI-MSGID: 31498606-97bb-4242-91e8-9b0e4cbdbfce
Received-SPF: none client-ip=194.25.134.18; envelope-from=vr_qemu@t-online.de;
 helo=mailout04.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>     Since commit 584af1f1d9 (ui/gtk: add a keyboard fifo to the VTE
>     consoles) a GTK VTE console chardev backend relies on the
>     connected chardev frontend to call qemu_chr_fe_accept_input()
>     whenever it can receive new characters. The HMP monitor doesn't
>     do this. It only schedules a call to qemu_chr_fe_accept_input()
>     after it handled a HMP command in monitor_command_cb().
>
>     This is a problem if you paste a few characters into the GTK
>     monitor console. Even entering a UTF-8 multibyte character leads
>     to the same problem.
>
>     Schedule a call to qemu_chr_fe_accept_input() after handling the
>     received bytes to fix the HMP monitor.
>
>     Signed-off-by: Volker Rümelin <vr_qemu@t-online.de
>     <mailto:vr_qemu@t-online.de>>
>
>
> Wouldn't it work to make gd_vc_send_chars() write in a loop (until it 
> fails)?

Hi Marc-André,

yes that works. I found similar code in the udp_chr_flush_buffer() 
function in chardev/char-udp.c. I will send a new patch within the next 
few hours.

With best regards,
Volker

>
> If not, I think monitor/qmp.c should be adjusted too.
>
>     ---
>      monitor/hmp.c              |  1 +
>      monitor/monitor-internal.h |  1 +
>      monitor/monitor.c          | 19 +++++++++++++++++--
>      3 files changed, 19 insertions(+), 2 deletions(-)
>
>     diff --git a/monitor/hmp.c b/monitor/hmp.c
>     index d50c3124e1..470f56a71d 100644
>     --- a/monitor/hmp.c
>     +++ b/monitor/hmp.c
>     @@ -1349,6 +1349,7 @@ static void monitor_read(void *opaque, const
>     uint8_t *buf, int size)
>              for (i = 0; i < size; i++) {
>                  readline_handle_byte(mon->rs, buf[i]);
>              }
>     +        monitor_accept_input(&mon->common);
>          } else {
>              if (size == 0 || buf[size - 1] != 0) {
>                  monitor_printf(&mon->common, "corrupted command\n");
>     diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
>     index 9c3a09cb01..af33c3c617 100644
>     --- a/monitor/monitor-internal.h
>     +++ b/monitor/monitor-internal.h
>     @@ -170,6 +170,7 @@ int monitor_puts(Monitor *mon, const char *str);
>      void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
>                             bool use_io_thread);
>      void monitor_data_destroy(Monitor *mon);
>     +void monitor_accept_input(Monitor *mon);
>      int monitor_can_read(void *opaque);
>      void monitor_list_append(Monitor *mon);
>      void monitor_fdsets_cleanup(void);
>     diff --git a/monitor/monitor.c b/monitor/monitor.c
>     index 46a171bca6..8e3cf4ad98 100644
>     --- a/monitor/monitor.c
>     +++ b/monitor/monitor.c
>     @@ -519,13 +519,28 @@ int monitor_suspend(Monitor *mon)
>          return 0;
>      }
>
>     -static void monitor_accept_input(void *opaque)
>     +static void monitor_accept_input_bh(void *opaque)
>      {
>          Monitor *mon = opaque;
>
>          qemu_chr_fe_accept_input(&mon->chr);
>      }
>
>     +void monitor_accept_input(Monitor *mon)
>     +{
>     +    if (!qatomic_mb_read(&mon->suspend_cnt)) {
>     +        AioContext *ctx;
>     +
>     +        if (mon->use_io_thread) {
>     +            ctx = iothread_get_aio_context(mon_iothread);
>     +        } else {
>     +            ctx = qemu_get_aio_context();
>     +        }
>     +
>     +        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
>     +    }
>     +}
>     +
>      void monitor_resume(Monitor *mon)
>      {
>          if (monitor_is_hmp_non_interactive(mon)) {
>     @@ -547,7 +562,7 @@ void monitor_resume(Monitor *mon)
>                  readline_show_prompt(hmp_mon->rs);
>              }
>
>     -        aio_bh_schedule_oneshot(ctx, monitor_accept_input, mon);
>     +        aio_bh_schedule_oneshot(ctx, monitor_accept_input_bh, mon);
>          }
>
>          trace_monitor_suspend(mon, -1);
>     -- 
>     2.26.2
>
>
>
>
> -- 
> Marc-André Lureau


