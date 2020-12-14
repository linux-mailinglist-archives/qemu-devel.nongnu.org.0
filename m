Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FDC2D9204
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 04:14:51 +0100 (CET)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koeK0-00019O-Ug
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 22:14:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1koeIZ-0000bm-JZ; Sun, 13 Dec 2020 22:13:21 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:2061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1koeIW-0007cc-6E; Sun, 13 Dec 2020 22:13:19 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CvRJw6vl0zQrlC;
 Mon, 14 Dec 2020 11:12:32 +0800 (CST)
Received: from DGGEMM531-MBX.china.huawei.com ([169.254.5.125]) by
 DGGEMM405-HUB.china.huawei.com ([10.3.20.213]) with mapi id 14.03.0509.000;
 Mon, 14 Dec 2020 11:12:56 +0800
From: "Chenqun (kuhn)" <kuhn.chenqun@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
 <qemu-trivial@nongnu.org>, Zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 Juan Quintela <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
Subject: RE: [PATCH RESEND v2 5/7] migration/colo: Plug memleaks in
 colo_process_incoming_thread
Thread-Topic: [PATCH RESEND v2 5/7] migration/colo: Plug memleaks in
 colo_process_incoming_thread
Thread-Index: AQHWqQOGfZOHBWTy90K69ob0Zezqnan2L/LA
Date: Mon, 14 Dec 2020 03:12:55 +0000
Message-ID: <7412CDE03601674DA8197E2EBD8937E83BB06ED5@dggemm531-mbx.china.huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
 <20201023061218.2080844-6-kuhn.chenqun@huawei.com>
In-Reply-To: <20201023061218.2080844-6-kuhn.chenqun@huawei.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.185.149]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga02-in.huawei.com
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
Cc: "lvivier@redhat.com" <lvivier@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Pannengyuan <pannengyuan@huawei.com>, ganqixin <ganqixin@huawei.com>,
 Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kindly ping!

Hi all,
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
> <liq3ea@gmail.com>; Chenqun (kuhn) <kuhn.chenqun@huawei.com>; Juan
> Quintela <quintela@redhat.com>; Dr. David Alan Gilbert
> <dgilbert@redhat.com>
> Subject: [PATCH RESEND v2 5/7] migration/colo: Plug memleaks in
> colo_process_incoming_thread
>=20
> From: Pan Nengyuan <pannengyuan@huawei.com>
>=20
> 'local_err' forgot to free in colo_process_incoming_thread error path.
> Fix that.
>=20
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> Reviewed-by: Li Qiang <liq3ea@gmail.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
> ---
> Cc: Hailiang Zhang <zhang.zhanghailiang@huawei.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> ---
>  migration/colo.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index 3f1d3dfd95..7cc5a3=
7192
> 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -886,7 +886,6 @@ void *colo_process_incoming_thread(void *opaque)
>      while (mis->state =3D=3D MIGRATION_STATUS_COLO) {
>          colo_wait_handle_message(mis, fb, bioc, &local_err);
>          if (local_err) {
> -            error_report_err(local_err);
>              break;
>          }
>=20
> @@ -922,6 +921,10 @@ out:
>          qemu_fclose(fb);
>      }
>=20
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +
>      /* Hope this not to be too long to loop here */
>      qemu_sem_wait(&mis->colo_incoming_sem);
>      qemu_sem_destroy(&mis->colo_incoming_sem);
> --
> 2.23.0


