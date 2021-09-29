Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBB41C1E8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:46:18 +0200 (CEST)
Received: from localhost ([::1]:42742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVWAL-00084V-LU
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVW6e-00041N-Gs
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:42:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mVW6c-0000TA-GY
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:42:27 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18T8Snt8009484; 
 Wed, 29 Sep 2021 05:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JZdlBpsq836m2XRWXTnp66tGwhztj69OV2hjcAJObYU=;
 b=Yv9stKXB6yw/K17ECAHnbrkahHLsJPx0kGkFsRs1b4Ie/MToGzZ9L/L52wC9ZOaA0bqV
 ygvjRzHLBRjPcHTE0bLk1Hu2A3uHRsr8YlSofDS8rBf0kPf//cklikLNMm6PfIQkh8sd
 lobLB0D8RlL+DKrBQtzixfFKnkZIGTf4KiYrWpeNueILeljgkDKsh+Ob6x/YKfZ+GCH1
 f9zQsfGjZ4E03npZtNSK/5iueJNUYDdxKj/Mc0Dv4vp/k8OxwEamfQr0DfB2AHZyIfQd
 Gpfg4hs6zWix1kEWlhftXlGNYP3a2NGk3AO/jVybRdE9H2K1hoTmrCpj2aMy64sWFb1U EA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcmnyhgfm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 05:42:21 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18T9K6ff007436;
 Wed, 29 Sep 2021 05:42:21 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bcmnyhgf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 05:42:20 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18T9VatY013754;
 Wed, 29 Sep 2021 09:42:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 3ba00du48m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Sep 2021 09:42:19 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18T9gHDC21037410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Sep 2021 09:42:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B08B3C6059;
 Wed, 29 Sep 2021 09:42:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D1E4C605A;
 Wed, 29 Sep 2021 09:42:14 +0000 (GMT)
Received: from [9.148.12.91] (unknown [9.148.12.91])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 29 Sep 2021 09:42:13 +0000 (GMT)
Subject: Re: [PATCH v3 2/2] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210825073538.959525-1-dovmurik@linux.ibm.com>
 <20210825073538.959525-3-dovmurik@linux.ibm.com>
 <YVH5SPW5eGFqQX1F@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <9218a3e1-ebd6-82c1-1eb3-16e70cd76a76@linux.ibm.com>
Date: Wed, 29 Sep 2021 12:42:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVH5SPW5eGFqQX1F@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iulVRQ4TPYNk2WfI8oaAGWqfdglfL6BH
X-Proofpoint-GUID: VqtaBK1NKzVkIhEQx5lHLKAScJFvqTNS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-29_02,2021-09-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109290057
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.562,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Jim Cadden <jcadden@ibm.com>, Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 27/09/2021 20:03, Daniel P. Berrangé wrote:
> On Wed, Aug 25, 2021 at 07:35:38AM +0000, Dov Murik wrote:
>> If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
>> kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
>> measured boot.
>>
>> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
>> ---
>>  hw/i386/x86.c | 25 ++++++++++++++++++++++++-
>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index 00448ed55a..4044104cfe 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -45,6 +45,7 @@
>>  #include "hw/i386/fw_cfg.h"
>>  #include "hw/intc/i8259.h"
>>  #include "hw/rtc/mc146818rtc.h"
>> +#include "target/i386/sev_i386.h"
>>  
>>  #include "hw/acpi/cpu_hotplug.h"
>>  #include "hw/irq.h"
>> @@ -778,6 +779,7 @@ void x86_load_linux(X86MachineState *x86ms,
>>      const char *initrd_filename = machine->initrd_filename;
>>      const char *dtb_filename = machine->dtb;
>>      const char *kernel_cmdline = machine->kernel_cmdline;
>> +    KernelLoaderContext kernel_loader_context = {};
> 
> I think the variable name is overly verbose but could also benefit
> from a 'sev_' prefix. eg how about just calling the var 'sev_context'.

I'll consider a rename which includes 'sev_' and is a bit shorter.

> 
> In any case, its functionally fine, so can add 
> 
>   Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> 

Thanks!

-Dov

> 
> Regards,
> Daniel
> 

