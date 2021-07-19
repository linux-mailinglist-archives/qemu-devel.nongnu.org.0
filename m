Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0883CD967
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:11:55 +0200 (CEST)
Received: from localhost ([::1]:58376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Uvy-0002kW-AY
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1m5Uup-0001We-Eg; Mon, 19 Jul 2021 11:10:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28576
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1m5Uun-0003yE-Hj; Mon, 19 Jul 2021 11:10:43 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JF4R05174044; Mon, 19 Jul 2021 11:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=7uuEjIan8mlXzgL4uY5t0cs4DVZ9P4xv+YKtEIWt588=;
 b=qVjkiF9v9hy6O8bXsddXLjCcn5QmhlfJKw4cK/faDWsvV7jCAf1HYSzcDlUJg2Fvan7n
 4/nzXW1fLIZ8P84Uet2w6FWE1m0E7gubhxHjaV6a/WUIzD3pMolAM9t2B/JfGv9t0Vcw
 Unpxkb54kxVq7XzFhNExSlypDoue4q6lO2ZDRYJJFLobThKGtZdi1nQgKctK22m6zFvl
 lFXSsEkFtyWcNI/h0PsbvOvRnxG8d3e6MkuH0NcsGBwVlk/O1er5GRCnVep3wJ2YNNVr
 xur6JEPoYCP8DMGrrSd4nL1mF13O/OZHgz5AbVAWlf5SdVVIhkztT9pcfLst9xSIyI0s NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39w9wm5knd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:10:37 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16JF4Spm174078;
 Mon, 19 Jul 2021 11:10:37 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39w9wm5kn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 11:10:37 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JF5JsC003391;
 Mon, 19 Jul 2021 15:10:36 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma01dal.us.ibm.com with ESMTP id 39upub790w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 15:10:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JF9jOo16449894
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 15:09:45 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1C0A78068;
 Mon, 19 Jul 2021 15:09:45 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F94278067;
 Mon, 19 Jul 2021 15:09:45 +0000 (GMT)
Received: from [9.85.151.192] (unknown [9.85.151.192])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Jul 2021 15:09:44 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] s390x: improve subchannel error handling (vfio)
To: Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck
 <cohuck@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
References: <20210705163952.736020-1-cohuck@redhat.com>
 <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
From: Jared Rossi <jrossi@linux.ibm.com>
Message-ID: <e8426672-bd10-de2d-7dc9-1a46a52f3dea@linux.ibm.com>
Date: Mon, 19 Jul 2021 11:09:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e2032c05-ec0b-d653-959f-dcc045da2036@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5LOANgBZ6kZLUhTQsaEyUnS2tWa-1Jrb
X-Proofpoint-ORIG-GUID: oHWFcyeT9TEJAo_q9Ps4mUDJjMjrHoNf
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190088
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, mkawano@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I will take a look and see if I can exercise the error paths.

Regards,

Jared Rossi

On 7/19/21 10:16 AM, Matthew Rosato wrote:
> On 7/5/21 12:39 PM, Cornelia Huck wrote:
>> This is a followup on the first version (which I had sent out in May,
>> and which kind of fell through the cracks.) While the first patch
>> is mostly unchanged, I added a second patch to address some possible
>> problems with the generated unit exceptions; non-vfio subchannels
>> are not affected by this.
>>
>> As before, this works on the good path, and I have not managed to
>> actually get my system to exercise the error path :(
>
> Sorry for the silence, was out of office for a bit and Eric is 
> unavailable -- Anyway the code LGTM and matches what I see in the 
> POPs, I'd be willing to ACK but I'd feel better if we could exercise 
> the error paths before merging.
>
> @Jared/@Mike, you've both had eyes on this area of code recently, 
> would one of you be willing to take a crack at a tested-by (non-zero 
> CCs on HSCH/CSCH + also drive the sch_gen_unit_exception path)?
>
>>
>> v1->v2:
>> - add comments regarding -ENODEV/-EACCES handling
>> - add second patch
>>
>> Cornelia Huck (2):
>>    vfio-ccw: forward halt/clear errors
>>    css: fix actl handling for unit exceptions
>>
>>   hw/s390x/css.c         | 38 ++++++++++++++++++++++++++++++++++----
>>   hw/vfio/ccw.c          |  4 ++--
>>   include/hw/s390x/css.h |  3 ++-
>>   3 files changed, 38 insertions(+), 7 deletions(-)
>>
>

