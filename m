Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A126A46FAA3
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 07:29:33 +0100 (CET)
Received: from localhost ([::1]:33846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvZPQ-0005RR-33
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 01:29:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvZJm-0003nG-6i
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mvZJe-00058I-C6
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639117411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQ5DWxJxhEJOFLA62EqBBhlt8SsXyz2E5Zba0DZHyBQ=;
 b=HQLL36GiGj8dCNqJjERE3AShwLdp8hVduhQ/MxaWf2EKwhbSxHPUDGJ+iTOc2vXphwF2PN
 F55jK6CY4PBjLFr54Yzw/n67XjvYujCrk2FEOI9T3f3KXN/mHtdzDG5FvSP/YXq6qb2YFI
 l9UKOwjJHLqkF4B72Zq+f9AuqB1xSVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-_DIlKWjrPN-MeGPAhbKOVw-1; Fri, 10 Dec 2021 01:23:25 -0500
X-MC-Unique: _DIlKWjrPN-MeGPAhbKOVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0720D1006AA1;
 Fri, 10 Dec 2021 06:23:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7471145D71;
 Fri, 10 Dec 2021 06:23:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 00E25113865F; Fri, 10 Dec 2021 07:23:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v7 2/7] net/vmnet: add vmnet backends to qapi/net
References: <20211207101828.22033-1-yaroshchuk2000@gmail.com>
 <20211207101828.22033-3-yaroshchuk2000@gmail.com>
Date: Fri, 10 Dec 2021 07:23:21 +0100
In-Reply-To: <20211207101828.22033-3-yaroshchuk2000@gmail.com> (Vladislav
 Yaroshchuk's message of "Tue, 7 Dec 2021 13:18:23 +0300")
Message-ID: <8735n1dlly.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
 r.bolshakov@yadro.com, phillip@axleos.com, akihiko.odaki@gmail.com,
 hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Vladislav Yaroshchuk <yaroshchuk2000@gmail.com> writes:

> Create separate netdevs for each vmnet operating mode:
> - vmnet-host
> - vmnet-shared
> - vmnet-bridged
>
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8..8ed7bf0c04 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,122 @@
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

We don't say "native host" elsewhere, just "host".  Let's drop
"native".

> +#
> +# @start-address: The starting IPv4 address to use for the interface.
> +#                 Must be in the private IP range (RFC 1918). Must be
> +#                 specified along with @end-address and @subnet-mask.
> +#                 This address is used as the gateway address. The
> +#                 subsequent address up to and including end-address are
> +#                 placed in the DHCP pool.
> +#
> +# @end-address: The DHCP IPv4 range end address to use for the
> +#               interface. Must be in the private IP range (RFC 1918).
> +#               Must be specified along with @start-address and
> +#               @subnet-mask.
> +#
> +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> +#               be specified along with @start-address and @subnet-mask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed.
> +#
> +# @net-uuid: The identifier (UUID) to uniquely identify the isolated
> +#            network vmnet interface should be added to. If
> +#            set, no DHCP service is provided for this interface and
> +#            network communication is allowed only with other interfaces
> +#            added to this network identified by the UUID.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetHostOptions',
> +  'data': {
> +    '*start-address':   'str',
> +    '*end-address':     'str',
> +    '*subnet-mask': 'str',
> +    '*isolated':    'bool',
> +    '*net-uuid':    'str'
> +  },

Unusual formatting.  The common one is

       '*net-uuid':    'str' },

Let's stick to it.

> +  'if': 'CONFIG_VMNET' }
> +
> +##
> +# @NetdevVmnetSharedOptions:
> +#
> +# vmnet (shared mode) network backend.
> +#
> +# Allows traffic originating from the vmnet interface to reach the
> +# Internet through a network address translator (NAT).
> +# The vmnet interface can communicate with the native host and with

Drop "native".

> +# other shared mode interfaces on the same subnet. If no DHCP
> +# settings, subnet mask and IPv6 prefix specified, the interface can
> +# communicate with any of other interfaces in shared mode.
> +#
> +# @start-address: The starting IPv4 address to use for the interface.
> +#                 Must be in the private IP range (RFC 1918). Must be
> +#                 specified along with @end-address and @subnet-mask.
> +#                 This address is used as the gateway address. The
> +#                 subsequent address up to and including end-address are
> +#                 placed in the DHCP pool.
> +#
> +# @end-address: The DHCP IPv4 range end address to use for the
> +#               interface. Must be in the private IP range (RFC 1918).
> +#               Must be specified along with @start-address and @subnet-mask.
> +#
> +# @subnet-mask: The IPv4 subnet mask to use on the interface. Must
> +#                be specified along with @start-address and @subnet-mask.
> +#
> +# @isolated: Enable isolation for this interface. Interface isolation
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed.
> +#
> +# @nat66-prefix: The IPv6 prefix to use into guest network. Must be a
> +#                unique local address i.e. start with fd00::/8 and have
> +#                length of 64.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetSharedOptions',
> +  'data': {
> +    '*start-address':    'str',
> +    '*end-address':      'str',
> +    '*subnet-mask':  'str',
> +    '*isolated':     'bool',
> +    '*nat66-prefix': 'str'
> +  },

Unusual formatting again.

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
> +#            ensures that vmnet interface is not able to communicate
> +#            with any other vmnet interfaces. Only communication with
> +#            host is allowed.
> +#
> +# Since: 7.0
> +##
> +{ 'struct': 'NetdevVmnetBridgedOptions',
> +  'data': {
> +    'ifname':     'str',
> +    '*isolated':  'str'
> +  },

And again.

> +  'if': 'CONFIG_VMNET' }
> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,10 +576,16 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#        @vmnet-host since 7.0
> +#        @vmnet-shared since 7.0
> +#        @vmnet-bridged since 7.0
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
> @@ -477,6 +599,9 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#        'vmnet-host' - since 7.0
> +#        'vmnet-shared' - since 7.0
> +#        'vmnet-bridged' - since 7.0
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +617,10 @@
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

With the minor tweaks, QAPI schema
Acked-by: Markus Armbruster <armbru@redhat.com>


