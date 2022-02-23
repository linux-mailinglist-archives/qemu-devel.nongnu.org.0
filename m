Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3914C10AD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:48:10 +0100 (CET)
Received: from localhost ([::1]:37098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpBn-0006V2-KD
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMori-000571-Sg
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:27:23 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1nMorf-0006qF-JO
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 05:27:22 -0500
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4K3XHv3kZFzcmvt;
 Wed, 23 Feb 2022 18:26:03 +0800 (CST)
Received: from dggpeml100015.china.huawei.com (7.185.36.168) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 18:27:15 +0800
Received: from dggpeml100016.china.huawei.com (7.185.36.216) by
 dggpeml100015.china.huawei.com (7.185.36.168) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 18:27:15 +0800
Received: from dggpeml100016.china.huawei.com ([7.185.36.216]) by
 dggpeml100016.china.huawei.com ([7.185.36.216]) with mapi id 15.01.2308.021;
 Wed, 23 Feb 2022 18:27:15 +0800
To: Paolo Bonzini <pbonzini@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] thread-posix: optimize qemu_sem_timedwait with zero
 timeout
Thread-Topic: [PATCH] thread-posix: optimize qemu_sem_timedwait with zero
 timeout
Thread-Index: AQHYKJB3N0CGBKbxVU6HuNeLjZ3ej6yg7kKA
Date: Wed, 23 Feb 2022 10:27:15 +0000
Message-ID: <c6dfa9c045a746eeac77f28f71992bbc@huawei.com>
References: <20220223083628.231589-1-pbonzini@redhat.com>
In-Reply-To: <20220223083628.231589-1-pbonzini@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.148.223]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=longpeng2@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Paolo Bonzini [mailto:paolo.bonzini@gmail.com] On Behalf Of Paolo B=
onzini
> Sent: Wednesday, February 23, 2022 4:36 PM
> To: qemu-devel@nongnu.org
> Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Subject: [PATCH] thread-posix: optimize qemu_sem_timedwait with zero time=
out
>=20
> In this case there is no need to call pthread_cond_timedwait; the
> function is just a trywait and waiting on the condition variable would
> always time out.
>=20
> Based-on: <20220222090507.2028-1-longpeng2@huawei.com>
> Cc: "Longpeng(Mike)" <longpeng2@huawei.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  util/qemu-thread-posix.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/util/qemu-thread-posix.c b/util/qemu-thread-posix.c
> index f2ce47d36b..89c23f1d64 100644
> --- a/util/qemu-thread-posix.c
> +++ b/util/qemu-thread-posix.c
> @@ -282,8 +282,12 @@ int qemu_sem_timedwait(QemuSemaphore *sem, int ms)
>      compute_abs_deadline(&ts, ms);
>      qemu_mutex_lock(&sem->mutex);
>      while (sem->count =3D=3D 0) {
> -        rc =3D qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
> -                                    __FILE__, __LINE__);
> +        if (ms =3D=3D 0) {
> +            rc =3D false;
> +        } else {
> +            rc =3D qemu_cond_timedwait_ts(&sem->cond, &sem->mutex, &ts,
> +                                        __FILE__, __LINE__);
> +        }
>          if (!rc) { /* timeout */
>              break;
>          }
> --
> 2.34.1

Reviewed-by: Longpeng <longpeng2@huawei.com>

Thanks.

