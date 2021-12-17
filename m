Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8C2478C90
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 14:43:48 +0100 (CET)
Received: from localhost ([::1]:60758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDWV-0001AJ-Jp
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 08:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDT9-0006xK-4z
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDT5-0008Rl-SZ
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748411;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WII+q6sMQtq6oiTOPoewOtdOLNUWgzawJNtWuwMt0Y=;
 b=N4Q+VJ0uISTXdwc1jUutSBVnIMY0W4YBevCueUTSFfn7pgPW0K8GIbpmL/R+1CrxLICqnL
 V2HYyJptFuzv6OxNvobFxFaTICF4XhaGZmCOMIbAkZoFVngO8JYbrx3jM/WILx9qJ1UmMe
 Kod/YXlrshjTT/X4eW2g8qhJ6nDBRQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-M2LCHepfPh2jVD5gCUJAow-1; Fri, 17 Dec 2021 08:40:06 -0500
X-MC-Unique: M2LCHepfPh2jVD5gCUJAow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA38874986;
 Fri, 17 Dec 2021 13:40:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDD3104A9F3;
 Fri, 17 Dec 2021 13:39:41 +0000 (UTC)
Date: Fri, 17 Dec 2021 13:39:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YbyTGUmLOcCoPYiq@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
 <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
 <87v8zneap1.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87v8zneap1.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 17, 2021 at 11:10:31AM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > On 12/16/21 15:11, Alex Bennée wrote:
> >> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> >> 
> >>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> >>> (Fedora 34 provides GLib 2.68.1) we get:
> >>>
> >>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
> >>>   ...
> >>>
> >>> g_memdup() has been updated by g_memdup2() to fix eventual security
> >>> issues (size argument is 32-bit and could be truncated / wrapping).
> >>> GLib recommends to copy their static inline version of g_memdup2():
> >>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> >>>
> >>> Our glib-compat.h provides a comment explaining how to deal with
> >>> these deprecated declarations (see commit e71e8cc0355
> >>> "glib: enforce the minimum required version and warn about old APIs").
> >>>
> <snip>
> >>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> >>> +
> >> 
> >> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> >> s)?
> >
> > I followed the documentation in include/glib-compat.h:
> >
> > /*
> >  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
> > allowing
> >  * use of functions from newer GLib via this compat header needs a little
> >  * trickery to prevent warnings being emitted.
> >  *
> >  * Consider a function from newer glib-X.Y that we want to use
> >  *
> >  *    int g_foo(const char *wibble)
> >  *
> >  * We must define a static inline function with the same signature that does
> >  * what we need, but with a "_qemu" suffix e.g.
> >  *
> >  * static inline void g_foo_qemu(const char *wibble)
> >  * {
> >  *     #if GLIB_CHECK_VERSION(X, Y, 0)
> >  *        g_foo(wibble)
> >  *     #else
> >  *        g_something_equivalent_in_older_glib(wibble);
> >  *     #endif
> >  * }
> >  *
> >  * The #pragma at the top of this file turns off -Wdeprecated-declarations,
> >  * ensuring this wrapper function impl doesn't trigger the compiler warning
> >  * about using too new glib APIs. Finally we can do
> >  *
> >  *   #define g_foo(a) g_foo_qemu(a)
> >  *
> >  * So now the code elsewhere in QEMU, which *does* have the
> >  * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
> >  * without generating warnings.
> >  */
> >
> > which is how g_unix_get_passwd_entry_qemu() is implemented.
> 
> Yet later we have qemu_g_test_slow following the style guide. Also I'm
> confused by the usage of g_unix_get_passwd_entry_qemu because the only
> place I see it in qga/commands-posix-ssh.c right before it does:
> 
> #define g_unix_get_passwd_entry_qemu(username, err) \
>    test_get_passwd_entry(username, err)

The g_unix_get_passwd_entry method is a bad example as it is
not following the guide for transparent replacement.

 > 
> although I think that only hold when the file is built with
> QGA_BUILD_UNIT_TEST.
> 
> > Should we reword the documentation first?
> 
> The original wording in glib-compat.h was added by Daniel in 2018 but
> the commit that added the password function comments:
> 
>   Since the fallback version is still unsafe, I would rather keep the
>   _qemu postfix, to make sure it's not being misused by mistake. When/if
>   necessary, we can implement a safer fallback and drop the _qemu suffix.
> 
> So if we are going to make a distinction between a qemu prefix and
> suffix we should agree that and add it to the style document.

The glibcompat.h header should only be used for cases where
we are doing transparent replacement such that callers continue
using the normal glib API name, and the suffix is a hidden
impl detail only seen in the header.

I think in that particular case we should have just had
'qemu_unix_get_passwd_entry' defined in a completely separate
place like osdep.c.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


