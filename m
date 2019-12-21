Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63E1128914
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Dec 2019 13:37:01 +0100 (CET)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iie0C-0005NX-Jc
	for lists+qemu-devel@lfdr.de; Sat, 21 Dec 2019 07:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gengdongjiu@huawei.com>) id 1iidzQ-0004t4-Sg
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 07:36:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gengdongjiu@huawei.com>) id 1iidzP-0000h8-RM
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 07:36:12 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:48738 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gengdongjiu@huawei.com>)
 id 1iidzM-0007xw-Lu; Sat, 21 Dec 2019 07:36:09 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5BEC98C9039688F26A78;
 Sat, 21 Dec 2019 20:35:53 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Sat, 21 Dec 2019
 20:35:46 +0800
Subject: Re: [RESEND PATCH v21 5/6] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To: Igor Mammedov <imammedo@redhat.com>, Xiang Zheng <zhengxiang9@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-6-zhengxiang9@huawei.com>
 <20191115173713.795e5f63@redhat.com>
From: gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <38f13f15-960d-3e56-78f5-42b1ec61a322@huawei.com>
Date: Sat, 21 Dec 2019 20:35:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20191115173713.795e5f63@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, wanghaibin.wang@huawei.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, linuxarm@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, james.morse@arm.com, xuwei5@huawei.com,
 jonathan.cameron@huawei.com, pbonzini@redhat.com, lersek@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/11/16 0:37, Igor Mammedov wrote:
>> +
>> +        /* zero means OSPM does not acknowledge the error */
>> +        if (!read_ack_register) {
>> +            if (loop < 3) {
>> +                usleep(100 * 1000);
>> +                loop++;
>> +                goto retry;
> as minimum this loop can stall guest repeatedly for 0.3s if guest triggers BQL,
> until it handles error.

I think reparations for 0.3s is reasonable.
1. 0.3s is the worst case to repeat, if guest acknowledge it in before 0.3s, the guest can not stall
2. if the previous error is not acknowledged, the next error will be lost, error handling(safety) is more important than others.


>
> (not sure what to suggest here though)
> 
> (not sure what to suggest here though)
> 


