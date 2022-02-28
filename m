Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6C4C6585
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 10:15:34 +0100 (CET)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOc7w-0006pP-Hr
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 04:15:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOc5v-0006As-Ck
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:13:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOc5t-0001F4-7O
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 04:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646039604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cPT9tpIeUPVgORBybacCiPs+U6ZVYWiYQHhiXgVh7aE=;
 b=NG0qK0cmyZhNw7vYrMzK8ooKq1CT0j9J13LIRDnKY6uuhPre7z4i9r2hwK/VroVAMPRLG0
 fIlFIQEC6HVhpavBHNqEWQCmLl0hYqdEvhdoxXWVLf+2RIdshF1mw5JVFr0U034oy1wG6F
 HfSD8QpDrq2ClnmuouRRVMWXB4qT2DY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-9qAbY2CGOC2H-kx6_N0QPA-1; Mon, 28 Feb 2022 04:13:15 -0500
X-MC-Unique: 9qAbY2CGOC2H-kx6_N0QPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0182B814614;
 Mon, 28 Feb 2022 09:13:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B10285ED2F;
 Mon, 28 Feb 2022 09:13:12 +0000 (UTC)
Date: Mon, 28 Feb 2022 09:13:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 6/8] char: move qemu_openpty_raw from util/ to char/
Message-ID: <YhySJepNwSuv/zP5@redhat.com>
References: <20220222194008.610377-1-marcandre.lureau@redhat.com>
 <20220222194008.610377-7-marcandre.lureau@redhat.com>
 <CAJ+F1C+QOAcjAiAY=7jcYgjJTQ79PTUDBRoJ3fzyHha2Syw4tA@mail.gmail.com>
 <8d5b4245-56e7-8384-4104-33d3ab1adf42@redhat.com>
 <CAJ+F1CK5U1agzbDztrWBavmoiAfmwW3AHcWBKRwGh9f0LRan0A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CK5U1agzbDztrWBavmoiAfmwW3AHcWBKRwGh9f0LRan0A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 11:53:23AM +0400, Marc-André Lureau wrote:
> Hi Paolo
> 
> On Sat, Feb 26, 2022 at 11:38 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
> > On 2/24/22 18:04, Marc-André Lureau wrote:
> > > Paolo,
> > >
> > > This patch is ok, but in some (new?) circumstances it fails with freebsd
> > > and reveals that -lutil was missing for kinfo_getproc() in
> > > util/oslib-posix.c. Please add:
> > >
> > > -util_ss.add(when: 'CONFIG_POSIX', if_true: files('oslib-posix.c'))
> > > +util_ss.add(when: 'CONFIG_POSIX', if_true: [files('oslib-posix.c'),
> > util])
> > >
> > > (even better if we made this specific to freebsd I guess, but not
> > > strictly necessary)
> >
> > Looking again at the patch (because indeed it broke CI :)), I'm not sure
> > it's a good idea.  The code seems to be partly taken from other projects
> > and doesn't follow the QEMU coding standards.
> >
> 
> One more reason imho to not have this in the common qemuutil library.
> 
> Apparently, the helper was added in 2008, commit 64b7b7334b ("Put
> Pseudo-TTY in rawmode for char devices") and it is not necessary since
> Solaris 11.4 (see commit 9df8b20d1). I am not sure we need to maintain
> compatibility with Solaris <11.4 (released on Aug 2018) tbh. According to
> wikipedia page, 11.3 is maintained until January 2024. Maybe wait until
> that and drop it?

We only support the current major release, and thue previous major
release for 2 years overlap. If we consider 11.x releases as major,
then 11.3 went out of scope from QEMU's POV in Aug 2020, and thus
we don't need to care about this code.

More generally though, Solaris isn't even a platform we try to
support at all is it ?

We've never had any formal testing on it. Have we seen people filing
bugs mentioning solaris in the last 5 years ? If QEMU works at all,
I suspect it is merely by luck. 

We could try to flush out anyone who cares by putting in a check in
configure to mark Solaris as deprecated in this release. If someone
complains then we can have the discussion about how we get any CI
testing for it going forward.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


