Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9068484763
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 19:03:37 +0100 (CET)
Received: from localhost ([::1]:45702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4o9o-0004eS-UW
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 13:03:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o5S-0007ta-Oz
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:59:06 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1n4o5Q-0002ke-UW
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 12:59:06 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 204GECFC010557; 
 Tue, 4 Jan 2022 17:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=W/J9Er4yOavp4Z/tyuqO5IMWqIQ0LuJgruJExZfD5fQ=;
 b=n6fz2vPXegWTJ989bZCOOz5/frAyaN4SjnMm00OFonzXBvwftAvQrTPo4r+1Hg9L+al9
 PflsKhszLtVWioX7YBIIBdKf2dGDRRPfMZ/WZtc5gYOFGedAmqoTg3g6L5HxuefzwWul
 nu7FeiO6md8W0lb8+01OZakcALPZEcSwAVD1GxVqdhlaaWoCWiZbhqRxk94pxJ98Ixl4
 rbEFGdaSqrFLBTKtMVkwMUiHfFDPiCCtOsQYirUMJsGNyctizZoETk3FOl7sFnyCLufL
 FrTmEVOYLg0HaCX19Ig5qXFQggYE2vxiYkhmymqSxdloJb4hzXDjBDbYqdDrhS5FxH5B Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rdens-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:59:02 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 204Ga6dG011706;
 Tue, 4 Jan 2022 17:59:02 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcq0rdenf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:59:02 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 204Hw6r1016555;
 Tue, 4 Jan 2022 17:59:01 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3daekaueuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 Jan 2022 17:59:01 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 204Hx0Bn32309720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 Jan 2022 17:59:00 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B694AC05F;
 Tue,  4 Jan 2022 17:59:00 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F40BCAC05B;
 Tue,  4 Jan 2022 17:58:59 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 Jan 2022 17:58:59 +0000 (GMT)
Message-ID: <3fa007a6-c264-c0b0-dd63-d24b2dc6d607@linux.ibm.com>
Date: Tue, 4 Jan 2022 12:58:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 2/3] acpi: tpm: Add missing device identification
 objects
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-3-stefanb@linux.ibm.com>
 <20220104105506.17ed9209@redhat.com>
 <1b32e29a-36fc-7275-e856-97a12585e0a3@linux.ibm.com>
 <20220104173456.5aaa0ea9@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20220104173456.5aaa0ea9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lV3Ia57PKTrTke9Ee8Av5XJ5setTl5iT
X-Proofpoint-ORIG-GUID: 8PphX106aAkMW8qndP1ibqaTUiHYhcMk
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-04_08,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201040117
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/4/22 11:34, Igor Mammedov wrote:
> On Tue, 4 Jan 2022 09:48:32 -0500
> Stefan Berger <stefanb@linux.ibm.com> wrote:
>
>> On 1/4/22 04:55, Igor Mammedov wrote:
>>> On Wed, 22 Dec 2021 21:23:09 -0500
>>> Stefan Berger <stefanb@linux.ibm.com> wrote:
>>>   
>>>> Add missing device identification objects _STR and _UID. They will appear
>>> why, does it break anything or it's just cosmetic?
>> I don't know about whether any software needs these entries but it's
>> driven by this:
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/708
>>
>>
>>>   
>>>> as files 'description' and 'uid' under Linux sysfs.
>>>>
>>>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>> Cc: Ani Sinha <ani@anisinha.ca>
>>>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
>>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>>>> Message-id: 20211110133559.3370990-3-stefanb@linux.ibm.com
>>>> ---
>>>>    hw/arm/virt-acpi-build.c | 1 +
>>>>    hw/i386/acpi-build.c     | 8 ++++++++
>>>>    2 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>>> index d0f4867fdf..f2514ce77c 100644
>>>> --- a/hw/arm/virt-acpi-build.c
>>>> +++ b/hw/arm/virt-acpi-build.c
>>>> @@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>>>    
>>>>        Aml *dev = aml_device("TPM0");
>>>>        aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
>>>> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>>>>        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>>    
>>>>        Aml *crs = aml_resource_template();
>>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>>> index 8383b83ee3..2fb70847cb 100644
>>>> --- a/hw/i386/acpi-build.c
>>>> +++ b/hw/i386/acpi-build.c
>>>> @@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>>>                        dev = aml_device("TPM");
>>>>                        aml_append(dev, aml_name_decl("_HID",
>>>>                                                      aml_string("MSFT0101")));
>>>> +                    aml_append(dev,
>>>> +                               aml_name_decl("_STR",
>>>> +                                             aml_string("TPM 2.0 Device")));
>>>>                    } else {
>>>>                        dev = aml_device("ISA.TPM");
>>>>                        aml_append(dev, aml_name_decl("_HID",
>>>>                                                      aml_eisaid("PNP0C31")));
>>>>                    }
>>>> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>>> why it's 1, and not 0 as in virt-arm?
>> Marc-Andre and I looked at machines with hardware TPMs and that's what
>> we found there as well, a '1'.
> perhaps mention that in commit message

Added to v5 2/3.



