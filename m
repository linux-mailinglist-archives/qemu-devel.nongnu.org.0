Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40950163CC5
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Feb 2020 06:40:30 +0100 (CET)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4I61-0005hf-AL
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 00:40:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I5I-0005Bk-8z
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 00:39:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j4I5H-0007XA-By
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 00:39:44 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:56612 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j4I5F-0007VC-00; Wed, 19 Feb 2020 00:39:41 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8BAA0F32D9837593EF5A;
 Wed, 19 Feb 2020 13:39:38 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 19 Feb 2020 13:39:29 +0800
Subject: Re: [PATCH] migration/throttle: Make throttle slower at tail stage
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200214032700.25011-1-zhukeqian1@huawei.com>
 <20200214122810.GE3283@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <9c4ea6f9-0fe9-19ae-964d-a01799879f54@huawei.com>
Date: Wed, 19 Feb 2020 13:39:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200214122810.GE3283@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/2/14 20:28, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> At the tail stage of throttle, VM is very sensitive to
>> CPU percentage. We just throttle 30% of remaining CPU
>> when throttle is more than 80 percentage.
> 
> This is a bit unusual;  all of the rest of the throttling has no
> fixed constants; all values are set by parameters.
> 
> You've got the two, the '80' and the '0.3'
> 
> I thinkt he easy solution is to replace your parameter 'tailslow' by two
> new parameters; 'tailstart' and 'tailrate';  both defaulting to 100%.
> 
> Then you make it:
> 
>         if (cpu_throttle_now >= pct_tailstart) {
>             /* Eat some scale of CPU from remaining */
>             cpu_throttle_inc = ceil((100 - cpu_throttle_now) * pct_tailrate);
> 
> (with percentage scaling added).
> 
> Then setting 'tailstart' to 80 and 'tailrate' to 30 is equivalent to
> what you have, but means we have no magical constants in the code.
> 
Yes, this is a good suggestion. Though this patch is not the final idea,
I will apply it when throttle approach is decided.
> Dave
> 
> 
[...]
>> -- 
>> 2.19.1
>>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
> .
> 
Thanks,
Keqian


