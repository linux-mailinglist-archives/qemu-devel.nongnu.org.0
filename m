Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6217017138B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 09:59:26 +0100 (CET)
Received: from localhost ([::1]:55630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7F0v-0004OQ-FW
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 03:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j7F08-0003pG-DU
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 03:58:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j7F07-0005uj-3Z
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 03:58:36 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3176 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j7F04-0005RP-50; Thu, 27 Feb 2020 03:58:32 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 222E6A77A0A3E8399D1C;
 Thu, 27 Feb 2020 16:58:26 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 27 Feb
 2020 16:58:16 +0800
Subject: Re: [PATCH v3 1/6] s390x: fix memleaks in cpu_finalize
To: David Hildenbrand <david@redhat.com>, <peter.maydell@linaro.org>
References: <20200227025055.14341-1-pannengyuan@huawei.com>
 <20200227025055.14341-2-pannengyuan@huawei.com>
 <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <46d1fc23-6ef5-947f-becd-c3004a6b76bc@huawei.com>
Date: Thu, 27 Feb 2020 16:58:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <59af1e29-8075-a25c-dd80-e93cc21bb328@redhat.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: zhang.zhanghailiang@huawei.com, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 euler.robot@huawei.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/27/2020 4:41 PM, David Hildenbrand wrote:
> On 27.02.20 03:50, Pan Nengyuan wrote:
>> This patch fix memleaks when we call tests/qtest/cpu-plug-test on s390=
x. The leak stack is as follow:
>>
>> Direct leak of 48 byte(s) in 1 object(s) allocated from:
>>     #0 0x7fb43c7cd970 in __interceptor_calloc (/lib64/libasan.so.5+0xe=
f970)
>>     #1 0x7fb43be2149d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>>     #2 0x558ba96da716 in timer_new_full /mnt/sdb/qemu-new/qemu/include=
/qemu/timer.h:530
>>     #3 0x558ba96da716 in timer_new /mnt/sdb/qemu-new/qemu/include/qemu=
/timer.h:551
>>     #4 0x558ba96da716 in timer_new_ns /mnt/sdb/qemu-new/qemu/include/q=
emu/timer.h:569
>>     #5 0x558ba96da716 in s390_cpu_initfn /mnt/sdb/qemu-new/qemu/target=
/s390x/cpu.c:285
>>     #6 0x558ba9c969ab in object_init_with_type /mnt/sdb/qemu-new/qemu/=
qom/object.c:372
>>     #7 0x558ba9c9eb5f in object_initialize_with_type /mnt/sdb/qemu-new=
/qemu/qom/object.c:516
>>     #8 0x558ba9c9f053 in object_new_with_type /mnt/sdb/qemu-new/qemu/q=
om/object.c:684
>>     #9 0x558ba967ede6 in s390x_new_cpu /mnt/sdb/qemu-new/qemu/hw/s390x=
/s390-virtio-ccw.c:64
>>     #10 0x558ba99764b3 in hmp_cpu_add /mnt/sdb/qemu-new/qemu/hw/core/m=
achine-hmp-cmds.c:57
>>     #11 0x558ba9b1c27f in handle_hmp_command /mnt/sdb/qemu-new/qemu/mo=
nitor/hmp.c:1082
>>     #12 0x558ba96c1b02 in qmp_human_monitor_command /mnt/sdb/qemu-new/=
qemu/monitor/misc.c:142
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>> Cc: Richard Henderson <rth@twiddle.net>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> ---
>> v2->v1:
>> - Similarly to other cleanups, move timer_new into realize(Suggested b=
y Philippe Mathieu-Daud=C3=A9)
>> v3->v2:
>> - Also do the timer_free in unrealize, it seems more balance.
>> ---
>=20
>=20
> As I already said, I think this is init and not realize stuff. Do we
> have a convention now and documented that?
>=20
> Anyhow, I don't really care
> [...]
>=20
>=20
>> @@ -453,6 +466,7 @@ static void s390_cpu_class_init(ObjectClass *oc, v=
oid *data)
>> =20
>>      device_class_set_parent_realize(dc, s390_cpu_realizefn,
>>                                      &scc->parent_realize);
>> +    dc->unrealize =3D s390_cpu_unrealizefn;
>=20
> Shouldn't we use device_class_set_parent_unrealize?

We just only declare parent_realize field in S390CPUClass(), it seems not=
hing to do in parent_unrealize.

typedef struct S390CPUClass {
...
DeviceRealize parent_realize;    // no parent_unrealize;
...
}

So I think we can't use it.

Thanks.

>=20
>=20

