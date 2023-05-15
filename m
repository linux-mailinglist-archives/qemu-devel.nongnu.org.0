Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53A702986
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:51:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUqU-0003No-KT; Mon, 15 May 2023 05:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUqS-0003Na-MN
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:50:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pyUqR-0006cS-0c
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:50:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684144218;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QUDXBY/khhgUlfi6ukWp7b9vvMVMDMp5zPz8Scsp+g8=;
 b=fyB7fJ4WL15GR/Iq7eecw09kpGRkuWaHKpzrCJMvsvNDXJuGWCd1bexrvUCuGrjDtVYl6Y
 PM4H0qu8RJG5QwKTKeRAh2RSBDZeEeCQg52YsYBKojTeSZvay4bTNn0pxXTagBE88lIup/
 0wuO54ysTUZA5E7z/hiUQ4sAYPIgNFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-Rm5U2VPGMIWeY_HoHyeRIw-1; Mon, 15 May 2023 05:50:15 -0400
X-MC-Unique: Rm5U2VPGMIWeY_HoHyeRIw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C961857DD9;
 Mon, 15 May 2023 09:50:15 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A367E1121314;
 Mon, 15 May 2023 09:50:13 +0000 (UTC)
Date: Mon, 15 May 2023 10:50:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrew Melnychenko <andrew@daynix.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com,
 eblake@redhat.com, qemu-devel@nongnu.org,
 yuri.benditovich@daynix.com, yan@daynix.com
Subject: Re: [PATCH v2 5/6] qmp: Added new command to retrieve eBPF blob.
Message-ID: <ZGIAUxfLmI6hm3VT@redhat.com>
References: <20230512122902.34345-1-andrew@daynix.com>
 <20230512122902.34345-6-andrew@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230512122902.34345-6-andrew@daynix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Question for Markus at the bottom....

On Fri, May 12, 2023 at 03:29:01PM +0300, Andrew Melnychenko wrote:
> Added command "request-ebpf". This command returns
> eBPF program encoded base64. The program taken from the
> skeleton and essentially is an ELF object that can be
> loaded in the future with libbpf.
> 
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  monitor/qmp-cmds.c | 16 ++++++++++++++++
>  qapi/misc.json     | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index b0f948d3376..259bc87ccb1 100644
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
> +EbpfObject *qmp_request_ebpf(EbpfProgramID id, Error **errp)
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
> index 6ddd16ea283..e96dac8482b 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -618,3 +618,41 @@
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
> +# @EbpfProgramID:
> +#
> +# An enumeration of the eBPF programs. Currently, only RSS is presented.
> +#
> +# Since: 8.1
> +##
> +{ 'enum': 'EbpfProgramID',
> +  'data': [ { 'name': 'rss', 'if': 'CONFIG_EBPF' } ] }
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
> +  'data': { 'id': 'EbpfProgramID' },
> +  'returns': 'EbpfObject' }
> +

Fnuctionally this is fine so

  Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


A question for Markus though - is is perhaps better to mark all the
command/enum/object as conditional on CONFIG_EBPF, rather than just
reporting an empty EbpfProgramID enum when EBPF is disabled at build
time ?


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


