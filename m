Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98233CB69F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:15:01 +0200 (CEST)
Received: from localhost ([::1]:42504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Lo4-0006Kg-Rv
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:15:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4Llk-0004Eb-R1; Fri, 16 Jul 2021 07:12:36 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7048
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m4Llj-0006Wb-8G; Fri, 16 Jul 2021 07:12:36 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GB47Uj156970; Fri, 16 Jul 2021 07:12:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TQBM6Mty+Yd/bz6Zyutfp5oXHRFiqPPFyZGkWV/2E3Y=;
 b=s/fKXdhUw0lyZxUQTW7z+KID8nxQVu6Gfi1dztk5YLz6Qid50rdnUuH/ixONkU2VyAyQ
 mVZITzBaXqesMle1FIMtz0SOWUmgZvm7Yk89XsbS+6JQ66jEzX5H0xkC6OROmQVu/oM7
 nEGuQwmipHv0fbhcvvThPWqkC3PmttO7ynuXFSP3f+kjAAGcHWXVBQijWjn1Mg1C7eLT
 tapamaahKF6qeQXHIi+bEgQcHWIS0D/3Iz+IrclsozuuPqI2OSNNwGT5RXH2ffB5PUre
 GOB+Nhqnbc3OV/j7O4bTcFlMvnhIfVYQdRJxbJfgNzlAACnJldDIZPTZMdkj74Xc6KY9 dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rskn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:12:33 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GB487g157163;
 Fri, 16 Jul 2021 07:12:33 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2rskmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 07:12:33 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GB9BHt023259;
 Fri, 16 Jul 2021 11:12:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 39q2th9egx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 11:12:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16GBAGNj24772948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 11:10:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EC184C07A;
 Fri, 16 Jul 2021 11:12:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 711304C07E;
 Fri, 16 Jul 2021 11:12:27 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.164.173])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 11:12:27 +0000 (GMT)
Subject: Re: [PATCH v1 7/9] s390x: SCLP: reporting the maximum nested topology
 entries
To: Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
 <1626281596-31061-8-git-send-email-pmorel@linux.ibm.com>
 <87sg0ebogo.fsf@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <1ca7872b-7f0c-4c32-fc63-954b8c0cb12b@linux.ibm.com>
Date: Fri, 16 Jul 2021 13:12:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87sg0ebogo.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ch3j5aUCd6zz39oKgC8JkjOBAjlzCKbG
X-Proofpoint-ORIG-GUID: PHykrrhy2nwYSxHbHcLy-zbXmugWeNXM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160067
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/16/21 11:24 AM, Cornelia Huck wrote:
> On Wed, Jul 14 2021, Pierre Morel <pmorel@linux.ibm.com> wrote:
> 
>> The maximum nested topology entries is used by the guest to know
>> how many nested topology are available on the machine.
>>
>> As we now implemented drawers and books above sockets and core
>> we can set the maximum nested topology reported by SCLP to 4.
> 
> Does that work with tcg as well? (Have not yet really looked at the
> patches above.)

I must make more tests on this.

regards,
Pierre

> 
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/sclp.c         | 1 +
>>   include/hw/s390x/sclp.h | 4 +++-
>>   target/s390x/kvm/kvm.c  | 1 -
>>   3 files changed, 4 insertions(+), 2 deletions(-)
> 

-- 
Pierre Morel
IBM Lab Boeblingen

