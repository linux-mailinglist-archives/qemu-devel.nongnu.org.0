Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDAA156F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Feb 2020 07:16:28 +0100 (CET)
Received: from localhost ([::1]:57298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j12Mt-0003L5-6M
	for lists+qemu-devel@lfdr.de; Mon, 10 Feb 2020 01:16:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12LS-0002BK-RX
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 01:14:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1j12LR-0007jZ-RN
 for qemu-devel@nongnu.org; Mon, 10 Feb 2020 01:14:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2699 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1j12LP-0007DO-6J; Mon, 10 Feb 2020 01:14:55 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 051FF14E37D5277C505C;
 Mon, 10 Feb 2020 14:14:46 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.230) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0;
 Mon, 10 Feb 2020 14:14:35 +0800
Subject: Re: [PATCH] migration: Optimization about wait-unplug migration state
To: <quintela@redhat.com>
References: <20200204050841.44453-1-zhukeqian1@huawei.com>
 <87blqehfyn.fsf@secure.laptop>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <4c6ab663-0d59-765a-e4b2-4dbf63afe9e9@huawei.com>
Date: Mon, 10 Feb 2020 14:14:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <87blqehfyn.fsf@secure.laptop>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.221.230]
X-CFilter-Loop: Reflected
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
Cc: jfreimann@redhat.com, wanghaibin.wang@huawei.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2020/2/4 17:14, Juan Quintela wrote:
> Keqian Zhu <zhukeqian1@huawei.com> wrote:
>> qemu_savevm_nr_failover_devices() is originally designed to
>> get the number of failover devices, but it actually returns
>> the number of "unplug-pending" failover devices now. Moreover,
>> what drives migration state to wait-unplug should be the number
>> of "unplug-pending" failover devices, not all failover devices.
>>
>> We can also notice that qemu_savevm_state_guest_unplug_pending()
>> and qemu_savevm_nr_failover_devices() is equivalent almost (from
>> the code view). So the latter is incorrect semantically and
>> useless, just delete it.
>>
>> In the qemu_savevm_state_guest_unplug_pending(), once hit a
>> unplug-pending failover device, then it can return true right
>> now to save cpu time.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> For my reading you are right:
> - 1st function naming is not right
> - 2nd function achieves exactly the same effect
> 
> I will wait until Jens says anything, but then I will queue it.
> 
> Thanks, Juan.
> 
> 
> .
> 
Thanks,
Keqian.


