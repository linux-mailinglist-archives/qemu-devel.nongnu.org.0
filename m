Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446093025A7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 14:47:47 +0100 (CET)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l42Da-0004pX-By
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 08:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l42C7-0004Lo-AK; Mon, 25 Jan 2021 08:46:15 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l42C3-0000Cx-Tn; Mon, 25 Jan 2021 08:46:15 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10PDWZMG040949; Mon, 25 Jan 2021 08:46:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=f6sxF2ouDb0cWbzFtQLstcH9PGXopoQcGep/DAknZpg=;
 b=iFq356Qwe/5dTCEWGwy8TIfcC+rBYEmKt3lbxT+/fm7IDUwFfRc8Lw485a5Go9VH6ouX
 Xyfxb5eyjNhxoIluBhosyuH7fTf1AwLnVgLA/WJiJTx/wgDzV3gSjcrX26XRP33TAYf/
 TYfeRjw5VXCeKUOq8zaGka7sWuF95LLCE3zyaJ0MrIof1qUDzb9S6fJh+KSfdgA7jGtZ
 fiVXFC6jQwlyrx2oAlqhhCOJ5C2zvpaP5hsKa2uWeKI+eKU5gWNNn6x7vhV91x79PL70
 xejl4/tSpj114cwwyU7UB0ycXKFsK6MbH0e2J/co7gN72Fm8SAtqciPr/ztVECTdteqk Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369xjnh7ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 08:46:06 -0500
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10PDWoZF044942;
 Mon, 25 Jan 2021 08:46:06 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 369xjnh7jq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 08:46:06 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10PDgjc5012400;
 Mon, 25 Jan 2021 13:46:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 368be7sv3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Jan 2021 13:46:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 10PDjrqV19857766
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 13:45:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C55EA405C;
 Mon, 25 Jan 2021 13:46:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA1DEA4054;
 Mon, 25 Jan 2021 13:45:59 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.75.12])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 25 Jan 2021 13:45:59 +0000 (GMT)
Subject: Re: [PATCH v2] s390x/cpu_model: disallow unpack for --only-migratable
To: Cornelia Huck <cohuck@redhat.com>
References: <20210125132238.179972-1-borntraeger@de.ibm.com>
 <20210125143840.64a64fdc.cohuck@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <6c5afd27-2cee-82bb-d14e-77f28d4638dd@de.ibm.com>
Date: Mon, 25 Jan 2021 14:45:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125143840.64a64fdc.cohuck@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-25_04:2021-01-25,
 2021-01-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101250075
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
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 25.01.21 14:38, Cornelia Huck wrote:
> On Mon, 25 Jan 2021 14:22:38 +0100
> Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> secure execution (aka protected virtualization) guests cannot be
>> migrated at the moment. Disallow the unpack facility if the user
>> specifies --only-migratable.
> 
> Maybe make the explanation a bit more verbose?
> 
> "Secure execution (aka protected virtualization) guests cannot be
> migrated at the moment. If the unpack facility is provided in the cpu
> model, a guest may choose to transition to secure mode, making the
> guest unmigratable at that point in time. If the machine was explicitly
> started with --only-migratable, we would get a failure only when the
> guest actually tries to transition; instead, explicitly disallow the
> unpack facility if --only-migratable was specified to avoid late
> surprises."
> 
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>> v1->v2:
>> - add missing return
>> - protect check with CONFIG_USER_ONLY for building non softmmu binaries
>>
>>  target/s390x/cpu_models.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index 35179f9dc7ba..e844a4007210 100644
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
>> @@ -878,6 +879,14 @@ static void check_compatibility(const S390CPUModel *max_model,
>>          return;
>>      }
>>  
>> +#ifndef CONFIG_USER_ONLY
>> +    if (only_migratable && test_bit(S390_FEAT_UNPACK, model->features)) {
>> +        error_setg(errp, "The unpack facility is not compatible with "
>> +                   "the --only-migratable option");
> 
> Might be a bit surprising if the host model had been specified... is
> there a way to add a hint how to get rid of the unpack bit?

I can try to make the error message a bit more verbose. 
> 
>> +	return;
>> +    }
>> +#endif
>> +
>>      /* detect the missing features to properly report them */
>>      bitmap_andnot(missing, model->features, max_model->features, S390_FEAT_MAX);
>>      if (bitmap_empty(missing, S390_FEAT_MAX)) {
> 

