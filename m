Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C14668FE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 18:19:32 +0100 (CET)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspk3-0007S3-1H
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 12:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mspce-00069v-IW; Thu, 02 Dec 2021 12:11:52 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:6502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mspcb-0001at-7E; Thu, 02 Dec 2021 12:11:52 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GI4VI027729; 
 Thu, 2 Dec 2021 17:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Sa/+ZagnQADdTXXFnvx59r03vaTJo432M8BD5oDVR0I=;
 b=HiHhUgDS/734EWMIl8z/mky1uYhJMcVERDWJ5kjhLXyPyZhSZ/FCb9mpGm6pHmx2G7zd
 PcyA9utPEwqFBe9vnKkcYQljoQXsWzkw2Zht214EosDWdOrOr8aP8UZs1SC3StNL6ncD
 QFO8e1JkXRXva+RfK0B3krzvh+NYktM/8GAB9uQmOxo9qrEpvUEyCFVDrrnlaWhycA1F
 AzwszqlBs4eoCvPI14pu1+065zh/ZOt0XbHXLUQ8gsyk5uNNLvlWxO3ECoaDadwRBeEo
 MKT3tullgtLDVCMwMoPJZvZbUYUU++vinoNZDU7Z22R/Al07FAt8dXFE9d8FEaTMnLCN bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq1hu94nn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 17:11:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2GI2Tt027446;
 Thu, 2 Dec 2021 17:11:43 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cq1hu94mg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 17:11:43 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2H99MU004230;
 Thu, 2 Dec 2021 17:11:41 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3ckcadeywh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 17:11:41 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2HBeTQ25297336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 17:11:40 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45417136053;
 Thu,  2 Dec 2021 17:11:40 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D1DD13604F;
 Thu,  2 Dec 2021 17:11:39 +0000 (GMT)
Received: from [9.211.48.116] (unknown [9.211.48.116])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 17:11:39 +0000 (GMT)
Message-ID: <a5b6d5d7-e11a-9b7a-651f-feda4f2c3781@linux.ibm.com>
Date: Thu, 2 Dec 2021 12:11:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-2-mjrosato@linux.ibm.com>
 <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <123ecaef-0f76-614c-2f6d-cdb824a84f56@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5Pl04zMDWIkEwLp37xxKzJTkw9tNIlyi
X-Proofpoint-ORIG-GUID: iU8MQPdS-DfJoFFK65PSrEOvdz9vm-Xs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_11,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020112
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 11:43 AM, David Hildenbrand wrote:
> On 02.12.21 17:41, Matthew Rosato wrote:
>> The current default PCI group being used can technically collide with a
>> real group ID passed from a hostdev.  Let's instead use a group ID that comes
>> from a special pool that is architected to be reserved for simulated devices.
>>
>> Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   include/hw/s390x/s390-pci-bus.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
>> index aa891c178d..2727e7bdef 100644
>> --- a/include/hw/s390x/s390-pci-bus.h
>> +++ b/include/hw/s390x/s390-pci-bus.h
>> @@ -313,7 +313,7 @@ typedef struct ZpciFmb {
>>   } ZpciFmb;
>>   QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
>>   
>> -#define ZPCI_DEFAULT_FN_GRP 0x20
>> +#define ZPCI_DEFAULT_FN_GRP 0xFF
>>   typedef struct S390PCIGroup {
>>       ClpRspQueryPciGrp zpci_group;
>>       int id;
>>
> 
> What happens if we migrate a VM from old to new QEMU? Won't the guest be
> able to observe the change?
> 

Yes, technically --  But # itself is not really all that important, it 
is provided from CLP Q PCI FN to be subsequently used as input into Q 
PCI FNGRP -- With the fundamental notion being that all functions that 
share the same group # share the same group CLP info.  Whether the 
number is, say, 1 or 5 doesn't matter so much.

However..  0xF0 and greater are the only values reserved for hypervisor 
use.  By using 0x20 we run the risk of accidentally conflating simulated 
devices and real hardware, hence the desire to change it.

Is your concern about a migrated guest with a virtio device trying to do 
a CLP QUERY PCI FNGRP using 0x20 on a new QEMU?  I suppose we could 
modify 'clp_service_call, case CLP_QUERY_PCI_FNGRP' to silently catch 
simulated devices trying to use something other than the default group, 
e.g.:

if ((pbdev->fh & FH_SHM_EMUL) &&
     (pbdev->zpci_fn.pfgid != ZPCI_DEFAULT_FN_GRP)) {
         /* Simulated device MUST have default group */
	pbdev->zpci_fn.pfgid = ZPCI_DEFAULT_FN_GRP;
	group = s390_group_find(ZPCI_DEFAULT_FN_GRP);
}

What do you think?

