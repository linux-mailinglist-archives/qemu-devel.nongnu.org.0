Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDB814A286
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 12:04:48 +0100 (CET)
Received: from localhost ([::1]:43104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw2CF-0001vV-EJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 06:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47553)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iw2Am-0000yh-UG
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:03:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iw2Al-00046K-UH
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:03:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45120
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iw2Al-00045z-Qy
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 06:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580122995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JbeYD7TQaZsExXoW2u00ipfqV/k+wCRmHEb1ZR3jfg8=;
 b=bLdI8Yvi7duECaMDRxTjsYrjZnuYFn5omdi2cmQoQx3S2XT/r9aTVb20K8GYtxtFFdN27B
 fQ5pK102+xU0cIttVr911TPwgxRg4JVPMhdmXXJgny+haTnL9buB3bpVSzHr3drTqN7m+x
 eFzHn1GJtgyfkVkIDbszK9w0pWV5KUs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-jdqDdHrvMOKZEcI8tsTsuA-1; Mon, 27 Jan 2020 06:03:11 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF049107ACC4;
 Mon, 27 Jan 2020 11:03:10 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2856519E9C;
 Mon, 27 Jan 2020 11:03:08 +0000 (UTC)
Message-ID: <25089b2d02f96571d2f240770710549f52995a31.camel@redhat.com>
Subject: Re: [PATCH 1/9] monitor: uninline add_init_drive
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Mon, 27 Jan 2020 13:03:08 +0200
In-Reply-To: <87zhghkd04.fsf@dusky.pond.sub.org>
References: <20191120185850.18986-1-mlevitsk@redhat.com>
 <20191120185850.18986-2-mlevitsk@redhat.com>
 <87zhghkd04.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: jdqDdHrvMOKZEcI8tsTsuA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-11-27 at 08:13 +0100, Markus Armbruster wrote:
> Maxim Levitsky <mlevitsk@redhat.com> writes:
> 
> > This is only used by hmp_drive_add.
> > The code is just a bit shorter this way.
> > 
> > No functional changes
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  device-hotplug.c | 33 +++++++++++++--------------------
> >  1 file changed, 13 insertions(+), 20 deletions(-)
> > 
> > diff --git a/device-hotplug.c b/device-hotplug.c
> > index f01d53774b..5ce73f0cff 100644
> > --- a/device-hotplug.c
> > +++ b/device-hotplug.c
> > @@ -34,42 +34,35 @@
> >  #include "monitor/monitor.h"
> >  #include "block/block_int.h"
> >  
> > -static DriveInfo *add_init_drive(const char *optstr)
> > +
> > +void hmp_drive_add(Monitor *mon, const QDict *qdict)
> >  {
> >      Error *err = NULL;
> > -    DriveInfo *dinfo;
> > +    DriveInfo *dinfo = NULL;
> 
> Superfluous initializer.
True, fixed now.
> 
> >      QemuOpts *opts;
> >      MachineClass *mc;
> > +    const char *optstr = qdict_get_str(qdict, "opts");
> > +    bool node = qdict_get_try_bool(qdict, "node", false);
> > +
> > +    if (node) {
> > +        hmp_drive_add_node(mon, optstr);
> > +        return;
> > +    }
> >  
> >      opts = drive_def(optstr);
> >      if (!opts)
> > -        return NULL;
> > +        return;
> >  
> >      mc = MACHINE_GET_CLASS(current_machine);
> >      dinfo = drive_new(opts, mc->block_default_type, &err);
> >      if (err) {
> >          error_report_err(err);
> >          qemu_opts_del(opts);
> > -        return NULL;
> > -    }
> > -
> > -    return dinfo;
> > -}
> > -
> > -void hmp_drive_add(Monitor *mon, const QDict *qdict)
> > -{
> > -    DriveInfo *dinfo = NULL;
> > -    const char *opts = qdict_get_str(qdict, "opts");
> > -    bool node = qdict_get_try_bool(qdict, "node", false);
> > -
> > -    if (node) {
> > -        hmp_drive_add_node(mon, opts);
> > -        return;
> > +        goto err;
> >      }
> >  
> > -    dinfo = add_init_drive(opts);
> >      if (!dinfo) {
> > -        goto err;
> > +        return;
> >      }
> >  
> >      switch (dinfo->type) {
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 
> 

Best regards,
	Maxim Levitsky


