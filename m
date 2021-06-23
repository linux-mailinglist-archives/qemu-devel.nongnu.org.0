Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D6B3B1442
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 08:56:10 +0200 (CEST)
Received: from localhost ([::1]:37688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvwnw-00069o-K8
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 02:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvwmJ-0005SO-OE
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 02:54:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53668
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1lvwmH-0002ec-6v
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 02:54:27 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15N6WeBq079212; Wed, 23 Jun 2021 02:54:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=PYZMBtJ0qAaLlG7tZb0kwKCFHb6CnZW+YVPKMNUtcUc=;
 b=eV5FouUImGUFxS19EfVhAs4W66Ccj3VoWMXbtNsVnYDQUS2aJjTG+vm46W4gQdsJlGyr
 gE8k5DvJGoUzTwcI5L4LLrn7ZRX5prIj6jH4/8JGKq6QqhwgPy0sBBvJDWXuaNBGJPC8
 XCLttEodlZVnt+DNs9/rwhOA1Jm9iX390K7DJUx3J8FF0kNS8oBzvJzL9PsRKu9TivOP
 Tlo039B7b1OyL1SSC2T7u+SbjwocNt5Gk4ajP9ZFFZiGa5cqqV4x0v6l7HaU07lNbrTQ
 0Hqb4X/Bb8NCULf96npLT91tZvu04FvHKCyzXYJee2fecH7LMHsn50GnypT3tMpk6n+P Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bxfj298g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 02:54:21 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15N6YGfk085782;
 Wed, 23 Jun 2021 02:54:20 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39bxfj2970-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 02:54:20 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15N6sHI6003950;
 Wed, 23 Jun 2021 06:54:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3998789t6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Jun 2021 06:54:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15N6qtmU27197876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Jun 2021 06:52:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60949AE04D;
 Wed, 23 Jun 2021 06:54:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40EADAE058;
 Wed, 23 Jun 2021 06:54:13 +0000 (GMT)
Received: from [9.148.12.78] (unknown [9.148.12.78])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Jun 2021 06:54:13 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] x86/sev: generate SEV kernel loader hashes in
 x86_load_linux
To: Connor Kuehl <ckuehl@redhat.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-3-dovmurik@linux.ibm.com>
 <85acff2f-367f-8ef1-a830-ba367daf17d7@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
Message-ID: <3203047d-564a-8b2e-a68b-e8f147f3ad13@linux.ibm.com>
Date: Wed, 23 Jun 2021 09:54:12 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85acff2f-367f-8ef1-a830-ba367daf17d7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W4GIkE0Qz4vFPhfXKZ0Ynvf5gWe6N6uo
X-Proofpoint-GUID: OoNFwuhqHz2EIPfpFE3hgLIfJ9hf2qgz
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-23_02:2021-06-22,
 2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106230037
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Connor,

On 22/06/2021 23:55, Connor Kuehl wrote:
> On 6/21/21 2:05 PM, Dov Murik wrote:
>> If SEV is enabled and a kernel is passed via -kernel, pass the hashes of
>> kernel/initrd/cmdline in an encrypted guest page to OVMF for SEV
>> measured boot.
>>
>> Co-developed-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> ---
>>  hw/i386/x86.c | 25 ++++++++++++++++++++++++-
>>  1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index ed796fe6ba..5c46463d9f 100644
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
>>  
>>      /* Align to 16 bytes as a paranoia measure */
>>      cmdline_size = (strlen(kernel_cmdline) + 16) & ~15;
>> @@ -924,6 +926,8 @@ void x86_load_linux(X86MachineState *x86ms,
>>      fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
>>      fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
>>      fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
>> +    kernel_loader_context.cmdline_data = (char *)kernel_cmdline;
>> +    kernel_loader_context.cmdline_size = strlen(kernel_cmdline) + 1;
> 
> I just wanted to check my understanding: I'm guessing you didn't set
> `kernel_loader_context.cmdline_size` to `cmdline_size` (defined above)
> so guest owners don't have to be aware of whatever alignment precaution
> QEMU takes when producing their own measurement, right?

The hashes calculated by OVMF must be identical to the hashes calculated
by QEMU.  OVMF calculates a hash over the blob it receives from QEMU,
which is:

    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) + 1);
    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);

That is -- the entire cmdline string including the terminating '\0'.

Here's the OVMF side that verifies the last byte is '\0':

    QemuFwCfgSelectItem (QemuFwCfgItemCommandLineData);
    QemuFwCfgReadBytes (CommandLineSize, CommandLine);

    //
    // Verify NUL-termination of the command line.
    //
    if (CommandLine[CommandLineSize - 1] != '\0') {
      DEBUG ((DEBUG_ERROR, "%a: kernel command line is not NUL-terminated\n",
        __FUNCTION__));
      Status = EFI_PROTOCOL_ERROR;
      goto FreeCommandLine;
    }

(this is more or less where we're adding the hash verification in OVMF.)


As you said, the Guest Owner also calculates the hash in exact the same
way in order to verify the SEV PSP measurement.


As I understand from the x86_load_linux code, the rounded/aligned
`cmdline_size` is used for placing the command line in an aligned address 
inside the guest memory.  In the kernel I'm booting the `cmdline_addr` is
always 0x20000 and doesn't depend on cmdline_size at all.


> 
> Otherwise:
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> 

Thanks!

-Dov

