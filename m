Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5C6D18F7
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 09:50:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi9V1-0005rS-KQ; Fri, 31 Mar 2023 03:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9Uz-0005rA-3c
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 03:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9Uw-0000Cq-Ms
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 03:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680248913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sW5oQtCW75QNrtts1aAwGzUT+oGMa3oC/4dGg2/l0SI=;
 b=HDH32am9217c3ERkqDi6Lg04kiW+yx2oMhl3L/aWf13UOXnM5Cpf1gjXYB2lIVQUiLvze7
 xfBCzYc8Wcj56TKJHqf7QSgXLQivSMNVu4v5wr+x+p78ZjIkJwHiRr1cyi7sd1LbOkPT0L
 b3SqWoYTFNWna98NC6i9y3PK5pcDsE4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-Da_IZZyMPXOb1nuWpAA40g-1; Fri, 31 Mar 2023 03:48:30 -0400
X-MC-Unique: Da_IZZyMPXOb1nuWpAA40g-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-17e11dd9a3dso11037207fac.10
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 00:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680248910; x=1682840910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sW5oQtCW75QNrtts1aAwGzUT+oGMa3oC/4dGg2/l0SI=;
 b=u+mAHIU4oHw3UAS0g+NRf9wN4sqk2ap0PakYn50qz8Eic/sTWpiHj5V8KIwxAEccL+
 8z8kLvOngj9d7ppPLUzlzdsTulgWpCudxvVteelb2f1cArKEU6DgFuX2+wIGPHwba7s/
 ILwDWRRC5aHGNaM3FghZxJzp7TTmGqznrn4L0KHFlGkgNDPODBxD+5gxbaoNaM5x7c+W
 osh2TwlKrhXjkv8JUbww6g1eiB8Cnl8wlp7+GbwUqnpQMn7CVHDtOCmnbGxDfkL170Iv
 9W1r0fTIH5u8Q6YOW7EtnXS86PJHoJ4iM+dmFD+NQp8cEpCi3IQ39ncf7WtiDHZMmEnr
 ELCQ==
X-Gm-Message-State: AAQBX9e8Xt2H84Rdo1xsiexTIc9eaiOwiHHWYJ3JQD7o6FJTVYqhGeaQ
 x9s70M0PXliWOK+VOr513IgQpEpnervi/CfNyV7+sIN+L/4FtI+sM6rUgre6i5zIpaGH47JVfdL
 /X6elbVmJKQqtqmf+KfCANOVLn9MGzHU=
X-Received: by 2002:a05:6870:df85:b0:17f:6fc4:6dd6 with SMTP id
 us5-20020a056870df8500b0017f6fc46dd6mr4047494oab.9.1680248910192; 
 Fri, 31 Mar 2023 00:48:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350bGvg/ieg1mvRzP6po7P4FkweGEZzZbWa2RSb6AT7UfLqPVrmtVBN13fY05eZH4gzGptW8EkTv2cBUX7LMhiSs=
X-Received: by 2002:a05:6870:df85:b0:17f:6fc4:6dd6 with SMTP id
 us5-20020a056870df8500b0017f6fc46dd6mr4047477oab.9.1680248909898; Fri, 31 Mar
 2023 00:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
 <CACGkMEs1hRNLL67W96MO3eMg4H=ex4bYvFxcUkNPgfXXbOvo3A@mail.gmail.com>
 <ZCVJoi7YQlt3axba@redhat.com>
