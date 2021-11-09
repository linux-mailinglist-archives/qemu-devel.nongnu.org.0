Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA5944ACEF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 12:51:58 +0100 (CET)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkPfQ-0003xc-US
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 06:51:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkPdk-0003Bq-NZ; Tue, 09 Nov 2021 06:50:12 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56672
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkPdh-0004PE-5s; Tue, 09 Nov 2021 06:50:12 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A99JtRh030089; 
 Tue, 9 Nov 2021 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7v78+v1S3lcaMix3NjHgV9YswN94D0vLaNsc+OQyfoY=;
 b=ZVM4QuneNqDwpsqz5s9sGzgYqR28beQTYZQ8IFqtV8vkSuIaZD+y1ecAxId75oDOTTQO
 Neh5W9flrrVnizAOVUSit+RXIQzWH9AVHpgiJqre2HjUUU2bJHmg/rNKNbhfw16BFomj
 whiF4TErSAFyj9XXK8kBPDVPQiOWdnZWHKt9zH6WsB19Pr8eTkWS2jdnNFgd20AzaF8p
 dQjSmHYz+31pDBB6+dDE2NkqeuWiX/UPsxzD4y5MXkFAeLttRCsAp4Tg+A64PHalFnaV
 AMEaKMEkspwQ6hz18sxakDctLtoD5G4m6SYCAaetJHnwHC9kKkel+DR9RFLKGSKlJoEO 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7m1p6687-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 11:50:05 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9BO0FD029043;
 Tue, 9 Nov 2021 11:50:04 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c7m1p667n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 11:50:04 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9BhOlx005139;
 Tue, 9 Nov 2021 11:50:04 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma05wdc.us.ibm.com with ESMTP id 3c5hbb6q38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 11:50:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9Bo2DH41484660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 11:50:02 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4015FBE04F;
 Tue,  9 Nov 2021 11:50:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0135BE05F;
 Tue,  9 Nov 2021 11:50:01 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 11:50:01 +0000 (GMT)
Message-ID: <2a79eeda-8dd4-50a9-7900-42afc60491a4@linux.ibm.com>
Date: Tue, 9 Nov 2021 06:50:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] acpi: tpm: Add missing device identification objects
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20211109003733.3177378-1-stefanb@linux.vnet.ibm.com>
 <CAMxuvax+T0sVp512idiCkngZJqFOWcQGR3mkfUy6-gO8yEofKA@mail.gmail.com>
 <CAMxuvayxZaBzs4RuR9JR5ocMfcXr-phQzcsFbBSPt1CH0PnoRg@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAMxuvayxZaBzs4RuR9JR5ocMfcXr-phQzcsFbBSPt1CH0PnoRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cRW9yPsOTrIB_6Ei-AyJQKCUATdcOZkn
X-Proofpoint-ORIG-GUID: ZypmZxlJJ1Eu12pTDBKQhIBAHLJ84Gzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090070
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/9/21 02:30, Marc-André Lureau wrote:
> Hi
>
> On Tue, Nov 9, 2021 at 11:25 AM Marc-André Lureau
> <marcandre.lureau@redhat.com> wrote:
>> On Tue, Nov 9, 2021 at 4:37 AM Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>>> Add missing device identification objects _STR and _UID. They will appear
>>> as files 'description' and 'uid' under Linux sysfs.
>>>
>>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: Ani Sinha <ani@anisinha.ca>
>>> Fixes: #708
>>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>
>> (on my host, for some reason the UID is 1, does this matter?)

Let's make it '1'. My TPM 1.2 machine shows also '1'.

specs:

"6.1.12 _UID (Unique ID)
This object provides OSPM with a logical device ID that does not change 
across reboots. This object is
optional, but is required when the device has no other way to report a 
persistent unique device ID. The
_UID must be unique across all devices with either a common _HID or 
_CID. [...]"


> And shouldn't this be done also for TIS device?

Fixed. It was missing for the CRB device.

Thanks.

   Stefan

>
>>> ---
>>>   hw/arm/virt-acpi-build.c | 1 +
>>>   hw/i386/acpi-build.c     | 4 ++++
>>>   2 files changed, 5 insertions(+)
>>>
>>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>>> index 674f902652..09456424aa 100644
>>> --- a/hw/arm/virt-acpi-build.c
>>> +++ b/hw/arm/virt-acpi-build.c
>>> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>>
>>>       Aml *dev = aml_device("TPM0");
>>>       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
>>> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>
>>>       Aml *crs = aml_resource_template();
>>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>>> index a3ad6abd33..d6d3541407 100644
>>> --- a/hw/i386/acpi-build.c
>>> +++ b/hw/i386/acpi-build.c
>>> @@ -1808,6 +1808,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>>                       dev = aml_device("TPM");
>>>                       aml_append(dev, aml_name_decl("_HID",
>>>                                                     aml_string("MSFT0101")));
>>> +                    aml_append(dev,
>>> +                               aml_name_decl("_STR",
>>> +                                             aml_string("TPM 2.0 Device")));
>>> +                    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>>                   } else {
>>>                       dev = aml_device("ISA.TPM");
>>>                       aml_append(dev, aml_name_decl("_HID",
>>> --
>>> 2.31.1
>>>

