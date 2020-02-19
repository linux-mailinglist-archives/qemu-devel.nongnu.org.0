Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0121163CBF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 06:36:29 +0100 (CET)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4I29-00048R-0T
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 00:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45821)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I0m-00038d-Gc
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 00:35:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I0l-000532-F8
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 00:35:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3238 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j4I0i-00050U-Rq; Wed, 19 Feb 2020 00:35:01 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B7D60F4648193DD5A081;
 Wed, 19 Feb 2020 13:34:57 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 19 Feb 2020 13:34:48 +0800
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
 <d46149e5-8d8f-d3b8-91ec-145c102cffb7@redhat.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <23e77c02-a2de-817c-040b-449e35555689@huawei.com>
Date: Wed, 19 Feb 2020 13:34:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d46149e5-8d8f-d3b8-91ec-145c102cffb7@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
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
Cc: wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/2/14 19:46, Eric Blake wrote:
> On 2/13/20 9:27 PM, Keqian Zhu wrote:
>> At the tail stage of throttle, VM is very sensitive to
>> CPU percentage. We just throttle 30% of remaining CPU
>> when throttle is more than 80 percentage.
>>
>> This doesn't conflict with cpu_throttle_increment.
>>
>> This may make migration time longer, and is disabled
>> by default.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
> 
>> +++ b/qapi/migration.json
>> @@ -532,6 +532,12 @@
>>   #                          auto-converge detects that migration is not making
>>   #                          progress. The default value is 10. (Since 2.7)
>>   #
>> +# @cpu-throttle-tailslow: Make throttle slower at tail stage
>> +#                         At the tail stage of throttle, VM is very sensitive to
>> +#                         CPU percentage. We just throttle 30% of remaining CPU
>> +#                         when throttle is more than 80 percentage. The default
>> +#                         value is false. (Since 4.1)
> 
> The next release is 5.0, not 4.1.
Thanks for reminding me.
> 
Thanks,
Keqian



