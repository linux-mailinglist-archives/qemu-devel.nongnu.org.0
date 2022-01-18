Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F53492D01
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 19:11:04 +0100 (CET)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9swh-00037M-MI
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 13:11:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n9suJ-0001hB-1k; Tue, 18 Jan 2022 13:08:35 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1n9suH-0005QF-45; Tue, 18 Jan 2022 13:08:34 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IHRNfu009195; 
 Tue, 18 Jan 2022 18:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Vrrff/534M3gFRv4swAZXOmk9d9vnH6q62GPtHCmP6Q=;
 b=rK2ibh467Batmkw3L7Kb/pHfhjrpx7shAyelzpWREsSVfA/9lt9chHFRQROZ1RhCFTAu
 fbS4adPTOsIMRYiLv+Zp2YNE0SZhkQ0qr5C+9MvLuSjDFV7tvaTww3qNOxrlGL5KHEDe
 5zmN0ZDYSnMOM+5ee+mA9/zB0/wAKV4HLQ3E0lpWLoVfdI2VXTsNX3oiwjFQg4P7E5Wz
 yGByxfg507aogsne2DRDifjZW/4pHpx1CTYxrFU7U/N7Gui/dQcsmhcg35QcmCUjnMDY
 EDGS9O2y6FCos6aHo2M1ULJ3ipUpO+58TnN6pX8s0rZrShljL6EXtXyG+f/qvBu2Lrgy ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp1yd924r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:08:29 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IHiCZD012996;
 Tue, 18 Jan 2022 18:08:29 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dp1yd9249-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:08:29 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20II1reo021198;
 Tue, 18 Jan 2022 18:08:28 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3dknwaq67k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:08:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20II8Neo38076882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:08:23 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66BB6E05F;
 Tue, 18 Jan 2022 18:08:23 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E5BD6E060;
 Tue, 18 Jan 2022 18:08:22 +0000 (GMT)
Received: from [9.163.19.30] (unknown [9.163.19.30])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:08:22 +0000 (GMT)
Message-ID: <aea53638-b38a-bc33-db46-a9ceefe95c87@linux.ibm.com>
Date: Tue, 18 Jan 2022 13:08:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 4/9] s390x/pci: enable for load/store intepretation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <20220114203849.243657-1-mjrosato@linux.ibm.com>
 <20220114203849.243657-5-mjrosato@linux.ibm.com>
 <27a1db36-5664-6c90-ec39-aa6da5c23c31@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <27a1db36-5664-6c90-ec39-aa6da5c23c31@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rrnIHrg9GqvPjJRoRkQxCDoF2oBAA3Lq
X-Proofpoint-ORIG-GUID: xAtsdosmGujN18LnB-HkEINBSBQEzEC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180109
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, alex.williamson@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, david@redhat.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/22 9:51 AM, Thomas Huth wrote:
> On 14/01/2022 21.38, Matthew Rosato wrote:
...
>>   static void s390_pcihost_plug(HotplugHandler *hotplug_dev, 
>> DeviceState *dev,
>>                                 Error **errp)
>>   {
>>       S390pciState *s = S390_PCI_HOST_BRIDGE(hotplug_dev);
>>       PCIDevice *pdev = NULL;
>>       S390PCIBusDevice *pbdev = NULL;
>> +    int rc;
>>       if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_BRIDGE)) {
>>           PCIBridge *pb = PCI_BRIDGE(dev);
>> @@ -1022,12 +1068,33 @@ static void s390_pcihost_plug(HotplugHandler 
>> *hotplug_dev, DeviceState *dev,
>>           set_pbdev_info(pbdev);
>>           if (object_dynamic_cast(OBJECT(dev), "vfio-pci")) {
>> -            pbdev->fh |= FH_SHM_VFIO;
>> +            /*
>> +             * By default, interpretation is always requested; if the 
>> available
>> +             * facilities indicate it is not available, fallback to the
>> +             * intercept model.
>> +             */
>> +            if (pbdev->interp && 
>> !s390_has_feat(S390_FEAT_ZPCI_INTERP)) {
>> +                    DPRINTF("zPCI interpretation facilities 
>> missing.\n");
>> +                    pbdev->interp = false;
>> +                }
> 
> Wrong indentation in the above three lines.

Thanks

> 
>> +            if (pbdev->interp) {
>> +                rc = s390_pci_interp_plug(s, pbdev);
>> +                if (rc) {
>> +                    error_setg(errp, "zpci interp plug failed: %d", rc);
> 
> The error message is a little bit scarce for something that might be 
> presented to the user - maybe write at least "interpretation" instead of 
> "interp" ?
> 
Good point, I'll re-word to something like "Plug failed for zPCI device 
in interpretation mode: %d"

>> +                    return;
>> +                }
>> +            }
>>               pbdev->iommu->dma_limit = s390_pci_start_dma_count(s, 
>> pbdev);
>>               /* Fill in CLP information passed via the vfio region */
>>               s390_pci_get_clp_info(pbdev);
>> +            if (!pbdev->interp) {
>> +                /* Do vfio passthrough but intercept for I/O */
>> +                pbdev->fh |= FH_SHM_VFIO;
>> +            }
>>           } else {
>>               pbdev->fh |= FH_SHM_EMUL;
>> +            /* Always intercept emulated devices */
>> +            pbdev->interp = false;
>>           }
> 
>   Thomas
> 


