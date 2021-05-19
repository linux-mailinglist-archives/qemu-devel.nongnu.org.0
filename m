Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2AB3892E3
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:45:09 +0200 (CEST)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljONg-0005qb-NC
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljOMN-0004Qn-1C
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljOME-00036m-Fy
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621439017;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Agqap8EVStMQwGq1YnzfvUcBkf55YQxpYjbChjZUOkA=;
 b=fuK5JSWfAmKIllKFTX4zK01dV5Uad6c1GAoPtez6EqLFGqQALypYjKjf7HqMU+mIbRcSaR
 bBqWmlrhfgBc1P7u3UTyxyVvAhz8qVkHqJQjYVjRKmufc5NkaDzAEfrf/dj/gpd1ipTUSv
 ZH2vjsZB8v0jAl5nSTamfxkK9EfVvHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-myOCBWHkMbySaXZJpw1UJw-1; Wed, 19 May 2021 11:43:34 -0400
X-MC-Unique: myOCBWHkMbySaXZJpw1UJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F3FC6D24A;
 Wed, 19 May 2021 15:43:32 +0000 (UTC)
Received: from redhat.com (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98CB61971B;
 Wed, 19 May 2021 15:43:30 +0000 (UTC)
Date: Wed, 19 May 2021 16:43:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 4/9] qapi: Implement 'query-machine-phase' command
Message-ID: <YKUyH3ckBw/CmMWI@redhat.com>
References: <20210513082549.114275-1-mirela.grujic@greensocs.com>
 <20210513082549.114275-5-mirela.grujic@greensocs.com>
 <b6b57511-7cef-5e0f-afbe-81a1d410e524@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b6b57511-7cef-5e0f-afbe-81a1d410e524@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: damien.hedde@greensocs.com, edgar.iglesias@xilinx.com,
 Eduardo Habkost <ehabkost@redhat.com>, mark.burton@greensocs.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 13, 2021 at 07:44:34PM +0200, Paolo Bonzini wrote:
