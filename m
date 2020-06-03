Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1741ECAD2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jun 2020 09:52:23 +0200 (CEST)
Received: from localhost ([::1]:33580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgOCD-0003Zi-Tw
	for lists+qemu-devel@lfdr.de; Wed, 03 Jun 2020 03:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1jgOBX-0003B6-3n
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 03:51:39 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3702 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1jgOBV-0005OL-Qc
 for qemu-devel@nongnu.org; Wed, 03 Jun 2020 03:51:38 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C75973C416CF64380153;
 Wed,  3 Jun 2020 15:51:30 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 3 Jun 2020
 15:51:20 +0800
Subject: Re: [PATCH] qom-hmp-cmds: fix a memleak in hmp_qom_get
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <pbonzini@redhat.com>, <berrange@redhat.com>, <ehabkost@redhat.com>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
References: <20200603070338.7922-1-pannengyuan@huawei.com>
 <de3c8dc7-b039-71d7-6c33-5794a7ed9eb8@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <60fa4945-7227-36d3-6f13-24d58eb88b40@huawei.com>
Date: Wed, 3 Jun 2020 15:51:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <de3c8dc7-b039-71d7-6c33-5794a7ed9eb8@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 02:17:00
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 euler.robot@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/3/2020 2:51 PM, Philippe Mathieu-Daudé wrote:
> Hi Pan,
> 
> On 6/3/20 9:03 AM, Pan Nengyuan wrote:
>> 'obj' forgot to free at the end of hmp_qom_get(). Fix that.
>>
>> The leak stack:
>> Direct leak of 40 byte(s) in 1 object(s) allocated from:
>>     #0 0x7f4e3a779ae8 in __interceptor_malloc (/lib64/libasan.so.5+0xefae8)
>>     #1 0x7f4e398f91d5 in g_malloc (/lib64/libglib-2.0.so.0+0x531d5)
>>     #2 0x55c9fd9a3999 in qstring_from_substr /build/qemu/src/qobject/qstring.c:45
>>     #3 0x55c9fd894bd3 in qobject_output_type_str /build/qemu/src/qapi/qobject-output-visitor.c:175
>>     #4 0x55c9fd894bd3 in qobject_output_type_str /build/qemu/src/qapi/qobject-output-visitor.c:168
>>     #5 0x55c9fd88b34d in visit_type_str /build/qemu/src/qapi/qapi-visit-core.c:308
>>     #6 0x55c9fd59aa6b in property_get_str /build/qemu/src/qom/object.c:2064
>>     #7 0x55c9fd5adb8a in object_property_get_qobject /build/qemu/src/qom/qom-qobject.c:38
>>     #8 0x55c9fd4a029d in hmp_qom_get /build/qemu/src/qom/qom-hmp-cmds.c:66
>>
>> Fixes: 89cf4fe34f4
> 
> When you fix a bug in a specific commit, please Cc the commit author and
> the reviewers, so they have a chance to 1/ review your fix and 2/ learn
> from their mistake.

Ok, I will do next time.

> 
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> ---
>>  qom/qom-hmp-cmds.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/qom/qom-hmp-cmds.c b/qom/qom-hmp-cmds.c
>> index f704b6949a..3d2a23292d 100644
>> --- a/qom/qom-hmp-cmds.c
>> +++ b/qom/qom-hmp-cmds.c
>> @@ -71,6 +71,7 @@ void hmp_qom_get(Monitor *mon, const QDict *qdict)
>>          qobject_unref(str);
>>      }
>>  
>> +    qobject_unref(obj);
> 
> The object_resolve_path() documentation is not clear about that...
> Can we get the documentation clarified?

I'm not sure why is object_resolve_path().
In this case, 'obj' is returned from object_property_get_qobject() in qmp_qom_get().
Do you mean document object_property_get_qobject() to make it more clear?
Like:
  - The returned object has a reference count of 1, and will be freed when the last reference is dropped.

Thanks.

> 
>>      hmp_handle_error(mon, err);
>>  }
>>  
>>
> 

