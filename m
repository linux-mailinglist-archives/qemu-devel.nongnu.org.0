Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DC46EC98D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:55:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqstP-0001ko-J9; Mon, 24 Apr 2023 05:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pqstI-0001kL-5e
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:53:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pqstG-0003Qz-0n
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682330025;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWqwc6RgSWWdiGzXOa8qbuV7Q7k1TP35nzc1Mfd3i7g=;
 b=Z8nkGmhdMJOJT8Z3UAlb2cL8hwuP3z9SLG1u/fUBD8MhjhdiFSAunhLP98CnL2S+WIX0NT
 E7bFLu2Riei4m5HRYZkSBxTdNkX/4qfG7LJQ85fkVJD7ecmEeRpwvyYUn4C89FPRE++S22
 9m5tihWG9K4UMxBFVJu9LhDNUb1a+x4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-iYLIUrT1PWeim7JKN7R57Q-1; Mon, 24 Apr 2023 05:53:42 -0400
X-MC-Unique: iYLIUrT1PWeim7JKN7R57Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AADFA38173C8;
 Mon, 24 Apr 2023 09:53:41 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B58544007;
 Mon, 24 Apr 2023 09:53:39 +0000 (UTC)
Date: Mon, 24 Apr 2023 10:53:36 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 3/6] tests/qtest: capture RESUME events during migration
Message-ID: <ZEZRoFtQg/MEdKi1@redhat.com>
References: <20230421171411.566300-1-berrange@redhat.com>
 <20230421171411.566300-4-berrange@redhat.com>
 <87leikgama.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87leikgama.fsf@secure.mitica>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.172,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Apr 21, 2023 at 11:59:25PM +0200, Juan Quintela wrote:
> Daniel P. Berrangé <berrange@redhat.com> wrote:
> > When running migration tests we monitor for a STOP event so we can skip
> > redundant waits. This will be needed for the RESUME event too shortly.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> i.e. it is better that what we have now.
> 
> But
> 
> 
> > diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
> > index f6f3c6680f..61396335cc 100644
> > --- a/tests/qtest/migration-helpers.c
> > +++ b/tests/qtest/migration-helpers.c
> > @@ -24,14 +24,20 @@
> >  #define MIGRATION_STATUS_WAIT_TIMEOUT 120
> >  
> >  bool got_stop;
> > +bool got_resume;
> >  
> > -static void check_stop_event(QTestState *who)
> > +static void check_events(QTestState *who)
> >  {
> >      QDict *event = qtest_qmp_event_ref(who, "STOP");
> >      if (event) {
> >          got_stop = true;
> >          qobject_unref(event);
> >      }
> > +    event = qtest_qmp_event_ref(who, "RESUME");
> > +    if (event) {
> > +        got_resume = true;
> > +        qobject_unref(event);
> > +    }
> >  }
> 
> What happens if we receive the events in the order RESUME/STOP (I mean
> in the big scheme of things, not that it makes sense in this particular
> case).
> 
> QDict *qtest_qmp_event_ref(QTestState *s, const char *event)
> {
>     while (s->pending_events) {
> 
>         GList *first = s->pending_events;
>         QDict *response = (QDict *)first->data;
> 
>         s->pending_events = g_list_delete_link(s->pending_events, first);
> 
>         if (!strcmp(qdict_get_str(response, "event"), event)) {
>             return response;
>         }
>         qobject_unref(response);
>     }
>     return NULL;
> }
> 
> if we don't found the event that we are searching for, we just drop it.
> Does this makes sense if we are searching only for more than one event?

You are right about this code being broken in general for multiple events.

In this particular series though we're looking at STOP on the src host and
RESUME on the dst host, so there's no ordering problem to worry about.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


