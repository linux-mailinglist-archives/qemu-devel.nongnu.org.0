Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E07F2007A2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 13:21:00 +0200 (CEST)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmF4t-0000Mm-Au
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 07:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jmF3t-0008B8-So; Fri, 19 Jun 2020 07:19:57 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:45774
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1jmF3s-0007Td-0N; Fri, 19 Jun 2020 07:19:57 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05JB3rBU129952; Fri, 19 Jun 2020 07:19:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rkh06gd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 07:19:52 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05JB414W131019;
 Fri, 19 Jun 2020 07:19:52 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31rkh06gcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 07:19:52 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05JBJT5J018374;
 Fri, 19 Jun 2020 11:19:51 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 31q6bdk4j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 11:19:51 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05JBJpkH49611140
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 11:19:51 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 784B2B2064;
 Fri, 19 Jun 2020 11:19:51 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64577B205F;
 Fri, 19 Jun 2020 11:19:51 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 11:19:51 +0000 (GMT)
Subject: Re: [PATCH v4 1/5] acpi: Convert build_tpm2() to build_append* API
To: Auger Eric <eric.auger@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
References: <20200611135917.18300-1-eric.auger@redhat.com>
 <20200611135917.18300-2-eric.auger@redhat.com>
 <20200616143327.2ee38a48@redhat.com>
 <3c3b466a-c965-e3f6-9bd6-74fce9c424c8@linux.ibm.com>
 <ed1b453d-2568-2134-3e86-c268e82a90f8@redhat.com>
 <ded58c6b-dcea-67ef-4f3c-b8af9f149ae8@redhat.com>
 <44663542-8352-2398-a297-3e1fe7f4bfd5@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <ce60f439-fd2a-a72b-f004-44a01f4c5bdf@linux.ibm.com>
Date: Fri, 19 Jun 2020 07:19:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <44663542-8352-2398-a297-3e1fe7f4bfd5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_08:2020-06-19,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=999 cotscore=-2147483648 phishscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 06:50:18
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/19/20 5:43 AM, Auger Eric wrote:
> Hi Laszlo,
>
> On 6/19/20 11:38 AM, Laszlo Ersek wrote:
>> On 06/18/20 09:50, Auger Eric wrote:
>>> Hi Stefan, Igor,
>>>
>>> On 6/16/20 4:11 PM, Stefan Berger wrote:
>>>> On 6/16/20 8:33 AM, Igor Mammedov wrote:
>>>>> nevertheless looks like faithfull conversion,
>>>>> btw why you didn't drop Acpi20TPM2 structure definition?
>>>>>
>>>> If we get rid of the table we should keep a reference to this document,
>>>> table 7: "TCG ACPI Specification; Family 1.2 and 2.0; Level 00 Revision
>>>> 00.37, December 19, 2014"
>>>>
>>>> https://trustedcomputinggroup.org/wp-content/uploads/TCG_ACPIGeneralSpecification_1-10_0-37-Published.pdf
>>>>
>>>>
>>>>
>>> Further looking at this spec, the log_area_minimum_length and
>>> log_area_start_address only are described in
>>> - Table 2 (TCG Hardware InterfaceDescription Table Format for TPM 1.2
>>> Clients)
>>> - Table 4 (TCG Hardware Interface Description Table Format for TPM 1.2
>>> Servers)
>>> but not in Table 7, ie. not for TPM 2.0.
>>>
>>> Are they really needed for TPM2 or what do I miss?
>> (side comment:
>>
>> LASA and LAML are optional with TPM-2.0. From the discussion at
>> <https://bugzilla.tianocore.org/show_bug.cgi?id=978>.


They are needed for (x86) BIOS, such as SeaBIOS, not for UEFI, though. I 
do not know about ARM.


> Thank you for the pointer and info. I failed to find this info in the
> spec. Given the risk of confusion, I would personally keep struct
> Acpi20TPM2 and maybe add a comment. Stefan?

Either way is fine with me for as long as we know where to find the 
layout of the structure.

   Stefan

>
> Thanks
>
> Eric
>> )
>>
>> Thanks
>> Laszlo
>>


