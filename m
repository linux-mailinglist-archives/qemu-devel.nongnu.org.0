Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14648DB91
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:19:54 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n82pN-0005I1-DR
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:19:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n82mT-0002A5-H9
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n82mQ-00076T-JN
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642090610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/wlHLMCsiJnV5tMdEaJC9Gg9ziHk7xnCbwrdH7RPoDk=;
 b=NVEy6o7glycIH+N1L/YSgTN7MrkGYTmrAejUMSumutz8q5CVeL9rMVumz4epAtfobErdxA
 nXDl0fDQMExCHl7HJSomzZJ1UD2PPJd5sFH7zYBE59DNyP2lU+Y9qcnQ9BJAWGZTFTV0Vc
 rC4w4k5zZatqShiJnkKmca+OkXWqLPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-lMk4bzLQORaqlN0VocH06A-1; Thu, 13 Jan 2022 11:16:48 -0500
X-MC-Unique: lMk4bzLQORaqlN0VocH06A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BB36101E874;
 Thu, 13 Jan 2022 16:16:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 318027953E;
 Thu, 13 Jan 2022 16:16:38 +0000 (UTC)
Date: Thu, 13 Jan 2022 16:16:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PULL 10/13] numa: Enable numa for SGX EPC sections
Message-ID: <YeBQYy0P9y6ipDVY@redhat.com>
References: <20211215202515.91586-1-pbonzini@redhat.com>
 <20211215202515.91586-11-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211215202515.91586-11-pbonzini@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
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
Cc: Yang Zhong <yang.zhong@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 09:25:12PM +0100, Paolo Bonzini wrote:
> From: Yang Zhong <yang.zhong@intel.com>
> 
> The basic SGX did not enable numa for SGX EPC sections, which
> result in all EPC sections located in numa node 0. This patch
> enable SGX numa function in the guest and the EPC section can
> work with RAM as one numa node.
> 
> The Guest kernel related log:
> [    0.009981] ACPI: SRAT: Node 0 PXM 0 [mem 0x180000000-0x183ffffff]
> [    0.009982] ACPI: SRAT: Node 1 PXM 1 [mem 0x184000000-0x185bfffff]
> The SRAT table can normally show SGX EPC sections menory info in different
> numa nodes.
> 
> The SGX EPC numa related command:
>  ......
>  -m 4G,maxmem=20G \
>  -smp sockets=2,cores=2 \
>  -cpu host,+sgx-provisionkey \
>  -object memory-backend-ram,size=2G,host-nodes=0,policy=bind,id=node0 \
>  -object memory-backend-epc,id=mem0,size=64M,prealloc=on,host-nodes=0,policy=bind \
>  -numa node,nodeid=0,cpus=0-1,memdev=node0 \
>  -object memory-backend-ram,size=2G,host-nodes=1,policy=bind,id=node1 \
>  -object memory-backend-epc,id=mem1,size=28M,prealloc=on,host-nodes=1,policy=bind \
>  -numa node,nodeid=1,cpus=2-3,memdev=node1 \
>  -M sgx-epc.0.memdev=mem0,sgx-epc.0.node=0,sgx-epc.1.memdev=mem1,sgx-epc.1.node=1 \
>  ......
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> Message-Id: <20211101162009.62161-2-yang.zhong@intel.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/core/numa.c            |  5 ++---
>  hw/i386/acpi-build.c      |  2 ++
>  hw/i386/sgx-epc.c         |  3 +++
>  hw/i386/sgx-stub.c        |  4 ++++
>  hw/i386/sgx.c             | 44 +++++++++++++++++++++++++++++++++++++++
>  include/hw/i386/sgx-epc.h |  3 +++
>  monitor/hmp-cmds.c        |  1 +
>  qapi/machine.json         | 10 ++++++++-
>  qemu-options.hx           |  4 ++--
>  9 files changed, 70 insertions(+), 6 deletions(-)

> diff --git a/qapi/machine.json b/qapi/machine.json
> index f1839acf20..edeab6084b 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1207,12 +1207,15 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> +# @node: the numa node

This needs a "(Since: 7.0)" annotation

> +#
>  # Since: 6.2
>  ##
>  { 'struct': 'SgxEPCDeviceInfo',
>    'data': { '*id': 'str',
>              'memaddr': 'size',
>              'size': 'size',
> +            'node': 'int',
>              'memdev': 'str'
>            }
>  }
> @@ -1285,10 +1288,15 @@
>  #
>  # @memdev: memory backend linked with device
>  #
> +# @node: the numa node

Likewise

> +#
>  # Since: 6.2
>  ##
>  { 'struct': 'SgxEPC',
> -  'data': { 'memdev': 'str' } }
> +  'data': { 'memdev': 'str',
> +            'node': 'int'
> +          }
> +}
>  

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


