Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678E2B6D27
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 19:20:41 +0100 (CET)
Received: from localhost ([::1]:46714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf5ap-0002FB-On
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 13:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf5ZR-0001Ze-Gd; Tue, 17 Nov 2020 13:19:13 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53092
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kf5ZP-0005Ne-J7; Tue, 17 Nov 2020 13:19:13 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AHI4Dqq070331; Tue, 17 Nov 2020 13:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HJ6uo6MKx3U/tpF/d8uNq2MhdJwwZNfGo6Nx9g4OXD8=;
 b=RwZiogBoBU7rr/3KS1Us2MnST3oFCa8ADR6qlABzVOIBOQYYVAs2AOXsQkL5+8t6kLbw
 D/RkNd89b+LzSUPSZburDDzVbYIY3eDYUOzh5jRc/HvrgA2wGaDCanNLjnyw7fHl7siu
 +Jkr7E617sSbI3YPpIoAtCGPEXOPNi8+j0cJWyZSC5rhJ1+aXyi82ZtWnnrry3Y8ODqt
 SSBZiloC9dnc/Pl1+w+QhcIaMDaZwLDBRDiFpSnB2ABNK6Vu4o7hpxg9+QX9JjMVwvSd
 pQ2nmo6hOxcJaMhjm+iYlQwbeg5Oc4rF/uOwPmNLXIoVeWKoS0E4cCPqlpmeFHRkfGlj sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34vfb794yj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 13:19:09 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AHI4La1070965;
 Tue, 17 Nov 2020 13:19:08 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34vfb794yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 13:19:08 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AHI8MUq003505;
 Tue, 17 Nov 2020 18:19:08 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 34t6v96h0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 18:19:07 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AHIJ7VY9765414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 18:19:07 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EABCE112061;
 Tue, 17 Nov 2020 18:19:06 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01A1C112062;
 Tue, 17 Nov 2020 18:19:03 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.163.48.2])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 17 Nov 2020 18:19:03 +0000 (GMT)
Subject: Re: [PATCH for-5.2] s390x/pci: fix endianness issues
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20201117171340.1289659-1-cohuck@redhat.com>
 <ba7c8139-aa2b-1887-270f-834e47e6de10@redhat.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
Message-ID: <ea79f118-f3de-499d-ac85-58a3506a16d9@linux.ibm.com>
Date: Tue, 17 Nov 2020 13:19:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <ba7c8139-aa2b-1887-270f-834e47e6de10@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_06:2020-11-17,
 2020-11-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170127
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 13:19:10
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
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
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 12:59 PM, Philippe Mathieu-Daudé wrote:
> On 11/17/20 6:13 PM, Cornelia Huck wrote:
>> zPCI control blocks are big endian, we need to take care that we
>> do proper accesses in order not to break tcg guests on little endian
>> hosts.
>>
>> Fixes: 28dc86a07299 ("s390x/pci: use a PCI Group structure")
>> Fixes: 9670ee752727 ("s390x/pci: use a PCI Function structure")
>> Fixes: 1e7552ff5c34 ("s390x/pci: get zPCI function info from host")
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>
>> Works for me with virtio-pci devices for tcg on x86 and s390x, and for kvm.
>> The vfio changes are not strictly needed; did not test them due to lack of
>> hardware -- testing appreciated. >>
>> As this fixes a regression, I want this in 5.2.
>>
>> ---
>>   hw/s390x/s390-pci-bus.c  | 12 ++++++------
>>   hw/s390x/s390-pci-inst.c |  4 ++--
>>   hw/s390x/s390-pci-vfio.c |  8 ++++----
>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> index e0dc20ce4a56..17e64e0b1200 100644
>> --- a/hw/s390x/s390-pci-bus.c
>> +++ b/hw/s390x/s390-pci-bus.c
>> @@ -787,12 +787,12 @@ static void s390_pci_init_default_group(void)
>>   
>>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
>>   {
>> -    pbdev->zpci_fn.sdma = ZPCI_SDMA_ADDR;
>> -    pbdev->zpci_fn.edma = ZPCI_EDMA_ADDR;
>> -    pbdev->zpci_fn.pchid = 0;
>> +    stq_p(&pbdev->zpci_fn.sdma, ZPCI_SDMA_ADDR);
> 
> "zPCI control blocks are big endian" so don't we
> need the _be_ accessors? stq_be_p() etc...
> 

I don't think this is necessary.  This is only available for target 
s390x, which is always big endian...  cpu-all.h should define stq_p as 
stq_be_p for example inside the #if defined(TARGET_WORDS_BIGENDIAN).

