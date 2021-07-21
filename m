Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C243D1068
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 16:01:43 +0200 (CEST)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6Cn8-00070r-AA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 10:01:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6ClZ-0006Dx-4O
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6ClW-00040g-DN
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 10:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626876001;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxgtES0VGcUQ6Sm3qYx1+sWd1znFV0aCLenQqBLuxTs=;
 b=DLkF/v2goXtTW5BjpQGceYHgETuc52FftkMeTbiX8NgLM/Z1twl3h70dOlW/4nqhKwpz0l
 zhVaqZcAMfFxm/uAuH5ALpURzZdUZ95+Qbp1oClaf6cWNddZDWbb8l50XVPKnPy7u1Jw18
 qvxWCJCUcxV59859W4sosB8A494zzY0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-f3Yv5P5JMniC5tFYRmVSMA-1; Wed, 21 Jul 2021 09:59:56 -0400
X-MC-Unique: f3Yv5P5JMniC5tFYRmVSMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4A7F802C87;
 Wed, 21 Jul 2021 13:59:55 +0000 (UTC)
Received: from redhat.com (ovpn-113-72.ams2.redhat.com [10.36.113.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B1A19C79;
 Wed, 21 Jul 2021 13:59:54 +0000 (UTC)
Date: Wed, 21 Jul 2021 14:59:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH] qom/object.c 'if (type_table == NULL)' statement is
 redundant , delete it.
Message-ID: <YPgoV0cUZKi0fMlr@redhat.com>
References: <20210721084446.26377-1-zhuguanghong@uniontech.com>
 <CAJ+F1CKkgfp8nDqHZD1Y8xAiY4_+eRmQBddE8W8bgV22BKoEQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKkgfp8nDqHZD1Y8xAiY4_+eRmQBddE8W8bgV22BKoEQA@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: QEMU <qemu-devel@nongnu.org>, zhuguanghong <zhuguanghong@uniontech.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 21, 2021 at 05:55:44PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 21, 2021 at 5:22 PM zhuguanghong <zhuguanghong@uniontech.com>
> wrote:
> 
> > Signed-off-by: zhuguanghong <zhuguanghong@uniontech.com>
> > ---
> >  qom/object.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/qom/object.c b/qom/object.c
> > index 6a01d56546..c8f5481afe 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -78,9 +78,7 @@ static GHashTable *type_table_get(void)
> >  {
> >      static GHashTable *type_table;
> >
> > -    if (type_table == NULL) {
> > -        type_table = g_hash_table_new(g_str_hash, g_str_equal);
> > -    }
> > +    type_table = g_hash_table_new(g_str_hash, g_str_equal);
> >
> >
> nack.It's not redundant, it does a one-time initialization.
> 
> We may want to replace it with a more explicit and thread-safe version
> though:
> https://developer.gnome.org/glib/stable/glib-Threads.html#g-once-init-enter

I would have thought QOM usage is so widespread in QEMU that we'll
trigger initialization of this hash tble very early in startup
while we're still single threaded.

That said there's not really any harm in using g_once

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


