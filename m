Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D721B957F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 05:34:19 +0200 (CEST)
Received: from localhost ([::1]:51736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSuXC-0000RO-6P
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 23:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jSuWC-0007h5-KX
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 23:33:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jSuWA-0000aB-M9
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 23:33:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34710
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1jSuWA-0000Zu-9a
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 23:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587958392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQhMgqE/TwLK7AYDehS9kGM8d+jlTvEPaZZJMDUVlYE=;
 b=O+7qmGlm9cVQnuCQt1qZTOoiHUbtqcUhFqwkFroOVQIQLi9FfffneFZHCHAa0IaqpzsQpQ
 ISi+j4au5iPZbT+wYdmv9nAQJSBlK9Eowxt8nJyG8JV59aNsLuWrccFQ8xtrCEUgQVNwRs
 m+LEtAQBIvBmn73Exi2apW0+zn39QAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-9lErbtlJNaa57U_04xHcVA-1; Sun, 26 Apr 2020 23:33:07 -0400
X-MC-Unique: 9lErbtlJNaa57U_04xHcVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1368E835B40;
 Mon, 27 Apr 2020 03:33:06 +0000 (UTC)
Received: from [10.72.12.205] (ovpn-12-205.pek2.redhat.com [10.72.12.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5DAA19C4F;
 Mon, 27 Apr 2020 03:33:03 +0000 (UTC)
Subject: Re: [PATCH v2] Fix tulip breakage
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20200426105539.GA12684@ls3530.fritz.box>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <51ba14d8-6017-0381-e086-3982bf3f180f@redhat.com>
Date: Mon, 27 Apr 2020 11:33:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200426105539.GA12684@ls3530.fritz.box>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:33:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/4/26 =E4=B8=8B=E5=8D=886:55, Helge Deller wrote:
> The tulip network driver in a qemu-system-hppa emulation is broken in
> the sense that bigger network packages aren't received any longer and
> thus even running e.g. "apt update" inside the VM fails.
>
> The breakage was introduced by commit 8ffb7265af ("check frame size and
> r/w data length") which added checks to prevent accesses outside of the
> rx/tx buffers.
>
> But the new checks were implemented wrong. The variable rx_frame_len
> counts backwards, from rx_frame_size down to zero, and the variable len
> is never bigger than rx_frame_len, so accesses just can't happen and the
> checks are unnecessary.
> On the contrary the checks now prevented bigger packages to be moved
> into the rx buffers.
>
> This patch reverts the wrong checks and were sucessfully tested with a
> qemu-system-hppa emulation.
>
> Fixes: 8ffb7265af ("check frame size and r/w data length")
> Buglink: https://bugs.launchpad.net/bugs/1874539
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> ---
> changes v2 to v1:
>      - renamed patch title
>      - rephrased commit message
>      - no changes to patch itself
>
> diff --git a/hw/net/tulip.c b/hw/net/tulip.c
> index 1295f51d07..59d21defcc 100644
> --- a/hw/net/tulip.c
> +++ b/hw/net/tulip.c
> @@ -171,9 +171,6 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct=
 tulip_descriptor *desc)
>               len =3D s->rx_frame_len;
>           }
>
> -        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
> -            return;
> -        }
>           pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
>               (s->rx_frame_size - s->rx_frame_len), len);
>           s->rx_frame_len -=3D len;
> @@ -186,9 +183,6 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct=
 tulip_descriptor *desc)
>               len =3D s->rx_frame_len;
>           }
>
> -        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
> -            return;
> -        }
>           pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
>               (s->rx_frame_size - s->rx_frame_len), len);
>           s->rx_frame_len -=3D len;


Queued for 5.1 and stable.

Thanks



