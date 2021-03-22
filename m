Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323EC3441DF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:37:26 +0100 (CET)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJoD-0001Ul-97
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJn4-0000pY-NX
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:36:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOJn1-0003W9-UH
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:36:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616416570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VluqNuGSGvihdidwCEVygH6yCePdsm56mjbMOL1+bHQ=;
 b=CsfxH0lzj2A8Fr8oKOPgoVpA4/hMvg1hOOyvRko8dPyyLCm28hZMFylOu43/gMdPXTFmlV
 i9KwJjmsn2iuMB8N+99+alCXoc/IFxiftQyW0bOXQfPeuX9ZSMUpF+xeLiIe5fqeV64rdc
 SaAB3Ladi1+0s8V4KIi2RqisGaboln0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-wdONpMVmOBifitsShj9R7g-1; Mon, 22 Mar 2021 08:36:08 -0400
X-MC-Unique: wdONpMVmOBifitsShj9R7g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70355107ACCD;
 Mon, 22 Mar 2021 12:36:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3513F60BE5;
 Mon, 22 Mar 2021 12:36:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8EBD611327E1; Mon, 22 Mar 2021 13:36:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V4 3/7] qapi/net: Add new QMP command for COLO passthrough
References: <20210319035508.113741-1-chen.zhang@intel.com>
 <20210319035508.113741-4-chen.zhang@intel.com>
Date: Mon, 22 Mar 2021 13:36:05 +0100
In-Reply-To: <20210319035508.113741-4-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 19 Mar 2021 11:55:04 +0800")
Message-ID: <87ft0n4b7u.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c     | 10 ++++++++++
>  qapi/net.json | 40 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 50 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 725a4e1450..7c7cefe0e0 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1199,6 +1199,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
>  
> +void qmp_colo_passthrough_add(L4_Connection *conn, Error **errp)
> +{
> +    /* Setup passthrough connection */
> +}
> +
> +void qmp_colo_passthrough_del(L4_Connection *conn, Error **errp)
> +{
> +    /* Delete passthrough connection */
> +}
> +
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>  {
>      char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index cd4a8ed95e..ec7d3b1128 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -851,3 +851,43 @@
>    'data': { 'protocol': 'IP_PROTOCOL', '*id': 'str', '*src_ip': 'str', '*dst_ip': 'str',
>      '*src_port': 'int', '*dst_port': 'int' } }
>  
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry according to customer's needs in COLO-compare.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip": "192.168.1.1",
> +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add', 'boxed': true,
> +     'data': 'L4_Connection' }
> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry according to customer's needs in COLO-compare.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "id": "object0", "src_ip": "192.168.1.1",
> +#      "dst_ip": "192.168.1.2", "src_port": 1234, "dst_port": 4321 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del', 'boxed': true,
> +     'data': 'L4_Connection' }
> +

Now let's look at colo-passthrough-del.  I figure it is for deleting the
kind of things colo-passthrough-add adds.

What exactly is deleted?  The thing created with the exact same
arguments?

This would be unusual.  Commonly, FOO-add and FOO-del both take a string
ID argument.  The FOO created by FOO-add remembers its ID, and FOO-del
deletes by ID.


