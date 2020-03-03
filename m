Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6DC1774E3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:59:58 +0100 (CET)
Received: from localhost ([::1]:45438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j95HJ-0007AD-N9
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:59:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60599)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1j95GQ-0006dw-L4
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:59:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1j95GP-0000Ab-IU
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:59:02 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:33026 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1j95GP-00007g-7u; Tue, 03 Mar 2020 05:59:01 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4FAAA5235A27173B8153;
 Tue,  3 Mar 2020 18:58:52 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020
 18:58:43 +0800
Subject: Re: [PATCH] target/i386/hax-posix: fix two 'format-truncation'
 compile warnings
To: Paolo Bonzini <pbonzini@redhat.com>, <rth@twiddle.net>,
 <ehabkost@redhat.com>
References: <20200224065139.19567-1-pannengyuan@huawei.com>
 <a6e307a4-a66d-2297-5d62-6be910353d67@redhat.com>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <964455ff-100e-8fdc-a775-232b9e99a8a5@huawei.com>
Date: Tue, 3 Mar 2020 18:58:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <a6e307a4-a66d-2297-5d62-6be910353d67@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
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
Cc: qemu-trivial@nongnu.org, euler.robot@huawei.com, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/2020 6:47 PM, Paolo Bonzini wrote:
> On 24/02/20 07:51, pannengyuan@huawei.com wrote:
>> diff --git a/target/i386/hax-posix.c b/target/i386/hax-posix.c
>> index a5426a6dac..197d5bc0f9 100644
>> --- a/target/i386/hax-posix.c
>> +++ b/target/i386/hax-posix.c
>> @@ -121,7 +121,8 @@ static char *hax_vm_devfs_string(int vm_id)
>>          return NULL;
>>      }
>>  
>> -    snprintf(name, sizeof HAX_VM_DEVFS, "/dev/hax_vm/vm%02d", vm_id);
>> +    int len = snprintf(name, sizeof HAX_VM_DEVFS, "/dev/hax_vm/vm%02d", vm_id);
>> +    assert(len < sizeof HAX_VM_DEVFS);
>>      return name;
>>  }
>>  
>> @@ -140,8 +141,9 @@ static char *hax_vcpu_devfs_string(int vm_id, int vcpu_id)
>>          return NULL;
>>      }
>>  
>> -    snprintf(name, sizeof HAX_VCPU_DEVFS, "/dev/hax_vm%02d/vcpu%02d",
>> -             vm_id, vcpu_id);
>> +    int len = snprintf(name, sizeof HAX_VCPU_DEVFS, "/dev/hax_vm%02d/vcpu%02d",
>> +                       vm_id, vcpu_id);
>> +    assert(len < sizeof HAX_VCPU_DEVFS);
>>      return name;
>>  }
>>  
>>
> 
> Julio Faracco has posted a fix for the same bug.  The best change is
> actually to switch to g_strdup_printf.

Okay, Thanks.

> 
> Paolo
> 

