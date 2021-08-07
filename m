Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121F3E3557
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 14:26:55 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCLPh-0005R4-SZ
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 08:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLOk-0004kx-J1
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mCLNk-0002gQ-4N
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 08:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628339090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LbFTxjdOORZU4qdJ8ZLnvhr9rLndMZQj+SH1z3rdHro=;
 b=inrMRRAa7S5Np5eJR60E+8hYBEhqlOJL6Sy+/gNriIB+kkFfyfr8N8eWxHBx2U28vat7rA
 LwmAZ5WmlTHCJb3E4Ooy+2rRYThJwulbF8lGbzuSijVVcrBkLJyTQZMwYQaY0r+1cStynY
 u9wvBph6dAclX9rYNNaj9WYFFicY9L0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-4ZdGuvlENVma7WpCz5nfAQ-1; Sat, 07 Aug 2021 08:24:48 -0400
X-MC-Unique: 4ZdGuvlENVma7WpCz5nfAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C8EE107ACF5;
 Sat,  7 Aug 2021 12:24:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A19695D9FC;
 Sat,  7 Aug 2021 12:24:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 267B311380A0; Sat,  7 Aug 2021 14:24:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3] net/macos: implement vmnet-based netdev
References: <20210708054451.9374-1-akihiko.odaki@gmail.com>
Date: Sat, 07 Aug 2021 14:24:45 +0200
In-Reply-To: <20210708054451.9374-1-akihiko.odaki@gmail.com> (Akihiko Odaki's
 message of "Thu, 8 Jul 2021 14:44:51 +0900")
Message-ID: <875ywhfnn6.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, stefanha@gmail.com, jasowang@redhat.com,
 qemu-devel@nongnu.org, Phillip Tennen <phillip@axleos.com>, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jason, did this fall through the cracks?

My review is for the QAPI schema only.

Akihiko Odaki <akihiko.odaki@gmail.com> writes:

> From: Phillip Tennen <phillip@axleos.com>
>
> This patch implements a new netdev device, reachable via -netdev
> vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet framework.
>
> The vmnet framework provides native bridging support, and its usage in
> this patch is intended as a replacement for attempts to use a tap device
> via the tuntaposx kernel extension. Notably, the tap/tuntaposx approach
> never would have worked in the first place, as QEMU interacts with the
> tap device via poll(), and macOS does not support polling device files.
>
> vmnet requires either a special entitlement, granted via a provisioning
> profile, or root access. Otherwise attempts to create the virtual
> interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status code. Q=
EMU may not
> currently be signed with an entitlement granted in a provisioning
> profile, as this would necessitate pre-signed binary build distribution,
> rather than source-code distribution. As such, using this netdev
> currently requires that qemu be run with root access. I=E2=80=99ve opened=
 a
> feedback report with Apple to allow the use of the relevant entitlement
> with this use case:
> https://openradar.appspot.com/radar?id=3D5007417364447232
>
> vmnet offers three operating modes, all of which are supported by this
> patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
>
> * "Host" mode: Allows the vmnet interface to communicate with other
> * vmnet
> interfaces that are in host mode and also with the native host.
> * "Shared" mode: Allows traffic originating from the vmnet interface to
> reach the Internet through a NAT. The vmnet interface can also
> communicate with the native host.
> * "Bridged" mode: Bridges the vmnet interface with a physical network
> interface.
>
> Each of these modes also provide some extra configuration that=E2=80=99s
> supported by this patch:
>
> * "Bridged" mode: The user may specify the physical interface to bridge
> with. Defaults to en0.
> * "Host" mode / "Shared" mode: The user may specify the DHCP range and
> subnet. Allocated by vmnet if not provided.
>
> vmnet also offers some extra configuration options that are not
> supported by this patch:
>
> * Enable isolation from other VMs using vmnet
> * Port forwarding rules
> * Enabling TCP segmentation offload
> * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> * Only available in "host" mode: specifying the IP address for the VM
> within an isolated network
>
> Note that this patch requires macOS 10.15 as a minimum, as this is when
> bridging support was implemented in vmnet.framework.
>
> Rebased to commit 9aef0954195cc592e86846dbbe7f3c2c5603690a by Akihiko
> Odaki.
>
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Message-Id: <20210315103209.20870-1-akihiko.odaki@gmail.com>

[...]

> diff --git a/qapi/net.json b/qapi/net.json
> index 7fab2e7cd8a..e3b67f174fc 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -452,6 +452,115 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
> =20
> +##
> +# @VmnetOperatingMode:
> +#
> +# The operating modes in which a vmnet netdev can run
> +# Only available on macOS

Generated qemu-qmp-ref.7 and .html show this as

    The operating modes in which a vmnet netdev can run Only available
    on macOS

Please end your sentences with periods :)

