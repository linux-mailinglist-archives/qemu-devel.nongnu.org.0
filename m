Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C422E29F8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 07:21:57 +0100 (CET)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksgU7-0007Mp-W5
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 01:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ksgSe-0006oj-MK
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 01:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ksgSY-00083i-N3
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 01:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608877214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lcDq4oNaTd/RbSBblYWOLeTwmBL3fCSM3pMnmL6BROA=;
 b=P3fXtMiTh5e0TRpiKu8AQ6wR+AKXwaNOVyEHTomTl3bEaxO3Ox3rbCPk/UG1JoltqD+MKG
 Upy241uz6o238mWSkKUyVON8xrSTKsFoxfbvkSyos9ZJmSEHHQv3ESJA0Org9Bn6N4ccbw
 xfFlbZNV5Z4LUCuRtdpxWhHxmqI/974=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-Btey9R6jOcKTz-eqt4HfBQ-1; Fri, 25 Dec 2020 01:20:12 -0500
X-MC-Unique: Btey9R6jOcKTz-eqt4HfBQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73C1710051A2;
 Fri, 25 Dec 2020 06:20:11 +0000 (UTC)
Received: from [10.72.12.166] (ovpn-12-166.pek2.redhat.com [10.72.12.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F410A70953;
 Fri, 25 Dec 2020 06:20:08 +0000 (UTC)
Subject: Re: [PATCH 1/3] qapi/net: Add new QMP command for COLO passthrough
To: Zhang Chen <chen.zhang@intel.com>, qemu-dev <qemu-devel@nongnu.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20201224010918.19275-1-chen.zhang@intel.com>
 <20201224010918.19275-2-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <08fe5c51-1383-12dd-b255-151a868cd6d9@redhat.com>
Date: Fri, 25 Dec 2020 14:20:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201224010918.19275-2-chen.zhang@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.825, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/12/24 上午9:09, Zhang Chen wrote:
> From: Zhang Chen <chen.zhang@intel.com>
>
> Since the real user scenario does not need to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>   net/net.c     | 12 ++++++++++++
>   qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 58 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index e1035f21d1..eac7a92618 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1151,6 +1151,18 @@ void qmp_netdev_del(const char *id, Error **errp)
>       qemu_del_net_client(nc);
>   }
>   
> +void qmp_colo_passthrough_add(const char *prot, const uint32_t port,
> +                              Error **errp)
> +{
> +    /* Setup passthrough connection */
> +}
> +
> +void qmp_colo_passthrough_del(const char *prot, const uint32_t port,
> +                              Error **errp)
> +{
> +    /* Delete passthrough connection */
> +}
> +
>   static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>   {
>       char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..466c29714e 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -714,3 +714,49 @@
>   ##
>   { 'event': 'FAILOVER_NEGOTIATED',
>     'data': {'device-id': 'str'} }
> +
> +##
> +# @colo-passthrough-add:
> +#
> +# Add passthrough entry according to customer's needs in COLO-compare.
> +#
> +# @protocol: COLO passthrough just support TCP and UDP.
> +#
> +# @port: TCP or UDP port number.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 5.3
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-add",
> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-add',
> +     'data': {'protocol': 'str', 'port': 'uint32'} }


Do we plan to support 4-tuple (src ip,src port, dst ip, dst port) in the 
future? If yes, let's add them now.

And do we plan to support wildcard here?

Thanks


> +
> +##
> +# @colo-passthrough-del:
> +#
> +# Delete passthrough entry according to customer's needs in COLO-compare.
> +#
> +# @protocol: COLO passthrough just support TCP and UDP.
> +#
> +# @port: TCP or UDP port number.
> +#
> +# Returns: Nothing on success
> +#
> +# Since: 5.3
> +#
> +# Example:
> +#
> +# -> { "execute": "colo-passthrough-del",
> +#      "arguments": { "protocol": "tcp", "port": 3389 } }
> +# <- { "return": {} }
> +#
> +##
> +{ 'command': 'colo-passthrough-del',
> +     'data': {'protocol': 'str', 'port': 'uint32'} }


