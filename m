Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 756993CB692
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:10:26 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Ljd-0007Y3-GN
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4Lhv-0006Lh-U3; Fri, 16 Jul 2021 07:08:39 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:58452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4Lht-0003qZ-9h; Fri, 16 Jul 2021 07:08:39 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GB33Yj196499; Fri, 16 Jul 2021 07:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IkfXcdW+Z21Yb1wzDJ2IveSB3fg7fFx3escuI1EW304=;
 b=Cgcva17P5FSWTrfwlcM3xKI2brVDEOk4n1zFRENeuVTLMrXBva8B7R15Y2lTlbP6ezLc
 gIV7l2D4Nqij5NgrbNDVUB83deQ+c+2RvGnn4slfxhFqXb26NCu+JfqWQLsS1NgFtYQI
 OLLEgGawqD40z2ZVfTuLtpwmdXhiST2diYJeix7NCeS8xVnHuLBxaCTLbvxH3mT7BatD
 cWC23uS87caJdyQXkv5OSBCKCR5p9TfgCjA+4KgwWlmxCslMjTlAflRTApqGUsMq2M3G
 6dJa6x4K9oH6lFWknwnZsZz5uFyDhlhpMQqLKem7TYbwExPJvO1W5ypRzps5js8hWN3W gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw6b987f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:08:34 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GB3Mej005441;
 Fri, 16 Jul 2021 07:08:33 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39tw6b9863-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:08:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GB7nPh021365;
 Fri, 16 Jul 2021 11:08:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 39q368aq18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:08:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GB8SQx13041988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 11:08:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EA124C072;
 Fri, 16 Jul 2021 11:08:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0B2A4C06F;
 Fri, 16 Jul 2021 11:08:27 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 11:08:27 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] s390x: toplogy: adding drawers and books to smp
 parsing
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-3-git-send-email-pmorel@linux.ibm.com>
 <87y2a8cda7.fsf@dusky.pond.sub.org> <YPFQDGoRU95gDICW@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <90613127-68cf-721a-0013-96c2f52e2ec8@linux.ibm.com>
Date: Fri, 16 Jul 2021 13:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPFQDGoRU95gDICW@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -TgH2FmSdlYGMwcNXlijikg0nj2nKHWp
X-Proofpoint-ORIG-GUID: jIJmw8AP0mYfDHseqjAfVkROM_WYxjqt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 mlxlogscore=999 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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



On 7/16/21 11:23 AM, Daniel P. Berrangé wrote:
> On Thu, Jul 15, 2021 at 08:16:32AM +0200, Markus Armbruster wrote:
>> Pierre Morel <pmorel@linux.ibm.com> writes:
>>
>>> Drawers and Books are levels 4 and 3 of the S390 CPU
>>> topology.
>>> We allow the user to define these levels and we will
>>> store the values inside the S390CcwMachineState.
>>
>> Double-checking: are these members specific to S390?
>>
>>>
>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>> ---
>>
>> [...]
>>
>>> diff --git a/qapi/machine.json b/qapi/machine.json
>>> index c3210ee1fb..98aff804c6 100644
>>> --- a/qapi/machine.json
>>> +++ b/qapi/machine.json
>>> @@ -883,6 +883,8 @@
>>     ##
>>     # @CpuInstanceProperties:
>>     #
>>     # List of properties to be used for hotplugging a CPU instance,
>>     # it should be passed by management with device_add command when
>>     # a CPU is being hotplugged.
>>     #
>>     # @node-id: NUMA node ID the CPU belongs to
>>     # @socket-id: socket number within node/board the CPU belongs to
>>
>> Missing: documentation for your new members.
> 
> It is also missing in qemu-options.hx which covers -smp
> 
> To quote the lscpu manpage, it seems drawer/book fit inbetween
> NUMA node and socket level:
> 
>         CPU    The logical CPU number of a CPU as used by the Linux kernel.
> 
>         CORE   The logical core number.  A core can contain several CPUs.
> 
>         SOCKET The logical socket number.  A socket can contain several cores.
> 
>         BOOK   The logical book number.  A book can contain several sockets.
> 
>         DRAWER The logical drawer number.  A drawer can contain several books.
> 
>         NODE   The logical NUMA node number.  A node can contain several drawers.
> 
> Regards,
> Daniel
> 

Yes, seems I missed a fundamental change.
Will adapt this too.

-- 
Pierre Morel
IBM Lab Boeblingen

