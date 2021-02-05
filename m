Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228AE31061E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 08:57:31 +0100 (CET)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7vzd-0006Qq-Vm
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 02:57:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7vyc-0005cj-MA
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 02:56:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l7vyZ-0002ra-Pd
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 02:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612511782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l0I0VGfsV9s+wqE82AcU/9BAoWf1oPRQQq+yxVKBdiw=;
 b=HtDK18yCJDG306p1XLbkXvEVDin6KwhV22g0h2k0gm8VZmKdxbxV9Ejm5FAanBHdh8oWHG
 EsZivnd0DR5T9PatfoioqiIJTAdvopvoRVCYCIEJql6XfupLXdwLBIaVIIlTea5ePM+2oG
 4/3rd2Na6C3j/D3YmbQcsZBEGqDCaD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-LA076P8IMga50_6u9yq4cA-1; Fri, 05 Feb 2021 02:56:20 -0500
X-MC-Unique: LA076P8IMga50_6u9yq4cA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F232107ACC7;
 Fri,  5 Feb 2021 07:56:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-51.ams2.redhat.com
 [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ECF01971C;
 Fri,  5 Feb 2021 07:56:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B8993113865F; Fri,  5 Feb 2021 08:56:17 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] monitor: trace qmp_send_response
References: <20210204222444.22217-1-vsementsov@virtuozzo.com>
Date: Fri, 05 Feb 2021 08:56:17 +0100
In-Reply-To: <20210204222444.22217-1-vsementsov@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Fri, 5 Feb 2021 01:24:44 +0300")
Message-ID: <874kir6j8e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> Add a useful counterpart for trace_handle_qmp_command for debugging
> libvirt guests.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  monitor/qmp.c        | 6 ++++++
>  monitor/trace-events | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/monitor/qmp.c b/monitor/qmp.c
> index 8f91af32be..772b9e7b30 100644
> --- a/monitor/qmp.c
> +++ b/monitor/qmp.c
> @@ -111,6 +111,12 @@ void qmp_send_response(MonitorQMP *mon, const QDict *rsp)
>      const QObject *data = QOBJECT(rsp);
>      GString *json;
>  
> +    if (trace_event_get_state_backends(TRACE_QMP_SEND_RESPONSE)) {
> +        json = qobject_to_json(data);
> +        trace_qmp_send_response(mon, json->str);
> +        g_string_free(json, true);
> +    }
> +
>      json = qobject_to_json_pretty(data, mon->pretty);
>      assert(json != NULL);
>  
> diff --git a/monitor/trace-events b/monitor/trace-events
> index 0365ac4d99..12f0576c7b 100644
> --- a/monitor/trace-events
> +++ b/monitor/trace-events
> @@ -13,3 +13,4 @@ monitor_suspend(void *ptr, int cnt) "mon %p: %d"
>  monitor_qmp_cmd_in_band(const char *id) "%s"
>  monitor_qmp_cmd_out_of_band(const char *id) "%s"
>  handle_qmp_command(void *mon, const char *req) "mon %p req: %s"
> +qmp_send_response(void *mon, const char *req) "mon %p req: %s"

A slightly lazier version of this just landed in commit f680405f45 "qmp:
Add more tracepoints".  The difference is yours ignores mon->pretty for
tracing.

Thoughts?


