Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22932D971E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:12:18 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolm5-0002LQ-Tz
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolkQ-0001kA-6P
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:10:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kolkM-0007Bh-Jd
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:10:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607944229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zaHNqBQN7bP4Yx//r4S9EEcBi7KblCYq/DjpfHFzOYY=;
 b=OpxCosJfm6qwC+rWaATCUnhIjg6AvN9XJ9+v4gtvyykorE6lt4rV9kotQzDsDwB0rJJmcz
 K2rB2MUBsUs/0lY1FI+bOtm5j4i/ZKr7tuCcQLA42wmEydlQivOognH/AlK9MKZXvm5/S7
 EH8Va05TbMriZOdZ9h8s4AUm/75ikN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-QadmP2xnNqy3_jIfBVJvYA-1; Mon, 14 Dec 2020 06:10:28 -0500
X-MC-Unique: QadmP2xnNqy3_jIfBVJvYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F24D11005504;
 Mon, 14 Dec 2020 11:10:26 +0000 (UTC)
Received: from localhost (unknown [10.40.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E69321C930;
 Mon, 14 Dec 2020 11:10:17 +0000 (UTC)
Date: Mon, 14 Dec 2020 12:10:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 2/3] hostmem-file: add readonly=on|off option
Message-ID: <20201214121015.592aaef0@redhat.com>
In-Reply-To: <20200916095150.755714-3-stefanha@redhat.com>
References: <20200916095150.755714-1-stefanha@redhat.com>
 <20200916095150.755714-3-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-devel@nongnu.org,
 eric.g.ernst@gmail.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Sep 2020 10:51:49 +0100
Stefan Hajnoczi <stefanha@redhat.com> wrote:

> Let -object memory-backend-file work on read-only files when the
> readonly=3Don option is given. This can be used to share the contents of =
a
> file between multiple guests while preventing them from consuming
> Copy-on-Write memory if guests dirty the pages, for example.
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

cosmetic/style nits only

s/Object *o/Object *obj/

for consistency with the rest of the code in file.

> ---
>  backends/hostmem-file.c | 26 +++++++++++++++++++++++++-
>  qemu-options.hx         |  5 ++++-
>  2 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index dffdf142e0..da585e4300 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -31,6 +31,7 @@ struct HostMemoryBackendFile {
>      uint64_t align;
>      bool discard_data;
>      bool is_pmem;
> +    bool readonly;
>  };
> =20
>  static void
> @@ -58,7 +59,7 @@ file_backend_memory_alloc(HostMemoryBackend *backend, E=
rror **errp)
>                                       backend->size, fb->align,
>                                       (backend->share ? RAM_SHARED : 0) |
>                                       (fb->is_pmem ? RAM_PMEM : 0),
> -                                     fb->mem_path, false, errp);
> +                                     fb->mem_path, fb->readonly, errp);
>      g_free(name);
>  #endif
>  }
> @@ -153,6 +154,26 @@ static void file_memory_backend_set_pmem(Object *o, =
bool value, Error **errp)
>      fb->is_pmem =3D value;
>  }
> =20
> +static bool file_memory_backend_get_readonly(Object *o, Error **errp)
> +{
> +    return MEMORY_BACKEND_FILE(o)->readonly;

I thought using macro this way not acceptable and one should use

HostMemoryBackendFile *fb =3D MEMORY_BACKEND_FILE(o);

return fb->readonly;


> +}
> +
> +static void file_memory_backend_set_readonly(Object *o, bool value,
> +                                             Error **errp)
> +{
> +    HostMemoryBackend *backend =3D MEMORY_BACKEND(o);
> +    HostMemoryBackendFile *fb =3D MEMORY_BACKEND_FILE(o);
> +
> +    if (host_memory_backend_mr_inited(backend)) {
> +        error_setg(errp, "cannot change property 'readonly' of %s.",
> +                   object_get_typename(o));
> +        return;
> +    }
> +
> +    fb->readonly =3D value;
> +}
> +
>  static void file_backend_unparent(Object *obj)
>  {
>      HostMemoryBackend *backend =3D MEMORY_BACKEND(obj);
> @@ -184,6 +205,9 @@ file_backend_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_add_bool(oc, "pmem",
>          file_memory_backend_get_pmem, file_memory_backend_set_pmem);
> +    object_class_property_add_bool(oc, "readonly",
> +        file_memory_backend_get_readonly,
> +        file_memory_backend_set_readonly);
>  }
> =20
>  static void file_backend_instance_finalize(Object *o)
> diff --git a/qemu-options.hx b/qemu-options.hx
> index b0f020594e..3dfaaddd62 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4369,7 +4369,7 @@ SRST
>      they are specified. Note that the 'id' property must be set. These
>      objects are placed in the '/objects' path.
> =20
> -    ``-object memory-backend-file,id=3Did,size=3Dsize,mem-path=3Ddir,sha=
re=3Don|off,discard-data=3Don|off,merge=3Don|off,dump=3Don|off,prealloc=3Do=
n|off,host-nodes=3Dhost-nodes,policy=3Ddefault|preferred|bind|interleave,al=
ign=3Dalign``
> +    ``-object memory-backend-file,id=3Did,size=3Dsize,mem-path=3Ddir,sha=
re=3Don|off,discard-data=3Don|off,merge=3Don|off,dump=3Don|off,prealloc=3Do=
n|off,host-nodes=3Dhost-nodes,policy=3Ddefault|preferred|bind|interleave,al=
ign=3Dalign,readonly=3Don|off``
>          Creates a memory file backend object, which can be used to back
>          the guest RAM with huge pages.
> =20
> @@ -4452,6 +4452,9 @@ SRST
>          4.15) and the filesystem of ``mem-path`` mounted with DAX
>          option.
> =20
> +        The ``readonly`` option specifies whether the backing file is op=
ened
> +        read-only or read-write (default).
> +
>      ``-object memory-backend-ram,id=3Did,merge=3Don|off,dump=3Don|off,sh=
are=3Don|off,prealloc=3Don|off,size=3Dsize,host-nodes=3Dhost-nodes,policy=
=3Ddefault|preferred|bind|interleave``
>          Creates a memory backend object, which can be used to back the
>          guest RAM. Memory backend objects offer more control than the