More of the same below.  Proof-reading the generated documentation is
always a good idea, and often forgotten (I've been guilty of that, too).

> +#
> +# @host: the guest may communicate with the host
> +#        and other guest network interfaces
> +#
> +# @shared: the guest may reach the Internet through a NAT,

Scratch "a"?

> +#          and may communicate with the host and other guest
> +#          network interfaces
> +#
> +# @bridged: the guest's traffic is bridged with a
> +#           physical network interface of the host

"bridged width" or "bridged to"?  I'm not a networking guy...

> +#
> +# Since: 6.0

6.2

> +##
> +{ 'enum': 'VmnetOperatingMode',
> +  'data': [ 'host', 'shared', 'bridged' ],
> +  'if': 'defined(CONFIG_VMNET)' }

I suspect we want 'defined(CONFIG_VMNET) && defined(CONFIG_DARWIN)',
here and below.

> +
> +##
> +# @NetdevVmnetModeOptionsBridged:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'bridged' mode
> +# Only available on macOS
> +#
> +# @ifname: the physical network interface to bridge with
> +#          (defaults to en0 if not specified)

Scratch " if not specified".

> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsBridged',
> +  'data': { '*ifname':  'str' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetModeOptionsHostOrShared:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'host' or 'shared' mode
> +# Only available on macOS
> +#
> +# @dhcp-start-address: the gateway address to use for the interface.
> +#                      The range to dhcp_end_address is placed in the DH=
CP pool.
> +#                      (only valid with mode=3Dhost|shared)
> +#                      (must be specified with dhcp-end-address and
> +#                       dhcp-subnet-mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp-end-address: the DHCP IPv4 range end address to use for the inte=
rface.
> +#                      (only valid with mode=3Dhost|shared)
> +#                      (must be specified with dhcp-start-address and
> +#                       dhcp-subnet-mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the interfa=
ce.
> +#                    (only valid with mode=3Dhost|shared)
> +#                    (must be specified with dhcp-start-address and
> +#                     dhcp-end-address)
> +#                    (allocated automatically if unset)

No IPv6.  Is it because the underlying OS feature can't do it, or is it
merely not implemented in QEMU, yet?

> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
> +  'data': {
> +    '*dhcp-start-address': 'str' ,
> +    '*dhcp-end-address':   'str',
> +    '*dhcp-subnet-mask':   'str' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetModeOptions:
> +#
> +# Options specific to different operating modes of a vmnet netdev

Suggest

   # Options for a vmnet network interface backend.

> +# Only available on macOS
> +#
> +# @mode: the operating mode vmnet should run in
> +#
> +# Since: 6.0
> +##
> +{ 'union': 'NetdevVmnetModeOptions',
> +  'base': { 'mode': 'VmnetOperatingMode' },
> +  'discriminator': 'mode',
> +  'data': {
> +    'bridged':      'NetdevVmnetModeOptionsBridged',
> +    'host':         'NetdevVmnetModeOptionsHostOrShared',
> +    'shared':       'NetdevVmnetModeOptionsHostOrShared' },
> +  'if': 'defined(CONFIG_VMNET)' }
> +
> +##
> +# @NetdevVmnetOptions:
> +#
> +# vmnet network backend
> +# Only available on macOS
> +#
> +# @options: a structure specifying the mode and mode-specific options
> +#           (once QAPI supports a union type as a branch to another unio=
n type,
> +#            this structure can be changed to a union, and the contents =
of
> +#            NetdevVmnetModeOptions moved here)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetOptions',
> +  'data': {'options': 'NetdevVmnetModeOptions' },
> +  'if': 'defined(CONFIG_VMNET)' }

Why do you need this wrapper struct?

> +
>  ##
>  # @NetClientDriver:
>  #
> @@ -460,10 +569,13 @@
>  # Since: 2.7
>  #
>  #        @vhost-vdpa since 5.1
> +#
> +#        @vmnet-macos since 6.0 (only available on macOS)
>  ##
>  { 'enum': 'NetClientDriver',
>    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
> -            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] =
}
> +            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa',
> +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_VMNET)' } ] }
> =20
>  ##
>  # @Netdev:
> @@ -477,6 +589,8 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#
> +#        'vmnet-macos' since 6.0 (only available on macOS)
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -492,7 +606,9 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',
> +                     'if': 'defined(CONFIG_VMNET)' } } }
> =20
>  ##
>  # @RxState:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index f7210779409..5ff872b3e84 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2609,6 +2609,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>  #ifdef __linux__
>      "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
>      "                configure a vhost-vdpa network,Establish a vhost-vd=
pa netdev\n"
> +#endif
> +#ifdef CONFIG_VMNET
> +    "-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifname=3Difname]\n"
> +    "         configure a macOS-provided vmnet network in \"physical int=
erface bridge\" mode\n"
> +    "         the physical interface to bridge with defaults to en0 if u=
nspecified\n"
> +    "-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n"
> +    "                     [,dhcp_start_address=3Daddr,dhcp_end_address=
=3Daddr,dhcp_subnet_mask=3Dmask]\n"
> +    "         configure a macOS-provided vmnet network in \"host\" or \"=
shared\" mode\n"
> +    "         the DHCP configuration will be set automatically if unspec=
ified\n"
>  #endif
>      "-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=3Dnd]\n"
>      "                configure a hub port on the hub with ID 'n'\n", QEM=
U_ARCH_ALL)


