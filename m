Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2FC44A66E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 06:42:20 +0100 (CET)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkJtj-00013C-2A
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 00:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkJsg-0000NH-Qw
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 00:41:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mkJsc-0003oH-V0
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 00:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636436469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LbV9f2BF+XS1T5Xzaa/VWPAu33XTJXXw/pZ7BVaVVz4=;
 b=PAS5RXd0IqGdrSZngL/cUoYnBEdejLb7VA9mW3PAWHmHXA5diRt4bpdVe5KGqz+l3I3PUM
 6xh74xahligOzeRES69QJ4RjRbBPJm6KLCwlAhBoD77Gbe+Bwuobc9ImzyhnXeaFc2ss/A
 gAw7UPUCdm0Gwckz6J1j+mxJ7HQWezs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-Ox1RGI0ZPgi9yAVIZTr-Tg-1; Tue, 09 Nov 2021 00:41:01 -0500
X-MC-Unique: Ox1RGI0ZPgi9yAVIZTr-Tg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28D4F1966320;
 Tue,  9 Nov 2021 05:41:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61BC65C232;
 Tue,  9 Nov 2021 05:40:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D3A9111380A7; Tue,  9 Nov 2021 06:40:51 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v4 2/6] net/vmnet: add vmnet backends to qapi/net
References: <20211108151704.65611-1-yaroshchuk2000@gmail.com>
 <20211108151704.65611-3-yaroshchuk2000@gmail.com>
Date: Tue, 09 Nov 2021 06:40:51 +0100
In-Reply-To: <20211108151704.65611-3-yaroshchuk2000@gmail.com> (Vladislav
 Yaroshchuk's message of "Mon, 8 Nov 2021 18:17:00 +0300")
Message-ID: <87czn9honw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, r.bolshakov@yadro.com, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..087cdf0546 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,112 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
>  
> +##
> +# @NetdevVmnetHostOptions:
> +#
> +# vmnet (host mode) network backend.
> +#
> +# Allows the vmnet interface to communicate with other vmnet
> +# interfaces that are in host mode and also with the native host.
> +#
> +# @dhcpstart: The starting IPv4 address to use for the interface.
> +#             Must be in the private IP range (RFC 1918). Must be
> +#             specified along with @dhcpend and @subnetmask.
> +#             This address is used as the gateway address. The
> +#             subsequent address up to and including dhcpend are
> +#             placed in the DHCP pool.

In QMP, we separate words by dashes, like @dhcp-start.  We may prefer
not to here, for consistency with NetdevUserOptions, ...

> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the
> +#           interface. Must be in the private IP range (RFC 1918).
> +#           Must be specified along with @dhcpstart and @subnetmask.

... and here, to match @dhcpstart.

> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> +#              be specified along with @dhcpstart and @subnetmask.

@subnet-mask, please.

No support for IPv6?

> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that network communication between multiple
> +#            vmnet interfaces instances is not possible.
> +#
> +# @net-uuid: The identifier (UUID) to uniquely identify the network.
> +#            If provided, no DHCP service is provided on this network
> +#            and the interface is added to an isolated network with
> +#            the specified identifier.

Out of curiosity: identify to whom?

If I set @net-uuid, I get an isolated network with a UUID, and if I set
"isolated": true, I get one without a UUID.  When would I want the
former, and when the latter?

What happens when I set "isolated": false together with @net-uuid?

When "no DCHCP service is provided", then @dhcpstart and @dhcpend become
misnomers.  Compare NetdevUserOptions: it uses @net to specify the
address range, and dhcpstart to specify the DHCP range (@dhcpend is
implied).  Should we aim for consistency between the two?

> +#
> +# Since: 6.2

Missed 6.2, please adjust.  More of the same below.

> +##
> +{ 'struct': 'NetdevVmnetHostOptions',
> +  'data': {
> +    '*dhcpstart':   'str',
> +    '*dhcpend':     'str',
> +    '*subnetmask':  'str',
> +    '*isolated':    'bool',
> +    '*net-uuid':    'str'
> +  },
> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetSharedOptions:
> +#
> +# vmnet (shared mode) network backend.
> +#
> +# Allows traffic originating from the vmnet interface to reach the
> +# Internet through a network address translator (NAT). The vmnet
> +# interface can also communicate with the native host. By default,
> +# the vmnet interface is able to communicate with other shared mode
> +# interfaces. If a subnet range is specified, the vmnet interface can

Do you mean "subnet mask"?

> +# communicate with other shared mode interfaces on the same subnet.
> +#
> +# @dhcpstart: The starting IPv4 address to use for the interface.
> +#             Must be in the private IP range (RFC 1918). Must be
> +#             specified along with @dhcpend and @subnetmask.
> +#             This address is used as the gateway address. The
> +#             subsequent address up to and including dhcpend are
> +#             placed in the DHCP pool.
> +#
> +# @dhcpend: The DHCP IPv4 range end address to use for the
> +#           interface. Must be in the private IP range (RFC 1918).
> +#           Must be specified along with @dhcpstart and @subnetmask.
> +#
> +# @subnetmask: The IPv4 subnet mask to use on the interface. Must
> +#              be specified along with @dhcpstart and @subnetmask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that network communication between multiple
> +#            vmnet interfaces instances is not possible.
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'NetdevVmnetSharedOptions',
> +  'data': {
> +    '*dhcpstart':    'str',
> +    '*dhcpend':      'str',
> +    '*subnetmask':   'str',
> +    '*isolated':     'bool'
> +  },
> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetBridgedOptions:
> +#
> +# vmnet (bridged mode) network backend.
> +#
> +# Bridges the vmnet interface with a physical network interface.
> +#
> +# @ifname: The name of the physical interface to be bridged.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that network communication between multiple
> +#            vmnet interfaces instances is not possible.
> +#
> +# Since: 6.2
> +##
> +{ 'struct': 'NetdevVmnetBridgedOptions',
> +  'data': {
> +    'ifname':     'str',
> +    '*isolated':  'str'
> +  },
> +  'if': 'CONFIG_VMNET' }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,10 +566,16 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#        @vmnet-host since 6.2
> +#        @vmnet-shared since 6.2
> +#        @vmnet-bridged since 6.2
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-host', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-shared', 'if': 'CONFIG_VMNET' },
> +            { 'name': 'vmnet-bridged', 'if': 'CONFIG_VMNET' }] }
>  
>  ##
>  # @Netdev:
> @@ -477,6 +589,9 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#        'vmnet-host' - since 6.2
> +#        'vmnet-shared' - since 6.2
> +#        'vmnet-bridged' - since 6.2
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +607,10 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-host': 'NetdevVmnetHostOptions',
> +    'vmnet-shared': 'NetdevVmnetSharedOptions',
> +    'vmnet-bridged': 'NetdevVmnetBridgedOptions' } }
>  
>  ##
>  # @RxState:


