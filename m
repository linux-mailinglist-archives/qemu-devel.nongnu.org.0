Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA253A8327
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:47:01 +0200 (CEST)
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltALA-0007K0-Dk
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltAHr-0003En-M7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ltAHk-0003dk-Gw
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 10:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623768202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtTvHHyRxbaZdkjueiXbZeaepBw2Ij0nxSQ/BwSAqME=;
 b=fMtt8oNe0uw+b+GTKTuZktapOv5nPyGTOGE9eUG7izIF7m7aHdI+fQr1Z41N1VwkLetZIS
 +gcFMLh+tgznD5lHIeqfnvPi8XDPWr1K/kMxD4Z+D1E+eVoPfPKKkvQVb7eDQiB84BnVzF
 48wo/Q6aWprTQA/PfBdOi1JnTd1pAr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-bqPuiuFlMcan4EksJ5_8gA-1; Tue, 15 Jun 2021 10:43:21 -0400
X-MC-Unique: bqPuiuFlMcan4EksJ5_8gA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B445101F000;
 Tue, 15 Jun 2021 14:43:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-104.ams2.redhat.com
 [10.36.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D838D19C66;
 Tue, 15 Jun 2021 14:43:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B6C2113865F; Tue, 15 Jun 2021 16:43:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Subject: Re: [PATCH V8 1/6] qapi/net: Add IPFlowSpec and QMP command for
 COLO passthrough
References: <20210615113740.2278015-1-chen.zhang@intel.com>
 <20210615113740.2278015-2-chen.zhang@intel.com>
Date: Tue, 15 Jun 2021 16:43:15 +0200
In-Reply-To: <20210615113740.2278015-2-chen.zhang@intel.com> (Zhang Chen's
 message of "Tue, 15 Jun 2021 19:37:35 +0800")
Message-ID: <87zgvrnq7w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 qemu-dev <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Zhang Chen <zhangckid@gmail.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> Since the real user scenario does not need COLO to monitor all traffic.
> Add colo-passthrough-add and colo-passthrough-del to maintain
> a COLO network passthrough list. Add IPFlowSpec struct for all QMP commands.
> All the fields of IPFlowSpec are optional.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---

The QAPI schema looks good to me, but the interface documentation is
still not quite clear enough.  To make progress, I'm going to make
concrete suggestions wherever I can despite being quite clueless about
the subject matter.  Risks me writing something that's clearer, but
wrong.  Keep that in mind, please.

>  net/net.c     | 10 +++++++
>  qapi/net.json | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>
> diff --git a/net/net.c b/net/net.c
> index 76bbb7c31b..f913e97983 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -1195,6 +1195,16 @@ void qmp_netdev_del(const char *id, Error **errp)
>      }
>  }
>  
> +void qmp_colo_passthrough_add(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement setup passthrough rule */
> +}
> +
> +void qmp_colo_passthrough_del(IPFlowSpec *spec, Error **errp)
> +{
> +    /* TODO implement delete passthrough rule */
> +}
> +
>  static void netfilter_print_info(Monitor *mon, NetFilterState *nf)
>  {
>      char *str;
> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..91f2e1495a 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -7,6 +7,7 @@
>  ##
>  
>  { 'include': 'common.json' }
> +{ 'include': 'sockets.json' }
>  
>  ##
>  # @set_link:
> @@ -696,3 +697,76 @@
>  ##
>  { 'event': 'FAILOVER_NEGOTIATED',
>    'data': {'device-id': 'str'} }
> +
> +##
> +# @IPFlowSpec:
> +#
> +# IP flow specification.
> +#
> +# @protocol: Transport layer protocol like TCP/UDP, etc. The protocol is the
> +#            string instead of enum, because it can be passed to getprotobyname(3)
> +#            and avoid duplication with /etc/protocols.

The rationale is good, but it doesn't really belong into the interface
documentation.  Suggest:

   # @protocol: Transport layer protocol like TCP/UDP, etc.  This will be
   #            passed to getprotobyname(3).


> +#
> +# @object-name: The @object-name means packet handler in Qemu. Because not
> +#               all the network packet must pass the colo-compare module,
> +#               the net-filters are same situation. There modules attach to
> +#               netdev or chardev to work, VM can run multiple modules
> +#               at the same time. So it needs the object-name to set
> +#               the effective module.

I still don't understand this, and I'm too ignorant of COLO and
networking to suggest improvements.

Jason or David, perhaps?

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
> +# Add passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.

Actually, all arguments are optional.

Suggest:

   # Add an entry to the COLO network passthrough list.
   # Absent protocol, host addresses and ports match anything.

If there is more than one such list, then "to a COLO network passthrough
list" instead.

Still missing then: meaning of absent @object-name.  Does it select the
COLO network passthrough list, perhaps?

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
> +# Delete passthrough entry IPFlowSpec to the COLO-compare instance.
> +# The protocol and source/destination IP/ports are optional. if the user
> +# only inputs part of the information, this will match all traffic.

I suspect this command doesn't actually match traffic, it matches
entries added with colo-passthrough-add.

Can it delete more than one such entry?

Suggest:

   # Delete an entry from the COLO network passthrough list.

and then explain how the command arguments select entries.

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


