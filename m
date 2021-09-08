Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C942403885
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 13:06:31 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNvPS-0004WK-Da
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 07:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNvM3-0002aF-DV
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mNvM1-0000Ge-J9
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 07:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631098976;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h05bdLJ8ik/TJC814xdFnl+X/NavX7mRRXq20qWmCpM=;
 b=M3Tzl36/4GL5gRuPVeA+Ez6scd1WuPvhNiHsPYjvGwX0IsekIIGxpriLKynv93Oh4n1h5Y
 tPBIfQId0iJZny9KRiHzz0nZt+ZHtpa92WnyLSXHzA2TvfCXoYy+RWBE2R10bwzbQEmW/i
 19k1lyYJ25r+v4LGOWAALPLNUejet1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-_f9IYsTfMkWjD4IoID4YtQ-1; Wed, 08 Sep 2021 07:02:55 -0400
X-MC-Unique: _f9IYsTfMkWjD4IoID4YtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C47C9126D
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 11:02:54 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15FD1196E2;
 Wed,  8 Sep 2021 11:02:52 +0000 (UTC)
Date: Wed, 8 Sep 2021 12:02:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 5/5] monitor: rewrite 'info registers' in terms of
 'x-query-registers'
Message-ID: <YTiYWjkeJRJkTNbX@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-6-berrange@redhat.com>
 <5634ab12-23b4-d2dd-fe7a-3a595ddc9e32@redhat.com>
MIME-Version: 1.0
In-Reply-To: <5634ab12-23b4-d2dd-fe7a-3a595ddc9e32@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 01:01:21PM +0200, Philippe Mathieu-Daudé wrote:
> On 9/8/21 12:37 PM, Daniel P. Berrangé wrote:
> > Now that we have a QMP command 'x-query-registers', the HMP counterpart
> > 'info registers' can be refactored to call the former.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  monitor/misc.c | 25 ++++++++++++++++---------
> >  1 file changed, 16 insertions(+), 9 deletions(-)
> > 
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index ffe7966870..f0b94c3084 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -67,6 +67,7 @@
> >  #include "block/block-hmp-cmds.h"
> >  #include "qapi/qapi-commands-char.h"
> >  #include "qapi/qapi-commands-control.h"
> > +#include "qapi/qapi-commands-machine.h"
> >  #include "qapi/qapi-commands-migration.h"
> >  #include "qapi/qapi-commands-misc.h"
> >  #include "qapi/qapi-commands-qom.h"
> > @@ -301,23 +302,29 @@ int monitor_get_cpu_index(Monitor *mon)
> >  static void hmp_info_registers(Monitor *mon, const QDict *qdict)
> >  {
> >      bool all_cpus = qdict_get_try_bool(qdict, "cpustate_all", false);
> > -    CPUState *cs;
> > +    bool has_cpu = !all_cpus;
> > +    int64_t cpu = 0;
> > +    Error *local_err = NULL;
> > +    g_autoptr(RegisterInfo) info = NULL;
> >  
> > -    if (all_cpus) {
> > -        CPU_FOREACH(cs) {
> > -            monitor_printf(mon, "\nCPU#%d\n", cs->cpu_index);
> > -            cpu_dump_state(cs, NULL, CPU_DUMP_FPU);
> 
> And once all targets are converted we can remove cpu_dump_state().

Yes, if we take approach in this series, then there would be another
20-ish patches inserted before this one, to convert all the other
targets, and eliminate the cpu_dump_state method / callback.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


