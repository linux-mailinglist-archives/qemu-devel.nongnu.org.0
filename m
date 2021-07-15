Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F9D3C9A6B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 10:20:39 +0200 (CEST)
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3wbm-0004nQ-Ab
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 04:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3waW-0002HT-3V; Thu, 15 Jul 2021 04:19:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:36152
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3waT-0005b0-7v; Thu, 15 Jul 2021 04:19:19 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16F849p5033909; Thu, 15 Jul 2021 04:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xVcvJ8+mghb2azxkEPprLn3GcZy648tvPJa/mJYMOG4=;
 b=ewf4Mv+HpISMGXiJAcH5mDLjS88KPj3iLDneYyXCj7Km6kAkAuEia/PwnSQ62HTy5VYy
 TaRrUZVgKM5HBIEIqhjLn3pk2CmP0IOrSUfykK6mrUEBSjOb09qRi8vGl6AvlYYsQjKd
 MlmEgATceIoXwsJyujFRp1jS5ZV5Q6m39hoTK79iG0/r4ElSk6ylXupNkWyKV5hKH7b5
 DhQybMcxU8gK9LiZO+o46Mc0uaWHlILTjH1sjXlLXpaJtqPkVCTvKeYFv03iv3AcfbfR
 DDqjU9b3EHdrtMIZDqhT1LPLacZkpYpfnIe0obqFiQW9z+zqSHZQdLwmCvwXl423zvlv 1w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sugum3fw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 04:19:15 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16F85S1Q040080;
 Thu, 15 Jul 2021 04:19:14 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sugum3fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 04:19:14 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16F8Hf7U029852;
 Thu, 15 Jul 2021 08:19:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 39s3p78jd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jul 2021 08:19:12 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16F8J9Xc31195598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Jul 2021 08:19:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9ED2FAE056;
 Thu, 15 Jul 2021 08:19:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 17DBDAE05D;
 Thu, 15 Jul 2021 08:19:09 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.77.125])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 15 Jul 2021 08:19:09 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
To: Markus Armbruster <armbru@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <0801e122-0e9c-e266-42e8-d5cddb16c237@linux.ibm.com>
Date: Thu, 15 Jul 2021 10:19:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87y2a8cda7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 49rAa8zjl8Uo9_9c0elqKRbM6O8dewkx
X-Proofpoint-ORIG-GUID: G389yHmghvJ8WiQJ0jprs4uvDQWx4lEb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-15_02:2021-07-14,
 2021-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107150060
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/15/21 8:16 AM, Markus Armbruster wrote:
> Pierre Morel <pmorel@linux.ibm.com> writes:
> 
>> Drawers and Books are levels 4 and 3 of the S390 CPU
>> topology.
>> We allow the user to define these levels and we will
>> store the values inside the S390CcwMachineState.
> 
> Double-checking: are these members specific to S390?

Yes AFAIK

> 
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> 
> [...]
> 
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index c3210ee1fb..98aff804c6 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -883,6 +883,8 @@
>     ##
>     # @CpuInstanceProperties:
>     #
>     # List of properties to be used for hotplugging a CPU instance,
>     # it should be passed by management with device_add command when
>     # a CPU is being hotplugged.
>     #
>     # @node-id: NUMA node ID the CPU belongs to
>     # @socket-id: socket number within node/board the CPU belongs to
> 
> Missing: documentation for your new members.

Oh yes, right forgot these, thanks.

> 
>     # @die-id: die number within node/board the CPU belongs to (Since 4.1)
>     # @core-id: core number within die the CPU belongs to
>     # @thread-id: thread number within core the CPU belongs to
>     #
>     # Note: currently there are 5 properties that could be present
>     #       but management should be prepared to pass through other
>     #       properties with device_add command to allow for future
>     #       interface extension. This also requires the filed names to be kept in
>     #       sync with the properties passed to -device/device_add.
>     #
>     # Since: 2.7
>     ##
>     { 'struct': 'CpuInstanceProperties',
>>     'data': { '*node-id': 'int',
>>               '*socket-id': 'int',
>>               '*die-id': 'int',
>> +            '*drawer-id': 'int',
>> +            '*book-id': 'int',
>>               '*core-id': 'int',
>>               '*thread-id': 'int'
>>     }
> 
> [...]
> 
> 

-- 
Pierre Morel
IBM Lab Boeblingen

