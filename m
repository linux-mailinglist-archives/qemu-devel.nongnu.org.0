Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC663958C8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 12:14:46 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnewW-0000x0-Ub
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 06:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lnevk-0000FR-6R; Mon, 31 May 2021 06:13:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19082
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lnevi-0003X3-6t; Mon, 31 May 2021 06:13:55 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14VA4m0J038375; Mon, 31 May 2021 06:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jL9QWAgYL/36vtHz7YZUH7OYnZs62kmcvcJB3OIE6i4=;
 b=lXUIoCbP55ydmT8BsTYWZeva/04REncuzEQ/8WybuT5D4ucupyLjKlllSWjVCE5KXkeb
 OF9veoN5RedZVMBIBWu7y7INi9kOuUwzU4mQnC17hnR5N9bWd5RJ+GMZeBo32aQaaPma
 I2MKhNGqGyUA9mZTtUwD0RSQzqYjsJhNeK+J4w5zSo7dtu31S+36yEuEPA/r5t60MCyt
 Mbe/HDf4nI1l6qop5odsJKcY+ReD8xeobwg+8alQ+NtNqPYTogvCe/Z5TbaC/FMlaMJD
 DIQ+enN11JPpszGvoLYu/3oyACRGiFEmTb3KpO/1KUtqOuMoC3i2lP9C44tZ1iaO0sae lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38vw6xs28a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 06:13:52 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14VA4mVe038305;
 Mon, 31 May 2021 06:13:52 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38vw6xs277-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 06:13:51 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14VACgKp014355;
 Mon, 31 May 2021 10:13:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 38ucvh8xyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 10:13:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14VADmiR33947974
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 10:13:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02E52A405C;
 Mon, 31 May 2021 10:13:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1FBAA4054;
 Mon, 31 May 2021 10:13:47 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.89.221])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 31 May 2021 10:13:47 +0000 (GMT)
Subject: Re: [PATCH] qobject: Fix maybe uninitialized in qdict_array_split
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210518130638.54529-1-frankja@linux.ibm.com>
 <b4aebccf-db62-74da-ebd0-8ca24ea22f59@linux.ibm.com>
 <97b11fa8-fd32-9f73-612b-dc4209e5b32e@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Message-ID: <f45f4858-7c90-1fab-e30c-3909ce68b1e7@linux.ibm.com>
Date: Mon, 31 May 2021 12:13:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <97b11fa8-fd32-9f73-612b-dc4209e5b32e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 11Z4nlcMBl4eNSf2uLeHpC3V02mXpAJg
X-Proofpoint-ORIG-GUID: xeK3yLW6op7IZFpPFz1skdZ8HGaP7_gH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-31_07:2021-05-31,
 2021-05-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105310072
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.618,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 cohuck@redhat.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/31/21 11:44 AM, Philippe Mathieu-Daudé wrote:
> On 5/31/21 11:21 AM, Janosch Frank wrote:
>> On 5/18/21 3:06 PM, Janosch Frank wrote:
>>> Lets make the compiler happy.
>>>
>>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>>
>> Ping
>> My build is still breaking on Ubuntu because of this.
>>
>>> ---
>>>  qobject/block-qdict.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
>>> index 1487cc5dd8..b26524429c 100644
>>> --- a/qobject/block-qdict.c
>>> +++ b/qobject/block-qdict.c
>>> @@ -224,7 +224,7 @@ void qdict_array_split(QDict *src, QList **dst)
>>>      for (i = 0; i < UINT_MAX; i++) {
>>>          QObject *subqobj;
>>>          bool is_subqdict;
>>> -        QDict *subqdict;
>>> +        QDict *subqdict = NULL;
>>>          char indexstr[32], prefix[32];
>>>          size_t snprintf_ret;
> 
> Slightly clearer:>
> -- >8 --
> diff --git a/qobject/block-qdict.c b/qobject/block-qdict.c
> index 1487cc5dd8b..8d0f00bc3ce 100644
> --- a/qobject/block-qdict.c
> +++ b/qobject/block-qdict.c
> @@ -224,7 +224,6 @@ void qdict_array_split(QDict *src, QList **dst)
>      for (i = 0; i < UINT_MAX; i++) {
>          QObject *subqobj;
>          bool is_subqdict;
> -        QDict *subqdict;
>          char indexstr[32], prefix[32];
>          size_t snprintf_ret;
> 
> @@ -249,14 +248,16 @@ void qdict_array_split(QDict *src, QList **dst)
>          }
> 
>          if (is_subqdict) {
> +            QDict *subqdict = NULL;
> +
>              qdict_extract_subqdict(src, &subqdict, prefix);
>              assert(qdict_size(subqdict) > 0);
> +            qlist_append_obj(*dst, QOBJECT(subqdict));
>          } else {
>              qobject_ref(subqobj);
>              qdict_del(src, indexstr);
> +            qlist_append_obj(*dst, subqobj);
>          }
> -
> -        qlist_append_obj(*dst, subqobj ?: QOBJECT(subqdict));
>      }
>  }
> ---

If you want post that snippet yourself, go ahead.
After all I only fixed a symptom without a closer look into the code.

> 
> Anyhow,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Cc'ing qemu-trivial@
> 

If not I'll take it, test on s390 and send a v2 with qemu-trivial and
you in CC.


Thanks for having a look!

