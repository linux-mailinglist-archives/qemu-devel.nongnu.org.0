Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FAD6526BD
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 20:06:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7hul-0000pS-4u; Tue, 20 Dec 2022 14:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcel@holtmann.org>)
 id 1p7hui-0000p8-7f
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:04:32 -0500
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcel@holtmann.org>) id 1p7hug-0006ko-3l
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 14:04:31 -0500
Received: from smtpclient.apple (p4fefcc21.dip0.t-ipconnect.de [79.239.204.33])
 by mail.holtmann.org (Postfix) with ESMTPSA id 726EECED09;
 Tue, 20 Dec 2022 20:04:25 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 7/7] libvhost-user: Switch to unsigned int for inuse field
 in struct VuVirtq
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20221220101454-mutt-send-email-mst@kernel.org>
Date: Tue, 20 Dec 2022 20:04:24 +0100
Cc: qemu-devel@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C14D79D-886A-49A1-A69A-7BF260222E20@holtmann.org>
References: <20221219175337.377435-8-marcel@holtmann.org>
 <20221220101454-mutt-send-email-mst@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
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

Hi Michael,

>> It seems there is no need to keep the inuse field signed and end up =
with
>> compiler warnings for sign-compare.
>>=20
>>  CC       libvhost-user.o
>> libvhost-user.c: In function =E2=80=98vu_queue_pop=E2=80=99:
>> libvhost-user.c:2763:19: error: comparison of integer expressions of =
different signedness: =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=
=99 [-Werror=3Dsign-compare]
>> 2763 |     if (vq->inuse >=3D vq->vring.num) {
>>      |                   ^~
>> libvhost-user.c: In function =E2=80=98vu_queue_rewind=E2=80=99:
>> libvhost-user.c:2808:13: error: comparison of integer expressions of =
different signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=98int=E2=80=
=99 [-Werror=3Dsign-compare]
>> 2808 |     if (num > vq->inuse) {
>>      |             ^
>>=20
>> Instead of casting the comparision to unsigned int, just make the =
inuse
>> field unsigned int in the fist place.
>>=20
>> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
>=20
>=20
> Is this a part of a patchset? No threading visible and I'd rather not
> guess.

I am going to re-send both series as v2.

Regards

Marcel


