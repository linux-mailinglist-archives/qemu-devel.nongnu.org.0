Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5AE16FC53
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 11:34:14 +0100 (CET)
Received: from localhost ([::1]:42174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6u17-00078K-Nu
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 05:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j6u06-00067Q-6H
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:33:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j6u04-000835-Pu
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 05:33:10 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:35552 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j6u01-0007qb-8A; Wed, 26 Feb 2020 05:33:05 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 715348616FD1F1BB3883;
 Wed, 26 Feb 2020 18:32:56 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 26 Feb
 2020 18:32:46 +0800
Subject: Re: [PATCH 2/2] qemu-img: free memory before re-assign
To: Max Reitz <mreitz@redhat.com>, <kwolf@redhat.com>
References: <20200226033037.18253-1-pannengyuan@huawei.com>
 <20200226033037.18253-3-pannengyuan@huawei.com>
 <03a50206-6407-41e8-f11a-6e866f0c3798@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <2b2056aa-f0a8-a3bb-656e-2a648c4e3150@huawei.com>
Date: Wed, 26 Feb 2020 18:32:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <03a50206-6407-41e8-f11a-6e866f0c3798@redhat.com>
Content-Type: text/plain; charset="windows-1252"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: euler.robot@huawei.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/26/2020 6:13 PM, Max Reitz wrote:
> On 26.02.20 04:30, Pan Nengyuan wrote:
>> collect_image_check() is called twice in img_check(), the filename/for=
mat will be alloced without free the original memory.
>> It is not a big deal since the process will exit anyway, but seems lik=
e a clean code and it will remove the warning spotted by asan.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>>  qemu-img.c | 2 ++
>>  1 file changed, 2 insertions(+)
>=20
> I think this should happen in the caller.  And there I think it would
> make more sense to completely discard the old object and allocate a new=
 one:
>=20
> qapi_free_ImageCheck(check);
> check =3D g_new0(ImageCheck, 1);
>=20
> This way, we can=92t forget to free any fields if new pointers were to =
be
> added to the ImageCheck object.

Good idea, thanks.

>=20
> Max
>=20

