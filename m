Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6B5503F7
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 12:09:15 +0200 (CEST)
Received: from localhost ([::1]:49614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2VOD-00086f-R2
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 06:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKP-0005rh-Ur
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 06:05:17 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKP-0004m1-H3; Sat, 18 Jun 2022 06:05:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=oZhy6HlQ+hLllky+nEh0DP4oLOFvf248bnNPM5KdO8Q=; b=XoN7SWF+HHibFSo1yVgu
 dj73btHRigRvnyaSl3gx+0qb1U9863JB0dCJzY0rJ9LE1OPGIfBcrQlL0roUJcng/CjEyrb3KGCus
 UY67qVniVcd0KCswUM/WMYTJWV3jGOseAu/ygOrRb/JAORT2AHiyVSePa/4rgzCwH6GO3DeR/1QGZ
 uAaqbpPIE0NUi5usXt1exQyTTjEg1nXtIlnnHwmSf8Khx1rkCmnucMvUb/YPiDkWQh36ZUdZPEh+c
 OjwwavmijotzxozFWtSpwuEQb1oX8VCZfGyFoYJ17yYcQloMCdlyS7EmUmM0Ue1aQAtcqdXuOMqMd
 FKOrAYY2Uydg2w==;
Received: from 2a02-8440-611c-788e-de41-a9ff-fe47-ec49.rev.sfr.net
 ([2a02:8440:611c:788e:de41:a9ff:fe47:ec49]:41516 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VKP-0002X7-Ao; Sat, 18 Jun 2022 06:05:17 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1o2VKG-00BXZN-Ul;
 Sat, 18 Jun 2022 12:05:08 +0200
Date: Sat, 18 Jun 2022 12:05:08 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <pdel@fb.com>
Cc: jasowang@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 3/4] slirp: Add mfr-id to -netdev options
Message-ID: <20220618100508.g7fkar6c6jvrzfwz@begin>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-4-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616010526.1895564-4-pdel@fb.com>
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

Peter Delevoryas, le mer. 15 juin 2022 18:05:25 -0700, a ecrit:
> This lets you set the manufacturer's ID for a slirp netdev, which can be
> queried from the guest through the Get Version ID NC-SI command. For
> example, by setting the manufacturer's ID to 0x8119:
> 
>     wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
>     qemu-system-arm -machine fby35-bmc \
>         -drive file=fby35.mtd,format=raw,if=mtd -nographic \
>         -netdev user,id=nic,mfr-id=0x8119,hostfwd=::2222-:22 \
>         -net nic,model=ftgmac100,netdev=nic
>     ...
>     username: root
>     password: 0penBmc
>     ...
>     root@bmc-oob:~# ncsi-util 0x15
>     NC-SI Command Response:
>     cmd: GET_VERSION_ID(0x15)
>     Response: COMMAND_COMPLETED(0x0000)  Reason: NO_ERROR(0x0000)
>     Payload length = 40
> 
>     20: 0xf1 0xf0 0xf0 0x00
>     24: 0x00 0x00 0x00 0x00
>     28: 0x00 0x00 0x00 0x00
>     32: 0x00 0x00 0x00 0x00
>     36: 0x00 0x00 0x00 0x00
>     40: 0x00 0x00 0x00 0x00
>     44: 0x00 0x00 0x00 0x00
>     48: 0x00 0x00 0x00 0x00
>     52: 0x00 0x00 0x81 0x19
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>  net/slirp.c   | 5 +++--
>  qapi/net.json | 5 ++++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/net/slirp.c b/net/slirp.c
> index 75e5ccafd9..231068c1e2 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -413,7 +413,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>                            const char *vnameserver, const char *vnameserver6,
>                            const char *smb_export, const char *vsmbserver,
>                            const char **dnssearch, const char *vdomainname,
> -                          const char *tftp_server_name,
> +                          const char *tftp_server_name, uint32_t mfr_id,
>                            Error **errp)
>  {
>      /* default settings according to historic slirp */
> @@ -636,6 +636,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
>      cfg.vnameserver6 = ip6_dns;
>      cfg.vdnssearch = dnssearch;
>      cfg.vdomainname = vdomainname;
> +    cfg.mfr_id = mfr_id;

You will need a #if to only include it with slirp 4.8.0 indeed.
Otherwise the mfr_id field won't exist.

In the #else part, it would probably useful to give the user at least a
warning that tells her to upgrade slirp to 4.8.0 to get the mfr_id
functionality working.

>      s->slirp = slirp_new(&cfg, &slirp_cb, s);
>      QTAILQ_INSERT_TAIL(&slirp_stacks, s, entry);
>  
> @@ -1172,7 +1173,7 @@ int net_init_slirp(const Netdev *netdev, const char *name,
>                           user->bootfile, user->dhcpstart,
>                           user->dns, user->ipv6_dns, user->smb,
>                           user->smbserver, dnssearch, user->domainname,
> -                         user->tftp_server_name, errp);
> +                         user->tftp_server_name, user->mfr_id, errp);
>  
>      while (slirp_configs) {
>          config = slirp_configs;
> diff --git a/qapi/net.json b/qapi/net.json
> index d6f7cfd4d6..efc5cb3fb6 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -167,6 +167,8 @@
>  #
>  # @tftp-server-name: RFC2132 "TFTP server name" string (Since 3.1)
>  #
> +# @mfr-id: Manufacturer ID (Private Enterprise Number: IANA)
> +#
>  # Since: 1.2
>  ##
>  { 'struct': 'NetdevUserOptions',
> @@ -192,7 +194,8 @@
>      '*smbserver': 'str',
>      '*hostfwd':   ['String'],
>      '*guestfwd':  ['String'],
> -    '*tftp-server-name': 'str' } }
> +    '*tftp-server-name': 'str',
> +    '*mfr-id': 'uint32' } }
>  
>  ##
>  # @NetdevTapOptions:
> -- 
> 2.30.2
> 

