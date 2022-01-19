Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB47F4941EF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 21:42:49 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAHn6-0003Yc-HF
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 15:42:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nAHl6-00028h-Kw
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:40:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:65096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nAHl4-0002k2-6D
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 15:40:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20JKYQL7030329; 
 Wed, 19 Jan 2022 20:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=1hGvti9fI+jrhEh8pDPUKCDJKmlrq3YUfKbFhp71Xaw=;
 b=MPKxFkrSLlVD/CaXL15hlWiCZhTKVJL/pfECpkYqRJDHEfTd3lVePb+WYuUZ1QGrOlPb
 MvurqdZ9WX5l448WJfCeaZsUbUCvMIICnA+KfNTJTw1ywjAMl7QQGqx4Pv48Q+IvsNNe
 Hg522m148cmBzpSIkyfq+D7pA7QMO6G522y6hSMcoi8rM0b1lf3I2iQThbIqXkaYZKp1
 w0ytK6KOhLcUnPEUvb3G1Sr/BGQ15W5Dzf+uUT78bunX8v5uCHtgkCGOT/gRLCotsdm/
 TRyg40Sx0R5aSfhq4CbQGbVv8PHudP/HXJEJcwNPyhi2asf6fWnVwiyLUzlstf245Nzr yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpqxsjhep-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:16 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20JKYScv030564;
 Wed, 19 Jan 2022 20:40:15 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dpqxsjheb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:15 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20JKdawN011802;
 Wed, 19 Jan 2022 20:40:14 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3dknwccces-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Jan 2022 20:40:14 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20JKeDkK32244054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 20:40:13 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C556BE059;
 Wed, 19 Jan 2022 20:40:13 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 853B3BE04F;
 Wed, 19 Jan 2022 20:40:12 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jan 2022 20:40:12 +0000 (GMT)
Message-ID: <f26efc04-b895-d7c0-4780-e4cae9c1eeed@linux.ibm.com>
Date: Wed, 19 Jan 2022 15:40:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 2/2] hw/vfio/common: Silence ram device offset
 alignment error traces
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>
References: <20220118153306.282681-1-eric.auger@redhat.com>
 <20220118153306.282681-3-eric.auger@redhat.com>
 <20220119131355.47bafabd.alex.williamson@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220119131355.47bafabd.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ho1N07pTl-BykSsWsUI-JhkbIeMg9AJ
X-Proofpoint-GUID: hCt6HOa9Kty6VlZM_VVF95dEKAlBToqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-19_11,2022-01-19_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201190113
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: cohuck@redhat.com, stefanb@linux.vnet.ibm.com, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/19/22 15:13, Alex Williamson wrote:
> On Tue, 18 Jan 2022 16:33:06 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> Failing to DMA MAP a ram_device should not cause an error message.
>> This is currently happening with the TPM CRB command region and
>> this is causing confusion.
>>
>> We may want to keep the trace for debug purpose though.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   hw/vfio/common.c     | 15 ++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   2 files changed, 15 insertions(+), 1 deletion(-)
> Thanks!  Looks good to me.
>
> Stefan, I can provide an ack here if you want to send a pull request
> for both or likewise I can send a pull request with your ack on the
> previous patch.  I suppose the patches themselves are technically
> independent if you want to split them.  Whichever you prefer.
>
> Acked-by: Alex Williamson <alex.williamson@redhat.com>

If you want to send the PR, please go ahead.

    Stefan

>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 080046e3f5..9caa560b07 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -884,7 +884,20 @@ static void vfio_listener_region_add(MemoryListener *listener,
>>       if (unlikely((section->offset_within_address_space &
>>                     ~qemu_real_host_page_mask) !=
>>                    (section->offset_within_region & ~qemu_real_host_page_mask))) {
>> -        error_report("%s received unaligned region", __func__);
>> +        if (memory_region_is_ram_device(section->mr)) { /* just debug purpose */
>> +            trace_vfio_listener_region_add_bad_offset_alignment(
>> +                memory_region_name(section->mr),
>> +                section->offset_within_address_space,
>> +                section->offset_within_region, qemu_real_host_page_size);
>> +        } else { /* error case we don't want to be fatal */
>> +            error_report("%s received unaligned region %s iova=0x%"PRIx64
>> +                         " offset_within_region=0x%"PRIx64
>> +                         " qemu_real_host_page_mask=0x%"PRIx64,
>> +                         __func__, memory_region_name(section->mr),
>> +                         section->offset_within_address_space,
>> +                         section->offset_within_region,
>> +                         qemu_real_host_page_mask);
>> +        }
>>           return;
>>       }
>>   
>> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
>> index 0ef1b5f4a6..ccd9d7610d 100644
>> --- a/hw/vfio/trace-events
>> +++ b/hw/vfio/trace-events
>> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_t end) "SKIPPING region_add
>>   vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
>>   vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
>> +vfio_listener_region_add_bad_offset_alignment(const char *name, uint64_t iova, uint64_t offset_within_region, uint64_t page_size) "Region \"%s\" @0x%"PRIx64", offset_within_region=0x%"PRIx64", qemu_real_host_page_mask=0x%"PRIx64 " cannot be mapped for DMA"
>>   vfio_listener_region_add_no_dma_map(const char *name, uint64_t iova, uint64_t size, uint64_t page_size) "Region \"%s\" 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and cannot be mapped for DMA"
>>   vfio_listener_region_del_skip(uint64_t start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
>>   vfio_listener_region_del(uint64_t start, uint64_t end) "region_del 0x%"PRIx64" - 0x%"PRIx64

