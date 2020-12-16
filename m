Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6552DBE16
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 10:57:30 +0100 (CET)
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpTYn-00005A-68
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 04:57:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpTWs-0007Be-5H
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:55:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kpTWl-00052e-FJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:55:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608112521;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F/G5Qwcyc3XcVFWZGtVGBOI15QH7aQ0Kbb1AxyHJTIg=;
 b=CKZ1Jy/LdeZxP+A0ma4cEr8s5wOfQsh4CjotSkxDBs+yxUfe1QkDX2gNES0wiFyFhpDR3u
 Da9yciJZGHL/X+WEuAkevCdhSDRw0Wco7EWpEz8UyT38jwINvcUZvcbzp8bVAUq5EJbdyO
 MJlDQnLc/MjLzrm2CD0dc1MAcHfr0KA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-FC1QcPuXMRGgGPzv1Uvpig-1; Wed, 16 Dec 2020 04:55:19 -0500
X-MC-Unique: FC1QcPuXMRGgGPzv1Uvpig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15D80800D62;
 Wed, 16 Dec 2020 09:55:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-177.ams2.redhat.com [10.36.115.177])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22EB260C5E;
 Wed, 16 Dec 2020 09:55:12 +0000 (UTC)
Date: Wed, 16 Dec 2020 09:55:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 2/2] qom: Assert that objects being destroyed have no
 parent
Message-ID: <20201216095509.GD189795@redhat.com>
References: <20201215224133.3545901-1-ehabkost@redhat.com>
 <20201215224133.3545901-3-ehabkost@redhat.com>
 <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMxuvax3MkDLRGAQh5NDs3rwv3qV7dCw=ne-8PYrovboq-ZNCw@mail.gmail.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 16, 2020 at 11:53:06AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Dec 16, 2020 at 2:41 AM Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > QOM reference counting bugs are often hard to detect, but there's
> > one kind of bug that's easier: if we are freeing an object but is
> > still attached to a parent, it means the reference count is wrong
> > (because the parent always hold a reference to their children).
> >
> > Add an assertion to make sure we detect those cases.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> >
> 
> On the principle, I fully agree. But the risk is high to introduce
> regression if objects are manipulated in strange ways.

Isn't the point that we're broken already. We have a QOM instance
in the tree which has a zero reference count and has been freed.
As soon as something touches that object in the tree, we're liable
to crash & burn touching free'd memory. So it seems the choices are
between crash fast where we see the problem, or crash eventually
at a place where we can't easily trace back to the root cause.

> I remember I wanted object_unref() to automatically remove itself from the
> parent when the last ref is dropped. I think there were similar concerns.

Automatically removing itself would be hiding the bug in whatever
code has mistakenly removed a reference it didn't own.

> 
> Maybe with --enable-qom-debug ? (removing the -cast)
> 
> ---
> >  qom/object.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/qom/object.c b/qom/object.c
> > index f2ae6e6b2a..5cfed6d7c6 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -685,6 +685,7 @@ static void object_finalize(void *data)
> >      object_deinit(obj, ti);
> >
> >      g_assert(obj->ref == 0);
> > +    g_assert(obj->parent == NULL);
> >      if (obj->free) {
> >          obj->free(obj);
> >      }
> > --
> > 2.28.0
> >
> >

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


