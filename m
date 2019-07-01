Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AFE143A5
	for <lists+qemu-devel@lfdr.de>; Mon,  6 May 2019 04:53:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49276 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNTky-0000ag-FL
	for lists+qemu-devel@lfdr.de; Sun, 05 May 2019 22:53:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hNTk1-0008TD-8C
	for qemu-devel@nongnu.org; Sun, 05 May 2019 22:52:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhengxiang9@huawei.com>) id 1hNTk0-0004O3-CW
	for qemu-devel@nongnu.org; Sun, 05 May 2019 22:52:33 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2208 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <zhengxiang9@huawei.com>)
	id 1hNTjx-0004Ko-5r; Sun, 05 May 2019 22:52:30 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id C26034716A1A5AD60625;
	Mon,  6 May 2019 10:52:23 +0800 (CST)
Received: from [127.0.0.1] (10.177.29.32) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Mon, 6 May 2019
	10:52:15 +0800
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190505070059.4664-1-zhengxiang9@huawei.com>
	<CAFEAcA-_bk0hr3g4VhxWHktMOyQ-vDvYSCBXcjMjusMFbwScgQ@mail.gmail.com>
From: Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <62606c85-458f-9ad1-19dc-ab42d892597c@huawei.com>
Date: Mon, 6 May 2019 10:51:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:64.0) Gecko/20100101
	Thunderbird/64.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-_bk0hr3g4VhxWHktMOyQ-vDvYSCBXcjMjusMFbwScgQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.29.32]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.190
Subject: Re: [Qemu-devel] [PATCH] pflash: Only read non-zero parts of
 backend image
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Max Reitz <mreitz@redhat.com>, Stefan
	Hajnoczi <stefanha@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
	wanghaibin.wang@huawei.com, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2019/5/5 23:37, Peter Maydell wrote:
> On Sun, 5 May 2019 at 08:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> Currently we fill the memory space with two 64MB NOR images when
>> using persistent UEFI variables on virt board. Actually we only use
>> a very small(non-zero) part of the memory while the rest significant
>> large(zero) part of memory is wasted.
>>
>> So this patch checks the block status and only writes the non-zero part
>> into memory. This requires pflash devices to use sparse files for
>> backends.
> 
> Do you mean "pflash devices will no longer work if the file
> that is backing them is not sparse", or just "if the file that
> is backing them is not sparse then you won't get the benefit
> of using less memory" ?
> 

I mean the latter, if the file is not sparse, nothing would change.
I will improve this commit message in the next version.

-- 

Thanks,
Xiang



