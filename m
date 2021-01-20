Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982132FD2FC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:49:47 +0100 (CET)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Enq-0002ud-KZ
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:49:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2EkD-0007I2-4T; Wed, 20 Jan 2021 09:46:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1l2Ek8-0004xw-RA; Wed, 20 Jan 2021 09:46:00 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KEUnNt053668; Wed, 20 Jan 2021 09:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WZjW+0gnh152lBTJYPJl493B4A9UP1fS18JXIuiLX8c=;
 b=D7x7hZtm0SinIyGBrVH82DkX9gwQvx9lfTz7iu2OhkKNe0NGMk51IF+3+F/f2Vkm0N9z
 oTrcpo7YNdtrkCPhZcJ8CfdMIv+ttLJHwZ15H7lr72gZoOZq/QDkTWaF/yBCUGm2KmWX
 cAthyWiHzLKqNlujPIYmZVkMET3McarlL81XVShE2WBX7ECPnnSzwWAqeVIDQKfsYpoX
 Gtx/6uIRWvy+CWhSjiXdkUzz59MvFJvuAoeA7mSFHxBveoo00JpqEv52VdBvqVjECS21
 gup4rziFa1bzREfoVtZkHAml+gj7AissO+K1tuJ8aSCG0CYycPMPxDGUW0LhUv794EIh cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366mr8kpmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 09:45:53 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KEVCUq054858;
 Wed, 20 Jan 2021 09:45:53 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366mr8kpma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 09:45:53 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KEbiPp003050;
 Wed, 20 Jan 2021 14:45:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3668parr44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 14:45:51 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KEjncq37486848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 14:45:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED7084C046;
 Wed, 20 Jan 2021 14:45:48 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A22F4C040;
 Wed, 20 Jan 2021 14:45:48 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.39.155])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jan 2021 14:45:48 +0000 (GMT)
Subject: Re: [PATCH 0/8] s390x/pci: Fixing s390 vfio-pci ISM support
To: Matthew Rosato <mjrosato@linux.ibm.com>, cohuck@redhat.com,
 thuth@redhat.com
References: <1611089059-6468-1-git-send-email-mjrosato@linux.ibm.com>
 <511aebd3-fc4f-d7d3-32c2-27720fb38fe8@linux.ibm.com>
 <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <a1d1df76-07df-9879-ae77-ff677efdd291@linux.ibm.com>
Date: Wed, 20 Jan 2021 15:45:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <15dbd981-7dda-2526-8f13-52ead6298ef1@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_05:2021-01-20,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101200083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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
Cc: schnelle@linux.ibm.com, david@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, alex.williamson@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/20/21 3:03 PM, Matthew Rosato wrote:
> On 1/20/21 4:12 AM, Pierre Morel wrote:
>>
>>
>> On 1/19/21 9:44 PM, Matthew Rosato wrote:
>>> Today, ISM devices are completely disallowed for vfio-pci passthrough as
>>> QEMU rejects the device due to an (inappropriate) MSI-X check.  Removing
>>> this fence, however, reveals additional deficiencies in the s390x PCI
>>> interception layer that prevent ISM devices from working correctly.
>>> Namely, ISM block write operations have particular requirements in 
>>> regards
>>> to the alignment, size and order of writes performed that cannot be
>>> guaranteed when breaking up write operations through the typical
>>> vfio_pci_bar_rw paths. Furthermore, ISM requires that legacy/non-MIO
>>> s390 PCI instructions are used, which is also not guaranteed when the 
>>> I/O
>>> is passed through the typical userspace channels.
>>>
>>> This patchset provides a set of fixes related to enabling ISM device
>>> passthrough and includes patches to enable use of a new vfio region that
>>> will allow s390x PCI pass-through devices to perform s390 PCI 
>>> instructions
>>> in such a way that the same instruction issued on the guest is re-issued
>>> on the host.
>>>
>>> Associated kernel patchset:
>>> https://lkml.org/lkml/2021/1/19/874
>>>
>>> Changes from RFC -> v1:
>>> - Refresh the header sync (built using Eric's 'update-linux-headers:
>>> Include const.h' + manually removed pvrdma_ring.h again)
>>> - Remove s390x/pci: fix pcistb length (already merged)
>>> - Remove s390x/pci: Fix memory_region_access_valid call (already merged)
>>> - Fix bug: s390_pci_vfio_pcistb should use the pre-allocated PCISTB
>>> buffer pcistb_buf rather than allocating/freeing its own.
>>> - New patch: track the PFT (PCI Function Type) separately from guest CLP
>>> response data -- we tell the guest '0' for now due to limitations in
>>> measurement block support, but we can still use the real value 
>>> provided via
>>> the vfio CLP capabilities to make decisions.
>>> - Use the PFT (pci function type) to determine when to use the region
>>> for PCISTB/PCILG (only for ISM), rather than using the relaxed alignment
>>> bit.
>>> - As a result, the pcistb_default is now updated to also handle the
>>> possibility of relaxed alignment via 2 new functions, 
>>> pcistb_validate_write
>>> and pcistb_write, which serve as wrappers to the memory_region calls.
>>> - New patch, which partially restores the MSI-X fence for passthrough
>>> devices...  Could potentially be squashed with 's390x/pci: MSI-X isn't
>>> strictly required for passthrough' but left separately for now as I 
>>> felt it
>>> needed a clear commit description of why we should still fence this 
>>> case.
>>>
>> Hi,
>>
>> The choice of using the new VFIO region is made on the ISM PCI 
>> function type (PFT), which makes the patch ISM specific, why don't we 
>> use here the MIO bit common to any zPCI function and present in kernel 
>> to make the choice?
>>
> 
> As discussed during the RFC (and see my reply also to the kernel set), 
> the use of this region only works for devices that do not rely on MSI-X 
> interrupts.  If we did as you suggest, other device types like mlx would 
> not receive MSI-X interrupts in the guest (And I did indeed try 
> variations where I used the special VFIO region for all 
> PCISTG/PCILG/PCISTB for various device types)
> 
> So the idea for now was to solve the specific problem at hand (getting 
> ISM devices working).
> 
> 

Sorry, if I missed or forgot some discussions, but I understood that we 
are using this region to handle PCISTB instructions when the device do 
not support MIO.
Don't we?

I do not understand the relation between MSI-X and MIO.
Can you please explain?

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

