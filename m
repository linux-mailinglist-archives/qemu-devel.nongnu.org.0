Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7B49C38E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 07:23:44 +0100 (CET)
Received: from localhost ([::1]:38586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCbiZ-00082b-9Q
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 01:23:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nCbc1-0006nl-Rh; Wed, 26 Jan 2022 01:16:57 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1nCbbt-0006sK-8G; Wed, 26 Jan 2022 01:16:57 -0500
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JkD3Z32YYz9sYc;
 Wed, 26 Jan 2022 14:15:22 +0800 (CST)
Received: from [10.40.193.166] (10.40.193.166) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.21; Wed, 26 Jan 2022 14:16:41 +0800
Subject: Re: [PATCH] hw/arm/virt: Enable HMAT on arm virt machine
To: Andrew Jones <drjones@redhat.com>
References: <1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com>
 <20220125102603.3ssiffsqcyt7tlwr@gator>
 <853b0152-8996-1097-1f01-d3ede7a2b0ca@hisilicon.com>
 <20220125124658.yf6we6n4l6unducl@gator>
CC: chenxiang via <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>,
 <shannon.zhaosl@gmail.com>, <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
 <imammedo@redhat.com>
Message-ID: <dc1c073b-b2e0-1208-880f-e0ffd242ebbe@hisilicon.com>
Date: Wed, 26 Jan 2022 14:16:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20220125124658.yf6we6n4l6unducl@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  "chenxiang (M)" <chenxiang66@hisilicon.com>
From:  "chenxiang (M)" via <qemu-devel@nongnu.org>



在 2022/1/25 20:46, Andrew Jones 写道:
> On Tue, Jan 25, 2022 at 07:46:43PM +0800, chenxiang (M) wrote:
>> Hi Andrew,
>>
>>
>> 在 2022/1/25 18:26, Andrew Jones 写道:
>>> On Tue, Jan 25, 2022 at 05:15:34PM +0800, chenxiang via wrote:
>>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>>
>>>> Since the patchset ("Build ACPI Heterogeneous Memory Attribute Table (HMAT)"),
>>>> HMAT is supported, but only x86 is enabled. Enable HMAT on arm virt machine.
>>> Hi Xiang,
>>>
>>> What QEMU commands lines have you tested with which Linux guest kernels?
>> I tested it with following commands with guest kernel 5.16-rc1, and the boot
>> log of guest kernel is as attached:
> Thanks. Please consider adding HMAT tests, see tests/qtest/numa-test.c and
> tests/qtest/bios-tables-test.c, for the virt machine type to this series.
> Otherwise,
>
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks, i will add those HMAT tests in v2.



