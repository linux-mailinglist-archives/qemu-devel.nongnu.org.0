Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2391E5503F8
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 12:09:28 +0200 (CEST)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2VOR-0000OJ-3S
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 06:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKo-0006Aj-F3
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 06:05:44 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKn-00050W-5q; Sat, 18 Jun 2022 06:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=b0+EyA1ZaW5J8AeF4MALS9wyck/P1A+dLFOrLZClvPc=; b=T41TKq+r7S7sIKblnvF2
 wPjZU+H7Jo0Dvkh1xzSQn8QvVzXRvSdB18VPLWEaVPsjg1PU/dDOtBhmKeOhxG+L1Qx4AtgrFqgsP
 2aiIXHBcW0I4IEKvPdvIunQPtho/qByh8HdAqc2A+h2/1cKhL1cAswCTkN+J+RVeImuz5Y4or9AWr
 1OQydFnPjif4A1Iq+Vmk5v91jKxeDFA8c+YtGzL8zAStXW3VxLbGH0Go9G0gf9s2J6Xgt0UDPfQTq
 LJagnmD92D5EeFhkeJjywCLL+pfJTRjeALlRPuxX0XGPrPsoXuiasYNDXjqJqVreRwkldCaHoCLkp
 piwJx+p4k76wAA==;
