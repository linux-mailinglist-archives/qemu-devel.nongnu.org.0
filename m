Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E6D18F2D0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 11:29:55 +0100 (CET)
Received: from localhost ([::1]:59878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGKLC-0004Lj-7V
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 06:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1jGKKK-0003wt-Nr
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:29:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1jGKKJ-00045E-QH
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:29:00 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:30991)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1jGKKJ-00044s-MN
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 06:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584959338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uXZ+XAKwCi3tTOLv9A7nu/l6secYFD7icP6HN2DCu7o=;
 b=iN5osEg+W10xHke1E0uU//bIOKXcXO3C6BVlmocH4hZ9teSeZJDclI6rlbNnwmLBTYtKQr
 88YbEUzjzYO0MLB78tJGapUM3CHJBDUmQN9iLKTVifOkEqTVZBHl6rCXsLoBiCmnTlNa1p
 ccFVVKC6FCXWVJDGsaoG+XADKkxL3wc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-uEnT6JNMMFKOanundC7Slw-1; Mon, 23 Mar 2020 06:28:55 -0400
X-MC-Unique: uEnT6JNMMFKOanundC7Slw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C99538017CC;
 Mon, 23 Mar 2020 10:28:53 +0000 (UTC)
Received: from [10.72.12.124] (ovpn-12-124.pek2.redhat.com [10.72.12.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E107E1036D00;
 Mon, 23 Mar 2020 10:28:50 +0000 (UTC)
Subject: Re: [PATCH v5 0/3] net: tulip: add checks to avoid OOB access
To: P J P <ppandit@redhat.com>
References: <20200319174050.759794-1-ppandit@redhat.com>
 <20f29d89-6d52-2edc-ef7e-13124908256a@redhat.com>
 <26c0091a-89f1-c956-efba-d1b2e4a13d76@redhat.com>
 <nycvar.YSQ.7.76.2003231008390.5086@xnncv>
 <nycvar.YSQ.7.76.2003231056520.5086@xnncv>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <739d25c4-4fd7-2650-a236-902eed1a6eed@redhat.com>
Date: Mon, 23 Mar 2020 18:28:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.2003231056520.5086@xnncv>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Sven Schnelle <svens@stackframe.org>,
 Qemu Developers <qemu-devel@nongnu.org>, Li Qiang <pangpei.lq@antfin.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ziming Zhang <ezrakiez@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/3/23 =E4=B8=8B=E5=8D=881:40, P J P wrote:
> +-- On Mon, 23 Mar 2020, P J P wrote --+
> | +-- On Mon, 23 Mar 2020, Jason Wang wrote --+
> | | hw/net/tulip.c:305:20: error: initialization of =E2=80=98_Bool (*)(Ne=
tClientState *)=E2=80=99
> | | {aka =E2=80=98_Bool (*)(struct NetClientState *)=E2=80=99} from incom=
patible pointer type =E2=80=98int
> | | (*)(NetClientState *)=E2=80=99 {aka =E2=80=98int (*)(struct NetClient=
State *)=E2=80=99}
> | | [-Werror=3Dincompatible-pointer-types]
> | | =C2=A0=C2=A0=C2=A0=C2=A0 .can_receive =3D tulip_can_receive,
> | | =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~
> |
> | Strange, I did not get it.
>
> qemu/include/net.h:
>
>    typedef int (NetCanReceive)(NetClientState *);
>
>    typedef struct NetClientInfo {
>      ...
>      NetCanReceive *can_receive;
>      ...
>    }
>
> @Jason,
>    Looking at the definition above, 'NetCanReceive' is returning an 'int'=
 type.
> When I change 'tulip_can_receive' to return a 'bool', I get the reverse e=
rror
>
> hw/net/tulip.c:305:20: error: initialization of =E2=80=98int (*)(NetClien=
tState *)=E2=80=99 {aka =E2=80=98int (*)(struct NetClientState *)=E2=80=99}=
 from incompatible pointer type =E2=80=98_Bool (*)(NetClientState *)=E2=80=
=99 {aka =E2=80=98_Bool (*)(struct NetClientState *)=E2=80=99}
> [-Werror=3Dincompatible-pointer-types]
>    305 |     .can_receive =3D tulip_can_receive,
>        |                    ^~~~~~~~~~~~~~~~~
>
> Maybe because of a stagged local change in your tree? (to confirm)


Right, it's the conversion from int to bool done by Philippe :)

I will fix the conflict after Qiang tests it.

Thanks


>
> Thank you.
> --
> Prasad J Pandit / Red Hat Product Security Team
> 8685 545E B54C 486B C6EB 271E E285 8B5A F050 DE8D


