Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E2368CD3
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 07:43:38 +0200 (CEST)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZobJ-000338-DP
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 01:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lZoaL-0002Zp-Oo
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 01:42:37 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58980
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lZoaH-0005aE-WE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 01:42:37 -0400
Received: from macbook02.fritz.box (p5b151e3b.dip0.t-ipconnect.de
 [91.21.30.59])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 9ABB4DA0FFF;
 Fri, 23 Apr 2021 07:42:28 +0200 (CEST)
To: Jason Wang <jasowang@redhat.com>, samuel.thibault@ens-lyon.org,
 qemu-devel@nongnu.org
References: <20210423031803.1479-1-jasowang@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH for 6.0] net: check the existence of peer before trying to
 pad
Message-ID: <45b74435-2bcd-d6f4-4ada-8d357bd33d4d@weilnetz.de>
Date: Fri, 23 Apr 2021 07:42:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210423031803.1479-1-jasowang@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: peter.maydell@linaro.org, bmeng.cn@gmail.com, philmd@redhat.com,
 crobinso@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.04.21 um 05:18 schrieb Jason Wang:

> There could be case that peer is NULL. This can happen when during
> network device hot-add where net device needs to be added first. So
> the patch check the existence of peer before trying to do the pad.
>
> Fixes: 969e50b61a285 ("net: Pad short frames to minimum size before sen=
ding from SLiRP/TAP")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>   include/net/net.h | 5 +++++
>   net/slirp.c       | 2 +-
>   net/tap-win32.c   | 2 +-
>   net/tap.c         | 2 +-
>   4 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index eff24519d2..1ef536d771 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -241,4 +241,9 @@ uint32_t net_crc32_le(const uint8_t *p, int len);
>       .offset     =3D vmstate_offset_macaddr(_state, _field),          =20
 \
>   }
>  =20
> +static inline bool net_peer_needs_padding(NetClientState *nc)
> +{
> +  return nc->peer && !nc->peer->do_not_pad;
> +}
> +
>   #endif
> diff --git a/net/slirp.c b/net/slirp.c
> index a01a0fccd3..7a4e96db5c 100644
> --- a/net/slirp.c
> +++ b/net/slirp.c
> @@ -119,7 +119,7 @@ static ssize_t net_slirp_send_packet(const void *pk=
t, size_t pkt_len,
>       uint8_t min_pkt[ETH_ZLEN];
>       size_t min_pktsz =3D sizeof(min_pkt);
>  =20
> -    if (!s->nc.peer->do_not_pad) {
> +    if (net_peer_needs_padding(&s->nc)) {
>           if (eth_pad_short_frame(min_pkt, &min_pktsz, pkt, pkt_len)) {=

>               pkt =3D min_pkt;
>               pkt_len =3D min_pktsz;
> diff --git a/net/tap-win32.c b/net/tap-win32.c
> index 897bd18e32..6096972f5d 100644
> --- a/net/tap-win32.c
> +++ b/net/tap-win32.c
> @@ -696,7 +696,7 @@ static void tap_win32_send(void *opaque)
>       if (size > 0) {
>           orig_buf =3D buf;
>  =20
> -        if (!s->nc.peer->do_not_pad) {
> +        if (net_peer_needs_padding(&s->nc)) {
>               if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) =
{
>                   buf =3D min_pkt;
>                   size =3D min_pktsz;
> diff --git a/net/tap.c b/net/tap.c
> index 7d53cedaec..820872fde8 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -203,7 +203,7 @@ static void tap_send(void *opaque)
>               size -=3D s->host_vnet_hdr_len;
>           }
>  =20
> -        if (!s->nc.peer->do_not_pad) {
> +        if (net_peer_needs_padding(&s->nc)) {
>               if (eth_pad_short_frame(min_pkt, &min_pktsz, buf, size)) =
{
>                   buf =3D min_pkt;
>                   size =3D min_pktsz;


I assume that you had a test case which triggered that null pointer=20
access? If yes, than this should indeed be applied before releasing 6.0.

The modification is simple enough for a last minute change.

Reviewed-by: Stefan Weil <sw@weilnetz.de>




