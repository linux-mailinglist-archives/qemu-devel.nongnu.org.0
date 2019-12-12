Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC1511C2B9
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 02:50:37 +0100 (CET)
Received: from localhost ([::1]:52790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifDch-0004Us-Vx
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 20:50:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ifDb5-0003Qw-Fa
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ifDb4-00069f-BI
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:48:55 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2279 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ifDb3-00063i-VA
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:48:54 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 70A32A4E7E86F97D34CA;
 Thu, 12 Dec 2019 09:48:50 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 09:48:44 +0800
Subject: Re: [PATCH] vhost-user-test: fix a memory leak
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>, "Thomas
 Huth" <thuth@redhat.com>
References: <1576025722-41720-1-git-send-email-pannengyuan@huawei.com>
 <eb4d58d0-ac2e-e69d-0a04-87fd5fc14e6e@redhat.com>
 <CAJ+F1CLFqpm8LRiJpQ6h1shW3_3UvV9yL6twDo7YAj=Ti1J8Vg@mail.gmail.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <7fa3679a-ebd6-f696-cbe1-e3b69c556239@huawei.com>
Date: Thu, 12 Dec 2019 09:48:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLFqpm8LRiJpQ6h1shW3_3UvV9yL6twDo7YAj=Ti1J8Vg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Originating-IP: [10.120.177.99]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 zhanghailiang <zhang.zhanghailiang@huawei.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/12/11 16:18, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Wed, Dec 11, 2019 at 11:57 AM Thomas Huth <thuth@redhat.com> wrote:
>>
>>  Hi!
>>
>> On 11/12/2019 01.55, pannengyuan@huawei.com wrote:
>> [...]
>>> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
>>> index 91ea373..54be931 100644
>>> --- a/tests/vhost-user-test.c
>>> +++ b/tests/vhost-user-test.c
>>> @@ -717,6 +717,8 @@ static void test_migrate(void *obj, void *arg, QG=
uestAllocator *alloc)
>>>      guint64 size;
>>>
>>>      if (!wait_for_fds(s)) {
>>> +        g_free(uri);
>>> +        test_server_free(dest);
>>>          return;
>>>      }
>>
>> Well spotted. But I'd prefer to rather move the allocation of these
>> resources after the if-statement instead of doing the allocation at th=
e
>> declaration of the variables already. Or maybe use a "goto out" and ju=
mp
>> to the end of the function instead? ... whatever you prefer, but
>> duplicating the "free" functions sounds like a cumbersome solution to =
me.
>=20
> g_auto (preferably) should work as well.

Yes, it should work as well. But try to keep it as it is, I will use a
"goto" instead.

Thanks.

>=20
>=20