> On 13/05/21 10:25, Mirela Grujic wrote:
> > The command returns current machine initialization phase.
> >  From now on, the MachineInitPhase enum is generated.
> > 
> > Signed-off-by: Mirela Grujic <mirela.grujic@greensocs.com>
> > ---
> >   qapi/machine.json          | 54 ++++++++++++++++++++++++++++++++++++++
> >   include/hw/qdev-core.h     | 29 +-------------------
> >   hw/core/machine-qmp-cmds.c |  9 +++++++
> >   3 files changed, 64 insertions(+), 28 deletions(-)
> > 
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 6e90d463fc..47bdbec817 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1274,3 +1274,57 @@
> >   ##
> >   { 'event': 'MEM_UNPLUG_ERROR',
> >     'data': { 'device': 'str', 'msg': 'str' } }
> > +
> > +##
> > +# @MachineInitPhase:
> > +#
> > +# Enumeration of machine initialization phases.
> > +#
> > +# @no-machine: machine does not exist
> > +#
> > +# @machine-created: machine is created, but its accelerator is not
> > +#
> > +# @accel-created: accelerator is created, but the machine properties have not
> > +#                 been validated and machine initialization is not done yet
> > +#
> > +# @initialized: machine is initialized, thus creating any embedded devices and
> > +#               validating machine properties. Devices created at this time are
> > +#               considered to be cold-plugged.
> > +#
> > +# @ready: QEMU is ready to start CPUs and devices created at this time are
> > +#         considered to be hot-plugged. The monitor is not restricted to
> > +#         "preconfig" commands.
> > +##
> > +{ 'enum': 'MachineInitPhase',
> > +  'data': [ 'no-machine', 'machine-created', 'accel-created', 'initialized',
> > +            'ready' ] }
> > +
> > +##
> > +# @MachineInitPhaseStatus:
> > +#
> > +# Information about machine initialization phase
> > +#
> > +# @phase: the machine initialization phase
> > +#
> > +# Since:  #FIXME
> > +##
> > +{ 'struct': 'MachineInitPhaseStatus',
> > +  'data': { 'phase': 'MachineInitPhase' } }
> > +
> > +##
> > +# @query-machine-phase:
> > +#
> > +# Return machine initialization phase
> > +#
> > +# Since: #FIXME
> > +#
> > +# Returns: MachineInitPhaseStatus
> > +#
> > +# Example:
> > +#
> > +# -> { "execute": "query-machine-phase" }
> > +# <- { "return": { "phase": "initialized" } }
> > +#
> > +##
> > +{ 'command': 'query-machine-phase', 'returns': 'MachineInitPhaseStatus',
> > +             'allow-preconfig': true }
> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > index dc2f63478b..ca39b77ae6 100644
> > --- a/include/hw/qdev-core.h
> > +++ b/include/hw/qdev-core.h
> > @@ -1,6 +1,7 @@
> >   #ifndef QDEV_CORE_H
> >   #define QDEV_CORE_H
> > +#include "qapi/qapi-types-machine.h"
> >   #include "qemu/queue.h"
> >   #include "qemu/bitmap.h"
> >   #include "qemu/rcu.h"
> > @@ -811,34 +812,6 @@ void device_listener_unregister(DeviceListener *listener);
> >    */
> >   bool qdev_should_hide_device(QemuOpts *opts);
> > -typedef enum MachineInitPhase {
> > -    /* current_machine is NULL.  */
> > -    MACHINE_INIT_PHASE_NO_MACHINE,
> > -
> > -    /* current_machine is not NULL, but current_machine->accel is NULL.  */
> > -    MACHINE_INIT_PHASE_MACHINE_CREATED,
> > -
> > -    /*
> > -     * current_machine->accel is not NULL, but the machine properties have
> > -     * not been validated and machine_class->init has not yet been called.
> > -     */
> > -    MACHINE_INIT_PHASE_ACCEL_CREATED,
> > -
> > -    /*
> > -     * machine_class->init has been called, thus creating any embedded
> > -     * devices and validating machine properties.  Devices created at
> > -     * this time are considered to be cold-plugged.
> > -     */
> > -    MACHINE_INIT_PHASE_INITIALIZED,
> > -
> > -    /*
> > -     * QEMU is ready to start CPUs and devices created at this time
> > -     * are considered to be hot-plugged.  The monitor is not restricted
> > -     * to "preconfig" commands.
> > -     */
> > -    MACHINE_INIT_PHASE_READY,
> > -} MachineInitPhase;
> > -
> >   extern bool phase_check(MachineInitPhase phase);
> >   extern void phase_advance(MachineInitPhase phase);
> >   extern MachineInitPhase phase_get(void);
> > diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> > index be286882cc..23f837dadb 100644
> > --- a/hw/core/machine-qmp-cmds.c
> > +++ b/hw/core/machine-qmp-cmds.c
> > @@ -198,3 +198,12 @@ MemdevList *qmp_query_memdev(Error **errp)
> >       object_child_foreach(obj, query_memdev, &list);
> >       return list;
> >   }
> > +
> > +MachineInitPhaseStatus *qmp_query_machine_phase(Error **errp)
> > +{
> > +    MachineInitPhaseStatus *status = g_malloc0(sizeof(*status));
> > +
> > +    status->phase = phase_get();
> > +
> > +    return status;
> > +}
> > 
> 
> This command is a good idea, and we can in fact even include it already in
> QEMU.

I worry that this is exposing an internal QEMU implementation detail.
If apps rely on a particular set of phases existing, and running in
particular order, it could easily hobble our ability to refactor
QEMU's startup procedure to cope with new requirements in future. 

I don't even much like the existing "pre-config" concept we have
for this same reason, and this is adding many more phases.

I think we'd be better off trying to make it possible for the mgmt
app to just provide all the config at once and let QEMU figure our
the phases in which it then instantiates stuff, so we can freedom
to change our minds at any time.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


