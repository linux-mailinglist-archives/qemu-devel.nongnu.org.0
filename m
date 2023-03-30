Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FD26CFC02
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:55:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phmBQ-00017J-F7; Thu, 30 Mar 2023 02:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmBN-00014M-3C
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmBL-0000VF-6b
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680159286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HnBDVk6TeF2JX0BslmQreoErznJmmGxBskAFTg1FUgQ=;
 b=OnwR4OND2chIfgiLYR7sQ7Whgc7CNotdz4SBAe8tPKUEJcikNoggeIK0T+lS9wOJgY4WiE
 xSjYDvGz+x8JR1SpvM40EwIJzAM33rd/m12ugNqYrwRHpICEeOy4/krbTc6I4fZ/P7eec+
 SHVpmE8dXwYOAnBsmFcRaCp5H7gOpPU=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-f3LcVScZOZeye7Sh1WWLRQ-1; Thu, 30 Mar 2023 02:54:44 -0400
X-MC-Unique: f3LcVScZOZeye7Sh1WWLRQ-1
Received: by mail-oo1-f72.google.com with SMTP id
 w44-20020a4a97af000000b0053e37b1fb91so3445360ooi.8
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680159284; x=1682751284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HnBDVk6TeF2JX0BslmQreoErznJmmGxBskAFTg1FUgQ=;
 b=zNlYZ7a0cpizteeSRszVoDrQ2pV/EMdtYRiRVvxBRDjcy1AmqN2r/qdukFbuaetBAh
 3jU9qtxWy+ehgNW5OPXVzP5vbHW7x25FaVcPaYI8ReMEB/b4ZZG6UXx6QGE/L9Q3L7Ce
 LB0WScx2+zypndxNAlZ15H+EswQY5wqTwywMLxsm8sca1T6De5TIAkzKFO8NQlJdet0W
 l5+zPut0gDRJSRyVDXdcrENzu2eTBFk9l7raxE7XSXbCHWvLw84raWrwd2nazU4ezYIt
 EqIRIZ5rTsY+fvvDxW6dSJcIY011p3ovE/vuea+L2mS+4re4tny0cjeNuds18t/9piHo
 wZqw==
X-Gm-Message-State: AAQBX9frRo+1jqVxCf+qwMWRbEu8tS/yY+gTBYwZwjxGI85St27ZmzPo
 tkagL6Wua81XZgADvzZ14kC2LwoZSid2rpepuL4iI2t/CgnZDKgaRGnExnCPS86j7v1Q24CYRbE
 mb7R3lmNQ0yUyCj75dZ4oUg/jPkGtKgE=
X-Received: by 2002:a05:6871:e45:b0:17f:1723:fc82 with SMTP id
 vk5-20020a0568710e4500b0017f1723fc82mr5047617oab.9.1680159283829; 
 Wed, 29 Mar 2023 23:54:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350an23AGSr1SwXnSOHLbQgQSjnX1lTqG/LsT8QaO8B+GzFSXIDcQ06l2UHi0v8deZrCm6Cf9B/2Hk65pcz4rfX0=
X-Received: by 2002:a05:6871:e45:b0:17f:1723:fc82 with SMTP id
 vk5-20020a0568710e4500b0017f1723fc82mr5047604oab.9.1680159283593; Wed, 29 Mar
 2023 23:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
In-Reply-To: <20230330001522.120774-4-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:54:32 +0800
Message-ID: <CACGkMEs1hRNLL67W96MO3eMg4H=ex4bYvFxcUkNPgfXXbOvo3A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
To: Andrew Melnychenko <andrew@daynix.com>
Cc: mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, armbru@redhat.com, 
 eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
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

On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@daynix.c=
om> wrote:
>
> Now, the binary objects may be retrieved by id/name.
> It would require for future qmp commands that may require specific
> eBPF blob.
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  ebpf/ebpf.c      | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  ebpf/ebpf.h      | 25 +++++++++++++++++++++++++
>  ebpf/ebpf_rss.c  |  4 ++++
>  ebpf/meson.build |  1 +
>  4 files changed, 78 insertions(+)
>  create mode 100644 ebpf/ebpf.c
>  create mode 100644 ebpf/ebpf.h
>
> diff --git a/ebpf/ebpf.c b/ebpf/ebpf.c
> new file mode 100644
> index 0000000000..86320d72f5
> --- /dev/null
> +++ b/ebpf/ebpf.c
> @@ -0,0 +1,48 @@
> +/*
> + * QEMU eBPF binary declaration routine.
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/queue.h"
> +#include "ebpf/ebpf.h"
> +
> +struct ElfBinaryDataEntry {
> +    const char *id;
> +    const void * (*fn)(size_t *);
> +
> +    QSLIST_ENTRY(ElfBinaryDataEntry) node;
> +};
> +
> +static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =3D
> +                                            QSLIST_HEAD_INITIALIZER();
> +
> +void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t=
 *))
> +{
> +    struct ElfBinaryDataEntry *data =3D NULL;
> +
> +    data =3D g_malloc0(sizeof(*data));
> +    data->fn =3D fn;
> +    data->id =3D id;
> +
> +    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, data, node);
> +}
> +
> +const void *ebpf_find_binary_by_id(const char *id, size_t *sz)
> +{
> +    struct ElfBinaryDataEntry *it =3D NULL;
> +    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
> +        if (strcmp(id, it->id) =3D=3D 0) {
> +            return it->fn(sz);
> +        }
> +    }
> +
> +    return NULL;
> +}
> diff --git a/ebpf/ebpf.h b/ebpf/ebpf.h
> new file mode 100644
> index 0000000000..fd705cb73e
> --- /dev/null
> +++ b/ebpf/ebpf.h
> @@ -0,0 +1,25 @@
> +/*
> + * QEMU eBPF binary declaration routine.
> + *
> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> + *
> + * Authors:
> + *  Andrew Melnychenko <andrew@daynix.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef EBPF_H
> +#define EBPF_H
> +
> +void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t=
 *));
> +const void *ebpf_find_binary_by_id(const char *id, size_t *sz);
> +
> +#define ebpf_binary_init(id, fn)                                        =
   \
> +static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)  =
   \
> +{                                                                       =
   \
> +    ebpf_register_binary_data(id, fn);                                  =
   \
> +}
> +
> +#endif /* EBPF_H */
> diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> index 08015fecb1..b4038725f2 100644
> --- a/ebpf/ebpf_rss.c
> +++ b/ebpf/ebpf_rss.c
> @@ -21,6 +21,8 @@
>
>  #include "ebpf/ebpf_rss.h"
>  #include "ebpf/rss.bpf.skeleton.h"
> +#include "ebpf/ebpf.h"
> +
>  #include "trace.h"
>
>  void ebpf_rss_init(struct EBPFRSSContext *ctx)
> @@ -237,3 +239,5 @@ void ebpf_rss_unload(struct EBPFRSSContext *ctx)
>      ctx->obj =3D NULL;
>      ctx->program_fd =3D -1;
>  }
> +
> +ebpf_binary_init("rss", rss_bpf__elf_bytes)

Who or how the ABI compatibility is preserved between libvirt and Qemu?

Thanks

> diff --git a/ebpf/meson.build b/ebpf/meson.build
> index 2dd0fd8948..67c3f53aa9 100644
> --- a/ebpf/meson.build
> +++ b/ebpf/meson.build
> @@ -1 +1,2 @@
> +softmmu_ss.add(files('ebpf.c'))
>  softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: fil=
es('ebpf_rss-stub.c'))
> --
> 2.39.1
>


