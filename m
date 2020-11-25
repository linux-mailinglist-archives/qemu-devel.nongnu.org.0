Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A5C2C47EE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:54:31 +0100 (CET)
Received: from localhost ([::1]:46668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzvy-0003fI-BG
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khzu7-0002x0-5S
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:52:35 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1khzu5-0004mi-38
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:52:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbea7ef0000>; Wed, 25 Nov 2020 10:52:31 -0800
Received: from [10.40.101.61] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 25 Nov
 2020 18:52:26 +0000
Subject: Re: [PATCH 1/1] Fix to show vfio migration stat in migration status
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1605731327-23533-1-git-send-email-kwankhede@nvidia.com>
 <20201125093036.GA3222@work-vm>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <debd3545-1d63-f0e4-784f-a968119f0137@nvidia.com>
Date: Thu, 26 Nov 2020 00:22:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201125093036.GA3222@work-vm>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606330351; bh=mQ+TTwgSRscZTphOD7t1MPHhnIZOGS54QPWNd1tncxQ=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=jWdEHdG9bxpCw+y6iar2H3lKMEJykfm7giJK0Lc1+947ZjYJR7gntWFGu95AYB9a4
 xiDr8RR9dZb0gxpD9fuDylg02ch6ocnmqJciZ64uwO6Ol334vTzobCCzFuVHb/bDf4
 XMm6dokU8modqAfjSw2VhRJnI+RFRsyJi4cUy2x3rGvhBzckWkZ5/xFj4LnHwPkyk6
 sUL0w9IHpwoS18gboHFKImDJxFEuQgG1l6aIBCBBFq4G1s5SCbpiA8n6G0UfPRq8ds
 fppmRXMCsTn/0Tk5amm/6zC48VS6qADZ7/nyDAGGjfjNLTDPZ55cbTj2FDe1ljNbl3
 LtrvJoiBw7Hzg==
Received-SPF: pass client-ip=216.228.121.65; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate26.nvidia.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: alex.williamson@redhat.com, cjia@nvidia.com, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/25/2020 3:00 PM, Dr. David Alan Gilbert wrote:
> * Kirti Wankhede (kwankhede@nvidia.com) wrote:
>> Header file where CONFIG_VFIO is defined is not included in migration.c
>> file. Include config devices header file in migration.c.
>>
>> Fixes: 3710586caa5d ("qapi: Add VFIO devices migration stats in Migration
>> stats")
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
> 
> Given it's got build problems; I suggest actually something cleaner
> would be to swing populate_vfio_info into one of the vfio specific
> files, add a stubs/ entry somewhere and then migration.c doesn't need
> to include the device or header stuff.
> 

Still function prototype for populate_vfio_info() and its stub has to be 
placed in some header file.

Earlier I used CONFIG_LINUX instead of CONFIG_VFIO which works here. 
Should I change it back to CONFIG_LINUX?

I'm not very much aware of meson build system, I tested by configuring 
specific target, but I think by default if target build is not specified 
during configuration, it builds for multiple target that's where this 
build is failing. Any help on how to fix it would be helpful.

Thanks,
Kirti

> Dave
> 
>> ---
>>   meson.build           | 1 +
>>   migration/migration.c | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/meson.build b/meson.build
>> index 7ddf983ff7f5..24526499cfb5 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -1713,6 +1713,7 @@ common_ss.add_all(when: 'CONFIG_USER_ONLY', if_true: user_ss)
>>   
>>   common_all = common_ss.apply(config_all, strict: false)
>>   common_all = static_library('common',
>> +                            c_args:'-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target) ,
>>                               build_by_default: false,
>>                               sources: common_all.sources() + genh,
>>                               dependencies: common_all.dependencies(),
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 87a9b59f83f4..650efb81daad 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -57,6 +57,7 @@
>>   #include "qemu/queue.h"
>>   #include "multifd.h"
>>   
>> +#include CONFIG_DEVICES
>>   #ifdef CONFIG_VFIO
>>   #include "hw/vfio/vfio-common.h"
>>   #endif
>> -- 
>> 2.7.0
>>

