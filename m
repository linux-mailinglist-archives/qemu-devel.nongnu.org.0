Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7BE3B1DBE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:41:06 +0200 (CEST)
Received: from localhost ([::1]:48848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4zw-000799-KH
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw4yW-0006Gl-M6
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:39:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lw4yS-0003UZ-7j
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624462770;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YlTFp2qnttqvkdIJ59KB3J917+pqxl6orXkU3szbis=;
 b=E98h3o0Bw6nOEG0rYPEX1trHf5kaYgQOujLj2LRdVxEG/GI381AnIHJHxmTo7KRyiQTLlK
 XU0wv/nXR8Y6N37FYCXbFk22evYSyYHb4NOYi5URAU7gkDHhVfwkp7sznnklNAhfvHrLwQ
 q6mBBxNRCg20th7bLY8vqzK0HSDuaTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Uz_uHNXIMuO7xeM18WdhFw-1; Wed, 23 Jun 2021 11:39:24 -0400
X-MC-Unique: Uz_uHNXIMuO7xeM18WdhFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B37721084F4B;
 Wed, 23 Jun 2021 15:39:23 +0000 (UTC)
Received: from redhat.com (ovpn-114-176.ams2.redhat.com [10.36.114.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C7B315C1A1;
 Wed, 23 Jun 2021 15:39:21 +0000 (UTC)
Date: Wed, 23 Jun 2021 16:39:18 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: Auditing QEMU to replace NULL with &error_abort
Message-ID: <YNNVplu0sIQA/ju5@redhat.com>
References: <7132e6a4-8d3a-828e-1c08-b17954445341@redhat.com>
 <87k0mk4vyg.fsf@dusky.pond.sub.org> <YNNOi22ZQaKibqSO@redhat.com>
 <CAJ+F1CKuknwaWXfjU7iXXYOTo0aB_Z_a_hj5ny+JRFiMYRZLNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CKuknwaWXfjU7iXXYOTo0aB_Z_a_hj5ny+JRFiMYRZLNQ@mail.gmail.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 23, 2021 at 07:31:13PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 23, 2021 at 7:10 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Wed, Jun 23, 2021 at 02:16:55PM +0200, Markus Armbruster wrote:
> > > &error_abort has been a clear win for us.  &error_fatal too, when used
> > > judiciously.  Marc-André tried to get both into GLib, unsuccessfully[2].
> >
> > ...snip...
> >
> > > [2] https://gitlab.gnome.org/GNOME/glib/-/issues/2288
> >
> > This doesn't actually suggest adding error_abort/fatal to GLib. Rather
> > it adds a general callback hook to GLib. Biggest complaints there
> > are around the callback concept and difficulty of safely using it,
> > which I can't disagree with.
> >
> > I wonder if we would have more luck if we explicitly proposed the
> > error_abort/fatal concept to GLib instead. At least that would not
> > hit any of the complaints raised about the callback.
> >
> >
> Without callbacks, it will be difficult to report errors back to the
> monitor, or prettify it the way we want (since we would be using extended
> GErrors for hints etc)
> 
> But we could have a more specific callback for that perhaps?
> 
> You are welcome to propose something else :)

I was thinking g_set_error would use g_warning/g_error to report
it, and thus involve the g_log_default_handler callback, which
we could provide to feed back into the monitor.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


