Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 156092C9763
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 07:06:22 +0100 (CET)
Received: from localhost ([::1]:39236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjynt-0005Dn-2D
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 01:06:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjymc-000491-NY
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:05:03 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinzeyu@huawei.com>)
 id 1kjyma-0002Xp-Ga
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 01:05:02 -0500
Received: from DGGEMM405-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ClWl05PZSzVhhJ;
 Tue,  1 Dec 2020 14:04:12 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 DGGEMM405-HUB.china.huawei.com (10.3.20.213) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 1 Dec 2020 14:04:56 +0800
Received: from [10.174.187.211] (10.174.187.211) by
 dggemi758-chm.china.huawei.com (10.1.198.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Tue, 1 Dec 2020 14:04:55 +0800
Subject: Re: [PATCH v2 4/6] migration: Add zstd support in multi-thread
 compression
To: Eric Blake <eblake@redhat.com>, <quintela@redhat.com>,
 <dgilbert@redhat.com>
References: <20201127093215.2659-1-jinzeyu@huawei.com>
 <3bd561fd-0503-308a-e728-1509375663d2@redhat.com>
From: Zeyu Jin <jinzeyu@huawei.com>
Message-ID: <9d7bf255-96b3-8b3b-ba43-dd6e333ece3c@huawei.com>
Date: Tue, 1 Dec 2020 14:04:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3bd561fd-0503-308a-e728-1509375663d2@redhat.com>
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
Cc: Ying Fang <fangying1@huawei.com>, qemu-devel@nongnu.org,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2020/12/1 0:43, Eric Blake wrote:
> On 11/27/20 3:32 AM, Zeyu Jin wrote:
>> This patch enables zstd option in multi-thread compression.
>>
>> Signed-off-by: Zeyu Jin <jinzeyu@huawei.com>
>> Signed-off-by: Ying Fang <fangying1@huawei.com>
>> ---
> 
>> +++ b/qapi/migration.json
>> @@ -536,7 +536,7 @@
>>  #
>>  ##
>>  { 'enum': 'CompressMethod',
>> -  'data': [ 'zlib' ] }
>> +  'data': [ 'zlib', { 'name': 'zstd', 'if': 'defined(CONFIG_ZSTD)' } ] }
> 
> Missing documentation of the new value, including a '(since 6.0)' marker.
> 

Yes, will fix it.

