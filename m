Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F8865317D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:15:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ypg-00018K-36; Wed, 21 Dec 2022 08:08:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7ypa-00016N-Nw
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:08:23 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7ypZ-0004fU-0T
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:08:22 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 411DACED12;
 Wed, 21 Dec 2022 14:08:16 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [RFC v2 10/10] libvduse: Fix assignment in vring_set_avail_event
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CACycT3vYU11RwEGK9m3SndeQPRPU0a=V_ujK4SUVe+kjUH=ASA@mail.gmail.com>
Date: Wed, 21 Dec 2022 14:08:15 +0100
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2704927D-ED7F-412A-B93A-DE9C9546ADF7@holtmann.org>
References: <cover.1671563795.git.marcel@holtmann.org>
 <743f1c04347de12e7e94360eed74a8dbdcff6477.1671563795.git.marcel@holtmann.org>
 <CACycT3vYU11RwEGK9m3SndeQPRPU0a=V_ujK4SUVe+kjUH=ASA@mail.gmail.com>
To: Yongji Xie <xieyongji@bytedance.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Yongji,

>>  CC       libvduse.o
>> libvduse.c: In function =E2=80=98vring_set_avail_event=E2=80=99:
>> libvduse.c:603:7: error: dereferencing type-punned pointer will break =
strict-aliasing rules [-Werror=3Dstrict-aliasin]
>>  603 |     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D =
htole16(val);
>>      |      ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>=20
>> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
>> ---
>> subprojects/libvduse/libvduse.c | 5 ++++-
>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/subprojects/libvduse/libvduse.c =
b/subprojects/libvduse/libvduse.c
>> index 338ad5e352e7..51a4ba1b6878 100644
>> --- a/subprojects/libvduse/libvduse.c
>> +++ b/subprojects/libvduse/libvduse.c
>> @@ -582,7 +582,10 @@ void vduse_queue_notify(VduseVirtq *vq)
>>=20
>> static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t =
val)
>> {
>> -    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) =3D =
htole16(val);
>> +    vring_used_elem_t *ring =3D =
&vq->vring.used->ring[vq->vring.num];
>> +
>> +    /* FIXME: Is this actually correct since this is __virtio32 id; =
*/
>> +    ring->id =3D htole16(val);
>> }
>=20
> Can we do it as libvhost-user does=EF=BC=9F
>=20
> static inline void
> vring_set_avail_event(VuVirtq *vq, uint16_t val)
> {
>    uint16_t *avail;
>=20
>    avail =3D (uint16_t *)&vq->vring.used->ring[vq->vring.num];
>    *avail =3D htole16(val);
> }

that will also work. Sending a v3 in a few moments.

Regards

Marcel


