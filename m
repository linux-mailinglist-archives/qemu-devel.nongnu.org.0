Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3D3C1507
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:19:36 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1UsJ-0005nM-FG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m1Uqp-0003br-8Q
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:18:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1m1Uqi-0004Mr-SR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:18:02 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 168E7tY0116827
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 10:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=OaI9vZI3m3TuU2jblJ5AvxfzGummpJAreMji24++AHw=;
 b=kkZIpBNkOHTYlW5sFiT57R69zrb41QQBjyxNVRy7O+xJ4g0MMC9kl4tpKHOFqNJcf3Eu
 K6uCx53Uz5UHrBRAhXTsFqlYqCoq3/gJcTW83EaUYLbzXxIcNJAO1z2KdKRPIlM9ydfR
 9CB5rFesOuMZE2Mm3I9yivZpiX1X4GOpP/v8uc0paSBLG8WX+JrhTDX/RRUx747D1oHO
 WbftDeOCDI+wIywaYRkn22LMCbU7vEseTX+zHxNZj7+QqwALf9QjKjdDUh2qF/62Bz/9
 P94FJkfbIoZZmTu8VKICucfL1G47LF5YcrL7OvnMwrJMFAs3+jHc5yZjwayt7WQ8GM22 zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxwv88q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:17:53 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 168EAf3v129234
 for <qemu-devel@nongnu.org>; Thu, 8 Jul 2021 10:17:53 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39nvxwv881-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 10:17:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 168E23Wj017468;
 Thu, 8 Jul 2021 14:17:52 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 39jfhea3s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Jul 2021 14:17:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 168EHplL11207008
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 8 Jul 2021 14:17:51 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64B8AAE0AA;
 Thu,  8 Jul 2021 14:17:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E01CAE0A9;
 Thu,  8 Jul 2021 14:17:51 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  8 Jul 2021 14:17:51 +0000 (GMT)
Subject: Re: [PATCH 3/7] tests: Add suffix tpm2 or tpm12 to ACPI table files
To: Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20210630153723.672473-1-stefanb@linux.vnet.ibm.com>
 <20210630153723.672473-4-stefanb@linux.vnet.ibm.com>
 <20210708155902.53e3d7f7@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Message-ID: <7a308683-2642-ff74-3f77-5826c6d5cfbd@linux.ibm.com>
Date: Thu, 8 Jul 2021 10:17:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210708155902.53e3d7f7@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yOoR43F6oDdv5fFUK93qHjj53Oaxl1-A
X-Proofpoint-GUID: aO6KZw0LRXCOmEqwALT2xFbuGy0RtwTI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-08_06:2021-07-08,
 2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080077
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: marcandre.lureau@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 7/8/21 9:59 AM, Igor Mammedov wrote:
> On Wed, 30 Jun 2021 11:37:19 -0400
> Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:
>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} | Bin
>>   tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} | Bin
>>   tests/qtest/bios-tables-test.c                  |   3 ++-
>>   3 files changed, 2 insertions(+), 1 deletion(-)
>>   rename tests/data/acpi/q35/{DSDT.tis => DSDT.tis.tpm2} (100%)
>>   rename tests/data/acpi/q35/{TPM2.tis => TPM2.tis.tpm2} (100%)
> it fails checkpatch which falsely detects it as adding new files
>
> ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
>
> ERROR: Do not add expected files together with tests, follow instructions in tests/qtest/bios-tables-test.c: both tests/data/acpi/q35/TPM2.tis.tpm2 and tests/qtest/bios-tables-test.c found
>
> looks like checkpatch needs to be fixed to handle testcase variant renaming.

Is this a show stopper for upstreaming it?


