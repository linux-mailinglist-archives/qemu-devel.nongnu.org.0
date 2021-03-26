Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3820834A231
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 07:53:25 +0100 (CET)
Received: from localhost ([::1]:40206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPgLU-00043u-8d
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 02:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lPgJU-0002py-VC; Fri, 26 Mar 2021 02:51:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lPgJS-0000xO-Ts; Fri, 26 Mar 2021 02:51:20 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q6a14S064730; Fri, 26 Mar 2021 02:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vcob0JS6D0igLIrMc3xXeLTlnK0WqkqHSlNvW2L17pU=;
 b=lE/bRFJSRdm1ZNBinIKyCBcTiAzId1B8t4Pe5ZmLb+prLefYmqcFgL7YA+TSPl6JIMPJ
 +DiVljfPKoTPor2pZItAijuvvqzcjMBBdqZUCso7JGZo0/idy1CshAOw0JrC+ZDO6DOw
 mGhVnc6mD3PLqQjGGXExWyYMRrGkcrt0huozV3oc3AoL+1SAoIjtDI/2Ofi3sufWywT0
 MQNyRY9FllQssXgLoiUp/BMxEPLFu8LWSwIb+a6LUU9bknNjdZv8Y4PTXJt4ONUq4A68
 dfCig04VHxGDilgDH6vWxNYohYtEQ+XV8aDXcsrGz4w4Qdg0rE3AEBWIYoroXfRm68rf lQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h74vcbfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 02:51:15 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12Q6gFSF024731;
 Fri, 26 Mar 2021 06:51:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 37h14vg6rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 06:51:13 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12Q6pBKn35324222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 06:51:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BA8DA405C;
 Fri, 26 Mar 2021 06:51:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD26AA4060;
 Fri, 26 Mar 2021 06:51:10 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com (unknown
 [9.171.42.38])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 06:51:10 +0000 (GMT)
Subject: Re: [PATCH v3] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210324185128.63971-1-krebbel@linux.ibm.com>
 <2b8d52a8-b72a-c968-f61a-2e6288ace4ad@vivier.eu>
From: Andreas Krebbel <krebbel@linux.ibm.com>
Message-ID: <37a8a2e4-17be-5a09-7069-3b7ce7fd1337@linux.ibm.com>
Date: Fri, 26 Mar 2021 07:51:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2b8d52a8-b72a-c968-f61a-2e6288ace4ad@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jFLqGE3PRGyaI5xN08I2RdDQNDpMLlB3
X-Proofpoint-ORIG-GUID: jFLqGE3PRGyaI5xN08I2RdDQNDpMLlB3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_01:2021-03-25,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103260046
Received-SPF: pass client-ip=148.163.158.5; envelope-from=krebbel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 8:55 PM, Laurent Vivier wrote:
> Le 24/03/2021 à 19:51, Andreas Krebbel a écrit :
>> When setting up the pointer for the sigreturn stub in the return
>> address register (r14) we currently use the host frame address instead
>> of the guest frame address.
>>
>> Note: This only caused problems if Qemu has been built with
>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>> defaults to 0 hiding the actual problem.
>>
>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>> ---
>>  linux-user/s390x/signal.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>> index ecfa2a14a9..7107c5fb53 100644
>> --- a/linux-user/s390x/signal.c
>> +++ b/linux-user/s390x/signal.c
>> @@ -211,9 +211,10 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>>      /* Set up to return from userspace.  If provided, use a stub
>>         already in userspace.  */
>>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>> -        env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
>> +        env->regs[14] = ka->sa_restorer | PSW_ADDR_AMODE;
>>      } else {
>> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
>> +        env->regs[14] = (frame_addr + offsetof(typeof(*frame), retcode))
>> +                        | PSW_ADDR_AMODE;
>>          __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>>                     (uint16_t *)(frame->retcode));
>>      }
>>
> 
> Applied to my linux-user-for-6.0 branch

Thanks! Since this fixes a problem which prevents important applications (e.g. golang) to run
properly under Qemu for IBM Z right now I think it qualifies for stable branch.

The patch applies cleanly on 5.0 branch. Testsuite is clean and I've verfified that it fixes the
actual problem there as well.

Please consider inclusion into stable branch.

Andreas

> 
> Thanks,
> Laurent
> 


