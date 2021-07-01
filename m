Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3B93B8D6F
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:33:44 +0200 (CEST)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lypKZ-0007HE-7V
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypJf-0006bO-FW
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:32:47 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lypJd-0005wA-SL
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:32:47 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16152ewb060678; Thu, 1 Jul 2021 01:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ubd2sY1P/DZBq0TdpoW83Y7FjvXq6oMQmb22hOI1Tzo=;
 b=G31XZO1RI4Fp45UPYV5HNtYXlSfO+pPNltttGn8UeVH3W4m3s7qcUFXBibhsKOzygEpt
 NpFggjoroyRu5H3jxxR0/KjJewxDau6NXBABjRDMOLiC9RYUm6guiWEiyq1qIgTA1Jpn
 Zyo9f6COJALZWbGR4l4Sbt3N413I2lCvOeDdnJsO4uhCpzoVPgXYsxrQ0CZeqQwvpVap
 9u96vchpjogUzNomYJ1qFvldKBnznr+qcKHzQAjLPVvkzJx1U9z+xQkRZedwjXRMNMAX
 FOLIdQQnXh6tr8JD4PVPcoc0Le7sb5ofGYcxi66Thcu+o4HfC8jq9PuzRayMuiLE/YqW 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h4rtbshw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:32:44 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1615Qr26140187;
 Thu, 1 Jul 2021 01:32:43 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h4rtbsha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 01:32:43 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1615NTfJ024441;
 Thu, 1 Jul 2021 05:32:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 39h19bg62m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 05:32:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1615Wdlb32178532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 05:32:39 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 504E8A4051;
 Thu,  1 Jul 2021 05:32:39 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E57C8A4055;
 Thu,  1 Jul 2021 05:32:36 +0000 (GMT)
Received: from [9.65.220.2] (unknown [9.65.220.2])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Jul 2021 05:32:36 +0000 (GMT)
Subject: Re: [PATCH v2 1/2] hw/i386/pc: pc_system_ovmf_table_find: Assert that
 flash was parsed
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, qemu-devel@nongnu.org
References: <20210630054625.3424178-1-dovmurik@linux.ibm.com>
 <20210630054625.3424178-2-dovmurik@linux.ibm.com>
 <563e4b65-b120-3232-cbe3-74299da6c351@amd.com>
 <e363fffd-5383-a9fa-459e-02e65be1bcda@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <43b799a9-c34c-93e7-5c8a-b360431e908e@linux.ibm.com>
Date: Thu, 1 Jul 2021 08:32:34 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e363fffd-5383-a9fa-459e-02e65be1bcda@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bbL3jNxZlncMYPs3Y97PZM-4FAicgNzW
X-Proofpoint-GUID: PvWY4yqMDrPDU0W9CEy5H3J4aM7qoDFf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010034
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30/06/2021 17:35, Philippe Mathieu-Daudé wrote:
> On 6/30/21 3:38 PM, Tom Lendacky wrote:
>> On 6/30/21 12:46 AM, Dov Murik wrote:
>>> Add assertion in pc_system_ovmf_table_find that verifies that the flash
>>> was indeed previously parsed (looking for the OVMF table) by
>>> pc_system_parse_ovmf_flash.
>>>
>>> Now pc_system_ovmf_table_find distinguishes between "no one called
>>> pc_system_parse_ovmf_flash" (which will abort due to assertion failure)
>>> and "the flash was parsed but no OVMF table was found, or it is invalid"
>>> (which will return false).
>>>
>>> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> Does the qemu coding style prefer not initializing the bool to false since
>> it will default to that?
> 
> Indeed, you are right, and checkpatch will block this patch:
> 
> ERROR: do not initialise statics to 0 or NULL
> #33: FILE: hw/i386/pc_sysfw.c:129:
> +static bool ovmf_flash_parsed = false;
> 
> total: 1 errors, 0 warnings, 28 lines checked

oops, missed that in my flow.

Sent a v3 series with this fix.


> 
>> Otherwise,
>>
>> Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>

Thanks, Tom!

-Dov

