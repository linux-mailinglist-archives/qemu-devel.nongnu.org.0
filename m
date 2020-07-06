Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653FF2156CD
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 13:55:02 +0200 (CEST)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsPi9-0000c3-0U
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 07:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jsPhA-0008CD-LP; Mon, 06 Jul 2020 07:54:00 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:57932 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1jsPh8-0004sX-9r; Mon, 06 Jul 2020 07:54:00 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8977D82EBD6CDCF9BDF7;
 Mon,  6 Jul 2020 19:53:47 +0800 (CST)
Received: from [10.174.187.22] (10.174.187.22) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 6 Jul 2020 19:53:38 +0800
Subject: Re: [PATCH v3] migration: Count new_dirty instead of real_dirty
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20200622032037.31112-1-zhukeqian1@huawei.com>
 <20200703142013.GC36813@work-vm>
From: zhukeqian <zhukeqian1@huawei.com>
Message-ID: <6644e1c0-ff21-9946-486f-f0849b66c4bd@huawei.com>
Date: Mon, 6 Jul 2020 19:53:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200703142013.GC36813@work-vm>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.22]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=zhukeqian1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 07:53:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: zhang.zhanghailiang@huawei.com, Juan Quintela <quintela@redhat.com>,
 wanghaibin.wang@huawei.com, Chao
 Fan <fanc.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jianjay.zhou@huawei.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,

On 2020/7/3 22:20, Dr. David Alan Gilbert wrote:
> * Keqian Zhu (zhukeqian1@huawei.com) wrote:
>> real_dirty_pages becomes equal to total ram size after dirty log sync
>> in ram_init_bitmaps, the reason is that the bitmap of ramblock is
>> initialized to be all set, so old path counts them as "real dirty" at
>> beginning.
>>
>> This causes wrong dirty rate and false positive throttling.
>>
>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> 
> OK, 
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> and queued.
> 
> you might still want to look at migration_trigger_thrtottle and see if
> you can stop the throttling if in the RAM bulk stage.
Yes, I tested it and it worked well.

Thanks,
Keqian

