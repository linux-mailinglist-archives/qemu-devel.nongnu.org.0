Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B664FE58F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 18:09:44 +0200 (CEST)
Received: from localhost ([::1]:42230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neJ5K-0005W9-PG
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 12:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1neJ3P-0003Ig-2A; Tue, 12 Apr 2022 12:07:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1neJ3L-0002ef-Ob; Tue, 12 Apr 2022 12:07:42 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CEn315007257; 
 Tue, 12 Apr 2022 16:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yIvej3iwwHUtmTFinJCTkrlzYgckXvRBsHwafw6lDPw=;
 b=G9j1Wwga8Lv3Ectvme9AVyH3Sm/LSuqV9F5XfkTO5GXGDmuImslP1/5uBmMi4ZGWqQHW
 bR/Od4GxJmlpoVAMRypatRLM+nSLddx0g0ReU3jOLFHN5beipwTtE0NbQk7dToh/SLD1
 IA0l/cNwnVnrxIXn0t5Lk5adNRyHjAHEBRMUiOqaESvzxGgeuIgNLmcqcuRUHYMv2/UO
 DloEi+grY3R8LJ++HpgUGnE9Xgo/XcZNWcFfvSBgVXn1+cESkym1/skEbgAUNIy5pl/+
 2Sa4xuFErw0jsGnWWG9deHHdaNHMCYjxFs3dQtQVzQYZ9Qk8VxOwZfX6CyuTD3vcz/sw Hg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcqj62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:07:34 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CFlnIR009252;
 Tue, 12 Apr 2022 16:07:34 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fd7wcqj5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:07:34 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CG5jLu019219;
 Tue, 12 Apr 2022 16:07:33 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04dal.us.ibm.com with ESMTP id 3fb1sa7gwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:07:33 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CG7Wv660948778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:07:32 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3751BAE060;
 Tue, 12 Apr 2022 16:07:32 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A69AE066;
 Tue, 12 Apr 2022 16:07:28 +0000 (GMT)
Received: from [9.211.106.50] (unknown [9.211.106.50])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:07:28 +0000 (GMT)
Message-ID: <791ee8c8-a2f4-6644-7155-3bacdb3c4074@linux.ibm.com>
Date: Tue, 12 Apr 2022 12:07:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/9] vfio: tolerate migration protocol v1 uapi renames
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
References: <20220404181726.60291-1-mjrosato@linux.ibm.com>
 <20220404181726.60291-3-mjrosato@linux.ibm.com>
 <ed4889b8-28c4-a3ed-b5ef-add3999023d4@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <ed4889b8-28c4-a3ed-b5ef-add3999023d4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 43HutTQlPVGmz0MTTffho9KELnIgSbfV
X-Proofpoint-ORIG-GUID: xUkD-T19euwEHGtuEX7l6m3YABEbOXFa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120077
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, schnelle@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/12/22 11:50 AM, Pierre Morel wrote:
> 
> 
> On 4/4/22 20:17, Matthew Rosato wrote:
>> The v1 uapi is deprecated and will be replaced by v2 at some point;
>> this patch just tolerates the renaming of uapi fields to reflect
>> v1 / deprecated status.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   hw/vfio/common.c    |  2 +-
>>   hw/vfio/migration.c | 19 +++++++++++--------
>>   2 files changed, 12 insertions(+), 9 deletions(-)
> 
> 
> I do not understand why you need this patch in this series.
> Shouldn't it be separate?

This patch is included because of the patch 1 kernel header sync, which 
pulls in uapi headers from kernel version 5.18-rc1 + my unmerged kernel 
uapi changes.

This patch is unnecessary without a header sync (and in fact would break 
QEMU compile), and is unrelated to the rest of the series -- but QEMU 
will not compile without it once you update linux uapi headers to 
5.18-rc1 (or greater) due to the v1 uapi for vfio migration being 
deprecated [1].  This means that ANY series that does a linux header 
sync starting from here on will need something like this patch to go 
along with the header sync (or a series that replaces v1 usage with v2?).

If this patch looks good it could be included whenever a header sync is 
next needed, doesn't necessarily have to be with this series.

[1] https://www.spinics.net/lists/kernel/msg4288200.html

> 
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 080046e3f5..7b1e12fb69 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -380,7 +380,7 @@ static bool 
>> vfio_devices_all_running_and_saving(VFIOContainer *container)
>>                   return false;
>>               }
>> -            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
>> +            if ((migration->device_state & 
>> VFIO_DEVICE_STATE_V1_SAVING) &&
>>                   (migration->device_state & 
>> VFIO_DEVICE_STATE_RUNNING)) {
>>                   continue;
>>               } else {
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index ff6b45de6b..e109cee551 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
>>       }
>>       ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
>> -                                   VFIO_DEVICE_STATE_SAVING);
>> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>>       if (ret) {
>>           error_report("%s: Failed to set state SAVING", vbasedev->name);
>>           return ret;
>> @@ -532,7 +532,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, 
>> void *opaque)
>>       int ret;
>>       ret = vfio_migration_set_state(vbasedev, 
>> ~VFIO_DEVICE_STATE_RUNNING,
>> -                                   VFIO_DEVICE_STATE_SAVING);
>> +                                   VFIO_DEVICE_STATE_V1_SAVING);
>>       if (ret) {
>>           error_report("%s: Failed to set state STOP and SAVING",
>>                        vbasedev->name);
>> @@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, 
>> void *opaque)
>>           return ret;
>>       }
>> -    ret = vfio_migration_set_state(vbasedev, 
>> ~VFIO_DEVICE_STATE_SAVING, 0);
>> +    ret = vfio_migration_set_state(vbasedev, 
>> ~VFIO_DEVICE_STATE_V1_SAVING, 0);
>>       if (ret) {
>>           error_report("%s: Failed to set state STOPPED", 
>> vbasedev->name);
>>           return ret;
>> @@ -730,7 +730,7 @@ static void vfio_vmstate_change(void *opaque, bool 
>> running, RunState state)
>>            * start saving data.
>>            */
>>           if (state == RUN_STATE_SAVE_VM) {
>> -            value = VFIO_DEVICE_STATE_SAVING;
>> +            value = VFIO_DEVICE_STATE_V1_SAVING;
>>           } else {
>>               value = 0;
>>           }
>> @@ -768,8 +768,9 @@ static void vfio_migration_state_notifier(Notifier 
>> *notifier, void *data)
>>       case MIGRATION_STATUS_FAILED:
>>           bytes_transferred = 0;
>>           ret = vfio_migration_set_state(vbasedev,
>> -                      ~(VFIO_DEVICE_STATE_SAVING | 
>> VFIO_DEVICE_STATE_RESUMING),
>> -                      VFIO_DEVICE_STATE_RUNNING);
>> +                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
>> +                                         VFIO_DEVICE_STATE_RESUMING),
>> +                                       VFIO_DEVICE_STATE_RUNNING);
>>           if (ret) {
>>               error_report("%s: Failed to set state RUNNING", 
>> vbasedev->name);
>>           }
>> @@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, 
>> Error **errp)
>>           goto add_blocker;
>>       }
>> -    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
>> -                                   VFIO_REGION_SUBTYPE_MIGRATION, 
>> &info);
>> +    ret = vfio_get_dev_region_info(vbasedev,
>> +                                   
>> VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
>> +                                   
>> VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
>> +                                   &info);
>>       if (ret) {
>>           goto add_blocker;
>>       }
>>
> 


