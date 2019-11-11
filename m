Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45233F6C3D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Nov 2019 02:24:39 +0100 (CET)
Received: from localhost ([::1]:48326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iTyRa-00065x-Cb
	for lists+qemu-devel@lfdr.de; Sun, 10 Nov 2019 20:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50974)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhengxiang9@huawei.com>) id 1iTyQL-0005Qe-7R
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 20:23:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhengxiang9@huawei.com>) id 1iTyQK-0008MO-8n
 for qemu-devel@nongnu.org; Sun, 10 Nov 2019 20:23:21 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:59118 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
 id 1iTyQH-0008Bw-Q2; Sun, 10 Nov 2019 20:23:18 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0AEF27CCDDD5308E8303;
 Mon, 11 Nov 2019 09:23:10 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 11 Nov 2019
 09:23:02 +0800
Subject: Re: [PATCH v21 3/6] ACPI: Add APEI GHES table generation support
To: gengdongjiu <gengdongjiu@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
 <20191104121458.29208-4-zhengxiang9@huawei.com>
 <3068b1f2-7175-485a-a9a1-dcba0bf82dea@huawei.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <b32dec90-93c7-a811-f521-470dee75e5b8@huawei.com>
Date: Mon, 11 Nov 2019 09:23:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <3068b1f2-7175-485a-a9a1-dcba0bf82dea@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, kvm@vger.kernel.org,
 mst@redhat.com, wanghaibin.wang@huawei.com, mtosatti@redhat.com,
 qemu-devel@nongnu.org, linuxarm@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, james.morse@arm.com, jonathan.cameron@huawei.com,
 imammedo@redhat.com, pbonzini@redhat.com, xuwei5@huawei.com, lersek@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2019/11/8 16:11, gengdongjiu wrote:
> On 2019/11/4 20:14, Xiang Zheng wrote:
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> This patch implements APEI GHES Table generation via fw_cfg blobs. Now
>> it only supports ARMv8 SEA, a type of GHESv2 error source. Afterwards,
>> we can extend the supported types if needed. For the CPER section,
>> currently it is memory section because kernel mainly wants userspace to
>> handle the memory errors.
>>
>> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
>> table. For more detailed information, please refer to document:
>> docs/specs/acpi_hest_ghes.rst
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Hi Xiang,
>    please add "Reviewed-by: Michael S. Tsirkin <mst@redhat.com> " which from Michael, thanks.
> 

OK, I will add it.

> 
> .
> 

-- 

Thanks,
Xiang


