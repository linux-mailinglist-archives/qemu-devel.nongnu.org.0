Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B852B97A2
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 17:20:55 +0100 (CET)
Received: from localhost ([::1]:49534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfmg2-0002F6-I6
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 11:20:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfmcv-0007kX-8x
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32614
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbuono@linux.vnet.ibm.com>)
 id 1kfmcp-0006So-EQ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 11:17:40 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJGGVbT073388
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7TbTVUG/qpHSRFAkVpqYo0k0ZUu5HCswh2C1jrajhac=;
 b=CCSenUWxR7YP4AwwU/iDuGprLOxwkcH9zsTmYtA+Z2r2JxvjJd+x1yyB4++Fi5AabGqK
 NKaKz0px3OXqS33kQQIKShN5UPkrY0mdZt/XS19jTmhdALoRAWs/o4HUVGFQx6qL9p/y
 4IUmjAKrUHaWurAS2zm7xDlPATauGVz9s3sHPtYh9xCTspJIBs+4lqaCqTo8ckdtWAbk
 0pTPK2gFmN3a62d8cyJQG1UZZCYcZuHu79irOx1SkllOsfSiOhPoKgcwWxJhD7iInt0j
 NkbZkY5uNQS8FNActhoCW6yapfJikuQL8eoi3lraYHXWulL894PzvTrIBrdSdnAGW/cH mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wu7723wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:17:20 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJGGfL6075213
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 11:17:08 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wu7723f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:17:08 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJG7VTp007984;
 Thu, 19 Nov 2020 16:16:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 34w26349m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:16:55 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJGGsO810158808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 16:16:54 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 948FA6A04F;
 Thu, 19 Nov 2020 16:16:54 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0611E6A047;
 Thu, 19 Nov 2020 16:16:53 +0000 (GMT)
Received: from [9.65.247.165] (unknown [9.65.247.165])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 16:16:53 +0000 (GMT)
Subject: Re: [PATCH-for-5.2? v3 3/9] hw/usb: reorder fields in UASStatus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201105221905.1350-1-dbuono@linux.vnet.ibm.com>
 <20201105221905.1350-4-dbuono@linux.vnet.ibm.com>
 <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
From: Daniele Buono <dbuono@linux.vnet.ibm.com>
Message-ID: <afff8e95-ac1f-552a-c8b3-ff008947bf98@linux.vnet.ibm.com>
Date: Thu, 19 Nov 2020 11:16:52 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <4677dea1-bdd2-0095-e75c-2ca6d9be0cb9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 suspectscore=2 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190116
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dbuono@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 09:24:07
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 11/6/2020 9:28 AM, Philippe Mathieu-Daudé wrote:
> On 11/5/20 11:18 PM, Daniele Buono wrote:
>> The UASStatus data structure has a variable sized field inside of type uas_iu,
>> that however is not placed at the end of the data structure.
>>
>> This placement triggers a warning with clang 11, and while not a bug right now,
>> (the status is never a uas_iu_command, which is the variable-sized case),
>> it could become one in the future.
> 
> The problem is uas_iu_command::add_cdb, indeed.
> 
>>
>> ../qemu-base/hw/usb/dev-uas.c:157:31: error: field 'status' with variable sized type 'uas_iu' not at the end of a struct or class is a GNU extension [-Werror,-Wgnu-variable-sized-type-not-at-end]
> 
> If possible remove the "../qemu-base/" as it does not provide
> any useful information.
> 
Sure, will do at the next cycle
>>      uas_iu                    status;
>>                                ^
>> 1 error generated.
>>
>> Fix this by moving uas_iu at the end of the struct
> 
> Your patch silents the warning, but the problem is the same.
> It would be safer/cleaner to make 'status' a pointer on the heap IMO.

I'm thinking of moving 'status' in a pointer with the following code
changes:

UASStatus is allocated in `usb_uas_alloc_status`, which currently does
not take a type or size for the union field. I'm thinking of adding
requested size for the status, like this:

static UASStatus *usb_uas_alloc_status(UASDevice *uas, uint8_t id,
uint16_t tag, size_t size);

and the common call would be
usb_uas_alloc_status([...],sizeof(uas_iu));

Also we'd need a double free when the object is freed. Right now
it's handled in the code when the object is not used anymore with a
`g_free(st);`.
I'd have to replace it with
`g_free(st->status); g_free(st);`. Would you suggest doing it place
or by adding a usb_uas_dealloc_status() function?

---

However, I am confused by the use of that variable-lenght field.
I'm looking at what seems the only place where a command is
parsed, in `usb_uas_handle_data`.

uas_iu iu;
[...]
     switch (p->ep->nr) {
     case UAS_PIPE_ID_COMMAND:
         length = MIN(sizeof(iu), p->iov.size);
         usb_packet_copy(p, &iu, length);
         [...]
         break;
[...]

It would seem that the copy is limited to at most sizeof(uas_iu),
so even if we had anything in add_cdb[], that wouldn't be copied
here?

Is this intended?

> 
>>
>> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
>> ---
>>   hw/usb/dev-uas.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
>> index cec071d96c..5ef3f4fec9 100644
>> --- a/hw/usb/dev-uas.c
>> +++ b/hw/usb/dev-uas.c
>> @@ -154,9 +154,9 @@ struct UASRequest {
>>   
>>   struct UASStatus {
>>       uint32_t                  stream;
>> -    uas_iu                    status;
>>       uint32_t                  length;
>>       QTAILQ_ENTRY(UASStatus)   next;
>> +    uas_iu                    status;
>>   };
>>   
>>   /* --------------------------------------------------------------------- */
>>
> 

