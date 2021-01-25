Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D3302540
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:03:18 +0100 (CET)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l41WX-0005Lu-Lh
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l41TW-0004D1-GE; Mon, 25 Jan 2021 08:00:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l41TU-0006tm-Jm; Mon, 25 Jan 2021 08:00:10 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10PCqNvH109990; Mon, 25 Jan 2021 08:00:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f7/eHX+2XmGElnHbVt9snyxaN8RA3yX+t/AFobB0b6c=;
 b=LYwO4TTLJsYyq1qTuIFXyIjWLce3SFeOIqtvz/DNYnrHUw0bA+izEJqPgfK+XONamUCD
 UpU5RiI5cRf0pgEQs6zJcy0oFhPOCZX21hZ8/qdCRtel7g2d3JahBTVY27dxctA34URk
 BMdSdb131f/AjNk6ei5pfoIlQd0WG9cVLBfEXJK507JZQdA8loQGPPSA+EOQrIvys79R
 e72uNYlgUUFfUMipH1SfiEac5AQ4kWXeMYegmyfMxV4Uh8YoD8mcJQJ4M2sq7mX6elps
 CkY3dlEI2dInRRPm1I3Ybya9x5RhvZO/8sqbmWwTigMoYjFqVGEcd8y1R/1912WBD6Q6 rA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369vg946nc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 08:00:03 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10PCqnIi112958;
 Mon, 25 Jan 2021 08:00:03 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369vg946k9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 08:00:03 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10PCvA8V015918;
 Mon, 25 Jan 2021 13:00:00 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 368be89twg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 13:00:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10PCxvxS35389816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 12:59:57 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFB3FA4054;
 Mon, 25 Jan 2021 12:59:57 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26025A405C;
 Mon, 25 Jan 2021 12:59:57 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.75.12])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 12:59:57 +0000 (GMT)
Subject: Re: [PATCH] s390x/cpu_model: disallow unpack for --only-migratable
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210125125312.138491-1-borntraeger@de.ibm.com>
 <12198ce5-8164-1e15-685d-d19f0aa234b4@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <90bb436e-bbf2-6d77-587a-0fb5b22d13cd@de.ibm.com>
Date: Mon, 25 Jan 2021 13:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <12198ce5-8164-1e15-685d-d19f0aa234b4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250072
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25.01.21 13:57, David Hildenbrand wrote:
> On 25.01.21 13:53, Christian Borntraeger wrote:
>> secure execution (aka protected virtualization) guests cannot be
>> migrated at the moment. Disallow the unpack facility if the user
>> specifies --only-migratable.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>  target/s390x/cpu_models.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index 35179f9dc7ba..0fa082ae2546 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -26,6 +26,7 @@
>>  #include "qapi/qmp/qdict.h"
>>  #ifndef CONFIG_USER_ONLY
>>  #include "sysemu/arch_init.h"
>> +#include "sysemu/sysemu.h"
>>  #include "hw/pci/pci.h"
>>  #endif
>>  #include "qapi/qapi-commands-machine-target.h"
>> @@ -878,6 +879,11 @@ static void check_compatibility(const S390CPUModel *max_model,
>>          return;
>>      }
>>  
>> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
>> +        error_setg(errp, "The unpack facility is not compatible with "
>> +                   "the --only-migratable option");
> 
> return; ?

of course.

> 
> 
> This implies that a VM with "-cpu host" might not start anymore, right?

Only if --only-migratable is set.

