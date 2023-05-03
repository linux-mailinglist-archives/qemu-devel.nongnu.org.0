Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244216F56F7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 13:10:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puAMe-00021Q-JI; Wed, 03 May 2023 07:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puAMd-00021H-HL
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:09:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puAMb-0005qf-Me
 for qemu-devel@nongnu.org; Wed, 03 May 2023 07:09:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683112176;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=qUUGLHiRPAyOLRMnfO+OqqoOM1NC4yPqicJkEYVZbNM=;
 b=dIfCtVsrAihi8svJYM1aiOnugbyOLPRhCEWOCZtTY8unexTbHjAssMDCpslWSSAEinejB+
 bNEGCRp5b/J/clgIyMkTyS8QexXJ6Y8vV85SH9aNMYmemQGW5TcJETUqp4keSFVcaweFPZ
 RokN76NGtI3Dnwsw1NQl2tat+1jNfzE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-Blm2Rmf8MBWojBiL9Mx0aQ-1; Wed, 03 May 2023 07:09:35 -0400
X-MC-Unique: Blm2Rmf8MBWojBiL9Mx0aQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4DC91C05191;
 Wed,  3 May 2023 11:09:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30511410F2A;
 Wed,  3 May 2023 11:09:33 +0000 (UTC)
Date: Wed, 3 May 2023 12:09:31 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH 4/5] qmp: Added new command to retrieve eBPF blob.
Message-ID: <ZFJA63EuoIHU1uIG@redhat.com>
References: <20230501072101.22890-1-andrew@daynix.com>
 <20230501072101.22890-5-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230501072101.22890-5-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 01, 2023 at 10:21:00AM +0300, Andrew Melnychenko wrote:
> Added command "request-ebpf". This command returns
> eBPF program encoded base64. The program taken from the
> skeleton and essentially is an ELF object that can be
> loaded in the future with libbpf.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  monitor/qmp-cmds.c | 16 ++++++++++++++++
>  qapi/misc.json     | 28 ++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index b0f948d3376..f7641bb55b9 100644
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
> @@ -209,3 +210,18 @@ static void __attribute__((__constructor__)) monitor_init_qmp_commands(void)
>                           qmp_marshal_qmp_capabilities,
>                           QCO_ALLOW_PRECONFIG, 0);
>  }
> +
> +EbpfObject *qmp_request_ebpf(const char *id, Error **errp)
> +{
> +    EbpfObject *ret = NULL;
> +    size_t size = 0;
> +    const void *data = ebpf_find_binary_by_id(id, &size, errp);
> +    if (!data) {
> +        return NULL;
> +    }
> +
> +    ret = g_new0(EbpfObject, 1);
> +    ret->object = g_base64_encode(data, size);
> +
> +    return ret;
> +}
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 6ddd16ea283..81613fd1b13 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -618,3 +618,31 @@
>  { 'event': 'VFU_CLIENT_HANGUP',
>    'data': { 'vfu-id': 'str', 'vfu-qom-path': 'str',
>              'dev-id': 'str', 'dev-qom-path': 'str' } }
> +
> +##
> +# @EbpfObject:
> +#
> +# Structure that holds eBPF ELF object encoded in base64.
> +#
> +# Since: 8.1
> +#
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
> +# Since: 8.1
> +#
> +##
> +{ 'command': 'request-ebpf',
> +  'data': { 'id': 'str' },

Since the number of EBPF program IDs is finite and known at build
time, I think we'd be better using an enum instead of str. That
will let apps introspect the QAPI schema to query whether the
particular EBPF program ID is known to this version fo QEMU.

> +  'returns': 'EbpfObject' }
> +
> -- 
> 2.39.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


