Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0E53D2701
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:48:08 +0200 (CEST)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6avf-0001WE-RD
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6atO-0006zf-1k
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:45:46 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1m6atL-0000Jc-OY
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:45:45 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4GVxX81xxFz7y37;
 Thu, 22 Jul 2021 23:42:00 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 23:45:40 +0800
Received: from [10.174.187.128] (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 22 Jul 2021 23:45:39 +0800
Subject: Re: [PATCH for-6.2 v2 04/11] machine: Use the computed parameters to
 calculate omitted cpus
To: Andrew Jones <drjones@redhat.com>
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <20210719032043.25416-5-wangyanan55@huawei.com>
 <20210719164203.r3f4qdbw3y3ieghb@gator>
 <ddf16035-d99f-9974-aec6-5bd0466205ed@huawei.com>
 <20210722122737.6zncj26bgjevflyh@gator>
 <6a75b589-3ad7-5a81-5804-3f9d07864a7c@huawei.com>
 <20210722150505.okdd6fv6dnkv6rcn@gator>
From: "wangyanan (Y)" <wangyanan55@huawei.com>
Message-ID: <d1a02031-cd0a-98d9-3eb5-9f643378b4e3@huawei.com>
Date: Thu, 22 Jul 2021 23:45:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210722150505.okdd6fv6dnkv6rcn@gator>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggeme718-chm.china.huawei.com (10.1.199.114) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.203,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard
 Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Halil Pasic <pasic@linux.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2021/7/22 23:05, Andrew Jones wrote:
> On Thu, Jul 22, 2021 at 10:59:11PM +0800, wangyanan (Y) wrote:
>> Ok. If we remove the rounding, then the calculation code has to be modified
>> to be like the following. We have to separately consider the case that cpus
>> and maxcpus are both omitted (e.g. -smp sockets=16).
>>
>> maxcpus = maxcpus > 0 ? maxcpus : cpus;
>>
>> if (cpus == 0 && maxcpus == 0) {
>>      sockets = sockets > 0 ? sockets : 1;
>>      cores = cores > 0 ? cores : 1;
>>      threads = threads > 0 ? threads : 1;
>>      goto cal;
>> }
>>
>> if (sockets == 0) {
>> ...
>> } else if (cores == 0) {
>> ...
>> } else if (threads == 0) {
>> ...
>> }
>>
>> cal:
>> maxcpus = maxcpus > 0 ? maxcpus : sockets * cores * threads;
>> cpus = cpus > 0 ? cpus : maxcpus;
> Whatever works, but hopefully you can avoid an ugly goto.
>
Well, it can be avoided.

Thanks,
Yanan


