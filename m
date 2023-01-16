Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EF66BA2A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 10:22:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLhE-0003ys-PI; Mon, 16 Jan 2023 04:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLhD-0003yk-1w
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLhA-0003uf-Fp
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 04:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673860943;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POXKGza+fEuDEPD6y4RSWzsKPRMi5knd7+e9VhbMGCw=;
 b=e3ilCblS/cWYn1LWQuC+xzMuAcLXLITPsMvUJo5SM/DWQB8rLdv/g34UPHFDuv7v7xtQOC
 usMcwbx/qJiVIZAzrOeGwMIgSmOq9mLol19lnErk/5mPoZ9FCC5bj4zxjPAdFNKzSRzzav
 wCyAEMauVAE4qw2fcQrkueelosTUuhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-REtoyPy1MgGuQ_slXPXNBQ-1; Mon, 16 Jan 2023 04:22:20 -0500
X-MC-Unique: REtoyPy1MgGuQ_slXPXNBQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B06F80D0E8;
 Mon, 16 Jan 2023 09:22:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63838492B10;
 Mon, 16 Jan 2023 09:22:18 +0000 (UTC)
Date: Mon, 16 Jan 2023 09:22:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc: "John Berberian, Jr" <jeb.study@gmail.com>, qemu-devel@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v2] Fix exec migration on Windows (w32+w64).
Message-ID: <Y8UXR6uqdv22auoE@redhat.com>
References: <20230116013421.3149183-1-jeb.study@gmail.com>
 <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+x3tSHAb6LbL+GK0m08UuKCS0RWygz41gMFycqL0JrrQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Jan 16, 2023 at 11:17:08AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jan 16, 2023 at 5:35 AM John Berberian, Jr <jeb.study@gmail.com> wrote:
> >
> > * Use cmd instead of /bin/sh on Windows.
> >
> > * Try to auto-detect cmd.exe's path, but default to a hard-coded path.
> >
> > Note that this will require that gspawn-win[32|64]-helper.exe and
> > gspawn-win[32|64]-helper-console.exe are included in the Windows binary
> > distributions (cc: Stefan Weil).
> >
> > Signed-off-by: "John Berberian, Jr" <jeb.study@gmail.com>
> > ---
> > Whoops, forgot a header. Here's a revised patch.
> >
> >  migration/exec.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/migration/exec.c b/migration/exec.c
> > index 375d2e1b54..38604d73a6 100644
> > --- a/migration/exec.c
> > +++ b/migration/exec.c
> > @@ -23,12 +23,31 @@
> >  #include "migration.h"
> >  #include "io/channel-command.h"
> >  #include "trace.h"
> > +#include "qemu/cutils.h"
> >
> > +#ifdef WIN32
> > +const char *exec_get_cmd_path(void);
> > +const char *exec_get_cmd_path(void)
> > +{
> > +    g_autofree char *detected_path = g_new(char, MAX_PATH);
> > +    if (GetSystemDirectoryA(detected_path, MAX_PATH) == 0) {
> > +        warn_report("Could not detect cmd.exe path, using default.");
> > +        return "C:\\Windows\\System32\\cmd.exe";
> > +    }
> > +    pstrcat(detected_path, MAX_PATH, "\\cmd.exe");
> > +    return g_steal_pointer(&detected_path);
> > +}
> > +#endif
> >
> >  void exec_start_outgoing_migration(MigrationState *s, const char *command, Error **errp)
> >  {
> >      QIOChannel *ioc;
> > +
> > +#ifdef WIN32
> > +    const char *argv[] = { exec_get_cmd_path(), "/c", command, NULL };
> > +#else
> >      const char *argv[] = { "/bin/sh", "-c", command, NULL };
> > +#endif
> 
> It may be a better idea to use g_shell_parse_argv() instead.

For non-Windows that would not be compatible though.  eg if someone is
currently using shell redirection or pipelined commands:

  migrate  "exec:dd of=/foo 1>/dev/null 2>&1"

When we introduce a new QAPI format for migration args though, I've
suggested we drop support for passing exec via shell, and require an
explicit argv[] array:

  https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg01434.html

For Windows since we don't have back compat to worry about, we
can avoid passing via cmd.exe from the start.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


