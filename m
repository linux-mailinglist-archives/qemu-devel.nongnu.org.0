Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B64865151C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 22:53:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7O3Z-0008I1-Gu; Mon, 19 Dec 2022 16:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7LL9-0000MX-E4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:58:19 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7LL7-0005sT-IY
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 13:58:19 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 79999CECF6;
 Mon, 19 Dec 2022 19:58:08 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 7/7] libvhost-user: Switch to unsigned int for inuse field
 in struct VuVirtq
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <ca6542ba-87de-36de-0e73-173ec421ac58@linaro.org>
Date: Mon, 19 Dec 2022 19:58:07 +0100
Cc: qemu-devel@nongnu.org, mst@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 =?utf-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0063A3C6-2B6D-4964-9427-5FA6FAD110F6@holtmann.org>
References: <20221219175337.377435-8-marcel@holtmann.org>
 <ca6542ba-87de-36de-0e73-173ec421ac58@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
Received-SPF: pass client-ip=212.227.132.17; envelope-from=marcel@holtmann.org;
 helo=mail.holtmann.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Dec 2022 16:52:19 -0500
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

Hi Philippe,

>> It seems there is no need to keep the inuse field signed and end up =
with
>> compiler warnings for sign-compare.
>>   CC       libvhost-user.o
>> libvhost-user.c: In function =E2=80=98vu_queue_pop=E2=80=99:
>> libvhost-user.c:2763:19: error: comparison of integer expressions of =
different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=
=99 [-Werror=3Dsign-compare]
>>  2763 |     if (vq->inuse >=3D vq->vring.num) {
>>       |                   ^~
>> libvhost-user.c: In function =E2=80=98vu_queue_rewind=E2=80=99:
>> libvhost-user.c:2808:13: error: comparison of integer expressions of =
different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=98int=E2=80=
=99 [-Werror=3Dsign-compare]
>>  2808 |     if (num > vq->inuse) {
>>       |             ^
>> Instead of casting the comparision to unsigned int, just make the =
inuse
>> field unsigned int in the fist place.
>> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
>> ---
>>  subprojects/libvhost-user/libvhost-user.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> diff --git a/subprojects/libvhost-user/libvhost-user.h =
b/subprojects/libvhost-user/libvhost-user.h
>> index aea7ec5061d5..8cda9b8f577a 100644
>> --- a/subprojects/libvhost-user/libvhost-user.h
>> +++ b/subprojects/libvhost-user/libvhost-user.h
>> @@ -343,7 +343,7 @@ typedef struct VuVirtq {
>>      /* Notification enabled? */
>>      bool notification;
>>  -    int inuse;
>> +    unsigned int inuse;
>=20
> Another use in subprojects/libvduse/libvduse.c.
>=20
> Possibly both could be renamed refcount which is more meaningful.

I quickly tried libvduse.[ch] and it has clearly less warnings than
libvhost-user, but some things could be applied there as well.

I looks like only the _GNU_SOURCE and the unsigned int inuse are
applicable, but there is a strict-aliasing issue that I first have
to fully understand.

If patches are acceptable, I send them as well for libvduse.

Regards

Marcel


