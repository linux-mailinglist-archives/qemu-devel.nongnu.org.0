Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BE24294A7
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 18:34:21 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZyFo-0002KW-Ou
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 12:34:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZyEQ-0000sF-78
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mZyEO-00038o-JE
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 12:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633969970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h7yERDOA5lp6+gXcWHWY1Gb5RCgPrxlhAyty6OOxHkY=;
 b=UgGdmCT/tQo8G//XsncINABA9EfzhOs9xKCabOazVgr+gqHBqKTh7zKwszK7YTeZWZtnsi
 2WyhmRDUAslvm6ZJzMVc/W5JPGFYWLpxsMi1qZEJuf0kJ1gYjUyXFFe9YvE1vrCAONrCnb
 yvX/86GHPr9Uarr6InIunw2TLCtaBxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Sm3sURX9Msmq9ufwwYKeKA-1; Mon, 11 Oct 2021 12:32:47 -0400
X-MC-Unique: Sm3sURX9Msmq9ufwwYKeKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1A2010247A6;
 Mon, 11 Oct 2021 16:32:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-152.phx2.redhat.com [10.3.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393015F707;
 Mon, 11 Oct 2021 16:32:41 +0000 (UTC)
Date: Mon, 11 Oct 2021 11:32:39 -0500
From: Eric Blake <eblake@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH 1/6] numa: Enable numa for SGX EPC sections
Message-ID: <20211011163239.kcpgv3ixmuxbfqtv@redhat.com>
References: <20211011111554.12403-1-yang.zhong@intel.com>
 <20211011111554.12403-2-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20211011111554.12403-2-yang.zhong@intel.com>
User-Agent: NeoMutt/20210205-852-339c0c
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 07:15:49PM +0800, Yang Zhong wrote:
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
> ---
>  qapi/machine.json         |  6 +++++-
>  include/hw/i386/sgx-epc.h |  3 +++
>  hw/i386/acpi-build.c      |  4 ++++
>  hw/i386/sgx-epc.c         |  3 +++
>  hw/i386/sgx.c             | 44 +++++++++++++++++++++++++++++++++++++++
>  monitor/hmp-cmds.c        |  1 +
>  qemu-options.hx           |  4 ++--
>  7 files changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 5db54df298..09b6188e6f 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1213,6 +1213,7 @@
>    'data': { '*id': 'str',
>              'memaddr': 'size',
>              'size': 'size',
> +            'node': 'int',
>              'memdev': 'str'
>            }
>  }
> @@ -1288,7 +1289,10 @@
>  # Since: 6.2
>  ##
>  { 'struct': 'SgxEPC',
> -  'data': { 'memdev': 'str' } }
> +  'data': { 'memdev': 'str',
> +            'node': 'int'
> +          }
> +}

Missing documentation of the new member.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


