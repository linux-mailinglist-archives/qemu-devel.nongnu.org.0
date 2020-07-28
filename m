Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D622FEE7
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 03:31:09 +0200 (CEST)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0ESS-0007qF-Ft
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 21:31:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1k0ERT-0007DW-C5; Mon, 27 Jul 2020 21:30:07 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44244 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1k0ERQ-0004Fa-LV; Mon, 27 Jul 2020 21:30:07 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 07366C8D509989393011;
 Tue, 28 Jul 2020 09:29:59 +0800 (CST)
Received: from [10.174.187.22] (10.174.187.22) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.487.0; Tue, 28 Jul 2020 09:29:51 +0800
Subject: Re: [PATCH] bugfix: irq: Avoid covering object refcount of qemu_irq
To: Li Qiang <liq3ea@gmail.com>
References: <20200727130225.32640-1-zhukeqian1@huawei.com>
 <CAKXe6S+L=Uze9Eo8jmPgpCDob_S_fXzvquHw2D974_5+haKdsw@mail.gmail.com>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <b96f7fc1-17dc-6913-16fb-30c7c5ea3beb@huawei.com>
Date: Tue, 28 Jul 2020 09:29:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAKXe6S+L=Uze9Eo8jmPgpCDob_S_fXzvquHw2D974_5+haKdsw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.22]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 21:29:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Esteban Bosse <estebanbosse@gmail.com>,
 Qemu Developers <qemu-devel@nongnu.org>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, yezengruan@huawei.com, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, wanghaibin.wang@huawei.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Qiang,

On 2020/7/27 22:37, Li Qiang wrote:
> Keqian Zhu <zhukeqian1@huawei.com> 于2020年7月27日周一 下午9:03写道：
>>
>> Avoid covering object refcount of qemu_irq, otherwise it may causes
>> memory leak.
> 
> Any reproducer?
> 
In mainline Qemu. this function is only used in qtest. One of our internal
self-developed module also use this function. The memory leak is reported
by ASAN.

Thanks,
Keqian

> Thanks,
> Li Qiang
> 
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>> ---
>>  hw/core/irq.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/core/irq.c b/hw/core/irq.c
>> index fb3045b912..59af4dfc74 100644
>> --- a/hw/core/irq.c
>> +++ b/hw/core/irq.c
>> @@ -125,7 +125,9 @@ void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler, int n)
>>      int i;
>>      qemu_irq *old_irqs = qemu_allocate_irqs(NULL, NULL, n);
>>      for (i = 0; i < n; i++) {
>> -        *old_irqs[i] = *gpio_in[i];
>> +        old_irqs[i]->handler = gpio_in[i]->handler;
>> +        old_irqs[i]->opaque = gpio_in[i]->opaque;
>> +
>>          gpio_in[i]->handler = handler;
>>          gpio_in[i]->opaque = &old_irqs[i];
>>      }
>> --
>> 2.19.1
>>
> .
> 

