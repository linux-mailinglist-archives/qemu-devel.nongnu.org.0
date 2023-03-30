Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772016CFE5D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:34:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phnil-0006ML-PL; Thu, 30 Mar 2023 04:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phnig-0006M9-M6
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:33:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phnie-0006NT-S4
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:33:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680165196;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=udQd4bFlCXl0uQ1aZmlEMzDN5HIZygPpSXh4odS3FWE=;
 b=OWwLMt/YsxSJOrub6g4PDTAyVSNFeeY2DaWfmOli2UIDY83rklSnRpR6qsUKg51ttrB811
 teagoS1Tq8hHuQ+zHmjn/DZyZxkfZ/OAsqFvVp8r3Hhu5kfj5Aj9D2+BAJLpEFDfQUuDGh
 UxlExK4ps4l7P/vdg1e7AtVYilen6ns=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-cEeISOWJNFaRpc1bhJsREg-1; Thu, 30 Mar 2023 04:33:12 -0400
X-MC-Unique: cEeISOWJNFaRpc1bhJsREg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B350D2812946;
 Thu, 30 Mar 2023 08:33:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 502974042AC8;
 Thu, 30 Mar 2023 08:33:09 +0000 (UTC)
Date: Thu, 30 Mar 2023 09:33:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 toke@redhat.com, mprivozn@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
Message-ID: <ZCVJQlCXQpWMwmP9@redhat.com>
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330001522.120774-4-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 30, 2023 at 03:15:20AM +0300, Andrew Melnychenko wrote:
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

It feels odd to be storing the function there, as that's just
an artifact of how the EBPF rss program is acquired. IMHO
this should just be

   const void *data;
   size_t datalen;

> +
> +    QSLIST_ENTRY(ElfBinaryDataEntry) node;
> +};
> +
> +static QSLIST_HEAD(, ElfBinaryDataEntry) ebpf_elf_obj_list =
> +                                            QSLIST_HEAD_INITIALIZER();
> +
> +void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t *))
> +{
> +    struct ElfBinaryDataEntry *data = NULL;
> +
> +    data = g_malloc0(sizeof(*data));

We prefer g_new0 over g_malloc and initialize when declaring eg

    struct ElfBinaryDataEntry *data = g_new0(struct ElfBinaryDataEntry, 1);

> +    data->fn = fn;
> +    data->id = id;
> +
> +    QSLIST_INSERT_HEAD(&ebpf_elf_obj_list, data, node);
> +}
> +
> +const void *ebpf_find_binary_by_id(const char *id, size_t *sz)
> +{
> +    struct ElfBinaryDataEntry *it = NULL;
> +    QSLIST_FOREACH(it, &ebpf_elf_obj_list, node) {
> +        if (strcmp(id, it->id) == 0) {
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
> +void ebpf_register_binary_data(const char *id, const void * (*fn)(size_t *));

IMHO it would be better as

void ebpf_register_binary_data(const char *id, const void *data, size_t datalen);


> +const void *ebpf_find_binary_by_id(const char *id, size_t *sz);
> +
> +#define ebpf_binary_init(id, fn)                                           \
> +static void __attribute__((constructor)) ebpf_binary_init_ ## fn(void)     \
> +{                                                                          \
> +    ebpf_register_binary_data(id, fn);                                     \

size_t datalen;
const void *data = fn(&datalen);
ebpf_register_binary_data(oid, data, datalen);


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
>      ctx->obj = NULL;
>      ctx->program_fd = -1;
>  }
> +
> +ebpf_binary_init("rss", rss_bpf__elf_bytes)
> diff --git a/ebpf/meson.build b/ebpf/meson.build
> index 2dd0fd8948..67c3f53aa9 100644
> --- a/ebpf/meson.build
> +++ b/ebpf/meson.build
> @@ -1 +1,2 @@
> +softmmu_ss.add(files('ebpf.c'))
>  softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


