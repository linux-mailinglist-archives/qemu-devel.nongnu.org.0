Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D69145D728
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 10:27:56 +0100 (CET)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqB2o-0005av-VO
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 04:27:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqB1U-0004sH-UW
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:26:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mqB1Q-0006zN-Nu
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 04:26:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637832387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VkgMuhTrK8xG8Lh3Ebn/2fwZM6y/A2NBvLmcHhB6h3s=;
 b=CWyJ/yK0frQA5kdwxQDu0utLHeF0IkrpVeFrolQ1XcNq1/btnBlGYMJeDmmOOOCRN/mu7q
 QYDHFvmt5CJMR/QuzqR73KVKED7HM8wgC4ZKWwA1eBGuxEE8aneH6mfiqab+BkvfaWDAXG
 b7ypAGxyBeYUngQENkYMFRBESOqf338=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-EZAdr5M4NY2AxTS8n3N8gQ-1; Thu, 25 Nov 2021 04:26:24 -0500
X-MC-Unique: EZAdr5M4NY2AxTS8n3N8gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5286B81CCB5;
 Thu, 25 Nov 2021 09:26:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0A6817C58;
 Thu, 25 Nov 2021 09:26:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 89C6211380A7; Thu, 25 Nov 2021 10:26:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v1 1/2] monitor: move monitor destruction to the very
 end of qemu cleanup
References: <20211115094143.157399-1-den-plotnikov@yandex-team.ru>
 <20211115094143.157399-2-den-plotnikov@yandex-team.ru>
Date: Thu, 25 Nov 2021 10:26:19 +0100
In-Reply-To: <20211115094143.157399-2-den-plotnikov@yandex-team.ru> (Denis
 Plotnikov's message of "Mon, 15 Nov 2021 12:41:42 +0300")
Message-ID: <87a6hsmvr8.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Denis Plotnikov <den-plotnikov@yandex-team.ru> writes:

> This is needed to keep sending DEVICE_DELETED events on qemu cleanup.
> The event may happen in the rcu thread and we're going to flush the rcu queue
> explicitly before qemu exiting in the next patch. So move the monitor
> destruction to the very end of qemu cleanup to be able to send all the events.
>
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  monitor/monitor.c  | 6 ++++++
>  softmmu/runstate.c | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 21c7a68758f5..b04ae4850db2 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -605,11 +605,17 @@ void monitor_data_init(Monitor *mon, bool is_qmp, bool skip_flush,
>      mon->outbuf = g_string_new(NULL);
>      mon->skip_flush = skip_flush;
>      mon->use_io_thread = use_io_thread;
> +    /*
> +     * take an extra ref to prevent monitor's chardev
> +     * from destroying in qemu_chr_cleanup()
> +     */
> +    object_ref(OBJECT(mon->chr.chr));

I'm not sure we need the comment in the long run.

Taking a reference changes mon->chr.chr from soft reference to hard
reference.  Feels right to me.

Note that mon->chr.chr isn't set here, but earlier.  Unlike the other
parts of @mon.  Because of this it starts as a soft reference, and
hardens only here.

It's set in three places:

1. monitor_init_hmp():

    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
        g_free(mon);
        return;
    }

    monitor_data_init(&mon->common, false, false, false);

2. monitor_init_qmp():

    if (!qemu_chr_fe_init(&mon->common.chr, chr, errp)) {
        g_free(mon);
        return;
    }
    qemu_chr_fe_set_echo(&mon->common.chr, true);

    /* Note: we run QMP monitor in I/O thread when @chr supports that */
    monitor_data_init(&mon->common, true, false,
                      qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_GCONTEXT));

3. qmp_human_monitor_command()

    MonitorHMP hmp = {};

    monitor_data_init(&hmp.common, false, true, false);

   hmp.common.chr.chr remains null here.  Works, because
   object_ref(OBJECT(NULL)) and object_unref(OBJECT(NULL)) do nothing.

Slightly cleaner, I think: pass the character device as an argument to
monitor_data_init(), take a reference and store it in mon->chr.chr
there.

>  }
>  
>  void monitor_data_destroy(Monitor *mon)
>  {
>      g_free(mon->mon_cpu_path);
> +    object_unref(OBJECT(mon->chr.chr));
>      qemu_chr_fe_deinit(&mon->chr, false);
>      if (monitor_is_qmp(mon)) {
>          monitor_data_destroy_qmp(container_of(mon, MonitorQMP, common));
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 10d9b7365aa7..8d29dd2c00e2 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -819,8 +819,8 @@ void qemu_cleanup(void)
>      tpm_cleanup();
>      net_cleanup();
>      audio_cleanup();
> -    monitor_cleanup();
>      qemu_chr_cleanup();
>      user_creatable_cleanup();
> +    monitor_cleanup();
>      /* TODO: unref root container, check all devices are ok */
>  }

Monitor cleanup now runs with character devices that have been
"unparented" from the QOM tree.  Paolo, is that okay?


