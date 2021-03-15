Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7633B49E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 14:32:56 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLnL5-0000HC-17
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 09:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lLnJb-000833-Oz; Mon, 15 Mar 2021 09:31:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51818
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lLnJZ-0006BK-Ug; Mon, 15 Mar 2021 09:31:23 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FDKr9w169117; Mon, 15 Mar 2021 09:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8YKO5oQT2gL3p3BrmUlC7B4AExaa1NoSZk8RU1PbKq8=;
 b=Y6RiieuGPBLje0f1gzK3dZkferagd1qfGvFZh7bYwh9iHujKIDjkWwcURRZ6q/iHiKKN
 P/+FXLCPWTe5B7LGTKC0FPYrUX0HZBPVPSnYemZchrc+Z/KWk4opWdogNQDi2IkqO/p0
 CzHOM0OGTSrpEg0ZqANnA4fHyLPXIXCNuMEdIxPoFZYxtNgyx4CXiNISl1unIDSeUvsv
 174Ty5R1mGdqZrI+1FoP+SRecFphLHoxXRe1lo0xw3QDWyFvQclIatVSfvf/6ESAXFMo
 xnLZsxDa+VtuTqnjZHAv4N3TW8hnUtnWAuby6Agba0uYlkUj/X/cJU+mmvns0gN+6s4F MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379rh4bynt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 09:31:16 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FDLfuh174437;
 Mon, 15 Mar 2021 09:31:16 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379rh4bynd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 09:31:16 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FDQf1U006804;
 Mon, 15 Mar 2021 13:31:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 378ubt5nvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 13:31:15 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FDVFv228836142
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 13:31:15 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF9BAC065;
 Mon, 15 Mar 2021 13:31:15 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7D10AC062;
 Mon, 15 Mar 2021 13:31:13 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.151.219])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 13:31:13 +0000 (GMT)
Subject: Re: [PATCH v3] Add missing initialization for g_autofree variables
To: Cornelia Huck <cohuck@redhat.com>, mrezanin@redhat.com
References: <20210315101352.152888-1-mrezanin@redhat.com>
 <20210315114232.4bb6654e.cohuck@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <fcc3b5ae-2211-735a-f583-94fff4497404@linux.ibm.com>
Date: Mon, 15 Mar 2021 09:31:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315114232.4bb6654e.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_05:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150091
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 6:42 AM, Cornelia Huck wrote:
> On Mon, 15 Mar 2021 11:13:52 +0100
> mrezanin@redhat.com wrote:
> 
>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>
>> When declaring g_autofree variable without inicialization, compiler
>> will raise "may be used uninitialized in this function" warning due
>> to automatic free handling.
>>
>> This is mentioned in docs/devel/style.rst (quote from section
>> "Automatic memory deallocation"):
>>
>>    * Variables declared with g_auto* MUST always be initialized,
>>      otherwise the cleanup function will use uninitialized stack memory
>>
>> Add inicialization for these declarations to prevent the warning and
>> comply with coding style.
> 
> Fixes: cd7498d07fbb ("s390x/pci: Add routine to get the vfio dma available count")
> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
> 
> I can fix the spelling mistakes pointed out by Phil while applying, and
> also add an 's390x/pci' prefix.
> 
> Would not mind a quick test run from someone with the hardware.

Sure, I took this for a spin (ConnectX-3 VF via vfio-pci) and made sure 
both code paths were being driven without issue.  Code looks fine as well.

Tested-by: Matthew Rosato <mjrosato@linux.ibm.com>

> 
>>
>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>
>> ---
>> * v3:
>>    -- allocate in s390_pci_update_dma_avail instead of NULL init
>>
>> * v2:
>>    -- Removed fixes in hw/remote/memory.c and hw/remote/proxy.c
>>       fixed by patch sent by Zenghui Yu (multi-process: Initialize
>>       variables declared with g_auto*)
>> ---
>>   hw/s390x/s390-pci-vfio.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
>> index ead4f222d5..2a153fa8c9 100644
>> --- a/hw/s390x/s390-pci-vfio.c
>> +++ b/hw/s390x/s390-pci-vfio.c
>> @@ -29,14 +29,11 @@
>>    */
>>   bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
>>   {
>> -    g_autofree struct vfio_iommu_type1_info *info;
>> -    uint32_t argsz;
>> +    uint32_t argsz = sizeof(struct vfio_iommu_type1_info);
>> +    g_autofree struct vfio_iommu_type1_info *info = g_malloc0(argsz);
>>   
>>       assert(avail);
>>   
>> -    argsz = sizeof(struct vfio_iommu_type1_info);
>> -    info = g_malloc0(argsz);
>> -
>>       /*
>>        * If the specified argsz is not large enough to contain all capabilities
>>        * it will be updated upon return from the ioctl.  Retry until we have
>> @@ -230,7 +227,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
>>    */
>>   void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
>>   {
>> -    g_autofree struct vfio_device_info *info;
>> +    g_autofree struct vfio_device_info *info = NULL;
>>       VFIOPCIDevice *vfio_pci;
>>       uint32_t argsz;
>>       int fd;
> 


