Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9EB1EB613
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 09:00:34 +0200 (CEST)
Received: from localhost ([::1]:60272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg0uX-00016i-7X
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 03:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhang.zhanghailiang@huawei.com>)
 id 1jg0tZ-0000d0-0z
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 02:59:33 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:45996 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhang.zhanghailiang@huawei.com>)
 id 1jg0tX-0007qQ-Gl
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 02:59:32 -0400
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id E3ED69D7B11259E6FCEC;
 Tue,  2 Jun 2020 14:59:24 +0800 (CST)
Received: from dggeme708-chm.china.huawei.com (10.1.199.104) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 2 Jun 2020 14:59:16 +0800
Received: from dggeme756-chm.china.huawei.com (10.3.19.102) by
 dggeme708-chm.china.huawei.com (10.1.199.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 2 Jun 2020 14:59:16 +0800
Received: from dggeme756-chm.china.huawei.com ([10.6.80.68]) by
 dggeme756-chm.china.huawei.com ([10.6.80.68]) with mapi id 15.01.1913.007;
 Tue, 2 Jun 2020 14:59:16 +0800
From: Zhanghailiang <zhang.zhanghailiang@huawei.com>
To: Zhang Chen <chen.zhang@intel.com>, "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>, Juan Quintela <quintela@redhat.com>, qemu-dev
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 3/3] migration/colo: Merge multi checkpoint request into
 one.
Thread-Topic: [PATCH 3/3] migration/colo: Merge multi checkpoint request into
 one.
Thread-Index: AQHWKnK/yUUVTef7UEqWweUf3ZnClajFADCw
Date: Tue, 2 Jun 2020 06:59:16 +0000
Message-ID: <359be3274bdf4f0e87c6c45cdc05ae90@huawei.com>
References: <20200515042818.17908-1-chen.zhang@intel.com>
 <20200515042818.17908-4-chen.zhang@intel.com>
In-Reply-To: <20200515042818.17908-4-chen.zhang@intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.173.220.30]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=zhang.zhanghailiang@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 02:20:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Jason Wang <jasowang@redhat.com>, Zhang Chen <zhangckid@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Zhang Chen [mailto:chen.zhang@intel.com]
> Sent: Friday, May 15, 2020 12:28 PM
> To: Dr . David Alan Gilbert <dgilbert@redhat.com>; Juan Quintela
> <quintela@redhat.com>; Zhanghailiang <zhang.zhanghailiang@huawei.com>;
> qemu-dev <qemu-devel@nongnu.org>
> Cc: Zhang Chen <zhangckid@gmail.com>; Jason Wang
> <jasowang@redhat.com>; Zhang Chen <chen.zhang@intel.com>
> Subject: [PATCH 3/3] migration/colo: Merge multi checkpoint request into
> one.
>=20
> From: Zhang Chen <chen.zhang@intel.com>
>=20
> When COLO guest occur issues, COLO-compare will catch lots of different
> network packet and trigger notification multi times, force periodic may
> happen at the same time. So this can be efficient merge checkpoint reques=
t
> within COLO_CHECKPOINT_INTERVAL.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  migration/colo.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index
> d5bced22cb..e6a7d8c6e2 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -47,6 +47,9 @@ static COLOMode last_colo_mode;
>=20
>  #define COLO_BUFFER_BASE_SIZE (4 * 1024 * 1024)
>=20
> +/* Default COLO_CHECKPOINT_INTERVAL is 1000 ms */ #define
> +COLO_CHECKPOINT_INTERVAL 1000
> +
>  bool migration_in_colo_state(void)
>  {
>      MigrationState *s =3D migrate_get_current(); @@ -651,13 +654,20 @@
> out:
>  void colo_checkpoint_notify(void *opaque)  {
>      MigrationState *s =3D opaque;
> -    int64_t next_notify_time;
> +    int64_t now =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
>=20
> -    qemu_sem_post(&s->colo_checkpoint_sem);
> -    s->colo_checkpoint_time =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
> -    next_notify_time =3D s->colo_checkpoint_time +
> -                    s->parameters.x_checkpoint_delay;
> -    timer_mod(s->colo_delay_timer, next_notify_time);
> +    /*
> +     * When COLO guest occur issues, COLO-compare will catch lots of
> +     * different network packet and trigger notification multi times,
> +     * force periodic may happen at the same time. So this can be
> +     * efficient merge checkpoint request within
> COLO_CHECKPOINT_INTERVAL.
> +     */
> +    if (now > s->colo_checkpoint_time + COLO_CHECKPOINT_INTERVAL) {
> +        qemu_sem_post(&s->colo_checkpoint_sem);

It is not right here, this notification should not be controlled by the int=
erval time,
I got what happened here, when multiple checkpoint requires come, this
Colo_delay_time will be added every time and it will be a big value which i=
s not what we want.

Besides, please update this patch based on [PATCH 0/6] colo: migration rela=
ted bugfixes series which
Has modified the same place.



> +        timer_mod(s->colo_delay_timer, now +
> +                  s->parameters.x_checkpoint_delay);
> +        s->colo_checkpoint_time =3D now;
> +    }
>  }
>=20
>  void migrate_start_colo_process(MigrationState *s)
> --
> 2.17.1


