Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 444013F4D08
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 17:07:19 +0200 (CEST)
Received: from localhost ([::1]:39860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIBXh-0004lQ-QU
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 11:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBW2-0003Ll-Iy
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:05:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBVx-0000KK-Kx
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 11:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629731128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fmkizdrvLVcOtuv/ptxIlIQH+LETg1GRbkw22Ge71sM=;
 b=IV1wNsTJrFHGhgbdpxLH7NnzbguBV+no8Sjycmc71ou3NXE/1rxjd+ORXUgMDj0rS2guXx
 7yI2naNzYu/RbpoW78dWnl/3ui1sH4HdChGATIXkYTu3+NlADLx6ypd0VGIqZoHMmulqGZ
 4cXvqoPAJ3JYjTLnPCQgK8osaI1SUXo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-WqLo6lc3Plq5VDsBp97IWg-1; Mon, 23 Aug 2021 11:05:25 -0400
X-MC-Unique: WqLo6lc3Plq5VDsBp97IWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y188-20020a1c7dc5000000b002e80e0b2f87so1257wmc.1
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 08:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fmkizdrvLVcOtuv/ptxIlIQH+LETg1GRbkw22Ge71sM=;
 b=OsmNIMARi6VsH5a5fQTSVdfI1k99CJYK3xF0hsW9RSKOOHxTI7a+nGPtQFFG4HOUCY
 0u3XgeR/3bvV7sT04eQ0qeveACnqFgg2+B2MpDoCJ/dvQMUhQQ5C+PUOZ+LGZfNN7dhb
 2ED9iQCES++5/djuy/a9BnsRovZwYqvHNl8VdoIUU1mYvUKwEszOHEcGjuSRZfw0SikP
 EmJyw7RsjHfmA8nS0bXfNRsK7P//Oii9M4GHfarAyLUOSCdiNlFrwXtmq/1vuZN2yoMg
 rgnO6X+YQ/mMFNol3zVqmSsUwTblIgY+toa1tHhyZGpGQsDkH2lD9oTSvgnQRRrjSOtr
 I93w==
X-Gm-Message-State: AOAM530LB1wgf49rj4OvVW+Z63ik1pk1mJN3uuQoQm/jbXfZmdJMPOiG
 3Ca9foUXJbu/aEX3mlKkio9tX0jRQXWFHyQX+Kbla5OtbSW+EXkjpj9enH3FhD+v4QncWtGg+Co
 NRiBpyfkXAUr7n24=
X-Received: by 2002:a7b:c18c:: with SMTP id y12mr6807319wmi.3.1629731122377;
 Mon, 23 Aug 2021 08:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK0mf6v1g8FF+PLyx4szVDv0N8NjvCZDWOLFJzOMJLkvTGnt9YT1wnOU5bltmEHoeH16koGQ==
X-Received: by 2002:a7b:c18c:: with SMTP id y12mr6807275wmi.3.1629731122037;
 Mon, 23 Aug 2021 08:05:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n15sm4037292wrv.48.2021.08.23.08.05.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 08:05:21 -0700 (PDT)
Subject: Re: [PATCH] monitor/qmp: fix race with clients disconnecting early
To: Stefan Reiter <s.reiter@proxmox.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Wolfgang Bumiller <w.bumiller@proxmox.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
References: <20210823101115.2015354-1-s.reiter@proxmox.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <28ed5f75-b058-85a1-6a0f-b68785bf51d8@redhat.com>
Date: Mon, 23 Aug 2021 17:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823101115.2015354-1-s.reiter@proxmox.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Marc-André

On 8/23/21 12:11 PM, Stefan Reiter wrote:
> From: Stefan Reiter <stefan@pimaker.at>
> 
> The following sequence can produce a race condition that results in
> responses meant for different clients being sent to the wrong one:
> 
> (QMP, no OOB)
> 1) client A connects
> 2) client A sends 'qmp_capabilities'
> 3) 'qmp_dispatch' runs in coroutine, schedules out to
>    'do_qmp_dispatch_bh' and yields
> 4) client A disconnects (i.e. aborts, crashes, etc...)
> 5) client B connects
> 6) 'do_qmp_dispatch_bh' runs 'qmp_capabilities' and wakes calling coroutine
> 7) capabilities are now set and 'mon->commands' is set to '&qmp_commands'
> 8) 'qmp_dispatch' returns to 'monitor_qmp_dispatch'
> 9) success message is sent to client B *without it ever having sent
>    'qmp_capabilities' itself*
> 9a) even if client B ignores it, it will now presumably send it's own
>    greeting, which will error because caps are already set
> 
> The fix proposed here uses an atomic, sequential connection number
> stored in the MonitorQMP struct, which is incremented every time a new
> client connects. Since it is not changed on CHR_EVENT_CLOSED, the
> behaviour of allowing a client to disconnect only one side of the
> connection is retained.
> 
> The connection_nr needs to be exposed outside of the monitor subsystem,
> since qmp_dispatch lives in qapi code. It needs to be checked twice,
> once for actually running the command in the BH (fixes 7/9a), and once for
> sending back a response (fixes 9).
> 
> This satisfies my local reproducer - using multiple clients constantly
> looping to open a connection, send the greeting, then exiting no longer
> crashes other, normally behaving clients with unrelated responses.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---
> 
> This is another patch in the apparently never-ending series of fixes to
> QMP-related race conditions. Our PVE users really seem to have a knack for
> triggering these ;)
> 
> Here's one of the (several) forum threads where we tried to diagnose the issue:
> https://forum.proxmox.com/threads/error-with-backup-when-backing-up-qmp-command-query-backup-failed-got-wrong-command-id.88017/
> 
> It manifested itself under load, where sometimes our monitor code (which uses
> the 'id' system of QMP to track commands) would receive bogus responses, showing
> up as "got wrong command id" errors in our logs.
> 
> I'm not sure this approach is the best fix, it seems a lot like a band-aid to
> me, but it's the best I could come up with for now - open for different ideas of
> course.
> 
> Note that with this patch, we're no longer running a command that was scheduled
> after a client has disconnected early. This seems like a slight behaviour change
> to me... On the other hand, I didn't want to drag the connection number into
> qmp_capabilities() and special case that even further.
> 
> I didn't look to deeply into 'QMP in iothread' yet, if that does what I think it
> does there might be two more potential races here:
> * between 'do_qmp_dispatch_bh' running 'aio_co_wake' and 'qmp_dispatch' actually
>   yielding (very unlikely though)
> * plus a TOCTOU in 'do_qmp_dispatch_bh' with the atomic read of the
>   connection_nr and actually running cmd->fn()
> 
> Thanks!
> 
> 
>  include/monitor/monitor.h  |  1 +
>  monitor/monitor-internal.h |  7 +++++++
>  monitor/monitor.c          | 15 +++++++++++++++
>  monitor/qmp.c              | 15 ++++++++++++++-
>  qapi/qmp-dispatch.c        | 21 +++++++++++++++++----
>  stubs/monitor-core.c       |  5 +++++
>  6 files changed, 59 insertions(+), 5 deletions(-)
> 
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index af3887bb71..ff6db1448b 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -16,6 +16,7 @@ extern QemuOptsList qemu_mon_opts;
>  Monitor *monitor_cur(void);
>  Monitor *monitor_set_cur(Coroutine *co, Monitor *mon);
>  bool monitor_cur_is_qmp(void);
> +int monitor_get_connection_nr(const Monitor *mon);
>  
>  void monitor_init_globals(void);
>  void monitor_init_globals_core(void);
> diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> index 9c3a09cb01..a92be8c3f7 100644
> --- a/monitor/monitor-internal.h
> +++ b/monitor/monitor-internal.h
> @@ -144,6 +144,13 @@ typedef struct {
>      QemuMutex qmp_queue_lock;
>      /* Input queue that holds all the parsed QMP requests */
>      GQueue *qmp_requests;
> +
> +    /*
> +     * A sequential number that gets incremented on every new CHR_EVENT_OPENED.
> +     * Used to avoid leftover responses in BHs from being sent to the wrong
> +     * client. Access with atomics.
> +     */
> +    int connection_nr;
>  } MonitorQMP;
>  
>  /**
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 636bcc81c5..ee5ac26c37 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -136,6 +136,21 @@ bool monitor_cur_is_qmp(void)
>      return cur_mon && monitor_is_qmp(cur_mon);
>  }
>  
> +/**
> + * If @mon is a QMP monitor, return the connection_nr, otherwise -1.
> + */
> +int monitor_get_connection_nr(const Monitor *mon)
> +{
> +    MonitorQMP *qmp_mon;
> +
> +    if (!monitor_is_qmp(mon)) {
> +        return -1;
> +    }
> +
> +    qmp_mon = container_of(mon, MonitorQMP, common);
> +    return qatomic_read(&qmp_mon->connection_nr);
> +}
> +
>  /**
>   * Is @mon is using readline?
>   * Note: not all HMP monitors use readline, e.g., gdbserver has a
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 0ef7cebb78..3ec67e32d3 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -141,6 +141,8 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
>      QDict *rsp;
>      QDict *error;
>  
> +    int conn_nr_before = qatomic_read(&mon->connection_nr);
> +
>      rsp = qmp_dispatch(mon->commands, req, qmp_oob_enabled(mon),
>                         &mon->common);
>  
> @@ -156,7 +158,17 @@ static void monitor_qmp_dispatch(MonitorQMP *mon, QObject *req)
>          }
>      }
>  
> -    monitor_qmp_respond(mon, rsp);
> +    /*
> +     * qmp_dispatch might have yielded and waited for a BH, in which case there
> +     * is a chance a new client connected in the meantime - if this happened,
> +     * the command will not have been executed, but we also need to ensure that
> +     * we don't send back a corresponding response on a line that no longer
> +     * belongs to this request.
> +     */
> +    if (conn_nr_before == qatomic_read(&mon->connection_nr)) {
> +        monitor_qmp_respond(mon, rsp);
> +    }
> +
>      qobject_unref(rsp);
>  }
>  
> @@ -444,6 +456,7 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
>  
>      switch (event) {
>      case CHR_EVENT_OPENED:
> +        qatomic_inc_fetch(&mon->connection_nr);
>          mon->commands = &qmp_cap_negotiation_commands;
>          monitor_qmp_caps_reset(mon);
>          data = qmp_greeting(mon);
> diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> index 59600210ce..95602446eb 100644
> --- a/qapi/qmp-dispatch.c
> +++ b/qapi/qmp-dispatch.c
> @@ -120,16 +120,28 @@ typedef struct QmpDispatchBH {
>      QObject **ret;
>      Error **errp;
>      Coroutine *co;
> +    int conn_nr;
>  } QmpDispatchBH;
>  
>  static void do_qmp_dispatch_bh(void *opaque)
>  {
>      QmpDispatchBH *data = opaque;
>  
> -    assert(monitor_cur() == NULL);
> -    monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> -    data->cmd->fn(data->args, data->ret, data->errp);
> -    monitor_set_cur(qemu_coroutine_self(), NULL);
> +    /*
> +     * A QMP monitor tracks it's client with a connection number, if this
> +     * changes during the scheduling delay of this BH, we must not execute the
> +     * command. Otherwise a badly placed 'qmp_capabilities' might affect the
> +     * connection state of a client it was never meant for.
> +     */
> +    if (data->conn_nr == monitor_get_connection_nr(data->cur_mon)) {
> +        assert(monitor_cur() == NULL);
> +        monitor_set_cur(qemu_coroutine_self(), data->cur_mon);
> +        data->cmd->fn(data->args, data->ret, data->errp);
> +        monitor_set_cur(qemu_coroutine_self(), NULL);
> +    } else {
> +        error_setg(data->errp, "active monitor connection changed");
> +    }
> +
>      aio_co_wake(data->co);
>  }
>  
> @@ -243,6 +255,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QObject *request,
>              .ret        = &ret,
>              .errp       = &err,
>              .co         = qemu_coroutine_self(),
> +            .conn_nr    = monitor_get_connection_nr(cur_mon),
>          };
>          aio_bh_schedule_oneshot(qemu_get_aio_context(), do_qmp_dispatch_bh,
>                                  &data);
> diff --git a/stubs/monitor-core.c b/stubs/monitor-core.c
> index d058a2a00d..3290b58120 100644
> --- a/stubs/monitor-core.c
> +++ b/stubs/monitor-core.c
> @@ -13,6 +13,11 @@ Monitor *monitor_set_cur(Coroutine *co, Monitor *mon)
>      return NULL;
>  }
>  
> +int monitor_get_connection_nr(const Monitor *mon)
> +{
> +    return -1;
> +}
> +
>  void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
>  {
>  }
> 