Received: from 2a02-8440-611c-788e-de41-a9ff-fe47-ec49.rev.sfr.net
 ([2a02:8440:611c:788e:de41:a9ff:fe47:ec49]:45228 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKm-0002kx-Qc; Sat, 18 Jun 2022 06:05:40 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1o2VKf-00BXZm-DU;
 Sat, 18 Jun 2022 12:05:33 +0200
Date: Sat, 18 Jun 2022 12:05:33 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <pdel@fb.com>
Cc: jasowang@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 4/4] slirp: Add oob-eth-addr to -netdev options
Message-ID: <20220618100533.eb6frd5wu2hyfncu@begin>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-5-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220616010526.1895564-5-pdel@fb.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Delevoryas, le mer. 15 juin 2022 18:05:26 -0700, a ecrit:
> With this change, you can now request the out-of-band MAC address from
> slirp in fby35-bmc:
> 
>     wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>     qemu-system-arm -machine fby35-bmc \
>         -drive file=fby35.mtd,format=raw,if=mtd \
>         -nographic \
>         -netdev user,id=nic,mfr-id=0x8119,oob-eth-addr=de:ad:be:ef:ca:fe,hostfwd=::2222-:22 \
>         -net nic,model=ftgmac100,netdev=nic
> 
>     ...
>     username: root
>     password: 0penBmc
>     ...
> 
>     root@bmc-oob:~# ncsi-util -n eth0 -c 0 0x50 0 0 0x81 0x19 0 0 0x1b 0
>     NC-SI Command Response:
>     cmd: NCSI_OEM_CMD(0x50)
>     Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
>     Payload length = 24
> 
>     20: 0x00 0x00 0x81 0x19
>     24: 0x01 0x00 0x1b 0x00
>     28: 0x00 0x00 0x00 0x00
>     32: 0xde 0xad 0xbe 0xef
>     36: 0xca 0xfe 0x00 0x00
> 
>     root@bmc-oob:~# ifconfig
>     eth0      Link encap:Ethernet  HWaddr DE:AD:BE:EF:CA:FE
> 	      inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
> 	      inet6 addr: fec0::dcad:beff:feef:cafe/64 Scope:Site
> 	      inet6 addr: fe80::dcad:beff:feef:cafe/64 Scope:Link
> 	      UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> 	      RX packets:253 errors:0 dropped:0 overruns:0 frame:0
> 	      TX packets:271 errors:0 dropped:0 overruns:0 carrier:0
> 	      collisions:0 txqueuelen:1000
> 	      RX bytes:24638 (24.0 KiB)  TX bytes:18876 (18.4 KiB)
> 	      Interrupt:32
> 
>     lo        Link encap:Local Loopback
> 	      inet addr:127.0.0.1  Mask:255.0.0.0
> 	      inet6 addr: ::1/128 Scope:Host
> 	      UP LOOPBACK RUNNING  MTU:65536  Metric:1
> 	      RX packets:2 errors:0 dropped:0 overruns:0 frame:0
> 	      TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
> 	      collisions:0 txqueuelen:1000
> 	      RX bytes:120 (120.0 B)  TX bytes:120 (120.0 B)
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  net/slirp.c   | 13 +++++++++++--
>  qapi/net.json |  5 ++++-
>  2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index 231068c1e2..858d3da859 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -414,7 +414,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>                            const char *smb_export, const char *vsmbserver,
>                            const char **dnssearch, const char *vdomainname,
>                            const char *tftp_server_name, uint32_t mfr_id,
> -                          Error **errp)
> +                          uint8_t oob_eth_addr[ETH_ALEN], Error **errp)
>  {
>      /* default settings according to historic slirp */
>      struct in_addr net  = { .s_addr = htonl(0x0a000200) }; /* 10.0.2.0 */
> @@ -637,6 +637,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>      cfg.vdnssearch = dnssearch;
>      cfg.vdomainname = vdomainname;
>      cfg.mfr_id = mfr_id;
> +    memcpy(cfg.oob_eth_addr, oob_eth_addr, ETH_ALEN);

And similarly here.

>      s->slirp = slirp_new(&cfg, &slirp_cb, s);
>      QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
>  
> @@ -1142,6 +1143,7 @@ int net_init_slirp(const Netdev *netdev, const char *name,
>      const NetdevUserOptions *user;
>      const char **dnssearch;
>      bool ipv4 = true, ipv6 = true;
> +    MACAddr oob_eth_addr = {};
>  
>      assert(netdev->type == NET_CLIENT_DRIVER_USER);
>      user = &netdev->u.user;
> @@ -1166,6 +1168,12 @@ int net_init_slirp(const Netdev *netdev, const char *name,
>      net_init_slirp_configs(user->hostfwd, SLIRP_CFG_HOSTFWD);
>      net_init_slirp_configs(user->guestfwd, 0);
>  
> +    if (user->has_oob_eth_addr &&
> +        net_parse_macaddr(oob_eth_addr.a, user->oob_eth_addr) < 0) {
> +        error_setg(errp, "invalid syntax for OOB ethernet address");
> +        return -1;
> +    }
> +
>      ret = net_slirp_init(peer, "user", name, user->q_restrict,
>                           ipv4, vnet, user->host,
>                           ipv6, user->ipv6_prefix, user->ipv6_prefixlen,
> @@ -1173,7 +1181,8 @@ int net_init_slirp(const Netdev *netdev, const char *name,
>                           user->bootfile, user->dhcpstart,
>                           user->dns, user->ipv6_dns, user->smb,
>                           user->smbserver, dnssearch, user->domainname,
> -                         user->tftp_server_name, user->mfr_id, errp);
> +                         user->tftp_server_name, user->mfr_id, oob_eth_addr.a,
> +                         errp);
>  
>      while (slirp_configs) {
>          config = slirp_configs;
> diff --git a/qapi/net.json b/qapi/net.json
> index efc5cb3fb6..7b2c3c205c 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -169,6 +169,8 @@
>  #
>  # @mfr-id: Manufacturer ID (Private Enterprise Number: IANA)
>  #
> +# @oob-eth-addr: Out-of-band ethernet address for BMC
> +#
>  # Since: 1.2
>  ##
>  { 'struct': 'NetdevUserOptions',
> @@ -195,7 +197,8 @@
>      '*hostfwd':   ['String'],
>      '*guestfwd':  ['String'],
>      '*tftp-server-name': 'str',
> -    '*mfr-id': 'uint32' } }
> +    '*mfr-id': 'uint32',
> +    '*oob-eth-addr': 'str' } }
>  
>  ##
>  # @NetdevTapOptions:
> -- 
> 2.30.2
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

