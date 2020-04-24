Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266691B6B3A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 04:18:14 +0200 (CEST)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRnuu-0003rz-Ko
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 22:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jRntu-0003J5-Ki
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:17:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jRntj-0006A7-4Z
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:17:09 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24327
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jRnti-000661-HO
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 22:16:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587694616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W8lAeN7Rr7wgJsaU3vN4NIXFJYvkUXhUjTTMCF0JGn4=;
 b=P5Xeqkf3Uk9E39UhJxCCesEcHDVb0LnJ6/tcooT/fG2Jb4Ox6F+aRpnVkKPKUv0zv6EPvQ
 a+H9keDcYuMKgj8QiQlcqz2z2YxtJ/nQx4a4PDWDZ4MZcZJstuVuV+ec7M6ScaL3hfADQl
 y6+oWXAeuIDkPe67UbZ6TdHkl/a9Jvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-OuD7KeDpOhGBQzO11KeefA-1; Thu, 23 Apr 2020 22:16:50 -0400
X-MC-Unique: OuD7KeDpOhGBQzO11KeefA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58EE41800D6B;
 Fri, 24 Apr 2020 02:16:48 +0000 (UTC)
Received: from [10.72.13.199] (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85D8D1002388;
 Fri, 24 Apr 2020 02:16:44 +0000 (UTC)
Subject: Re: [RFC PATCH 3/3] hw/net/tulip: Set descriptor error bit when
 lenght is incorrect
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200423231644.15786-1-f4bug@amsat.org>
 <20200423231644.15786-4-f4bug@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <606d1218-79ce-3fd5-5400-1a5ece8f183f@redhat.com>
Date: Fri, 24 Apr 2020 10:16:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200423231644.15786-4-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 22:16:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Helge Deller <deller@gmx.de>,
 Li Qiang <liq3ea@gmail.com>, Li Qiang <pangpei.lq@antfin.com>,
 Sven Schnelle <svens@stackframe.org>, Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/24 =E4=B8=8A=E5=8D=887:16, Philippe Mathieu-Daud=C3=A9 wrote:
> When a frame lenght is incorrect, set the RDES0 'Error Summary'
> and 'Frame too long' bits. Then stop the receive process and
> trigger an abnormal interrupt. See [4.3.5 Receive Process].
>
> Cc: Li Qiang <liq3ea@gmail.com>
> Cc: Li Qiang <pangpei.lq@antfin.com>
> Cc: Ziming Zhang <ezrakiez@gmail.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Prasad J Pandit <pjp@fedoraproject.org>
> Fixes: 8ffb7265af ("check frame size and r/w data length")
> Buglink: https://bugs.launchpad.net/bugs/1874539
> Reported-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>


Hi Philippe:

It's still unclear to me that how this fixes the stuck. Did you mean=20
guest trigger the error condition and then recvoer by abnormal interrupt?

If yes, this sounds still like a bug somewhere in the code.

Thanks


> ---
>   hw/net/tulip.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 470f635acb..671f79b6f4 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -158,7 +158,7 @@ static void tulip_next_rx_descriptor(TULIPState *s,
>       s->current_rx_desc &=3D ~3ULL;
>   }
>  =20
> -static void tulip_copy_rx_bytes(TULIPState *s, struct tulip_descriptor *=
desc)
> +static int tulip_copy_rx_bytes(TULIPState *s, struct tulip_descriptor *d=
esc)
>   {
>       int len1 =3D (desc->control >> RDES1_BUF1_SIZE_SHIFT) & RDES1_BUF1_=
SIZE_MASK;
>       int len2 =3D (desc->control >> RDES1_BUF2_SIZE_SHIFT) & RDES1_BUF2_=
SIZE_MASK;
> @@ -177,7 +177,8 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct=
 tulip_descriptor *desc)
>                             "(ofs: %u, len:%d, size:%zu)\n",
>                             __func__, s->rx_frame_len, len,
>                             sizeof(s->rx_frame));
> -            return;
> +            s->rx_frame_len =3D 0;
> +            return -1;
>           }
>           pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
>               (s->rx_frame_size - s->rx_frame_len), len);
> @@ -197,12 +198,15 @@ static void tulip_copy_rx_bytes(TULIPState *s, stru=
ct tulip_descriptor *desc)
>                             "(ofs: %u, len:%d, size:%zu)\n",
>                             __func__, s->rx_frame_len, len,
>                             sizeof(s->rx_frame));
> -            return;
> +            s->rx_frame_len =3D 0;
> +            return -1;
>           }
>           pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
>               (s->rx_frame_size - s->rx_frame_len), len);
>           s->rx_frame_len -=3D len;
>       }
> +
> +    return 0;
>   }
>  =20
>   static bool tulip_filter_address(TULIPState *s, const uint8_t *addr)
> @@ -274,7 +278,11 @@ static ssize_t tulip_receive(TULIPState *s, const ui=
nt8_t *buf, size_t size)
>               s->rx_frame_len =3D s->rx_frame_size;
>           }
>  =20
> -        tulip_copy_rx_bytes(s, &desc);
> +        if (tulip_copy_rx_bytes(s, &desc)) {
> +            desc.status |=3D RDES0_ES | RDES0_TL; /* Error: frame too lo=
ng */
> +            s->csr[5] |=3D CSR5_RPS; /* Receive process stopped */
> +            tulip_update_int(s);
> +        }
>  =20
>           if (!s->rx_frame_len) {
>               desc.status |=3D s->rx_status;


