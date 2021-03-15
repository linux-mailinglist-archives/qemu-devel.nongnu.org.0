Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E4B33B0C4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:14:57 +0100 (CET)
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlBY-0002RY-6K
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLl6N-00075C-21
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:09:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lLl6H-00014Y-Be
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:09:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615806567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8eDNOwsVT4D4NsAwLCtcOzteI/Em3+S6N8Qffmi6WDw=;
 b=cqcEnh13W2ImoVZJmJwsTS7IdOv83JCXh5zqR0vFEfZRrtFX8UT+/SqbWs8wmkhZhErGbT
 q9xrDY0SDD0Wq0bhjsAcMvxeC2E0MIWG0+goRfBMkdkJ8ESplC59DMKT73ILmlh5vBE4S4
 gshdfCy4QVw6dU157iOGk8GcL/GOdPk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-poXLnDUxPRWvZqfyIE_Wxg-1; Mon, 15 Mar 2021 07:09:25 -0400
X-MC-Unique: poXLnDUxPRWvZqfyIE_Wxg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B54B7802B45;
 Mon, 15 Mar 2021 11:09:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-128.ams2.redhat.com [10.36.115.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 146B65C3E6;
 Mon, 15 Mar 2021 11:09:15 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:09:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 27/30] hmp: QAPIfy object_add
Message-ID: <YE9AWksF89nc2NjV@merkur.fritz.box>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <20210308165440.386489-28-kwolf@redhat.com>
 <87pn03rxmq.fsf@dusky.pond.sub.org>
 <cb9bee91-8d38-b232-44bd-b163d7081395@redhat.com>
 <87tupckb7d.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87tupckb7d.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 15.03.2021 um 10:39 hat Markus Armbruster geschrieben:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> > On 13/03/21 14:28, Markus Armbruster wrote:
> >> Kevin Wolf <kwolf@redhat.com> writes:
> >> 
> >>> This switches the HMP command object_add from a QemuOpts-based parser to
> >>> user_creatable_add_from_str() which uses a keyval parser and enforces
> >>> the QAPI schema.
> >>>
> >>> Apart from being a cleanup, this makes non-scalar properties and help
> >>> accessible. In order for help to be printed to the monitor instead of
> >>> stdout, the printf() calls in the help functions are changed to
> >>> qemu_printf().
> >>>
> >>> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> >>> Acked-by: Peter Krempa <pkrempa@redhat.com>
> >>> Reviewed-by: Eric Blake <eblake@redhat.com>
> >>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >>> ---
> >>>   monitor/hmp-cmds.c      | 17 ++---------------
> >>>   qom/object_interfaces.c | 11 ++++++-----
> >>>   hmp-commands.hx         |  2 +-
> >>>   3 files changed, 9 insertions(+), 21 deletions(-)
> >>>
> >>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> >>> index 3c88a4faef..652cf9ff21 100644
> >>> --- a/monitor/hmp-cmds.c
> >>> +++ b/monitor/hmp-cmds.c
> >>> @@ -1670,24 +1670,11 @@ void hmp_netdev_del(Monitor *mon, const QDict *qdict)
> >>>   
> >>>   void hmp_object_add(Monitor *mon, const QDict *qdict)
> >>>   {
> >>> +    const char *options = qdict_get_str(qdict, "object");
> >>>       Error *err = NULL;
> >>> -    QemuOpts *opts;
> >>> -    Object *obj = NULL;
> >>> -
> >>> -    opts = qemu_opts_from_qdict(qemu_find_opts("object"), qdict, &err);
> >>> -    if (err) {
> >>> -        goto end;
> >>> -    }
> >>>   
> >>> -    obj = user_creatable_add_opts(opts, &err);
> >>> -    qemu_opts_del(opts);
> >>> -
> >>> -end:
> >>> +    user_creatable_add_from_str(options, &err);
> >>>       hmp_handle_error(mon, err);
> >>> -
> >>> -    if (obj) {
> >>> -        object_unref(obj);
> >>> -    }
> >>>   }
> >> 
> >> Doesn't this break the list-valued properties (Memdev member host-nodes,
> >> NumaNodeOptions member cpus) exactly the same way that made us keep
> >> QemuOpts for qemu-system-FOO -object?
> >
> > Yes, it does.  I guess it can just be documented, unlike for the command 
> > line?
> 
> Maybe.  Judgement call, not mine to make.
> 
> Do people create such objects in HMP?  I figure we don't really know.
> Educated guess?
> 
> If you try, how does it break?  Is it confusing?  Can you show an
> example?

(qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes=0
Error: Invalid parameter type for 'host-nodes', expected: array
(qemu) object_add memory-backend-ram,id=mem,size=4G,policy=bind,host-nodes.0=0
(qemu)

HMP is not a stable interface, so changing the syntax didn't feel like a
problem to me. I doubt many people do HMP memory hotplug while setting a
specific NUMA policy, but it wouldn't change my assessment anyway. I
should have made this explicit in the commit message, though.

Kevin


