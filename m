Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5959A33B151
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:41:52 +0100 (CET)
Received: from localhost ([::1]:36564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlbb-00012t-BW
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLlZ3-0007hl-6b
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLlYw-0001mG-Tx
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615808344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fiHpG74xB+fNUJbZVvOCCRWI25ZUxJxhjwtnsG1PR40=;
 b=VDVwIC1T+RhqGCBbSv4DUzZ84814+72GAUbXsQasFO+cMvQ3p6hacUgNHteTrik3SkeLWl
 QGff8kk1hEHW68zPhY5IYxIiOFsgiUw+qTQgefoA1yGjQlqylsOtm6P9mv7ym1ayKEAP/e
 mfCtvCk+SYjid8EBnRAbkbI63rKq5eo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-_KNGArVTNNG6_QrxWC2jOg-1; Mon, 15 Mar 2021 07:39:02 -0400
X-MC-Unique: _KNGArVTNNG6_QrxWC2jOg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3A56184F564;
 Mon, 15 Mar 2021 11:39:01 +0000 (UTC)
Received: from work-vm (ovpn-114-235.ams2.redhat.com [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C0D1B5C3E6;
 Mon, 15 Mar 2021 11:38:50 +0000 (UTC)
Date: Mon, 15 Mar 2021 11:38:48 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v3 27/30] hmp: QAPIfy object_add
Message-ID: <YE9HSDSVK5XpupIL@work-vm>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-28-kwolf@redhat.com>
 <87pn03rxmq.fsf@dusky.pond.sub.org>
 <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com>
 <87tupckb7d.fsf@dusky.pond.sub.org>
 <YE9AWksF89nc2NjV@merkur.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YE9AWksF89nc2NjV@merkur.fritz.box>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Kevin Wolf (kwolf@redhat.com) wrote:
> Am 15.03.2021 um 10:39 hat Markus Armbruster geschrieben:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> > > On 13/03/21 14:28, Markus Armbruster wrote:
> > >> Kevin Wolf <kwolf@redhat.com> writes:
> > >> 
> > >>> This switches the HMP command object_add from a QemuOpts-based parser to
> > >>> user_creatable_add_from_str() which uses a keyval parser and enforces
> > >>> the QAPI schema.
> > >>>
> > >>> Apart from being a cleanup, this makes non-scalar properties and help
> > >>> accessible. In order for help to be printed to the monitor instead of
> > >>> stdout, the printf() calls in the help functions are changed to
> > >>> qemu_printf().
> > >>>
> > >>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> > >>> Acked-by: Peter Krempa <pkrempa@redhat.com>
> > >>> Reviewed-by: Eric Blake <eblake@redhat.com>
> > >>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > >>> ---
> > >>>   monitor/hmp-cmds.c      | 17 ++---------------
> > >>>   qom/object_interfaces.c | 11 ++++++-----
> > >>>   hmp-commands.hx         |  2 +-
> > >>>   3 files changed, 9 insertions(+), 21 deletions(-)
> > >>>
> > >>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > >>> index 3c88a4faef..652cf9ff21 100644
> > >>> --- a/monitor/hmp-cmds.c
> > >>> +++ b/monitor/hmp-cmds.c
> > >>> @@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
> > >>>   
> > >>>   void hmp_object_add(Monitor *mon, const QDict *qdict)
> > >>>   {
> > >>> +    const char *options = qdict_get_str(qdict, "object");
> > >>>       Error *err = NULL;
> > >>> -    QemuOpts *opts;
> > >>> -    Object *obj = NULL;
> > >>> -
> > >>> -    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
> > >>> -    if (err) {
> > >>> -        goto end;
> > >>> -    }
> > >>>   
> > >>> -    obj = user_creatable_add_opts(opts, &err);
> > >>> -    qemu_opts_del(opts);
> > >>> -
> > >>> -end:
> > >>> +    user_creatable_add_from_str(options, &err);
> > >>>       hmp_handle_error(mon, err);
> > >>> -
> > >>> -    if (obj) {
> > >>> -        object_unref(obj);
> > >>> -    }
> > >>>   }
> > >> 
> > >> Doesn't this break the list-valued properties (Memdev member host-nodes,
> > >> NumaNodeOptions member cpus) exactly the same way that made us keep
> > >> QemuOpts for qemu-system-FOO -object?
> > >
> > > Yes, it does.  I guess it can just be documented, unlike for the command 
> > > line?
> > 
> > Maybe.  Judgement call, not mine to make.
> > 
> > Do people create such objects in HMP?  I figure we don't really know.
> > Educated guess?
> > 
> > If you try, how does it break?  Is it confusing?  Can you show an
> > example?
> 
> (qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes=0
> Error: Invalid parameter type for 'host-nodes', expected: array
> (qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes.0=0
> (qemu)
> 
> HMP is not a stable interface, so changing the syntax didn't feel like a
> problem to me. I doubt many people do HMP memory hotplug while setting a
> specific NUMA policy, but it wouldn't change my assessment anyway. I
> should have made this explicit in the commit message, though.

I'm OK for it to change, but yes I'd like to have the before/after
syntax listed somewhere as easy references for people confused.

Dave

> Kevin
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


