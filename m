Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C184E6473
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:53:08 +0100 (CET)
Received: from localhost ([::1]:40332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNtj-0006oa-Ae
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:53:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nXNoI-0004X2-AA; Thu, 24 Mar 2022 09:47:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54330
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nXNoG-0007Q7-6W; Thu, 24 Mar 2022 09:47:30 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ODbFhW019916; 
 Thu, 24 Mar 2022 13:47:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oBHFVUPYMkODOlLsMs4YB6IrQTkvATvsjTZE1SPOdlI=;
 b=O2R4OpXDuxN4enoqC81Na6hHlJW/1Nvr+gpr3TVK/Ztbt5gz2dv6Dxa8TUjtGOAvWhUo
 K/7FGLWz+IRrsyjRjE9UvIoqLglCVv3oNLz/bB4uyUhxqksPLgjM47mPXI0rzug0WTLF
 U/3QBEhs+BPW1e7pVHY0tnXrt9haf7vK5/XnHqLLYhEsBeTc/xInWtVKgDf/m+Jcccn7
 xbW653rK/er1UTU3naP40PRmt5U2JCvO+jZ1G4dZl7AK0I95Nzded2tShvVua6PK4T8L
 rB+CPRIS6NfSphob56U9Kobtp06WJQ8G3ltga9WfTnRgCt73Y+B5Ym6SbFaVueqscMk3 uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0pxcve38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 13:47:17 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22ODfMoS002214;
 Thu, 24 Mar 2022 13:47:17 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f0pxcve29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 13:47:17 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22ODe4Sd009264;
 Thu, 24 Mar 2022 13:47:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3ew6ej1fmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 13:47:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22ODZRic44564900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Mar 2022 13:35:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E707A405C;
 Thu, 24 Mar 2022 13:47:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D487FA4054;
 Thu, 24 Mar 2022 13:47:12 +0000 (GMT)
Received: from [9.145.154.27] (unknown [9.145.154.27])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 24 Mar 2022 13:47:12 +0000 (GMT)
Message-ID: <5a482e34-cadc-571a-360a-fb5ede7d8a2d@linux.ibm.com>
Date: Thu, 24 Mar 2022 14:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] pcie: Don't try triggering a LSI when not defined
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, clg@kaod.org,
 mst@redhat.com, marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
 <20220321153357.165775-2-fbarrat@linux.ibm.com>
 <d0eaf24b-9eff-cfd4-4827-c738e238b5e6@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <d0eaf24b-9eff-cfd4-4827-c738e238b5e6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dd2EeCJQwOj5mrRlri5zI_wegCItJ9zU
X-Proofpoint-ORIG-GUID: yGBJBZaDPj5DBOhNXYnf6ZE5dW8mrpA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240077
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 24/03/2022 14:07, Daniel Henrique Barboza wrote:
> 
> 
> On 3/21/22 12:33, Frederic Barrat wrote:
>> This patch skips [de]asserting a LSI interrupt if the device doesn't
>> have any LSI defined. Doing so would trigger an assert in
>> pci_irq_handler().
>>
>> The PCIE root port implementation in qemu requests a LSI (INTA), but a
>> subclass may want to change that behavior since it's a valid
>> configuration. For example on the POWER8/POWER9/POWER10 systems, the
>> root bridge doesn't request any LSI.
>>
>> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
>> ---
> 
> I assume that it's easier to handle just the codepaths that powernv PHBs 
> uses
> rather than handling all instances where pci_irq_handler() would be 
> asserting
> without LSIs.


The real reason is that the LSI is added when we realize the 
TYPE_PCIE_ROOT_PORT object. See rp_realize(). So I'm only trying to fix 
the code paths that can be called from a subclass of TYPE_PCIE_ROOT_PORT 
which would choose to override the "interrupt pin" setting in the config 
space. I believe they are all covered by this patch.
The assert() in pci_irq_handler() is there for a reason and I don't want 
to mess with that.

   Fred


> 
> 
> Patch LGTM. Small nits below:
> 
>>   hw/pci/pcie.c     | 8 ++++++--
>>   hw/pci/pcie_aer.c | 4 +++-
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 67a5d67372..71c5194b80 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -354,7 +354,9 @@ static void hotplug_event_notify(PCIDevice *dev)
>>       } else if (msi_enabled(dev)) {
>>           msi_notify(dev, pcie_cap_flags_get_vector(dev));
>>       } else {
>> -        pci_set_irq(dev, dev->exp.hpev_notified);
>> +        if (pci_intx(dev) != -1) {
>> +            pci_set_irq(dev, dev->exp.hpev_notified);
>> +        }
> 
> 
> Since you're not doing anything unless the condition is met, you can use 
> 'else if'
> like it's done in the other conditionals:
> 
> 
>      if (msix_enabled(dev)) {
>          msix_notify(dev, pcie_cap_flags_get_vector(dev));
>      } else if (msi_enabled(dev)) {
>          msi_notify(dev, pcie_cap_flags_get_vector(dev));
>      } else if (pci_intx(dev) != -1) {
>          pci_set_irq(dev, dev->exp.hpev_notified);
>      }
> 
> 
> 
>>       }
>>   }
>> @@ -362,7 +364,9 @@ static void hotplug_event_clear(PCIDevice *dev)
>>   {
>>       hotplug_event_update_event_status(dev);
>>       if (!msix_enabled(dev) && !msi_enabled(dev) && 
>> !dev->exp.hpev_notified) {
>> -        pci_irq_deassert(dev);
>> +        if (pci_intx(dev) != -1) {
>> +            pci_irq_deassert(dev);
>> +        }
>>       }
> 
> Similar comment here:
> 
>      if (!msix_enabled(dev) && !msi_enabled(dev) && 
> !dev->exp.hpev_notified &&
>          pci_intx(dev) != -1) {
>          pci_irq_deassert(dev);
>      }
> 
> 
> 
>>   }
>> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
>> index e1a8a88c8c..d936bfca20 100644
>> --- a/hw/pci/pcie_aer.c
>> +++ b/hw/pci/pcie_aer.c
>> @@ -291,7 +291,9 @@ static void pcie_aer_root_notify(PCIDevice *dev)
>>       } else if (msi_enabled(dev)) {
>>           msi_notify(dev, pcie_aer_root_get_vector(dev));
>>       } else {
>> -        pci_irq_assert(dev);
>> +        if (pci_intx(dev) != -1) {
>> +            pci_irq_assert(dev);
>> +        }
> 
> 
> And here:
> 
>      if (msix_enabled(dev)) {
>          msix_notify(dev, pcie_aer_root_get_vector(dev));
>      } else if (msi_enabled(dev)) {
>          msi_notify(dev, pcie_aer_root_get_vector(dev));
>      } else if (pci_intx(dev) != -1) {
>          pci_irq_assert(dev);
>      }
> 
> 
> 
> Thanks,
> 
> 
> Daniel
> 
>>       }
>>   }

