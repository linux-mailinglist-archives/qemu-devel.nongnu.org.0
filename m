Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D16DC2EF
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 05:18:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pli1s-0007R5-IY; Sun, 09 Apr 2023 23:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pli1p-0007Qt-Ma
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:17:13 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <longpeng2@huawei.com>)
 id 1pli1n-0001dy-7C
 for qemu-devel@nongnu.org; Sun, 09 Apr 2023 23:17:13 -0400
Received: from kwepemi100025.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PvvDz4BswznbGF;
 Mon, 10 Apr 2023 11:13:23 +0800 (CST)
Received: from [10.174.148.223] (10.174.148.223) by
 kwepemi100025.china.huawei.com (7.221.188.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 11:16:54 +0800
Message-ID: <16c48190-bc4d-3001-3460-d7dfa6041919@huawei.com>
Date: Mon, 10 Apr 2023 11:16:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Reducing vdpa migration downtime because of memory pin / maps
To: Jason Wang <jasowang@redhat.com>, Eugenio Perez Martin
 <eperezma@redhat.com>
CC: qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, "Gonglei (Arei)"
 <arei.gonglei@huawei.com>, Eli Cohen <elic@nvidia.com>, Parav Pandit
 <parav@nvidia.com>, Juan Quintela <quintela@redhat.com>, David Gilbert
 <dgilbert@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>
References: <CAJaqyWdV6pKP0SVZciMiu_HN86aJriZh0HBiwHNkO7+yErXnBA@mail.gmail.com>
 <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
In-Reply-To: <CACGkMEuPo_hyQayJDN=VjaV_BAX3B9hBcxFquVSXPu8nBP21Aw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.148.223]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi100025.china.huawei.com (7.221.188.158)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=longpeng2@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.888,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-to:  "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
 <longpeng2@huawei.com>
From: longpeng2--- via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023/4/10 10:14, Jason Wang 写道:
> On Wed, Apr 5, 2023 at 7:38 PM Eugenio Perez Martin <eperezma@redhat.com> wrote:
>>
>> Hi!
>>
>> As mentioned in the last upstream virtio-networking meeting, one of
>> the factors that adds more downtime to migration is the handling of
>> the guest memory (pin, map, etc). At this moment this handling is
>> bound to the virtio life cycle (DRIVER_OK, RESET). In that sense, the
>> destination device waits until all the guest memory / state is
>> migrated to start pinning all the memory.
>>
>> The proposal is to bind it to the char device life cycle (open vs
>> close), so all the guest memory can be pinned for all the guest / qemu
>> lifecycle.
>>
>> This has two main problems:
>> * At this moment the reset semantics forces the vdpa device to unmap
>> all the memory. So this change needs a vhost vdpa feature flag.
> 
> Is this true? I didn't find any codes to unmap the memory in
> vhost_vdpa_set_status().
> 

It could depend on the vendor driver, for example, the vdpasim would do 
something like that.

vhost_vdpa_set_status->vdpa_reset->vdpasim_reset->vdpasim_do_reset->vhost_iotlb_reset

> Thanks
> 
>> * This may increase the initialization time. Maybe we can delay it if
>> qemu is not the destination of a LM. Anyway I think this should be
>> done as an optimization on top.
>>
>> Any ideas or comments in this regard?
>>
>> Thanks!
>>
> 
> .

