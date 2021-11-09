Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221E444AF7A
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 15:30:37 +0100 (CET)
Received: from localhost ([::1]:57584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkS8y-0006kW-3d
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 09:30:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkS6Z-0005xv-JL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:28:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1mkS6X-0005u0-9J
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 09:28:07 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9CGva8032063; 
 Tue, 9 Nov 2021 14:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=353csBSNISzoQbVorR4F+iWXAFa9RAgKsWbBtxeS3BI=;
 b=tlFfWLm8P62tb6naOza+TDdzFHy+EevdYnXoI5K9v40vTC0rzNgGC4+3ifs3Ljt+03A2
 nFnBZpzBmVa62vDgqOrNwjxj/feGPHea/mFpofuEqy3ccg6/p50Ls+blCMPOQFyzwq4d
 1KrbLO7dq3y7wIiAzd26c56dluyctA6QGc+OM5cEV3Uzpewso4nnP4n+GCiSHLj4T6GV
 ENH/u0SccX2WSIYu1985tlV6Og0MuvKWqoTGfI6O9I9xrePVP6I2TWG6Bh8rogc2yxFA
 Ue+df9hl9YdYIiF1KDop0VQAlw+ZdPwuP1I2yfeziB73tVqw0g96cqvJwOjtDF0ixASx Vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7ruwu1pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:28:03 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A9DTY1Y002524;
 Tue, 9 Nov 2021 14:28:03 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c7ruwu1pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:28:03 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A9EDOfi022421;
 Tue, 9 Nov 2021 14:28:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 3c5hbbb0b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Nov 2021 14:28:02 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A9EQk5Y45220242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Nov 2021 14:26:46 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B1F4112064;
 Tue,  9 Nov 2021 14:26:46 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F283112061;
 Tue,  9 Nov 2021 14:26:46 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Nov 2021 14:26:46 +0000 (GMT)
Message-ID: <5f10eeed-e83c-e2c8-b4bb-23116fdcbc51@linux.ibm.com>
Date: Tue, 9 Nov 2021 09:26:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/3] acpi: tpm: Add missing device identification
 objects
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20211109140152.3310657-1-stefanb@linux.ibm.com>
 <20211109140152.3310657-3-stefanb@linux.ibm.com>
 <20211109091432-mutt-send-email-mst@kernel.org>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20211109091432-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 55WIvZSXJ-wkHHFoiA-VBmzy_bXwICQG
X-Proofpoint-ORIG-GUID: Fkzm_WqHm15k2Ht5yHm723G9o-YOQFli
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_03,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090085
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/9/21 09:20, Michael S. Tsirkin wrote:
> On Tue, Nov 09, 2021 at 09:01:51AM -0500, Stefan Berger wrote:
>> Add missing device identification objects _STR and _UID. They will appear
>> as files 'description' and 'uid' under Linux sysfs.
>>
>> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
>> Cc: Michael S. Tsirkin <mst@redhat.com>
>> Cc: Igor Mammedov <imammedo@redhat.com>
>> Cc: Ani Sinha <ani@anisinha.ca>
>> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/708
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Do you want this in 6.2?

Yes.


>
>> ---
>>   hw/arm/virt-acpi-build.c | 1 +
>>   hw/i386/acpi-build.c     | 8 ++++++++
>>   2 files changed, 9 insertions(+)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 674f902652..09456424aa 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -228,6 +228,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
>>   
>>       Aml *dev = aml_device("TPM0");
>>       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
>> +    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
>>       aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>>   
>>       Aml *crs = aml_resource_template();
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index a3ad6abd33..5bd2160a89 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -1808,11 +1808,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>                       dev = aml_device("TPM");
>>                       aml_append(dev, aml_name_decl("_HID",
>>                                                     aml_string("MSFT0101")));
>> +                    aml_append(dev,
>> +                               aml_name_decl("_STR",
>> +                                             aml_string("TPM 2.0 Device")));
>
> When we support more versions, won't this make us
> do annoying tricks to say so in the string?
> Why not just "TPM device" to future-proof it?

I am not sure what other version there will be and I haven't seen any 
other descriptions than the one reported here:

https://gitlab.com/qemu-project/qemu/-/issues/708

That's why I took TPM 2.0 device. My TPM 1.2 machine doesn't report it 
for a TPM 1.2.



>
>> haven                 } else {
>>                       dev = aml_device("ISA.TPM");
>>                       aml_append(dev, aml_name_decl("_HID",
>>                                                     aml_eisaid("PNP0C31")));
>>                   }
>> +                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>>
> The ACPI spec mentions also matching on _CID.
"6.1.2 _CID (Compatible ID)
This optional object is used to supply OSPM with a device?s Plug and 
Play-Compatible Device ID. Use _CID

objects when a device has no other defined hardware standard method to 
report its compatible IDs"


6.1.12 _UID (Unique ID)
This object provides OSPM with a logical device ID that does not change 
across reboots. This object is
optional, but is required when the device has no other way to report a 
persistent unique device ID. The
_UID must be unique across all devices with either a common _HID or _CID.


Is _CID a must-have for TPM now? We have _HID.


>    
>>                   aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
>>                   crs = aml_resource_template();
>> @@ -1840,6 +1844,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>       if (TPM_IS_CRB(tpm)) {
>>           dev = aml_device("TPM");
>>           aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
>> +        aml_append(dev, aml_name_decl("_STR",
>> +                                      aml_string("TPM 2.0 Device")));
>>           crs = aml_resource_template();
>>           aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
>>                                              TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
>> @@ -1847,6 +1853,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>   
>>           aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
>>   
>> +        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>> +
>>           tpm_build_ppi_acpi(tpm, dev);
>>   
>>           aml_append(sb_scope, dev);
>> -- 
>> 2.31.1

