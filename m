Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705FE14C941
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:06:27 +0100 (CET)
Received: from localhost ([::1]:44314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwlAw-0006UJ-8I
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iwlA3-00061h-Vj
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:05:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iwlA1-0004L6-PU
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:05:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:26946)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1iwlA1-0004Jt-Ld
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:05:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580295929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MqDfl2iGvpKZh7ckSGzu0leYgg5wWQTIx6AxUjmOCVE=;
 b=Ibfk5bioBnPa/TDgBKNIoevkGjfVvlW//xW0nOnl7/0YD23wlAjVXanz5pn1wP1EF5aTge
 e2LMk39mRunRRwi7qbhI7c2ltv+inv3Db1HLRnEHXZUrVpphIfIIcFJmP3+YVFbn1OB5Ip
 I2kV2cD7TcGWH3yZGz9Tty3eD6Zx/kE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-F4gFxt50PPKpDLUUYbiFqA-1; Wed, 29 Jan 2020 06:05:25 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 786328F70C2;
 Wed, 29 Jan 2020 11:05:24 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFC8F5C1B5;
 Wed, 29 Jan 2020 11:05:19 +0000 (UTC)
Message-ID: <7b796fc452a817ea4f39f4ebdd8a2acce638788f.camel@redhat.com>
Subject: Re: [PATCH v3 13/13] monitor/hmp: Prefer to use hmp_handle_error
 for error reporting in block hmp commands
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Date: Wed, 29 Jan 2020 13:05:18 +0200
In-Reply-To: <87eevi7e1e.fsf@dusky.pond.sub.org>
References: <20200127103647.17761-1-mlevitsk@redhat.com>
 <20200127103647.17761-14-mlevitsk@redhat.com>
 <f6c782743639a93ac06c8a6ef0e110b66eb613c4.camel@redhat.com>
 <87eevi7e1e.fsf@dusky.pond.sub.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: F4gFxt50PPKpDLUUYbiFqA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2020-01-29 at 11:27 +0100, Markus Armbruster wrote:
> Maxim Levitsky <mlevitsk@redhat.com> writes:
> 
> > On Mon, 2020-01-27 at 12:36 +0200, Maxim Levitsky wrote:
> > > This way they all will be prefixed with 'Error:' which some parsers
> > > (e.g libvirt) need
> > > 
> > > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1719169
> > > 
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > 
> > And I probably will keep that patch since it is not invasive and
> > still does a nice refactoring.
> > Thoughts?
> 
> The commit message needs updating: libvirt doesn't actually need this
> anymore.
> 
> What remains is "nice refactoring".  Let's look at the patch from that
> perspective.
> 
> > 
> > Best regards,
> > 	Maxim Levitsky
> > 
> > > ---
> > >  block/monitor/block-hmp-cmds.c | 35 ++++++++++++++++++++--------------
> > >  1 file changed, 21 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
> > > index 7bbe4e3814..5b060d380d 100644
> > > --- a/block/monitor/block-hmp-cmds.c
> > > +++ b/block/monitor/block-hmp-cmds.c
> > > @@ -84,7 +84,6 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict)
> > >      mc = MACHINE_GET_CLASS(current_machine);
> > >      dinfo = drive_new(opts, mc->block_default_type, &err);
> > >      if (err) {
> > > -        error_report_err(err);
> > >          qemu_opts_del(opts);
> > >          goto err;
> > >      }
> > > @@ -98,7 +97,7 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict)
> > >          monitor_printf(mon, "OK\n");
> > >          break;
> > >      default:
> > > -        monitor_printf(mon, "Can't hot-add drive to type %d\n", dinfo->type);
> > > +        error_setg(&err, "Can't hot-add drive to type %d", dinfo->type);
> > >          goto err;
> > >      }
> > >      return;
> > > @@ -109,6 +108,7 @@ err:
> > >          monitor_remove_blk(blk);
> > >          blk_unref(blk);
> > >      }
> > > +    hmp_handle_error(mon, err);
> > >  }
> 
> Is this really nicer?
> 
> > >  
> > >  void hmp_drive_del(Monitor *mon, const QDict *qdict)
> > > @@ -130,14 +130,14 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
> > >  
> > >      blk = blk_by_name(id);
> > >      if (!blk) {
> > > -        error_report("Device '%s' not found", id);
> > > -        return;
> > > +        error_setg(&local_err, "Device '%s' not found", id);
> > > +        goto err;
> > >      }
> > >  
> > >      if (!blk_legacy_dinfo(blk)) {
> > > -        error_report("Deleting device added with blockdev-add"
> > > -                     " is not supported");
> > > -        return;
> > > +        error_setg(&local_err,
> > > +                   "Deleting device added with blockdev-add is not supported");
> > > +        goto err;
> > >      }
> > >  
> > >      aio_context = blk_get_aio_context(blk);
> > > @@ -146,9 +146,8 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
> > >      bs = blk_bs(blk);
> > >      if (bs) {
> > >          if (bdrv_op_is_blocked(bs, BLOCK_OP_TYPE_DRIVE_DEL, &local_err)) {
> > > -            error_report_err(local_err);
> > >              aio_context_release(aio_context);
> > > -            return;
> > > +            goto err;
> > >          }
> > >  
> > >          blk_remove_bs(blk);
> > > @@ -169,12 +168,15 @@ void hmp_drive_del(Monitor *mon, const QDict *qdict)
> > >      }
> > >  
> > >      aio_context_release(aio_context);
> > > +err:
> > > +    hmp_handle_error(mon, local_err);
> > >  }
> 
> Likewise.
> 
> > >  
> > >  void hmp_commit(Monitor *mon, const QDict *qdict)
> > >  {
> > >      const char *device = qdict_get_str(qdict, "device");
> > >      BlockBackend *blk;
> > > +    Error *local_err = NULL;
> > >      int ret;
> > >  
> > >      if (!strcmp(device, "all")) {
> > > @@ -185,12 +187,12 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
> > >  
> > >          blk = blk_by_name(device);
> > >          if (!blk) {
> > > -            error_report("Device '%s' not found", device);
> > > -            return;
> > > +            error_setg(&local_err, "Device '%s' not found", device);
> > > +            goto err;
> > >          }
> > >          if (!blk_is_available(blk)) {
> > > -            error_report("Device '%s' has no medium", device);
> > > -            return;
> > > +            error_setg(&local_err, "Device '%s' has no medium", device);
> > > +            goto err;
> > >          }
> > >  
> > >          bs = blk_bs(blk);
> > > @@ -202,8 +204,13 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
> > >          aio_context_release(aio_context);
> > >      }
> > >      if (ret < 0) {
> > > -        error_report("'commit' error for '%s': %s", device, strerror(-ret));
> > > +        error_setg(&local_err,
> > > +                   "'commit' error for '%s': %s", device, strerror(-ret));
> > > +        goto err;
> > >      }
> > > +    return;
> > > +err:
> > > +    hmp_handle_error(mon, local_err);
> > >  }
> > >  
> > >  void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
> 
> Likewise.
> 
> Up to the code's maintainers Kevin & Max.
Yep.
In theory, if I understand correctly we should reduce usage of monitor_printf,
but yes, without libvirt justification I don't mind dropping this.

I hope that the rest of the patches will make it, so that this work is not
wasted.

Thanks for the review!

Best regards,
	Maxim Levitsky



