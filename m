Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB732C9762
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:06:02 +0100 (CET)
Received: from localhost ([::1]:37636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjynZ-0004VW-0m
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:06:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjym6-0003qx-FD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:04:30 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjym3-0002JZ-RD
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:04:30 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ClWkW18bpzXhkH;
 Tue,  1 Dec 2020 14:03:47 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 1 Dec 2020 14:04:08 +0800
Received: from [10.174.187.211] (10.174.187.211) by
 dggemi758-chm.china.huawei.com (10.1.198.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 1 Dec 2020 14:04:07 +0800
Subject: Re: [PATCH v2 0/6] migration: Multi-thread compression method support
To: Eric Blake <eblake@redhat.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>
References: <20201127093639.2815-1-jinzeyu@huawei.com>
 <2ec8cee7-5330-0e87-f593-464ba789688e@redhat.com>
From: Zeyu Jin <jinzeyu@huawei.com>
Message-ID: <df92d5da-d38c-3b73-488e-2e69c48d2a13@huawei.com>
Date: Tue, 1 Dec 2020 14:04:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2ec8cee7-5330-0e87-f593-464ba789688e@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.211]
X-ClientProxiedBy: dggemi702-chm.china.huawei.com (10.3.20.101) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187; envelope-from=jinzeyu@huawei.com;
 helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/1 0:42, Eric Blake wrote:
> On 11/27/20 3:36 AM, Zeyu Jin wrote:
> 
> Meta-comment: you appear to be having problems threading your series;
> I've now seen three separate cover letters (RFC v1, v2 with no subject,
> v2 with subject) and two series where each patch was a separate thread.
> It is difficult to follow which messages are related when reading in a
> mail client that sorts by most-recently-active thread first.  You may
> want to investigate why your threading is not working, although I'd wait
> to send v3 until you have actual changes to incorporate.
> 

Thank you for noticing that. It`s my mistake when sending patches.
Everything will be fine in v3.

>> Currently we have both multi-thread compression and multifd to optimize
>> live migration in Qemu. Mulit-thread compression deals with the situation
>> where network bandwith is limited but cpu resource adequate. Multifd instead
> 
> Not that typos in the cover letter matter, but this should be 'bandwidth'
>

Yes, I will fix that.

>> aims to take full advantage of network bandwith. Moreover it supports both
>> zlib and zstd compression on each channel.
>>
>> In this patch series, we did some code refactoring on multi-thread compression
>> live migration and bring zstd compression method support for it.
>>
>> Below is the test result of multi-thread compression live migration
>> with different compress methods. Test result shows that zstd outperforms
>> zlib by about 70%.
>>
> 


