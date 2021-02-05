Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AB3107F4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:35:58 +0100 (CET)
Received: from localhost ([::1]:49076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xWu-0005Dy-OB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:35:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xV8-0004S8-DA
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:34:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7xV2-0006Cg-SY
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:34:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612517638;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVXM/gCoiJkivwHAoCAYveWsoSE+PFeHFS9q9I1l5sI=;
 b=QkL3I9ltt1vc3HA0+YPzxRwY9TOjs/cCKCkIuHU5AE62mQrdBXPEtDQi/FYYuXBeDDvwJA
 iF9bsFtAHdHZGSG0V1oZsf8+DjCGYFnBBfckCLFnBdrYKIfbmy9Jw14ywD8Cd7epWUuQh/
 Hk0yzekvAdyRdk+R2SKMadOLAMdsGmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-tnrA_rj1ObSZGJ8on2AE0A-1; Fri, 05 Feb 2021 04:33:52 -0500
X-MC-Unique: tnrA_rj1ObSZGJ8on2AE0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BCD3100CCD5;
 Fri,  5 Feb 2021 09:33:51 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EFCA8048E;
 Fri,  5 Feb 2021 09:33:48 +0000 (UTC)
Date: Fri, 5 Feb 2021 09:33:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/33] migration: push Error **errp into
 qemu_loadvm_state()
Message-ID: <20210205093345.GA908621@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-2-berrange@redhat.com>
 <74407f84-c670-cc87-27fe-f3d9d38bda33@redhat.com>
MIME-Version: 1.0
In-Reply-To: <74407f84-c670-cc87-27fe-f3d9d38bda33@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 10:57:20PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> > This is an incremental step in converting vmstate loading code to report
> > via Error objects instead of printing directly to the console/monitor.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  migration/migration.c |  4 ++--
> >  migration/savevm.c    | 36 ++++++++++++++++++++----------------
> >  migration/savevm.h    |  2 +-
> >  3 files changed, 23 insertions(+), 19 deletions(-)
> ...
> 
> > diff --git a/migration/savevm.c b/migration/savevm.c
> > index 6b320423c7..c8d93eee1e 100644
> > --- a/migration/savevm.c
> > +++ b/migration/savevm.c
> > @@ -2638,40 +2638,49 @@ out:
> >      return ret;
> >  }
> >  
> > -int qemu_loadvm_state(QEMUFile *f)
> > +int qemu_loadvm_state(QEMUFile *f, Error **errp)
> >  {
> >      MigrationIncomingState *mis = migration_incoming_get_current();
> > -    Error *local_err = NULL;
> >      int ret;
> >  
> > -    if (qemu_savevm_state_blocked(&local_err)) {
> > -        error_report_err(local_err);
> > -        return -EINVAL;
> > +    if (qemu_savevm_state_blocked(errp)) {
> > +        return -1;
> >      }
> >  
> >      ret = qemu_loadvm_state_header(f);
> >      if (ret) {
> > -        return ret;
> > +        error_setg(errp, "Error %d while loading VM state", ret);
> 
> Using error_setg_errno() instead (multiple occurences):

I don't think we want todo that in general, because the code is
already not reliable at actually returning an errno value, sometimes
returning just "-1". At the end of this series it will almost always
be returning "-1", not an errno.  There are some places where an
errno is relevant though - specificially qemu_get_file_error calls.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


