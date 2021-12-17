Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABDF478CFC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:02:25 +0100 (CET)
Received: from localhost ([::1]:38286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDoW-00009d-5m
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:02:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDXA-0003zj-Bb
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:44:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1myDX8-00061Y-Ij
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:44:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639748666;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=grdJCQFq0CnPfK8IG6P9M7aXLslUbiUFWUPfJzKLpJ4=;
 b=UPNdvmEq11jod2b5akquuLEcaUzrg40cfFa+eKuyAYcabTg86sF8AVGYV9gMe6gwxN8ebd
 Vh1LCxSAuAEXqRW3kvlySKhiin8k94TPM4feHG4Lvox0cVmhdykzp91+6DDJIubSwXzNRf
 DM4Y4cOI9LjIQmcPwjTsijNSGO7AG3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-Gkg4u-GBPJusg16uXxK9gQ-1; Fri, 17 Dec 2021 08:44:13 -0500
X-MC-Unique: Gkg4u-GBPJusg16uXxK9gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912C081EE6E;
 Fri, 17 Dec 2021 13:44:11 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CCB945D9C;
 Fri, 17 Dec 2021 13:43:10 +0000 (UTC)
Date: Fri, 17 Dec 2021 13:43:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YbyT7D/UpSGpmC24@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
 <875yrofxki.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875yrofxki.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Dec 16, 2021 at 02:11:37PM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> > (Fedora 34 provides GLib 2.68.1) we get:
> >
> >   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
> >   ...
> >
> > g_memdup() has been updated by g_memdup2() to fix eventual security
> > issues (size argument is 32-bit and could be truncated / wrapping).
> > GLib recommends to copy their static inline version of g_memdup2():
> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> >
> > Our glib-compat.h provides a comment explaining how to deal with
> > these deprecated declarations (see commit e71e8cc0355
> > "glib: enforce the minimum required version and warn about old APIs").
> >
> > Following this comment suggestion, implement the g_memdup2_qemu()
> > wrapper to g_memdup2(), and use the safer equivalent inlined when
> > we are using pre-2.68 GLib.
> >
> > Reported-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/include/glib-compat.h b/include/glib-compat.h
> > index 9e95c888f54..8d01a8c01fb 100644
> > --- a/include/glib-compat.h
> > +++ b/include/glib-compat.h
> > @@ -68,6 +68,43 @@
> >   * without generating warnings.
> >   */
> >  
> > +/*
> > + * g_memdup2_qemu:
> > + * @mem: (nullable): the memory to copy.
> > + * @byte_size: the number of bytes to copy.
> > + *
> > + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> > + * from @mem. If @mem is %NULL it returns %NULL.
> > + *
> > + * This replaces g_memdup(), which was prone to integer overflows when
> > + * converting the argument from a #gsize to a #guint.
> > + *
> > + * This static inline version is a backport of the new public API from
> > + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> > + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> > + *
> > + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> > + *          or %NULL if @mem is %NULL.
> > + */
> > +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> > +{
> > +#if GLIB_CHECK_VERSION(2, 68, 0)
> > +    return g_memdup2(mem, byte_size);
> > +#else
> > +    gpointer new_mem;
> > +
> > +    if (mem && byte_size != 0) {
> > +        new_mem = g_malloc(byte_size);
> > +        memcpy(new_mem, mem, byte_size);
> > +    } else {
> > +        new_mem = NULL;
> > +    }
> > +
> > +    return new_mem;
> > +#endif
> > +}
> > +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> > +
> 
> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> s)?

Not in this case. We use suffix as we don't want people calling this
directly with the suffix.

In the glibcompat.h header we're attempting to transparently/secretly
replace/wrap standard glib APIs.  All the callers should remain using
the plain glib API name, never call the method with the suffix at
all. This lets us delete the wrapper later and not have to update
any callers. The suffix is basically just a hack of the impl we use
for transparent replacement. 

A method with a 'qemu_' prefix by constrast is something that callers
are explicitly expected to call directly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


