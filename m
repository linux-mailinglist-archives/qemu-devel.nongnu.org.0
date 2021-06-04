Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E995339BAFC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 16:36:54 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpAwQ-0001lq-2G
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 10:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAvP-0000Zc-Fr
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lpAvM-00054o-Ty
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 10:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622817347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zy9is/9qU1Qu0ITgoyg7KmgFXSLXkpJPIFKvpd0Ttq4=;
 b=egNbFXcAZ4FVc6fh7n3oTHEGKtoWNN2VcA9KwyD7dxjuOLG/SHmSXrRy4xBgkbRW3Rsp7n
 K/7bjUuzFjXv/1EIQcOnOjcoe/7WN7T9ijD6FBJHy2q+MlcKecC/juK5HTrziEBjb3wytz
 FD4xG5w/2WxsT3PcOA6YqMeVDj6QkuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-p46l4r7qM1aXZ0REZkFodA-1; Fri, 04 Jun 2021 10:35:43 -0400
X-MC-Unique: p46l4r7qM1aXZ0REZkFodA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 596311013726;
 Fri,  4 Jun 2021 14:35:41 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE154687DD;
 Fri,  4 Jun 2021 14:35:23 +0000 (UTC)
Date: Fri, 4 Jun 2021 09:35:21 -0500
From: Eric Blake <eblake@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V7 1/6] qapi/net: Add IPFlowSpec and QMP command for COLO
 passthrough
Message-ID: <20210604143521.ej6n7g5tlawkhwpj@redhat.com>
References: <20210526025424.1319994-1-chen.zhang@intel.com>
 <20210526025424.1319994-2-chen.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210526025424.1319994-2-chen.zhang@intel.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 10:54:19AM +0800, Zhang Chen wrote:
> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
> Except protocol field is necessary, other fields are optional.

That last sentence reads awkwardly, and I don't see a protocol field
in the patch below.

> 
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/net.c     | 10 ++++++++
>  qapi/net.json | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 

> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>  
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>  
>  ##
>  # @set_link:
> @@ -694,3 +695,70 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP...

Why is this open-coded as 'str' instead of an enum?

> +#
> +# @object-name: Point out the IPflow spec effective range of object,
> +#               If there is no such part, it means global spec.
> +#
> +# @source: Source address and port.
> +#
> +# @destination: Destination address and port.
> +#
> +# Since: 6.1
> +##
> +{ 'struct': 'IPFlowSpec',
> +  'data': { '*protocol': 'str', '*object-name': 'str',
> +    '*source': 'InetSocketAddressBase',
> +    '*destination': 'InetSocketAddressBase' } }
> +
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry according to user's needs in COLO-compare.
> +# Source IP/port and destination IP/port both optional, If user just
> +# input parts of infotmation, it will match all.

information

Grammar suggestion:

The source and destination IP/ports are both optional; if the user
only inputs part of the information, this will match all traffic.

except I'm not sure if my rewrite conveys the actual intent.

> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry according to user's needs in COLO-compare.
> +# Source IP/port and destination IP/port both optional, If user just
> +# input parts of infotmation, it will match all.

Same problems as above.

> +#
> +# Returns: Nothing on success
> +#
> +# Since: 6.1
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "object-name": "object0",
> +#      "source": {"host": "192.168.1.1", "port": "1234"},
> +#      "destination": {"host": "192.168.1.2", "port": "4321"} } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del', 'boxed': true,
> +     'data': 'IPFlowSpec' }
> -- 
> 2.25.1
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


