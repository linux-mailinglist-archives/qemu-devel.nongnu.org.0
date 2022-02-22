Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5F4BEFA5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 03:47:55 +0100 (CET)
Received: from localhost ([::1]:44578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMLDW-00007R-2n
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 21:47:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1nMLBq-0007nK-6z
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 21:46:10 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:4182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxinxin.wang@huawei.com>)
 id 1nMLBl-0003uW-JX
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 21:46:09 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4K2k3N17Z6z9s7b;
 Tue, 22 Feb 2022 10:42:24 +0800 (CST)
Received: from dggpeml100023.china.huawei.com (7.185.36.151) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 10:45:49 +0800
Received: from canpemm500006.china.huawei.com (7.192.105.130) by
 dggpeml100023.china.huawei.com (7.185.36.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 10:45:49 +0800
Received: from canpemm500006.china.huawei.com ([7.192.105.130]) by
 canpemm500006.china.huawei.com ([7.192.105.130]) with mapi id 15.01.2308.021; 
 Tue, 22 Feb 2022 10:45:49 +0800
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "dgilbert@redhat.com" <dgilbert@redhat.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "Huangweidong (C)" <weidong.huang@huawei.com>,
 zhaihuanyu <zhaihuanyu@huawei.com>
Subject: RE: [PATCH] multifd: ensure multifd threads are terminated before
 cleanup params
Thread-Topic: [PATCH] multifd: ensure multifd threads are terminated before
 cleanup params
Thread-Index: AQHYIBGCWsTkOTsUOkm6vQwR6td196ye7C7w
Date: Tue, 22 Feb 2022 02:45:48 +0000
Message-ID: <6a046f02114f4c0383e92deece109b2c@huawei.com>
References: <20220212130735.3236-1-wangxinxin.wang@huawei.com>
In-Reply-To: <20220212130735.3236-1-wangxinxin.wang@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.151.225]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangxinxin.wang@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-to:  "Wangxin (Alexander)" <wangxinxin.wang@huawei.com>
From:  "Wangxin (Alexander)" via <qemu-devel@nongnu.org>

Ping.

>=20
> In multifd_save_cleanup(), we terminate all multifd threads and destroy
> the 'p->mutex', while the mutex may still be held by multifd send thread,
> this causes qemu to crash.
>=20
> It's because the multifd_send_thread maybe scheduled out after setting
> 'p->running' to false. To reproduce the problem, we put
> 'multifd_send_thread' to sleep seconds before unlock 'p->mutex':
>=20
> function multifd_send_thread()
> {
>     ...
>     qemu_mutex_lock(&p->mutex);
>     p->running =3D false;
>     usleep(5000000);
>     ^^^^^^^^^^^^^^^^
>     qemu_mutex_unlock(&p->mutex);
>     ...
> }
>=20
> As the 'p->running' is used to indicate whether the multifd_send/recv thr=
ead
> is created, it should be set to false after the thread terminate.
>=20
> Signed-off-by: Wang Xin <wangxinxin.wang@huawei.com>
> Signed-off-by: Huangyu Zhai <zhaihuanyu@huawei.com>
>=20
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 76b57a7177..d8fc7d319e 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -526,6 +526,7 @@ void multifd_save_cleanup(void)
>=20
>          if (p->running) {
>              qemu_thread_join(&p->thread);
> +            p->running =3D false;
>          }
>      }
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
> @@ -707,10 +708,6 @@ out:
>          qemu_sem_post(&multifd_send_state->channels_ready);
>      }
>=20
> -    qemu_mutex_lock(&p->mutex);
> -    p->running =3D false;
> -    qemu_mutex_unlock(&p->mutex);
> -
>      rcu_unregister_thread();
>      trace_multifd_send_thread_end(p->id, p->num_packets, p->total_normal=
_pages);
>=20
> @@ -995,6 +992,7 @@ int multifd_load_cleanup(Error **errp)
>               */
>              qemu_sem_post(&p->sem_sync);
>              qemu_thread_join(&p->thread);
> +            p->running =3D false;
>          }
>      }
>      for (i =3D 0; i < migrate_multifd_channels(); i++) {
> @@ -1110,9 +1108,6 @@ static void *multifd_recv_thread(void *opaque)
>          multifd_recv_terminate_threads(local_err);
>          error_free(local_err);
>      }
> -    qemu_mutex_lock(&p->mutex);
> -    p->running =3D false;
> -    qemu_mutex_unlock(&p->mutex);
>=20
>      rcu_unregister_thread();
>      trace_multifd_recv_thread_end(p->id, p->num_packets, p->total_normal=
_pages);
> --
> 2.26.0.windows.1