In-Reply-To: <ZCVJoi7YQlt3axba@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 31 Mar 2023 15:48:18 +0800
Message-ID: <CACGkMEugLOsQJz_Hie1-0WLbPEiC2B_7y=RVqqmGi8-aqBfHXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 30, 2023 at 4:34=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Thu, Mar 30, 2023 at 02:54:32PM +0800, Jason Wang wrote:
> > On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@dayn=
ix.com> wrote:
> > >
> > > Now, the binary objects may be retrieved by id/name.
> > > It would require for future qmp commands that may require specific
> > > eBPF blob.
> > >
> > > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > > ---
> > >  ebpf/ebpf.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  ebpf/ebpf.h      | 25 +++++++++++++++++++++++++
> > >  ebpf/ebpf_rss.c  |  4 ++++
> > >  ebpf/meson.build |  1 +
> > >  4 files changed, 78 insertions(+)
> > >  create mode 100644 ebpf/ebpf.c
> > >  create mode 100644 ebpf/ebpf.h
> > >
> > > diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
> > > new file mode 100644
> > > index 0000000000..86320d72f5
> > > --- /dev/null
> > > +++ b/ebpf/ebpf.c
> > > @@ -0,0 +1,48 @@
> > > +/*
> > > + * QEMU eBPF binary declaration routine.
> > > + *
> > > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > > + *
> > > + * Authors:
> > > + *  Andrew Melnychenko <andrew@daynix.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > > + * later.  See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "qemu/queue.h"
> > > +#include "ebpf/ebpf.h"
> > > +
> > > +struct ElfBinaryDataEntry {
> > > +    const char *id;
> > > +    const void * (*fn)(size_t *);
> > > +
> > > +    QSLIST_ENTRY(ElfBinaryDataEntry) node;
> > > +};
> > > +
> > > +static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =3D
> > > +                                            QSLIST_HEAD_INITIALIZER(=
);
> > > +
> > > +void ebpf_register_binary_data(const char *id, const void * (*fn)(si=
ze_t *))
> > > +{
> > > +    struct ElfBinaryDataEntry *data =3D NULL;
> > > +
> > > +    data =3D g_malloc0(sizeof(*data));
> > > +    data->fn =3D fn;
> > > +    data->id =3D id;
> > > +
> > > +    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, data, node);
> > > +}
> > > +
> > > +const void *ebpf_find_binary_by_id(const char *id, size_t *sz)
> > > +{
> > > +    struct ElfBinaryDataEntry *it =3D NULL;
> > > +    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
> > > +        if (strcmp(id, it->id) =3D=3D 0) {
> > > +            return it->fn(sz);
> > > +        }
> > > +    }
> > > +
> > > +    return NULL;
> > > +}
> > > diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
> > > new file mode 100644
> > > index 0000000000..fd705cb73e
> > > --- /dev/null
> > > +++ b/ebpf/ebpf.h
> > > @@ -0,0 +1,25 @@
> > > +/*
> > > + * QEMU eBPF binary declaration routine.
> > > + *
> > > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > > + *
> > > + * Authors:
> > > + *  Andrew Melnychenko <andrew@daynix.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2 o=
r
> > > + * later.  See the COPYING file in the top-level directory.
> > > + */
> > > +
> > > +#ifndef EBPF_H
> > > +#define EBPF_H
> > > +
> > > +void ebpf_register_binary_data(const char *id, const void * (*fn)(si=
ze_t *));
> > > +const void *ebpf_find_binary_by_id(const char *id, size_t *sz);
> > > +
> > > +#define ebpf_binary_init(id, fn)                                    =
       \
> > > +static void __attribute__((constructor)) ebpf_binary_init_ ## fn(voi=
d)     \
> > > +{                                                                   =
       \
> > > +    ebpf_register_binary_data(id, fn);                              =
       \
> > > +}
> > > +
> > > +#endif /* EBPF_H */
> > > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> > > index 08015fecb1..b4038725f2 100644
> > > --- a/ebpf/ebpf_rss.c
> > > +++ b/ebpf/ebpf_rss.c
> > > @@ -21,6 +21,8 @@
> > >
> > >  #include "ebpf/ebpf_rss.h"
> > >  #include "ebpf/rss.bpf.skeleton.h"
> > > +#include "ebpf/ebpf.h"
> > > +
> > >  #include "trace.h"
> > >
> > >  void ebpf_rss_init(struct EBPFRSSContext *ctx)
> > > @@ -237,3 +239,5 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> > >      ctx->obj =3D NULL;
> > >      ctx->program_fd =3D -1;
> > >  }
> > > +
> > > +ebpf_binary_init("rss", rss_bpf__elf_bytes)
> >
> > Who or how the ABI compatibility is preserved between libvirt and Qemu?
>
> There's no real problem with binary compatibility to solve any more.
>
> When libvirt first launches a QEMU VM, it will fetch the eBPF programs
> it needs from that running QEMU using QMP. WHen it later needs to
> enable features that use eBPF, it already has the program data that
> matches the running QEMU

Ok, then who will validate the eBPF program? I don't think libvirt can
trust what is received from Qemu otherwise arbitrary eBPF programs
could be executed by Qemu in this way. One example is that when guests
escape to Qemu it can modify the rss_bpf__elf_bytes. Though
BPF_PROG_TYPE_SOCKET_FILTER gives some of the restrictions, we still
need to evaluate side effects of this. Or we need to find other ways
like using the binary in libvirt or use rx filter events.

Thanks

>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


