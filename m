Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3626CFE94
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 10:39:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phnoV-00080k-Lw; Thu, 30 Mar 2023 04:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phnoU-00080N-1L
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:39:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1phnoS-0007IY-AN
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 04:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680165555;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DhudsKKxGg8qe+P5bjBeDR0bTU36bJix/QLrzU0qCGE=;
 b=ic1rtmu76uIbk3W0IAXbfODcaokJ6VBT+M3bSfvW7eYQufH9kBymghKFqSCTej4OOOM/O/
 sMcQruXOL2EhebnaRRdYrBd2JB/nTwopPkARVyTqLS6LPUbNRNqk8ArqtjoBOvMij3ssG9
 ssT6QQbgwl/9v7wILasdjiG41Mk2+7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-d-QhJwtAPw2EIIHhSGsSRQ-1; Thu, 30 Mar 2023 04:39:11 -0400
X-MC-Unique: d-QhJwtAPw2EIIHhSGsSRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28490101A54F;
 Thu, 30 Mar 2023 08:39:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D459D2166B33;
 Thu, 30 Mar 2023 08:39:08 +0000 (UTC)
Date: Thu, 30 Mar 2023 09:39:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org,
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org,
 toke@redhat.com, mprivozn@redhat.com, yuri.benditovich@daynix.com,
 yan@daynix.com
Subject: Re: [RFC PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
Message-ID: <ZCVKqvw2i3xmQZWn@redhat.com>
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-5-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330001522.120774-5-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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

On Thu, Mar 30, 2023 at 03:15:21AM +0300, Andrew Melnychenko wrote:
> Added command "request-ebpf". This command returns
> eBPF program encoded base64. The program taken from the
> skeleton and essentially is an ELF object that can be
> loaded in the future with libbpf.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  monitor/qmp-cmds.c | 17 +++++++++++++++++
>  qapi/misc.json     | 25 +++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index b0f948d337..8f2fc3e7ec 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -32,6 +32,7 @@
>  #include "hw/mem/memory-device.h"
>  #include "hw/intc/intc.h"
>  #include "hw/rdma/rdma.h"
> +#include "ebpf/ebpf.h"
>  
>  NameInfo *qmp_query_name(Error **errp)
>  {
> @@ -209,3 +210,19 @@ static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
>                           qmp_marshal_qmp_capabilities,
>                           QCO_ALLOW_PRECONFIG, 0);
>  }
> +
> +EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
> +{
> +    EbpfObject *ret = NULL;
> +    size_t size = 0;
> +    const guchar *data = ebpf_find_binary_by_id(id, &size);

"const void *data"  I believe

> +
> +    if (data) {
> +        ret = g_new0(EbpfObject, 1);
> +        ret->object = g_base64_encode(data, size);
> +    } else {
> +        error_setg(errp, "can't find eBPF object with id: %s", id);

I think I'm inclined to say that we should add an 'Error **errp'
parameter to ebpf_find_binary_by_id(), and make it responsible
for this error message, such that we get

   const void *data  ebpf_find_binary_by_id(id, &size, errp);
   if (!data) {
       return NULL;
   }

   ret = g_new0(EbpfObject, 1);
   ret->object = g_base64_encode(data, size);
   return ret;

> +    }
> +
> +    return ret;
> +}
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 6ddd16ea28..4689802460 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -618,3 +618,28 @@
>  { 'event': 'VFU_CLIENT_HANGUP',
>    'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
>              'dev-id': 'str', 'dev-qom-path': 'str' } }
> +
> +##
> +# @EbpfObject:
> +#
> +# Structure that holds eBPF ELF object encoded in base64.

Needs a 'Since' tag

> +##
> +{ 'struct': 'EbpfObject',
> +  'data': {'object': 'str'} }
> +
> +##
> +# @request-ebpf:
> +#
> +# Function returns eBPF object that can be loaded with libbpf.
> +# Management applications (g.e. libvirt) may load it and pass file
> +# descriptors to QEMU. Which allows running QEMU without BPF capabilities.
> +#
> +# Returns: RSS eBPF object encoded in base64.
> +#
> +# Since: 7.3

We're about to release 8.0 and so the next will be 8.1

> +#
> +##
> +{ 'command': 'request-ebpf',
> +  'data': { 'id': 'str' },
> +  'returns': 'EbpfObject' }

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


