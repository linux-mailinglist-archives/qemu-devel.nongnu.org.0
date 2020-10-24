Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D258297E6E
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Oct 2020 22:29:34 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWQAP-0002jT-HM
	for lists+qemu-devel@lfdr.de; Sat, 24 Oct 2020 16:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWQ93-0002I5-NK
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 16:28:09 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1kWQ90-0003xZ-QZ
 for qemu-devel@nongnu.org; Sat, 24 Oct 2020 16:28:09 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f948e5a0000>; Sat, 24 Oct 2020 13:28:10 -0700
Received: from [10.40.102.184] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 24 Oct
 2020 20:27:47 +0000
Subject: Re: [PATCH v28 05/17] vfio: Add VM state change handler to know state
 of VM
To: Cornelia Huck <cohuck@redhat.com>
References: <1603449643-12851-1-git-send-email-kwankhede@nvidia.com>
 <1603449643-12851-6-git-send-email-kwankhede@nvidia.com>
 <20201023133235.306a7b3e.cohuck@redhat.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <7beba676-6369-59aa-2be0-45309f78939c@nvidia.com>
Date: Sun, 25 Oct 2020 01:57:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201023133235.306a7b3e.cohuck@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603571290; bh=dwouiu9IXs+JTM3uuaMsF/Z1Q9Mb7+2/ij+FOMDmWdQ=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=lpXaMhegoiQ2fEMz9ZZI3mH3hm6YnCaTo+bFOgHRxepiqKOttyDpkKgbWKXdT2IZ2
 WuQarkQMZ6CjCOpVOW8fC7Q9joOywV20rgW0WUsFePFu8Ytoe9KC1/nenFkHwndlfV
 R2eyffLdulqbPPM8dHM6tfyLDl6rtPUjKWRlLlCU2Y5eelOivR5cm/11AuXmRnY+/c
 NQ6UhnoSuJ4IJd8n87wc/gko+t94+3Z2VKJfSPFY3xNVvjHF/EA3OlaS9xAEvYmPXQ
 opJw1iHsOR16eZG3TFNDBEr9RiD5xHXYqqAFIpBet67zdppvL1h4trrhFfCHj4YuzF
 P/97CCaCGG0Iw==
Received-SPF: pass client-ip=216.228.121.64; envelope-from=kwankhede@nvidia.com;
 helo=hqnvemgate25.nvidia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/24 16:22:55
X-ACL-Warn: Detected OS   = Windows 7 or 8 [fuzzy]
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.107, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: cjia@nvidia.com, zhi.wang.linux@gmail.com, aik@ozlabs.ru,
 Zhengxiao.zx@Alibaba-inc.com, shuangtai.tst@alibaba-inc.com,
 qemu-devel@nongnu.org, peterx@redhat.com, eauger@redhat.com, artemp@nvidia.com,
 yi.l.liu@intel.com, quintela@redhat.com, ziye.yang@intel.com,
 armbru@redhat.com, mlevitsk@redhat.com, pasic@linux.ibm.com,
 felipe@nutanix.com, zhi.a.wang@intel.com, mcrossley@nvidia.com,
 kevin.tian@intel.com, yan.y.zhao@intel.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, changpeng.liu@intel.com, eskultet@redhat.com,
 Ken.Xue@amd.com, jonathan.davies@nutanix.com, pbonzini@redhat.com,
 dnigam@nvidia.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/23/2020 5:02 PM, Cornelia Huck wrote:
> On Fri, 23 Oct 2020 16:10:31 +0530
> Kirti Wankhede <kwankhede@nvidia.com> wrote:
> 
>> VM state change handler is called on change in VM's state. Based on
>> VM state, VFIO device state should be changed.
>> Added read/write helper functions for migration region.
>> Added function to set device_state.
>>
>> Signed-off-by: Kirti Wankhede <kwankhede@nvidia.com>
>> Reviewed-by: Neo Jia <cjia@nvidia.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Hm, this version looks a bit different from the one Dave gave his R-b
> for... does it still apply?
> 

I would defer that to Dave.

>> ---
>>   hw/vfio/migration.c           | 156 ++++++++++++++++++++++++++++++++++++++++++
>>   hw/vfio/trace-events          |   2 +
>>   include/hw/vfio/vfio-common.h |   4 ++
>>   3 files changed, 162 insertions(+)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 

Thanks.

Kirti

