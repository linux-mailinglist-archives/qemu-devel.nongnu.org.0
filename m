Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0B372979
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 13:19:36 +0200 (CEST)
Received: from localhost ([::1]:44324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldt5T-0007Fk-Sj
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 07:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldt4Y-0006pY-W8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:18:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ldt4W-0004uz-Iq
 for qemu-devel@nongnu.org; Tue, 04 May 2021 07:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620127115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jhxQrTPij0Xf/Yo48SJDWy3VUBenrJodJzbW/o8nNQI=;
 b=i9RfJUnpZwoRyf/a0LCXdVW4CJOlP8vdYjtjhiBXbvNDMPj7nTcbwy400XcLFxqBmctreC
 6/tPSdz8MzbfDXU0zDegZAb/Basyn9E6uPl/wUHHnrt6zWFH4XUgsX/D4t2zDKB0qYgrzG
 ILYNJleLRhTayNp2UzHjHg/j+IdB3qY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-DaROyHotNsuiD5tBmEA5Ug-1; Tue, 04 May 2021 07:18:33 -0400
X-MC-Unique: DaROyHotNsuiD5tBmEA5Ug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C691410066E5;
 Tue,  4 May 2021 11:18:32 +0000 (UTC)
Received: from redhat.com (ovpn-113-37.ams2.redhat.com [10.36.113.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66224131C4;
 Tue,  4 May 2021 11:18:13 +0000 (UTC)
Date: Tue, 4 May 2021 12:18:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v7 10/15] hostmem: Wire up RAM_NORESERVE via "reserve"
 property
Message-ID: <YJEtc49hw+ZtgXmG@redhat.com>
References: <20210428133754.10713-1-david@redhat.com>
 <20210428133754.10713-11-david@redhat.com>
 <YJEeFtpZFcoR35He@redhat.com>
 <1a865f85-f616-993f-58e1-bb441cec344b@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1a865f85-f616-993f-58e1-bb441cec344b@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, Nitesh Lal <nilal@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 04, 2021 at 01:08:02PM +0200, David Hildenbrand wrote:
> On 04.05.21 12:12, Daniel P. Berrangé wrote:
> > On Wed, Apr 28, 2021 at 03:37:49PM +0200, David Hildenbrand wrote:
> > > Let's provide a way to control the use of RAM_NORESERVE via memory
> > > backends using the "reserve" property which defaults to true (old
> > > behavior).
> > > 
> > > Only Linux currently supports clearing the flag (and support is checked at
> > > runtime, depending on the setting of "/proc/sys/vm/overcommit_memory").
> > > Windows and other POSIX systems will bail out with "reserve=false".
> > > 
> > > The target use case is virtio-mem, which dynamically exposes memory
> > > inside a large, sparse memory area to the VM. This essentially allows
> > > avoiding to set "/proc/sys/vm/overcommit_memory == 0") when using
> > > virtio-mem and also supporting hugetlbfs in the future.
> > > 
> > > Reviewed-by: Peter Xu <peterx@redhat.com>
> > > Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> > > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > > Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
> > > Cc: Markus Armbruster <armbru@redhat.com>
> > > Cc: Eric Blake <eblake@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > ---
> > >   backends/hostmem-file.c  | 11 ++++++-----
> > >   backends/hostmem-memfd.c |  1 +
> > >   backends/hostmem-ram.c   |  1 +
> > >   backends/hostmem.c       | 32 ++++++++++++++++++++++++++++++++
> > >   include/sysemu/hostmem.h |  2 +-
> > >   qapi/qom.json            | 10 ++++++++++
> > >   6 files changed, 51 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> > > index b683da9daf..9d550e53d4 100644
> > > --- a/backends/hostmem-file.c
> > > +++ b/backends/hostmem-file.c
> > > @@ -40,6 +40,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> > >                  object_get_typename(OBJECT(backend)));
> > >   #else
> > >       HostMemoryBackendFile *fb = MEMORY_BACKEND_FILE(backend);
> > > +    uint32_t ram_flags;
> > >       gchar *name;
> > >       if (!backend->size) {
> > > @@ -52,11 +53,11 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> > >       }
> > >       name = host_memory_backend_get_name(backend);
> > > -    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
> > > -                                     name,
> > > -                                     backend->size, fb->align,
> > > -                                     (backend->share ? RAM_SHARED : 0) |
> > > -                                     (fb->is_pmem ? RAM_PMEM : 0),
> > > +    ram_flags = backend->share ? RAM_SHARED : 0;
> > > +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> > > +    ram_flags |= fb->is_pmem ? RAM_PMEM : 0;
> > > +    memory_region_init_ram_from_file(&backend->mr, OBJECT(backend), name,
> > > +                                     backend->size, fb->align, ram_flags,
> > >                                        fb->mem_path, fb->readonly, errp);
> > >       g_free(name);
> > >   #endif
> > > diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> > > index 93b5d1a4cf..f3436b623d 100644
> > > --- a/backends/hostmem-memfd.c
> > > +++ b/backends/hostmem-memfd.c
> > > @@ -55,6 +55,7 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> > >       name = host_memory_backend_get_name(backend);
> > >       ram_flags = backend->share ? RAM_SHARED : 0;
> > > +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> > >       memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
> > >                                      backend->size, ram_flags, fd, 0, errp);
> > >       g_free(name);
> > > diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
> > > index 741e701062..b8e55cdbd0 100644
> > > --- a/backends/hostmem-ram.c
> > > +++ b/backends/hostmem-ram.c
> > > @@ -29,6 +29,7 @@ ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
> > >       name = host_memory_backend_get_name(backend);
> > >       ram_flags = backend->share ? RAM_SHARED : 0;
> > > +    ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
> > >       memory_region_init_ram_flags_nomigrate(&backend->mr, OBJECT(backend), name,
> > >                                              backend->size, ram_flags, errp);
> > >       g_free(name);
> > > diff --git a/backends/hostmem.c b/backends/hostmem.c
> > > index c6c1ff5b99..58fdc1b658 100644
> > > --- a/backends/hostmem.c
> > > +++ b/backends/hostmem.c
> > > @@ -217,6 +217,11 @@ static void host_memory_backend_set_prealloc(Object *obj, bool value,
> > >       Error *local_err = NULL;
> > >       HostMemoryBackend *backend = MEMORY_BACKEND(obj);
> > > +    if (!backend->reserve && value) {
> > > +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
> > > +        return;
> > > +    }
> > > +
> > >       if (!host_memory_backend_mr_inited(backend)) {
> > >           backend->prealloc = value;
> > >           return;
> > > @@ -268,6 +273,7 @@ static void host_memory_backend_init(Object *obj)
> > >       /* TODO: convert access to globals to compat properties */
> > >       backend->merge = machine_mem_merge(machine);
> > >       backend->dump = machine_dump_guest_core(machine);
> > > +    backend->reserve = true;
> > >       backend->prealloc_threads = 1;
> > >   }
> > > @@ -426,6 +432,28 @@ static void host_memory_backend_set_share(Object *o, bool value, Error **errp)
> > >       backend->share = value;
> > >   }
> > > +static bool host_memory_backend_get_reserve(Object *o, Error **errp)
> > > +{
> > > +    HostMemoryBackend *backend = MEMORY_BACKEND(o);
> > > +
> > > +    return backend->reserve;
> > > +}
> > > +
> > > +static void host_memory_backend_set_reserve(Object *o, bool value, Error **errp)
> > > +{
> > > +    HostMemoryBackend *backend = MEMORY_BACKEND(o);
> > > +
> > > +    if (host_memory_backend_mr_inited(backend)) {
> > > +        error_setg(errp, "cannot change property value");
> > > +        return;
> > > +    }
> > > +    if (backend->prealloc && !value) {
> > > +        error_setg(errp, "'prealloc=on' and 'reserve=off' are incompatible");
> > > +        return;
> > > +    }
> > > +    backend->reserve = value;
> > > +}
> > > +
> > >   static bool
> > >   host_memory_backend_get_use_canonical_path(Object *obj, Error **errp)
> > >   {
> > > @@ -494,6 +522,10 @@ host_memory_backend_class_init(ObjectClass *oc, void *data)
> > >           host_memory_backend_get_share, host_memory_backend_set_share);
> > >       object_class_property_set_description(oc, "share",
> > >           "Mark the memory as private to QEMU or shared");
> > > +    object_class_property_add_bool(oc, "reserve",
> > > +        host_memory_backend_get_reserve, host_memory_backend_set_reserve);
> > > +    object_class_property_set_description(oc, "reserve",
> > > +        "Reserve swap space (or huge pages) if applicable");
> > >       /*
> > >        * Do not delete/rename option. This option must be considered stable
> > >        * (as if it didn't have the 'x-' prefix including deprecation period) as
> > > diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
> > > index df5644723a..9ff5c16963 100644
> > > --- a/include/sysemu/hostmem.h
> > > +++ b/include/sysemu/hostmem.h
> > > @@ -64,7 +64,7 @@ struct HostMemoryBackend {
> > >       /* protected */
> > >       uint64_t size;
> > >       bool merge, dump, use_canonical_path;
> > > -    bool prealloc, is_mapped, share;
> > > +    bool prealloc, is_mapped, share, reserve;
> > >       uint32_t prealloc_threads;
> > >       DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
> > >       HostMemPolicy policy;
> > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > index cd0e76d564..4fa3137aab 100644
> > > --- a/qapi/qom.json
> > > +++ b/qapi/qom.json
> > > @@ -545,6 +545,9 @@
> > >   # @share: if false, the memory is private to QEMU; if true, it is shared
> > >   #         (default: false)
> > >   #
> > > +# @reserve: if true, reserve swap space (or huge pages) if applicable
> > > +#           default: true)
> > > +#
> > >   # @size: size of the memory region in bytes
> > >   #
> > >   # @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
> > > @@ -556,6 +559,12 @@
> > >   #                                        false generally, but true for machine
> > >   #                                        types <= 4.0)
> > >   #
> > > +# Note: prealloc=true and reserve=false cannot be set at the same time. With
> > > +#       reserve=true, the behavior depends on the operating system: for example,
> > > +#       Linux will not reserve swap space for shared file mappings --
> > > +#       "not applicable". In contrast, reserve=false will bail out if it cannot
> > > +#       be configured accordingly.
> > > +#
> > >   # Since: 2.1
> > >   ##
> > >   { 'struct': 'MemoryBackendProperties',
> > > @@ -566,6 +575,7 @@
> > >               '*prealloc': 'bool',
> > >               '*prealloc-threads': 'uint32',
> > >               '*share': 'bool',
> > > +            '*reserve': 'bool',
> > >               'size': 'size',
> > >               '*x-use-canonical-path-for-ramblock-id': 'bool' } }
> > 
> > IIUC from the previous patch in the series, 'reserve' is only implemented
> > on Linux.  If we make this QAPI prop dependant on CONFIG_LINUX, then mgmt
> > apps will do the right thing to detect what platform(s) it works on.
> 
> Would that mean only conditionally calling (or ifdeffing) the
> object_property_add_* in backends/hostmem.c?

Yes, any code which refers to the property would need to have
matching conditionals. The plus side is that you don't have to
do error reporting to say it doesn't exist, because it becomes
impossible for the mgmt app to even set the property in the
first place on platforms where it doesn't exist. 

> Note that the "share" property is basically ignored on Windows and only
> implemented on POSIX and we don't even bail out when set ...

It might pre-date the support for conditionals in QAPI. Silently ignoring
things that can't be supported is even worse !

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


