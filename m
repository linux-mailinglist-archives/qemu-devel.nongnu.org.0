Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D232A19C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:55:24 +0100 (CET)
Received: from localhost ([::1]:42930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH5Ug-0003es-Uu
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5T6-00037J-Mr
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:53:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH5T2-0005B4-Et
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 08:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614693214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0/pmBQHJpyKWSXykTXRFut8uM5TuZvOmqo9GwyHsT7I=;
 b=hiIwpwjvK+67t68rbAwAOEFqtsCMnWrqFUkqIECUYgviH4RLt1uwyCAAGg9WxonIUac9kd
 vC83zqqSyq+XqZ0KQYGW0PjxX2V+9aWZGQGOvJRWgBYdV/UeGqUnAG7n/cA6EENBK7CXrx
 0Q+BVBleNSa3SDeDDBBCS1D24Yf/oSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-5rPdp8aXPbiKUxbSYGCIRg-1; Tue, 02 Mar 2021 08:53:32 -0500
X-MC-Unique: 5rPdp8aXPbiKUxbSYGCIRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DCDD19357A8;
 Tue,  2 Mar 2021 13:53:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B890E60873;
 Tue,  2 Mar 2021 13:53:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4D03B113860F; Tue,  2 Mar 2021 14:53:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Andrey Shinkevich via <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 2/5] monitor: drain requests queue with 'channel
 closed' event
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
Date: Tue, 02 Mar 2021 14:53:29 +0100
In-Reply-To: <1606484146-913540-3-git-send-email-andrey.shinkevich@virtuozzo.com>
 (Andrey Shinkevich via's message of "Fri, 27 Nov 2020 16:35:43 +0300")
Message-ID: <87h7ltll0m.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 vsementsov@virtuozzo.com, qemu-block@nongnu.org, den@openvz.org,
 armbru@redhat.com, mdroth@linux.vnet.ibm.com, mreitz@redhat.com,
 pbonzini@redhat.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrey Shinkevich via <qemu-devel@nongnu.org> writes:

> When CHR_EVENT_CLOSED comes, the QMP requests queue may still contain
> unprocessed commands. It can happen with QMP capability OOB enabled.
> Let the dispatcher complete handling requests rest in the monitor
> queue.
>
> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
> ---
>  monitor/qmp.c | 46 +++++++++++++++++++++-------------------------
>  1 file changed, 21 insertions(+), 25 deletions(-)
>
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 7169366..a86ed35 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -75,36 +75,32 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>      }
>  }
>  
> -static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
> +/*
> + * Let unprocessed QMP commands be handled.
> + */
> +static void monitor_qmp_drain_queue(MonitorQMP *mon)
>  {
> -    qemu_mutex_lock(&mon->qmp_queue_lock);
> +    bool q_is_empty = false;
>  
> -    /*
> -     * Same condition as in monitor_qmp_dispatcher_co(), but before
> -     * removing an element from the queue (hence no `- 1`).
> -     * Also, the queue should not be empty either, otherwise the
> -     * monitor hasn't been suspended yet (or was already resumed).
> -     */
> -    bool need_resume = (!qmp_oob_enabled(mon) ||
> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX)
> -        && !g_queue_is_empty(mon->qmp_requests);
> +    while (!q_is_empty) {
> +        qemu_mutex_lock(&mon->qmp_queue_lock);
> +        q_is_empty = g_queue_is_empty(mon->qmp_requests);
> +        qemu_mutex_unlock(&mon->qmp_queue_lock);
>  
> -    monitor_qmp_cleanup_req_queue_locked(mon);
> +        if (!q_is_empty) {
> +            if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {
> +                /* Kick the dispatcher coroutine */
> +                aio_co_wake(qmp_dispatcher_co);
> +            } else {
> +                /* Let the dispatcher do its job for a while */
> +                g_usleep(40);
> +            }
> +        }
> +    }
>  
> -    if (need_resume) {
> -        /*
> -         * handle_qmp_command() suspended the monitor because the
> -         * request queue filled up, to be resumed when the queue has
> -         * space again.  We just emptied it; resume the monitor.
> -         *
> -         * Without this, the monitor would remain suspended forever
> -         * when we get here while the monitor is suspended.  An
> -         * unfortunately timed CHR_EVENT_CLOSED can do the trick.
> -         */
> +    if (qatomic_mb_read(&mon->common.suspend_cnt)) {
>          monitor_resume(&mon->common);
>      }
> -
> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>  }
>  
>  void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
> @@ -418,7 +414,7 @@ static void monitor_qmp_event(void *opaque, QEMUChrEvent event)
>           * stdio, it's possible that stdout is still open when stdin
>           * is closed.
>           */
> -        monitor_qmp_cleanup_queue_and_resume(mon);
> +        monitor_qmp_drain_queue(mon);
>          json_message_parser_destroy(&mon->parser);
>          json_message_parser_init(&mon->parser, handle_qmp_command,
>                                   mon, NULL);

Before the patch: we call monitor_qmp_cleanup_queue_and_resume() to
throw away the contents of the request queue, and resume the monitor if
suspended.

Afterwards: we call monitor_qmp_drain_queue() to wait for the request
queue to drain.  I think.  Before we discuss the how, I have a question
the commit message should answer, but doesn't: why?


