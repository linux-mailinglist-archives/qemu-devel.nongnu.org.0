Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697B9329AF0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:51:10 +0100 (CET)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2cP-0004Oa-9S
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:51:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH2b1-0003sD-KS
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:49:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lH2ay-0005AM-3p
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:49:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614682177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaMw4CI+l55+eJpn7gjcF+WUER1QDpYV5oBndNSENkY=;
 b=X7HuDo+z8ZI45/DlWWiq7o46HRxPa4GJDeN3qC9FN0ScN7nV4J+W2QzUpyTz9cC0OY2lsm
 pCWWBQh93sE8qgQcy7GtPHhaIHkTqINteQoT2Izlv7CUyV32Ka+LT6kucc47bGO0e6ZFSC
 6FAhnsdxSCmk+ryyVja4V1ttdPGeQLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-uPCnCCrEMwG27tZmj0c8-Q-1; Tue, 02 Mar 2021 05:49:33 -0500
X-MC-Unique: uPCnCCrEMwG27tZmj0c8-Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51A17C289;
 Tue,  2 Mar 2021 10:49:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC0655D9D3;
 Tue,  2 Mar 2021 10:49:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4423B113860F; Tue,  2 Mar 2021 11:49:30 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: phillip.ennen@gmail.com
Subject: Re: [PATCH v2] net/macos: implement vmnet-based network device
References: <20210205164106.6664-1-phillip.ennen@gmail.com>
Date: Tue, 02 Mar 2021 11:49:29 +0100
In-Reply-To: <20210205164106.6664-1-phillip.ennen@gmail.com> (phillip ennen's
 message of "Fri, 5 Feb 2021 17:41:06 +0100")
Message-ID: <87o8g1j0ee.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, thuth@redhat.com,
 stefanha@gmail.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 phillip@axleos.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Phillip, this doesn't apply anymore.  I'm reviewing the QAPI schema part
anyway.

Peter, there is a question for you below.  Search for "Sphinx".

phillip.ennen@gmail.com writes:

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
> Signed-off-by: Phillip Tennen <phillip@axleos.com>
> ---
[...]
> diff --git a/qapi/net.json b/qapi/net.json
> index c31748c87f..e4d4143243 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -450,6 +450,115 @@
>      '*vhostdev':     'str',
>      '*queues':       'int' } }
> =20
> +##
> +# @VmnetOperatingMode:
> +#
> +# The operating modes in which a vmnet netdev can run
> +# Only available on macOS

Please end these sentences with a period.

I'm not sure we need "Only available on macOS".  Rendered documentation
shows the 'if' like

    If
    defined(CONFIG_DARWIN)

More of the same below.

> +#
> +# @host: the guest may communicate with the host=20
> +#        and other guest network interfaces
> +#
> +# @shared: the guest may reach the Internet through a NAT,=20
> +#          and may communicate with the host and other guest=20
> +#          network interfaces
> +#
> +# @bridged: the guest's traffic is bridged with a=20
> +#           physical network interface of the host
> +#
> +# Since: 6.0
> +##
> +{ 'enum': 'VmnetOperatingMode',
> +  'data': [ 'host', 'shared', 'bridged' ],
> +  'if': 'defined(CONFIG_DARWIN)' }
> +
> +##
> +# @NetdevVmnetModeOptionsBridged:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'bridged' mode
> +# Only available on macOS

Likewise.

> +#
> +# @ifname: the physical network interface to bridge with=20
> +#          (defaults to en0 if not specified)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsBridged',
> +  'data': { '*ifname':  'str' },
> +  'if': 'defined(CONFIG_DARWIN)' }
> +
> +##
> +# @NetdevVmnetModeOptionsHostOrShared:
> +#
> +# Options for the vmnet-macos netdev
> +# that are only available in 'host' or 'shared' mode
> +# Only available on macOS
> +#
> +# @dhcp-start-address: the gateway address to use for the interface.=20
> +#                      The range to dhcp_end_address is placed in the DH=
CP pool.

Recommend to wrap lines around column 75.

> +#                      (only valid with mode=3Dhost|shared)

Isn't that trivial?  The type's only use is as union branch for modes
host and shared.

> +#                      (must be specified with dhcp-end-address and=20
> +#                       dhcp-subnet-mask)

Does that mean you have to specify all three parameters or none?

Sphinx warns:

    qapi/net.json:492:Unexpected indentation.

Known restriction of our tooling: the position is less than useful.

Unindenting the second line like

   #                      (must be specified with dhcp-end-address and=20
   #                      dhcp-subnet-mask)

here and similarly below makes Sphinx shut up.

I'm not 100% sure our tooling behaves as intended here.  Peter?

> +#                      (allocated automatically if unset)

How?

The sequence of (parenthesized sentences) looks pretty bad in rendered
documentation.  Please proof-read docs/manual/interop/qemu-qmp-ref.html.

> +#
> +# @dhcp-end-address: the DHCP IPv4 range end address to use for the inte=
rface.=20
> +#                      (only valid with mode=3Dhost|shared)
> +#                      (must be specified with dhcp-start-address and=20
> +#                       dhcp-subnet-mask)
> +#                      (allocated automatically if unset)
> +#
> +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the interfa=
ce.
> +#                    (only valid with mode=3Dhost|shared)
> +#                    (must be specified with dhcp-start-address and=20
> +#                     dhcp-end-address)
> +#                    (allocated automatically if unset)
> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
> +  'data': {=20
> +    '*dhcp-start-address': 'str' ,
> +    '*dhcp-end-address':   'str',
> +    '*dhcp-subnet-mask':   'str' },
> +  'if': 'defined(CONFIG_DARWIN)' }
> +
> +##
> +# @NetdevVmnetModeOptions:
> +#
> +# Options specific to different operating modes of a vmnet netdev
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
> +  'if': 'defined(CONFIG_DARWIN)' }
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

Sphinx warns:

    qapi/net.json:546:Unexpected indentation.

> +#
> +# Since: 6.0
> +##
> +{ 'struct': 'NetdevVmnetOptions',
> +  'data': {'options': 'NetdevVmnetModeOptions' },
> +  'if': 'defined(CONFIG_DARWIN)' }
> +

Awkward.

You can't use make NetdevVmnetModeOptions a branch of union Netdev,
because NetdevVmnetModeOptions is a union, and a branch must be a
struct.  To work around, you wrap struct NetdevVmnetOptions around union
NetdevVmnetModeOptions.

NetdevVmnetModeOptions has no common members other than the union
discriminator.  Why not add them as three branches to Netdev?

>  ##
>  # @NetClientDriver:
>  #
> @@ -458,10 +567,13 @@
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
> +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_DARWIN)' } ] =
}
> =20
>  ##
>  # @Netdev:
> @@ -475,6 +587,8 @@
>  # Since: 1.2
>  #
>  #        'l2tpv3' - since 2.1
> +#
> +#        'vmnet-macos' since 6.0 (only available on macOS)
>  ##
>  { 'union': 'Netdev',
>    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> @@ -490,7 +604,9 @@
>      'hubport':  'NetdevHubPortOptions',
>      'netmap':   'NetdevNetmapOptions',
>      'vhost-user': 'NetdevVhostUserOptions',
> -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',=20
> +                     'if': 'defined(CONFIG_DARWIN)' } } }
> =20
>  ##
>  # @NetFilterDirection:
[...]


