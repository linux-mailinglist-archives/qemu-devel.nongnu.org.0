Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D10C3DFBFE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 09:21:16 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBBDG-0007sO-Sh
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 03:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1mBBBX-0006qG-ML; Wed, 04 Aug 2021 03:19:28 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yezhenyu2@huawei.com>)
 id 1mBBBR-00072G-7E; Wed, 04 Aug 2021 03:19:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Gfjgt3S92zZxPS;
 Wed,  4 Aug 2021 15:15:38 +0800 (CST)
Received: from dggpemm500017.china.huawei.com (7.185.36.178) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 15:19:11 +0800
Received: from [10.174.185.76] (10.174.185.76) by
 dggpemm500017.china.huawei.com (7.185.36.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 4 Aug 2021 15:19:10 +0800
Subject: Re: [Question] qemu-img convert block alignment
To: Eric Blake <eblake@redhat.com>
References: <ed4ae175-1c67-b7fb-669d-c8c08ca1a7f7@huawei.com>
 <20210803150316.eo5gm3xqxuetqahq@redhat.com>
From: Zhenyu Ye <yezhenyu2@huawei.com>
Message-ID: <3e4b8fb0-0d3b-a99b-c603-ac3f0b0d3d9d@huawei.com>
Date: Wed, 4 Aug 2021 15:18:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210803150316.eo5gm3xqxuetqahq@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.76]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500017.china.huawei.com (7.185.36.178)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=yezhenyu2@huawei.com;
 helo=szxga01-in.huawei.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, pl@kamp.de,
 qemu-devel@nongnu.org, Xiexiangyou <xiexiangyou@huawei.com>, mreitz@redhat.com,
 zhengchuan <zhengchuan@huawei.com>, lichuan18@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/8/3 23:03, Eric Blake wrote:
> On Fri, Apr 02, 2021 at 11:52:25AM +0800, Zhenyu Ye wrote:
>> Hi all,
>>
>> commit 8dcd3c9b91 ("qemu-img: align result of is_allocated_sectors")
>> introduces block alignment when doing qemu-img convert. However, the
>> alignment is:
>>
>> 	s.alignment = MAX(pow2floor(s.min_sparse),
>>                       DIV_ROUND_UP(out_bs->bl.request_alignment,
>>                                    BDRV_SECTOR_SIZE));
>>
>> (where the default s.min_sparse is 8)
>> When the target device's bl.request_alignment is smaller than 4K, this
>> will cause additional write-zero overhead and makes the size of target
>> file larger.
>>
>> Is this as expected?  Should we change the MAX() to MIN()?
> 
> Yes it is expected, and no we shouldn't change it.  Even when a target
> advertises a bl.request_alignment of 512, our goal is to avoid needing
> read-modify-write cycles when that target is really on top of a 4k
> sector disk.  Writing extra 0s out to the 4k boundaries does not
> change the fact that allocation is in 4k chunks anyways, regardless of
> whether the disk supports smaller 512-byte reads.
> 

Thanks for your reply.

Zhenyu

