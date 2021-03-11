Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F863372E6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 13:41:35 +0100 (CET)
Received: from localhost ([::1]:51894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKKdC-0001uV-G1
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 07:41:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKKaT-0008Rc-IV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lKKaP-0000fA-O2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 07:38:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615466321;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NiLm+4V8XkFxuy6WUlkaCP0kqpA1pBrQPShiLjs2sc=;
 b=f+wBjVo70xBCo6P3x5fLKo9MtIslmTDB87tILJkxWNy4TTtAusbnT8ZQPQXgKkQywNEicl
 wXcRVZEOgBIEc+vwOpomPXN0Zw3ueSukPxKWkVEB6JrSvqmA4uPmHD/9Xwc4xI+K1MlNQ/
 MnxBbTdQJ5ODG13awkK2heA5yGpZlIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-QWpiVfmBN62vOkRrCLtVDw-1; Thu, 11 Mar 2021 07:38:37 -0500
X-MC-Unique: QWpiVfmBN62vOkRrCLtVDw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CC0A107ACCD;
 Thu, 11 Mar 2021 12:38:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-85.ams2.redhat.com [10.36.115.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF4DA5D6D1;
 Thu, 11 Mar 2021 12:38:34 +0000 (UTC)
Date: Thu, 11 Mar 2021 12:38:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 01/33] migration: push Error **errp into
 qemu_loadvm_state()
Message-ID: <YEoPRup0EF+smoFy@redhat.com>
References: <20210204171907.901471-1-berrange@redhat.com>
 <20210204171907.901471-2-berrange@redhat.com>
 <74407f84-c670-cc87-27fe-f3d9d38bda33@redhat.com>
 <20210205093345.GA908621@redhat.com>
 <CAP+75-XnReuDAXw6N28-ckzCtu88A8pn92RH1UgsBMWcN=oYAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP+75-XnReuDAXw6N28-ckzCtu88A8pn92RH1UgsBMWcN=oYAw@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 10:35:28AM +0100, Philippe Mathieu-Daudé wrote:
> On Fri, Feb 5, 2021 at 10:33 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Thu, Feb 04, 2021 at 10:57:20PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 2/4/21 6:18 PM, Daniel P. Berrangé wrote:
> > > > This is an incremental step in converting vmstate loading code to report
> > > > via Error objects instead of printing directly to the console/monitor.
> > > >
> > > > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > > > ---
> > > >  migration/migration.c |  4 ++--
> > > >  migration/savevm.c    | 36 ++++++++++++++++++++----------------
> > > >  migration/savevm.h    |  2 +-
> > > >  3 files changed, 23 insertions(+), 19 deletions(-)
> > > ...
> > >
> > > > diff --git a/migration/savevm.c b/migration/savevm.c
> > > > index 6b320423c7..c8d93eee1e 100644
> > > > --- a/migration/savevm.c
> > > > +++ b/migration/savevm.c
> > > > @@ -2638,40 +2638,49 @@ out:
> > > >      return ret;
> > > >  }
> > > >
> > > > -int qemu_loadvm_state(QEMUFile *f)
> > > > +int qemu_loadvm_state(QEMUFile *f, Error **errp)
> > > >  {
> > > >      MigrationIncomingState *mis = migration_incoming_get_current();
> > > > -    Error *local_err = NULL;
> > > >      int ret;
> > > >
> > > > -    if (qemu_savevm_state_blocked(&local_err)) {
> > > > -        error_report_err(local_err);
> > > > -        return -EINVAL;
> > > > +    if (qemu_savevm_state_blocked(errp)) {
> > > > +        return -1;
> > > >      }
> > > >
> > > >      ret = qemu_loadvm_state_header(f);
> > > >      if (ret) {
> > > > -        return ret;
> > > > +        error_setg(errp, "Error %d while loading VM state", ret);
> > >
> > > Using error_setg_errno() instead (multiple occurences):
> >
> > I don't think we want todo that in general, because the code is
> > already not reliable at actually returning an errno value, sometimes
> > returning just "-1". At the end of this series it will almost always
> > be returning "-1", not an errno.  There are some places where an
> > errno is relevant though - specificially qemu_get_file_error calls.
> 
> Fair. Ignore my other same comments in this. R-b tag stands.

On further investigation you are right. Not using error_setg_errno
has caused a regression in error quality as shown by Dave in a later
patch in this series.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


