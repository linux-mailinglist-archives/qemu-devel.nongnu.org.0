Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C448981A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:54:44 +0100 (CET)
Received: from localhost ([::1]:37754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6tG8-0008Lw-1R
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1n6tDQ-0007Is-Iq; Mon, 10 Jan 2022 06:51:56 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1n6tDN-0001XO-GP; Mon, 10 Jan 2022 06:51:56 -0500
Received: from kwepemi100002.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JXXGK71wCzccTD;
 Mon, 10 Jan 2022 19:51:05 +0800 (CST)
Received: from kwepemm600002.china.huawei.com (7.193.23.29) by
 kwepemi100002.china.huawei.com (7.221.188.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 19:51:43 +0800
Received: from [10.174.185.187] (10.174.185.187) by
 kwepemm600002.china.huawei.com (7.193.23.29) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 10 Jan 2022 19:51:43 +0800
Message-ID: <0ac47838-f936-e9a9-5c8c-0a6911e07955@huawei.com>
Date: Mon, 10 Jan 2022 19:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 0/2] block-backend: Retain permissions after migration
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, <qemu-block@nongnu.org>
CC: <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>
References: <20211125135317.186576-1-hreitz@redhat.com>
In-Reply-To: <20211125135317.186576-1-hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.187]
X-ClientProxiedBy: dggeme706-chm.china.huawei.com (10.1.199.102) To
 kwepemm600002.china.huawei.com (7.193.23.29)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=liangpeng10@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Peng Liang <liangpeng10@huawei.com>
From:  Peng Liang via <qemu-devel@nongnu.org>

On 11/25/2021 9:53 PM, Hanna Reitz wrote:
> Hi,
> 
> Peng Liang has reported an issue regarding migration of raw images here:
> https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00673.html
> 
> It turns out that after migrating, all permissions are shared when they
> weren’t before.  The cause of the problem is that we deliberately delay
> restricting the shared permissions until migration is really done (until
> the runstate is no longer INMIGRATE) and first share all permissions;
> but this causes us to lose the original shared permission mask and
> overwrites it with BLK_PERM_ALL, so once we do try to restrict the
> shared permissions, we only again share them all.
> 
> Fix this by saving the set of shared permissions through the first
> blk_perm_set() call that shares all; and add a regression test.
> 
> 
> I don’t believe we have to fix this in 6.2, because I think this bug has
> existed for four years now.  (I.e. it isn’t critical, and it’s no
> regression.)
> 
> 
> Hanna Reitz (2):
>   block-backend: Retain permissions after migration
>   iotests/migration-permissions: New test
> 
>  block/block-backend.c                         |  11 ++
>  .../qemu-iotests/tests/migration-permissions  | 101 ++++++++++++++++++
>  .../tests/migration-permissions.out           |   5 +
>  3 files changed, 117 insertions(+)
>  create mode 100755 tests/qemu-iotests/tests/migration-permissions
>  create mode 100644 tests/qemu-iotests/tests/migration-permissions.out
> 

Hi Hanna,
QEMU 6.3 development tree has been opened.  Will this fix be merged in 6.3?

Thanks,
Peng

