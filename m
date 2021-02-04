Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DA30FD5A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:55:52 +0100 (CET)
Received: from localhost ([::1]:36354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kjH-0003JO-MH
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kfH-0007TZ-LO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:51:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7kfE-0002XK-EN
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612468298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=slQBX41uezPmR/Q5+LFPRq1Wlg6eL3NxPimMOBAdqs0=;
 b=cyTHVWR3dFqGtjR6IejZ7a456Ze4x/CERb/eDpkVIEPwSRQ0KxEkeN/sHmklOxiKKXjQ5P
 3+36HZN5lb+t1Zb0RsGluiqifIJzRF5Dp4CyzuIkyi996fg1eC4npvbCKs2niFcw+H9+15
 5H/viphhYtJqTSMeTeJReoSFmOED/ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-8GgGCvKuPNGpVEi5gZhZHQ-1; Thu, 04 Feb 2021 14:51:34 -0500
X-MC-Unique: 8GgGCvKuPNGpVEi5gZhZHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB36E107ACE3;
 Thu,  4 Feb 2021 19:51:33 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2397B60BE2;
 Thu,  4 Feb 2021 19:51:33 +0000 (UTC)
To: phillip.ennen@gmail.com, qemu-devel@nongnu.org
References: <20210204162544.65439-1-phillip.ennen@gmail.com>
 <20210204162544.65439-3-phillip.ennen@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH 2/2] net: implement vmnet-based netdev
Message-ID: <bfa145d6-648a-8b01-03ba-cd64ba082c69@redhat.com>
Date: Thu, 4 Feb 2021 13:51:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204162544.65439-3-phillip.ennen@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: stefanha@gmail.com, jasowang@redhat.com, phillip@axleos.com,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/21 10:25 AM, phillip.ennen@gmail.com wrote:
> From: Phillip Tennen <phillip@axleos.com>
> 
> This patch implements a new netdev device, reachable via -netdev
> vmnet-macos, that’s backed by macOS’s vmnet framework.
> 
> The vmnet framework provides native bridging support, and its usage in
> this patch is intended as a replacement for attempts to use a tap device
> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> never would have worked in the first place, as QEMU interacts with the
> tap device via poll(), and macOS does not support polling device files.
> 

> This is my first QEMU contribution, so please feel free to let me know
> what I’ve missed or what needs improving. Thanks very much for taking a
> look =)

This paragraph would fit better...

> 
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> ---

...here, after the --- marker.  It's useful to the reviewer (and welcome
to the community, by the way!), but does not need to be enshrined in git
history.

>  configure         |   2 +-
>  net/clients.h     |   6 +
>  net/meson.build   |   1 +
>  net/net.c         |   3 +
>  net/vmnet-macos.c | 444 ++++++++++++++++++++++++++++++++++++++++++++++
>  qapi/net.json     |  64 ++++++-
>  qemu-options.hx   |   9 +

I'm focusing mainly on the UI aspects, and did not look closely at the rest.

> +++ b/qapi/net.json
> @@ -450,6 +450,65 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
>  
> +##
> +# @VmnetOperatingMode:
> +#
> +# An enumeration of the I/O operation types
> +#
> +# @host: the guest may communicate with the host 
> +#        and other guest network interfaces
> +#
> +# @shared: the guest may reach the Internet through a NAT, 
> +#          and may communicate with the host and other guest 
> +#          network interfaces
> +#
> +# @bridged: the guest's traffic is bridged with a 
> +#           physical network interface of the host
> +#
> +# Since: 5.3

The next release will be 6.0, not 5.3.

> +##
> +{ 'enum': 'VmnetOperatingMode',
> +  'data': [ 'host', 'shared', 'bridged' ] }
> +
> +##
> +# @NetdevVmnetOptions:
> +#
> +# vmnet network backend (only available on macOS)
> +#
> +# @mode: the operating mode vmnet should run in
> +#
> +# @ifname: the physical network interface to bridge with 
> +#          (only valid with mode=bridged)

If this is only valid with bridged, then you should use a union type,
where only the bridged branch supports this member.  That is more
typesafe than always supporting it in the schema and having to
semantically filter it out after the fact.

> +#
> +# @dhcp_start_address: the gateway address to use for the interface. 

New QAPI additions should favor names with '-' rather than '_', as in
dhcp-start-address; the exception is if you are closely copying another
older interface that already used _.

> +#                      The range to dhcp_end_address is placed in the DHCP pool.
> +#                      (only valid with mode=host|shared)
> +#                      (must be specified with dhcp_end_address and 
> +#                       dhcp_subnet_mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp_end_address: the DHCP IPv4 range end address to use for the interface. 
> +#                      (only valid with mode=host|shared)
> +#                      (must be specified with dhcp_start_address and 
> +#                       dhcp_subnet_mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp_subnet_mask: the IPv4 subnet mask (string) to use on the interface.
> +#                    (only valid with mode=host|shared)
> +#                    (must be specified with dhcp_start_address and 
> +#                     dhcp_end_address)
> +#                    (allocated automatically if unset)
> +#
> +# Since: 5.3

6.0

> +##
> +{ 'struct': 'NetdevVmnetOptions',
> +  'data': {
> +    'mode':        'VmnetOperatingMode',
> +    '*ifname':        'str',
> +    '*dhcp_start_address':      'str',
> +    '*dhcp_end_address':        'str',
> +    '*dhcp_subnet_mask':        'str' } }

In addition to my suggestion of making this a union rather than a
struct, you probably also want to include an 'if' tag so that the struct
is present only on MacOS builds (it's nicer for introspection to not
advertise something that won't work).

> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -461,7 +520,7 @@
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa', 'vmnet-macos' ] }

Missing a doc mention that 'vmnet-macos' is new to 6.0.

>  
>  ##
>  # @Netdev:
> @@ -490,7 +549,8 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-macos': 'NetdevVmnetOptions' } }

Adding Markus in cc; right now, I don't think QAPI supports a union type
as a branch to another union type. There's nothing that technically
would prevent us from doing that, just the grunt work of modifying the
QAPI code generator to support it.

>  
>  ##
>  # @NetFilterDirection:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9172d51659..ec6b40b079 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>  #ifdef __linux__
>      "-netdev vhost-vdpa,id=str,vhostdev=/path/to/dev\n"
>      "                configure a vhost-vdpa network,Establish a vhost-vdpa netdev\n"
> +#endif
> +#ifdef CONFIG_DARWIN
> +    "-netdev vmnet-macos,id=str,mode=bridged[,ifname=ifname]\n"
> +    "         configure a macOS-provided vmnet network in \"physical interface bridge\" mode\n"
> +    "         the physical interface to bridge with defaults to en0 if unspecified\n"
> +    "-netdev vmnet-macos,id=str,mode=host|shared\n"
> +    "                     [,dhcp_start_address=addr,dhcp_end_address=addr,dhcp_subnet_mask=mask]\n"
> +    "         configure a macOS-provided vmnet network in \"host\" or \"shared\" mode\n"
> +    "         the DHCP configuration will be set automatically if unspecified\n"
>  #endif
>      "-netdev hubport,id=str,hubid=n[,netdev=nd]\n"
>      "                configure a hub port on the hub with ID 'n'\n", QEMU_ARCH_ALL)
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


