Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176784BF21A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 07:31:05 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMOhT-0001hu-Kw
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 01:31:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMOfO-0000aZ-6D
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:28:54 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59834
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nMOfL-0003B4-QR
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 01:28:53 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21M5BkvE015031; 
 Tue, 22 Feb 2022 06:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qX6al6JoX2dEAl60UcgfyJq8F/c6WxmG/ShdOdTHn4Y=;
 b=T1jTMbxVJrrhLsnlEGJU8som5Vw17rnX57hIgQaX5Kzmu6rCYJqVXe/hGUO6bF8TesOY
 OCC0duWSXfyrtyu1VNPuh5tPmryCW1kThlGq5WklikU2kqvEmIcUnmVT7GV1cGa+S0Tv
 u+iDE5UtMdvaxXRggHTvpuM1sZHJZ5t5HESpXlFE3qi3YfP6NtKtAk4KvR8TLNhGCAf9
 n+b6MEoqYWchPzReqZpNe0wNlKNRkFmaO/2WahIQLtX+2OU6QFKZkTCB1gikwn5aY/b9
 xDawsagfpfiVA2mPQTNHWzbNSFlJ4DEDsZJh+IFY2+kYa2jDsjjkael9Pr1rAcNn/R/y Xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ecsfc9ewd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 06:28:41 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21M6Gdt5025133;
 Tue, 22 Feb 2022 06:28:41 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ecsfc9ew4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 06:28:41 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21M6DNn8017118;
 Tue, 22 Feb 2022 06:28:40 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3ear6a4kr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 06:28:40 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21M6SXjE33620466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Feb 2022 06:28:33 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C00596A04F;
 Tue, 22 Feb 2022 06:28:33 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D0E066A05F;
 Tue, 22 Feb 2022 06:28:30 +0000 (GMT)
Received: from [9.160.8.241] (unknown [9.160.8.241])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 22 Feb 2022 06:28:30 +0000 (GMT)
Message-ID: <f83d9b15-f90f-78fc-d7fe-0df5282630f7@linux.ibm.com>
Date: Tue, 22 Feb 2022 08:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2] hw/i386: Improve bounds checking in OVMF table parsing
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220216064024.153423-1-dovmurik@linux.ibm.com>
 <YhPrug59i7U0BUao@work-vm>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YhPrug59i7U0BUao@work-vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ROIO0uPPECjU6VUfjUrQxeGup2UcNwa9
X-Proofpoint-ORIG-GUID: SSMpBYQcS27ojc6kpEBuGCkp4uVCEhu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202220035
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks Dave for reviewing.


On 21/02/2022 21:44, Dr. David Alan Gilbert wrote:
> * Dov Murik (dovmurik@linux.ibm.com) wrote:
>> When pc_system_parse_ovmf_flash() parses the optional GUIDed table in
>> the end of the OVMF flash memory area, the table length field is checked
>> for sizes that are too small, but doesn't error on sizes that are too
>> big (bigger than the flash content itself).
>>
>> Add a check for maximal size of the OVMF table, and add an error report
>> in case the size is invalid.  In such a case, an error like this will be
>> displayed during launch:
>>
>>     qemu-system-x86_64: OVMF table has invalid size 4047
>>
>> and the table parsing is skipped.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> ---
>>
>> v2:
>> - add error message example to commit description
>> - replace magic numbers 48 and 50 with size calculations (thanks Phil MD)
>> ---
>>  hw/i386/pc_sysfw_ovmf.c | 20 ++++++++++++++++----
>>  1 file changed, 16 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/i386/pc_sysfw_ovmf.c b/hw/i386/pc_sysfw_ovmf.c
>> index f4dd92c588..1c9a16e9e6 100644
>> --- a/hw/i386/pc_sysfw_ovmf.c
>> +++ b/hw/i386/pc_sysfw_ovmf.c
>> @@ -24,11 +24,14 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> +#include "qemu/error-report.h"
>>  #include "hw/i386/pc.h"
>>  #include "cpu.h"
>>  
>>  #define OVMF_TABLE_FOOTER_GUID "96b582de-1fb2-45f7-baea-a366c55a082d"
>>  
>> +static const int bytes_after_table_footer = 32;
>> +
>>  static bool ovmf_flash_parsed;
>>  static uint8_t *ovmf_table;
>>  static int ovmf_table_len;
>> @@ -38,6 +41,8 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>      uint8_t *ptr;
>>      QemuUUID guid;
>>      int tot_len;
>> +    int max_tot_len = flash_size - (bytes_after_table_footer +
>> +                                    sizeof(guid) + sizeof(uint16_t));
>>  
>>      /* should only be called once */
>>      if (ovmf_flash_parsed) {
>> @@ -52,12 +57,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>  
>>      /*
>>       * if this is OVMF there will be a table footer
>> -     * guid 48 bytes before the end of the flash file.  If it's
>> -     * not found, silently abort the flash parsing.
>> +     * guid 48 bytes before the end of the flash file
>> +     * (= 32 bytes after the table + 16 bytes the GUID itself).
>> +     * If it's not found, silently abort the flash parsing.
>>       */
>>      qemu_uuid_parse(OVMF_TABLE_FOOTER_GUID, &guid);
>>      guid = qemu_uuid_bswap(guid); /* guids are LE */
>> -    ptr = flash_ptr + flash_size - 48;
>> +    ptr = flash_ptr + flash_size - (bytes_after_table_footer + sizeof(guid));
>>      if (!qemu_uuid_is_equal((QemuUUID *)ptr, &guid)) {
>>          return;
>>      }


I'll probably split the two hunks above (without max_tot_len) to a
separate patch "hw/i386: Replace magic number with field length
calculation".



>> @@ -66,7 +72,13 @@ void pc_system_parse_ovmf_flash(uint8_t *flash_ptr, size_t flash_size)
>>      ptr -= sizeof(uint16_t);
>>      tot_len = le16_to_cpu(*(uint16_t *)ptr) - sizeof(guid) - sizeof(uint16_t);
> 
> Instead of the max_tot_len calculation above, is it actually:
>    max_tot_len = ptr - flash_ptr;
> 
> I think that works out the same and avoids doing the calculation in two
> places; it's also logically what you have - you can't read over the
> structure you just read.

Good call, it indeed gives the same result.


I'll change the condition below to:

    if (tot_len < 0 || tot_len > (ptr - flash_ptr))

and remove the max_tot_len variable, and put this in a separate patch
that only adds this condition to solve the overflow problem.


Thanks,
-Dov



> 
> Dave
> 
>> -    if (tot_len <= 0) {
>> +    if (tot_len < 0 || tot_len > max_tot_len) {
>> +        error_report("OVMF table has invalid size %d", tot_len);
>> +        return;
>> +    }
>> +
>> +    if (tot_len == 0) {
>> +        /* no entries in the OVMF table */
>>          return;
>>      }
>>  
>>
>> base-commit: 48033ad678ae2def43bf0d543a2c4c3d2a93feaf
>> -- 
>> 2.25.1
>>

