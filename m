Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64420BD70A
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 06:17:09 +0200 (CEST)
Received: from localhost ([::1]:45236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCyjk-0005h4-1z
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 00:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1iCyhi-0004na-Su
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 00:15:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1iCyhe-0001KH-9E
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 00:15:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1iCyhe-0001Jf-3S
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 00:14:58 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B46F18C4290;
 Wed, 25 Sep 2019 04:14:56 +0000 (UTC)
Received: from [10.72.12.148] (ovpn-12-148.pek2.redhat.com [10.72.12.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2ADE5D9CC;
 Wed, 25 Sep 2019 04:14:52 +0000 (UTC)
Subject: Re: [PATCH v3] vhost-user: save features if the char dev is closed
To: Adrian Moreno <amorenoz@redhat.com>, qemu-devel@nongnu.org
References: <20190924162044.11414-1-amorenoz@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d4b87491-00da-09ae-ef14-56c3337f530c@redhat.com>
Date: Wed, 25 Sep 2019 12:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924162044.11414-1-amorenoz@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 25 Sep 2019 04:14:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ddstreet@canonical.com, Pei Zhang <pezhang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/9/25 =E4=B8=8A=E5=8D=8812:20, Adrian Moreno wrote:
> That way the state can be correctly restored when the device is opened
> again. This might happen if the backend is restarted.
>
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1738768
> Reported-by: Pei Zhang <pezhang@redhat.com>
> Fixes: 6ab79a20af3a (do not call vhost_net_cleanup() on running net fro=
m char user event)
> Cc: ddstreet@canonical.com
> Cc: Michael S. Tsirkin <mst@redhat.com>
>
> Signed-off-by: Adrian Moreno <amorenoz@redhat.com>
> ---
>  net/vhost-user.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/net/vhost-user.c b/net/vhost-user.c
> index 51921de443..014199d600 100644
> --- a/net/vhost-user.c
> +++ b/net/vhost-user.c
> @@ -235,6 +235,10 @@ static void chr_closed_bh(void *opaque)
> =20
>      s =3D DO_UPCAST(NetVhostUserState, nc, ncs[0]);
> =20
> +    if (s->vhost_net) {
> +        s->acked_features =3D vhost_net_get_acked_features(s->vhost_ne=
t);
> +    }
> +
>      qmp_set_link(name, false, &err);
> =20
>      qemu_chr_fe_set_handlers(&s->chr, NULL, NULL, net_vhost_user_event=
,


Acked-by: Jason Wang <jasowang@redhat.com>



