Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE730A773
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:19:55 +0100 (CET)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6YBN-0006b3-M4
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:19:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1l6Y9j-00064D-0m; Mon, 01 Feb 2021 07:18:11 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1l6Y9f-0006eK-70; Mon, 01 Feb 2021 07:18:10 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DTn3m0j5Dz5M8K;
 Mon,  1 Feb 2021 20:16:20 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Mon, 1 Feb 2021 20:17:56 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Mon, 1 Feb 2021 20:17:56 +0800
Subject: Re: [PATCH] block/mirror: fix core when using iothreads
To: John Snow <jsnow@redhat.com>, <qemu-block@nongnu.org>, <kwolf@redhat.com>
References: <20200826131910.1879079-1-liangpeng10@huawei.com>
 <11c14e57-e285-68c1-33cd-37f2121d302b@redhat.com>
From: Peng Liang <liangpeng10@huawei.com>
Message-ID: <d59522c9-455f-0f41-3fdb-37e4feeec1e8@huawei.com>
Date: Mon, 1 Feb 2021 20:17:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <11c14e57-e285-68c1-33cd-37f2121d302b@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=liangpeng10@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, xiexiangyou@huawei.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/2020 10:50 PM, John Snow wrote:
> On 8/26/20 9:19 AM, Peng Liang wrote:
>> We found an issue when doing block-commit with iothreads, which tries to
>> dereference a NULL pointer.
>>
> 
> I'm clearing out my patch backlog. I am a bit out of the loop on block
> issues at the moment, did this issue get addressed in a later patch that
> I am not seeing, or does it still need attention?
> 
> --js
> 

Hi John,
I'm very sorry for missing your reply.

Michael encountered the problem too and gave a reproducer script.

Thanks,
Peng

