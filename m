Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099211C270
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 02:42:53 +0100 (CET)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifDVE-0008UF-9m
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 20:42:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44738)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ifDTt-0007Pe-Dh
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ifDTs-0003uO-DK
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:41:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2278 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ifDTr-0003mL-Mq
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 20:41:28 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 69890A33228D1654DCA2;
 Thu, 12 Dec 2019 09:41:22 +0800 (CST)
Received: from [127.0.0.1] (10.120.177.99) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 12 Dec 2019
 09:41:12 +0800
Subject: Re: [PATCH] vhost-user-test: fix a memory leak
To: Thomas Huth <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>
References: <1576025722-41720-1-git-send-email-pannengyuan@huawei.com>
 <eb4d58d0-ac2e-e69d-0a04-87fd5fc14e6e@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <bddb212d-c4c7-3a08-47fb-2f6e00243a61@huawei.com>
Date: Thu, 12 Dec 2019 09:41:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <eb4d58d0-ac2e-e69d-0a04-87fd5fc14e6e@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.120.177.99]
X-CFilter-Loop: Reflected
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/12/11 15:57, Thomas Huth wrote:
>  Hi!
> 
> On 11/12/2019 01.55, pannengyuan@huawei.com wrote:
> [...]
>> diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
>> index 91ea373..54be931 100644
>> --- a/tests/vhost-user-test.c
>> +++ b/tests/vhost-user-test.c
>> @@ -717,6 +717,8 @@ static void test_migrate(void *obj, void *arg, QGuestAllocator *alloc)
>>      guint64 size;
>>  
>>      if (!wait_for_fds(s)) {
>> +        g_free(uri);
>> +        test_server_free(dest);
>>          return;
>>      }
> 
> Well spotted. But I'd prefer to rather move the allocation of these
> resources after the if-statement instead of doing the allocation at the
> declaration of the variables already. Or maybe use a "goto out" and jump
> to the end of the function instead? ... whatever you prefer, but
> duplicating the "free" functions sounds like a cumbersome solution to me.
> 

Yes, I think use a "goto out" is more better. I will change it.

Thanks.

>  Thanks,
>   Thomas
> 
> 


