Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2D2D91A7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 03:06:19 +0100 (CET)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kodFi-0005pa-5I
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 21:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kodER-0005IU-KT; Sun, 13 Dec 2020 21:04:59 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kodEO-0000OI-Q7; Sun, 13 Dec 2020 21:04:59 -0500
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4CvPnQ619yz13TXF;
 Mon, 14 Dec 2020 10:03:38 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.125]) by
 DGGEMM401-HUB.china.huawei.com ([10.3.20.209]) with mapi id 14.03.0509.000;
 Mon, 14 Dec 2020 10:04:28 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Michael Roth <mdroth@linux.vnet.ibm.com>
Subject: RE: [PATCH RESEND v2 2/7] qga/channel-posix: Plug memory leak in
 ga_channel_write_all()
Thread-Topic: [PATCH RESEND v2 2/7] qga/channel-posix: Plug memory leak in
 ga_channel_write_all()
Thread-Index: AQHWqQODDn5EOG2xVkK8bT0+Bd9UP6n2JZew
Date: Mon, 14 Dec 2020 02:04:28 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BB04DE9@dggemm531-mbx.china.huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-3-kuhn.chenqun@huawei.com>
In-Reply-To: <20201023061218.2080844-3-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Pannengyuan <pannengyuan@huawei.com>, Li
 Qiang <liq3ea@gmail.com>, ganqixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping!

Hi Michael,
  It's a bug, though it's trivial.=20
Could you review it and add your queues or add trivial queues?

Thanks,
Chen Qun

> -----Original Message-----
> From: Chenqun (kuhn)
> Sent: Friday, October 23, 2020 2:12 PM
> To: qemu-devel@nongnu.org; qemu-trivial@nongnu.org
> Cc: Pannengyuan <pannengyuan@huawei.com>; lvivier@redhat.com;
> Zhanghailiang <zhang.zhanghailiang@huawei.com>; ganqixin
> <ganqixin@huawei.com>; Euler Robot <euler.robot@huawei.com>; Li Qiang
> <liq3ea@gmail.com>; Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Michael
> Roth <mdroth@linux.vnet.ibm.com>
> Subject: [PATCH RESEND v2 2/7] qga/channel-posix: Plug memory leak in
> ga_channel_write_all()
>=20
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> Missing g_error_free on error path in ga_channel_write_all(). Fix that.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Michael Roth <mdroth@linux.vnet.ibm.com>
> ---
>  qga/channel-posix.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/qga/channel-posix.c b/qga/channel-posix.c index
> 0373975360..8f3821af6d 100644
> --- a/qga/channel-posix.c
> +++ b/qga/channel-posix.c
> @@ -249,7 +249,7 @@ GIOStatus ga_channel_write_all(GAChannel *c, const
> gchar *buf, gsize size)
>              buf +=3D written;
>          } else if (status !=3D G_IO_STATUS_AGAIN) {
>              g_warning("error writing to channel: %s", err->message);
> -            return status;
> +            goto out;
>          }
>      }
>=20
> @@ -261,6 +261,10 @@ GIOStatus ga_channel_write_all(GAChannel *c,
> const gchar *buf, gsize size)
>          g_warning("error flushing channel: %s", err->message);
>      }
>=20
> +out:
> +    if (err) {
> +        g_error_free(err);
> +    }
>      return status;
>  }
>=20
> --
> 2.23.0


