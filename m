Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F0E35DA8D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 10:59:25 +0200 (CEST)
Received: from localhost ([::1]:39046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWEtI-00083D-IH
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 04:59:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWEsL-0007eO-Ax
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:58:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lWEsJ-0002sC-9d
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 04:58:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618304302;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Pwon+f6yZeWGXz1ACEZEg379BeoU0XfKBZXQeRMSs4=;
 b=SRUJRTQTnOWS8Oqd3MaEGSp0pCvkQI8L3uExtuh4JO2FvoPIdpu8QPrALAfxGvlbg3TU+f
 JFkPXcfGuDlgTCP0s/l5EwZm5EfVSmgdMxAh9CiToQWayJmFkGw2+DJcxB+iFlp+XG4vt9
 v8qdG3E3Swihc9elLs6QDB/1Rs6ceGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-YR06YNe1PMWQz_cAwKX3yw-1; Tue, 13 Apr 2021 04:58:11 -0400
X-MC-Unique: YR06YNe1PMWQz_cAwKX3yw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C9EA881276;
 Tue, 13 Apr 2021 08:58:09 +0000 (UTC)
Received: from redhat.com (ovpn-114-58.ams2.redhat.com [10.36.114.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43F5439A60;
 Tue, 13 Apr 2021 08:58:01 +0000 (UTC)
Date: Tue, 13 Apr 2021 09:57:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] Support monitor chardev hotswap with QMP
Message-ID: <YHVdFndkaj0bltcE@redhat.com>
References: <20210315170636.704201-1-zhlcindy@gmail.com>
 <20210315170636.704201-2-zhlcindy@gmail.com>
 <8735vu1ybo.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <8735vu1ybo.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: lukasstraub2@web.de, alexandr.iarygin@profitbricks.com,
 qemu-devel@nongnu.org, Li Zhang <li.zhang@cloud.ionos.com>,
 pankaj.gupta@cloud.ionos.com, Li Zhang <zhlcindy@gmail.com>,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 13, 2021 at 08:40:59AM +0200, Markus Armbruster wrote:
> Li Zhang <zhlcindy@gmail.com> writes:
> 
> > From: Li Zhang <li.zhang@cloud.ionos.com>
> >
> > For some scenarios, it needs to hot-add a monitor device.
> > But QEMU doesn't support hotplug yet. It also works by adding
> > a monitor with null backend by default and then change its
> > backend to socket by QMP command "chardev-change".

If you need ability to hot-add monitor instances, why not just
implement that feature directly, instead of pre-creating monitors
with null backends and then later changing the backend ?

> >
> > So this patch is to support monitor chardev hotswap with QMP.
> >
> > Signed-off-by: Li Zhang <li.zhang@cloud.ionos.com>
> 
> I think what what you're trying to say is that chardev-change does not
> work when the character device changes is used by a QMP monitor.
> Correct?
> 
> If yes, how exactly does it misbehave?
> 
> Does it work with an HMP monitor?
> 
> > ---
> >  monitor/monitor-internal.h |  3 +++
> >  monitor/monitor.c          |  2 +-
> >  monitor/qmp.c              | 42 +++++++++++++++++++++++++++++++++++---
> >  3 files changed, 43 insertions(+), 4 deletions(-)
> >
> > diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
> > index 40903d6386..2df6dd21de 100644
> > --- a/monitor/monitor-internal.h
> > +++ b/monitor/monitor-internal.h
> > @@ -186,4 +186,7 @@ int hmp_compare_cmd(const char *name, const char *list);
> >  void qmp_query_qmp_schema(QDict *qdict, QObject **ret_data,
> >                                   Error **errp);
> >  
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +                               void *opaque);
> > +
> >  #endif
> > diff --git a/monitor/monitor.c b/monitor/monitor.c
> > index e94f532cf5..2d255bab18 100644
> > --- a/monitor/monitor.c
> > +++ b/monitor/monitor.c
> > @@ -157,7 +157,7 @@ static inline bool monitor_is_hmp_non_interactive(const Monitor *mon)
> >  
> >  static void monitor_flush_locked(Monitor *mon);
> >  
> > -static gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> > +gboolean monitor_unblocked(GIOChannel *chan, GIOCondition cond,
> >                                    void *opaque)
> >  {
> >      Monitor *mon = opaque;
> > diff --git a/monitor/qmp.c b/monitor/qmp.c
> > index 2326bd7f9b..55cfb230d9 100644
> > --- a/monitor/qmp.c
> > +++ b/monitor/qmp.c
> > @@ -44,6 +44,7 @@ struct QMPRequest {
> >      Error *err;
> >  };
> >  typedef struct QMPRequest QMPRequest;
> > +static void monitor_qmp_set_handlers_bh(void *opaque);
> >  
> >  QmpCommandList qmp_commands, qmp_cap_negotiation_commands;
> >  
> > @@ -480,7 +481,35 @@ void monitor_data_destroy_qmp(MonitorQMP *mon)
> >      g_queue_free(mon->qmp_requests);
> >  }
> >  
> > -static void monitor_qmp_setup_handlers_bh(void *opaque)
> > +static int monitor_qmp_change(void *opaque)
> > +{
> > +    MonitorQMP *mon = opaque;
> > +
> > +    mon->common.use_io_thread =
> > +        qemu_chr_has_feature(mon->common.chr.chr, QEMU_CHAR_FEATURE_GCONTEXT);
> > +
> > +    if (mon->common.use_io_thread) {
> > +        aio_bh_schedule_oneshot(iothread_get_aio_context(mon_iothread),
> > +                                monitor_qmp_set_handlers_bh, mon);
> > +    } else {
> > +        qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> > +                                 monitor_qmp_read, monitor_qmp_event,
> > +                                 monitor_qmp_change, &mon->common, NULL, true);
> > +    }
> > +
> > +    if (mon->common.out_watch) {
> > +        g_source_remove(mon->common.out_watch);
> 
> All other updates of @out_watch are under @mon_lock.  Why not this one?
> 
> I have no idea whether g_source_remove() is the right function to call.
> Its documentation says "You must use g_source_destroy() for sources
> added to a non-default main context."  The qemu_chr_fe_set_handlers()
> contract is of no help.
> 
> Documentation of g_source_destroy() confuses some more: "This does not
> unref the GSource: if you still hold a reference, use g_source_unref()
> to drop it.
> 
> Marc-André, can you help?
> 
> > +        qemu_mutex_lock(&mon->common.mon_lock);
> > +        mon->common.out_watch =
> > +        qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
> > +                               monitor_unblocked, &mon->common);
> 
> Bad indentation.  Better:
> 
>         mon->common.out_watch =
>             qemu_chr_fe_add_watch(&mon->common.chr, G_IO_OUT | G_IO_HUP,
>                                    monitor_unblocked, &mon->common);
> 
> or
> 
>         mon->common.out_watch = qemu_chr_fe_add_watch(&mon->common.chr,
>                                                       G_IO_OUT | G_IO_HUP,
>                                                       monitor_unblocked,
>                                                       &mon->common);
> 
> or
> 
>         mon->common.out_watch = qemu_chr_fe_add_watch(&mon->common.chr,
>                                         G_IO_OUT | G_IO_HUP,
>                                         monitor_unblocked, &mon->common);
> 
> > +        qemu_mutex_unlock(&mon->common.mon_lock);
> > +    }
> > +
> > +    return 0;
> > +}
> 
> This function copies from monitor_data_init(), monitor_init_qmp(), and
> monitor_flush_locked().  Feels like a refactoring would be in order.
> Possibly on top.
> 
> > +
> > +static void monitor_qmp_set_handlers_bh(void *opaque)
> >  {
> >      MonitorQMP *mon = opaque;
> >      GMainContext *context;
> > @@ -490,7 +519,14 @@ static void monitor_qmp_setup_handlers_bh(void *opaque)
> >      assert(context);
> >      qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                               monitor_qmp_read, monitor_qmp_event,
> > -                             NULL, &mon->common, context, true);
> > +                             monitor_qmp_change, &mon->common, context, true);
> > +
> > +}
> > +
> > +static void monitor_qmp_setup_handlers_bh(void *opaque)
> > +{
> > +    MonitorQMP *mon = opaque;
> > +    monitor_qmp_set_handlers_bh(mon);
> >      monitor_list_append(&mon->common);
> >  }
> >  
> > @@ -531,7 +567,7 @@ void monitor_init_qmp(Chardev *chr, bool pretty, Error **errp)
> >      } else {
> >          qemu_chr_fe_set_handlers(&mon->common.chr, monitor_can_read,
> >                                   monitor_qmp_read, monitor_qmp_event,
> > -                                 NULL, &mon->common, NULL, true);
> > +                                 monitor_qmp_change, &mon->common, NULL, true);
> >          monitor_list_append(&mon->common);
> >      }
> >  }
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


