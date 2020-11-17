Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66D2B6217
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 14:26:32 +0100 (CET)
Received: from localhost ([::1]:46032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf10B-0002AC-E1
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 08:26:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kf0xz-0001Ge-5E; Tue, 17 Nov 2020 08:24:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1kf0xv-0001hR-Te; Tue, 17 Nov 2020 08:24:14 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHD3BlP042096; Tue, 17 Nov 2020 08:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=t28tOjZ9sYbJWiXa756ieXEfL7vThsu0/8vFYLqc4Dk=;
 b=je5cw/0RorGDP9KJF7ReILoSfa/MzLt8e/SVibHR99amXXFeuRDBXyQpXf6fPuy53CJg
 8AZblV/n8b254K2WFI33J3Lz3RFDaHxC3RNeufosAaKL6NPtpZ2dvqHgcJ1ngvwb4HDY
 ToFsp7zM3K3T71R4tCPOz/V2Dh3FamawP3skAkxI4eRmbMGvPBV4F5vYQ3FoRlmzaZ+9
 6bE8bA/dQVaXDUSqPBSYdDT7qQ/Jmb56535AgpM5xZKGnHkevkJZX0ZkpUMhPzEEMiDS
 94OrsSj6te0tJu9LR04TRtRwvVgf5X8AkTFEzBDBFwf3d2YnEorYj+PQiDDOsZdfPP98 fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vdn5k1ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 08:24:05 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AHD3HOI042335;
 Tue, 17 Nov 2020 08:24:04 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34vdn5k1k7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 08:24:04 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHDMHfC025171;
 Tue, 17 Nov 2020 13:24:02 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 34t6gh35fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 13:24:01 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHDNwaS37945624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 13:23:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D23D642041;
 Tue, 17 Nov 2020 13:23:58 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4287C42042;
 Tue, 17 Nov 2020 13:23:58 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.190.194])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 13:23:58 +0000 (GMT)
Subject: Re: [RFC PATCH-for-5.2] hw/s390x/pci: Fix endianness issue
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20201117120115.1234994-1-philmd@redhat.com>
 <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <d945234d-4725-9928-11cb-f34606c8524c@linux.ibm.com>
Date: Tue, 17 Nov 2020 14:23:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-c3hw2w23OR0moKDYuvyD3O=Bqjp3fiid0byH7K+nr-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170095
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 08:24:07
X-ACL-Warn: Detected OS   = Linux 3.1-3.10
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/17/20 2:00 PM, Peter Maydell wrote:
> On Tue, 17 Nov 2020 at 12:03, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Fix an endianness issue reported by Cornelia:
>>
>>> s390x tcg guest on x86, virtio-pci devices are not detected. The
>>> relevant feature bits are visible to the guest. Same breakage with
>>> different guest kernels.
>>> KVM guests and s390x tcg guests on s390x are fine.
>>
>> Fixes: 28dc86a0729 ("s390x/pci: use a PCI Group structure")
>> Reported-by: Cornelia Huck <cohuck@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> RFC because review-only patch, untested
>> ---
>>   hw/s390x/s390-pci-inst.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
>> index 58cd041d17f..cfb54b4d8ec 100644
>> --- a/hw/s390x/s390-pci-inst.c
>> +++ b/hw/s390x/s390-pci-inst.c
>> @@ -305,7 +305,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
>>           ClpReqQueryPciGrp *reqgrp = (ClpReqQueryPciGrp *)reqh;
>>           S390PCIGroup *group;
>>
>> -        group = s390_group_find(reqgrp->g);
>> +        group = s390_group_find(ldl_p(&reqgrp->g));
> 
> 'g' in the ClpReqQueryPciGrp struct is a uint32_t, so
> adding the ldl_p() will have no effect unless (a) the
> structure is not 4-aligned and (b) the host will fault on
> unaligned accesses, which isn't the case for x86 hosts.
> 
> Q: is this struct really in host order, or should we
> be using ldl_le_p() or ldl_be_p() and friends here and
> elsewhere?
> 
> thanks
> -- PMM
> 

Hi, I think we better modify the structure here, g should be a byte.

Connie, can you please try this if it resolves the issue?

diff --git a/hw/s390x/s390-pci-inst.h b/hw/s390x/s390-pci-inst.h
index fa3bf8b5aa..641d19c815 100644
--- a/hw/s390x/s390-pci-inst.h
+++ b/hw/s390x/s390-pci-inst.h
@@ -146,7 +146,8 @@ typedef struct ClpReqQueryPciGrp {
      uint32_t fmt;
      uint64_t reserved1;
  #define CLP_REQ_QPCIG_MASK_PFGID 0xff
-    uint32_t g;
+    uint32_t g0 :24;
+    uint32_t g  :8;
      uint32_t reserved2;
      uint64_t reserved3;
  } QEMU_PACKED ClpReqQueryPciGrp;

-- 
Pierre Morel
IBM Lab Boeblingen

