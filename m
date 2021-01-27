Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9306305B6F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 13:32:23 +0100 (CET)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4jzi-0000Vv-Ee
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 07:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4jyA-0008VG-TG
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:30:47 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2538
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1l4jy6-0005gS-RM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 07:30:46 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10RC48PZ143477
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 07:30:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=reply-to : subject : to
 : cc : references : from : message-id : date : mime-version : in-reply-to
 : content-type : content-transfer-encoding; s=pp1;
 bh=spdJk3Zk45vKNBhdkheN9C5F85WVB40KW/8Q1z2QsNE=;
 b=avbK2IVEShKnZVZoKKaOlMq5jUuR0LMA1NCVvNLNgjVjz/f73DJWReMaUGV4vogGv7Vs
 27zmolhApM6HPQsBNwX2y4aq0ZmJ076lrXRNTY8hvRMjlu/brC0lgGr9j45Thy81k/D2
 XFuxVXPAksX2KpdB9CxUhUrB8vNYbPSRf0HpcVKJHf1Jt4JEJMioKRoET/iLfU0ak2SP
 idUPi/xDZ/6FiY0sWS9ODpEQznGYgT44e9bnPWIOmapetAmpd6En+Srs0OO1qZ9x0oyA
 V3BCRM0av9l96iZfDE50Z8Rl+VfQam9G9LOQ4RFccW6oEUg4h0FO8T/wtNkcCczvdzpm cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36b4g8pjmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 07:30:39 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RC6sat160084
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 07:30:39 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36b4g8pjm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 07:30:39 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RCCnAH008168;
 Wed, 27 Jan 2021 12:30:38 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 36a3qbvdt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Jan 2021 12:30:38 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10RCUc7w24183208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Jan 2021 12:30:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EAB2FBE053;
 Wed, 27 Jan 2021 12:30:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6B0DBE051;
 Wed, 27 Jan 2021 12:30:36 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.85.165.159])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Jan 2021 12:30:36 +0000 (GMT)
Subject: Re: [PATCH] IOMMU and ATS not supported by vhost-user filesystem.
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <e76462fdcfaa07208380e2a7df9b281b6e6717b8.1611685180.git.lagarcia@br.ibm.com>
 <20210127111938.GH299797@stefanha-x1.localdomain>
From: =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?=
 <lagarcia@linux.ibm.com>
Organization: IBM
Message-ID: <b7080a33-a192-45d6-2b02-9cda4ff8c9b4@linux.ibm.com>
Date: Wed, 27 Jan 2021 09:30:35 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210127111938.GH299797@stefanha-x1.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-27_05:2021-01-27,
 2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270063
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: lagarcia@br.ibm.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/21 8:19 AM, Stefan Hajnoczi wrote:
> On Tue, Jan 26, 2021 at 03:23:38PM -0300, lagarcia@linux.ibm.com wrote:
>> From: Leonardo Garcia <lagarcia@br.ibm.com>
>>
>> Currently, as IOMMU and ATS are not supported, if a user mistakenly set
>> any of them and tries to mount the vhost-user filesystem inside the
>> guest, whenever the user tries to access the mount point, the system
>> will hang forever.
>>
>> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
>> ---
>>   hw/virtio/vhost-user-fs-pci.c | 7 +++++++
>>   hw/virtio/vhost-user-fs.c     | 5 +++++
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/hw/virtio/vhost-user-fs-pci.c b/hw/virtio/vhost-user-fs-pci.c
>> index 2ed8492b3f..564d1fd108 100644
>> --- a/hw/virtio/vhost-user-fs-pci.c
>> +++ b/hw/virtio/vhost-user-fs-pci.c
>> @@ -11,6 +11,8 @@
>>    * top-level directory.
>>    */
>>   
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>>   #include "qemu/osdep.h"
>>   #include "hw/qdev-properties.h"
>>   #include "hw/virtio/vhost-user-fs.h"
>> @@ -45,6 +47,11 @@ static void vhost_user_fs_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>>           vpci_dev->nvectors = dev->vdev.conf.num_request_queues + 2;
>>       }
>>   
>> +    if (vpci_dev->flags & VIRTIO_PCI_FLAG_ATS) {
>> +        error_setg(errp, "ATS is currently not supported with vhost-user-fs-pci");
>> +        return;
>> +    }
> Why is this check needed in addition to VIRTIO_F_IOMMU_PLATFORM?


I don't know if VIRTIO_PCI_FLAG_ATS should depend on 
VIRTIO_F_IOMMU_PLATFORM. At least from a code perspective today, they 
are completely independent. A user can specify one or the other or both. 
And if a user specifies VIRTIO_PCI_FLAG_ATS without specifying 
VIRTIO_F_IOMMU_PLATFORM, the same issue described in the original 
message will happen inside the guest.


>
> What needs to be added to support ATS?


Unfortunately I don't know the answer for this question. Hopefully 
someone else can help with this one.


>
>> +
>>       qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>>   }
>>   
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index ac4fc34b36..914d68b3ee 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -203,6 +203,11 @@ static void vuf_device_realize(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>   
>> +    if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM)) {
>> +        error_setg(errp, "IOMMU is currently not supported with vhost-user-fs");
>> +        return;
>> +    }
>> +
>>       if (!vhost_user_init(&fs->vhost_user, &fs->conf.chardev, errp)) {
> I thought IOMMU support depends on the vhost-user device backend (e.g.
> virtiofsd), so the vhost-user backend should participate in advertising
> this feature.
>
> Perhaps the check should be:
>
>      ret = vhost_dev_init(&fs->vhost_dev, &fs->vhost_user,
>                           VHOST_BACKEND_TYPE_USER, 0);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "vhost_dev_init failed");
>          goto err_virtio;
>      }
> +
> +   if (virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM) &&
> +       !(fs->vhost_dev.hdev_features & (1ull << VIRTIO_F_IOMMU_PLATFORM))) {
> +       error_setg(errp, "IOMMU is not supported by the vhost-user device backend");
> +       goto err_iommu_needed;
> +   }
>
> Also, can this logic be made generic for all vhost-user devices? It's
> not really specific to vhost-user-fs.


Sure, I can do that. I wasn't sure whether this restriction was only for 
vhost-user-fs or whether it was generic for all vhost-user devices. I 
will include this in a next version of the patch.


Cheers,


Leo


>
> Stefan

