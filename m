Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A023D336F4A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 10:53:29 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKI0W-0006dS-Mm
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 04:53:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKHxe-0004yB-E1
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:50:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKHxY-00036c-RZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 04:50:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615456219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TbPUEXeWYwqfjrp7uzzD2FUnUuz3I8jZY6yAH4CKxlU=;
 b=N6D3TdP3uj+B/+77afah/DAhy41E2npP+N5HuCBzD1bTYwkSH6gcLbWRO+CHGU8Pa/ogjr
 g064DfJHWiVV8B4eUnOQ/D8Un066qe6EK0VCJI2wD7G2V6TL5SNgX85V9VraoXIhgtdb2j
 6tcII8m5DVBM591CY0G1dPHKAsgWlOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-qTVuJjJWPMaeUV8Hoqpg-Q-1; Thu, 11 Mar 2021 04:50:17 -0500
X-MC-Unique: qTVuJjJWPMaeUV8Hoqpg-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8415E801596;
 Thu, 11 Mar 2021 09:50:16 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A17E519C9B;
 Thu, 11 Mar 2021 09:50:15 +0000 (UTC)
Date: Thu, 11 Mar 2021 09:50:13 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 5/9] monitor: Replaced qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Message-ID: <YEnn1X5NABiDuzRb@work-vm>
References: <20210311031538.5325-1-ma.mandourr@gmail.com>
 <20210311031538.5325-6-ma.mandourr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210311031538.5325-6-ma.mandourr@gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Mahmoud Mandour (ma.mandourr@gmail.com) wrote:
> Removed various qemu_mutex_lock and their respective qemu_mutex_unlock
> calls and used lock guard macros (QEMU_LOCK_GUARD and
> WITH_QEMU_LOCK_GUARD). This simplifies the code by
> eliminating qemu_mutex_unlock calls.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  monitor/monitor.c |  8 ++------
>  monitor/qmp.c     | 51 ++++++++++++++++++++++-------------------------
>  2 files changed, 26 insertions(+), 33 deletions(-)
> 
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index e94f532cf5..640496e562 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -349,7 +349,7 @@ monitor_qapi_event_queue_no_reenter(QAPIEvent event, QDict *qdict)
>      evconf = &monitor_qapi_event_conf[event];
>      trace_monitor_protocol_event_queue(event, qdict, evconf->rate);
>  
> -    qemu_mutex_lock(&monitor_lock);
> +    QEMU_LOCK_GUARD(&monitor_lock);
>  
>      if (!evconf->rate) {
>          /* Unthrottled event */
> @@ -391,8 +391,6 @@ monitor_qapi_event_queue_no_reenter(QAPIEvent event, QDict *qdict)
>              timer_mod_ns(evstate->timer, now + evconf->rate);
>          }
>      }
> -
> -    qemu_mutex_unlock(&monitor_lock);
>  }
>  
>  void qapi_event_emit(QAPIEvent event, QDict *qdict)
> @@ -447,7 +445,7 @@ static void monitor_qapi_event_handler(void *opaque)
>      MonitorQAPIEventConf *evconf = &monitor_qapi_event_conf[evstate->event];
>  
>      trace_monitor_protocol_event_handler(evstate->event, evstate->qdict);
> -    qemu_mutex_lock(&monitor_lock);
> +    QEMU_LOCK_GUARD(&monitor_lock);
>  
>      if (evstate->qdict) {
>          int64_t now = qemu_clock_get_ns(monitor_get_event_clock());
> @@ -462,8 +460,6 @@ static void monitor_qapi_event_handler(void *opaque)
>          timer_free(evstate->timer);
>          g_free(evstate);
>      }
> -
> -    qemu_mutex_unlock(&monitor_lock);
>  }
>  
>  static unsigned int qapi_event_throttle_hash(const void *key)
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 2326bd7f9b..2b0308f933 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -76,7 +76,7 @@ static void monitor_qmp_cleanup_req_queue_locked(MonitorQMP *mon)
>  
>  static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>  {
> -    qemu_mutex_lock(&mon->qmp_queue_lock);
> +    QEMU_LOCK_GUARD(&mon->qmp_queue_lock);
>  
>      /*
>       * Same condition as in monitor_qmp_dispatcher_co(), but before
> @@ -103,7 +103,6 @@ static void monitor_qmp_cleanup_queue_and_resume(MonitorQMP *mon)
>          monitor_resume(&mon->common);
>      }
>  
> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
>  }
>  
>  void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
> @@ -179,7 +178,7 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
>      Monitor *mon;
>      MonitorQMP *qmp_mon;
>  
> -    qemu_mutex_lock(&monitor_lock);
> +    QEMU_LOCK_GUARD(&monitor_lock);
>  
>      QTAILQ_FOREACH(mon, &mon_list, entry) {
>          if (!monitor_is_qmp(mon)) {
> @@ -205,8 +204,6 @@ static QMPRequest *monitor_qmp_requests_pop_any_with_lock(void)
>          QTAILQ_INSERT_TAIL(&mon_list, mon, entry);
>      }
>  
> -    qemu_mutex_unlock(&monitor_lock);
> -
>      return req_obj;

You could have used it for the qmp_queue_lock in this function as well;
that can go in a later patch sometime.

>  }
>  
> @@ -376,30 +373,30 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
>      req_obj->err = err;
>  
>      /* Protect qmp_requests and fetching its length. */
> -    qemu_mutex_lock(&mon->qmp_queue_lock);
> +    WITH_QEMU_LOCK_GUARD(&mon->qmp_queue_lock) {
>  
> -    /*
> -     * Suspend the monitor when we can't queue more requests after
> -     * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
> -     * monitor_qmp_cleanup_queue_and_resume() will resume it.
> -     * Note that when OOB is disabled, we queue at most one command,
> -     * for backward compatibility.
> -     */
> -    if (!qmp_oob_enabled(mon) ||
> -        mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1) {
> -        monitor_suspend(&mon->common);
> -    }
> +        /*
> +         * Suspend the monitor when we can't queue more requests after
> +         * this one.  Dequeuing in monitor_qmp_dispatcher_co() or
> +         * monitor_qmp_cleanup_queue_and_resume() will resume it.
> +         * Note that when OOB is disabled, we queue at most one command,
> +         * for backward compatibility.
> +         */
> +        if (!qmp_oob_enabled(mon) ||
> +            mon->qmp_requests->length == QMP_REQ_QUEUE_LEN_MAX - 1) {
> +            monitor_suspend(&mon->common);
> +        }
>  
> -    /*
> -     * Put the request to the end of queue so that requests will be
> -     * handled in time order.  Ownership for req_obj, req,
> -     * etc. will be delivered to the handler side.
> -     */
> -    trace_monitor_qmp_in_band_enqueue(req_obj, mon,
> -                                      mon->qmp_requests->length);
> -    assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
> -    g_queue_push_tail(mon->qmp_requests, req_obj);
> -    qemu_mutex_unlock(&mon->qmp_queue_lock);
> +        /*
> +         * Put the request to the end of queue so that requests will be
> +         * handled in time order.  Ownership for req_obj, req,
> +         * etc. will be delivered to the handler side.
> +         */
> +        trace_monitor_qmp_in_band_enqueue(req_obj, mon,
> +                                          mon->qmp_requests->length);
> +        assert(mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX);
> +        g_queue_push_tail(mon->qmp_requests, req_obj);
> +    }
>  
>      /* Kick the dispatcher routine */
>      if (!qatomic_xchg(&qmp_dispatcher_co_busy, true)) {

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> 2.25.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


