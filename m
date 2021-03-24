Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9318934810C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:57:44 +0100 (CET)
Received: from localhost ([::1]:48248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8hL-0005gG-5S
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP8Y8-0005ov-UX; Wed, 24 Mar 2021 14:48:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61072
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krebbel@linux.ibm.com>)
 id 1lP8Y3-0002SW-5n; Wed, 24 Mar 2021 14:48:11 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OIYVLN118727; Wed, 24 Mar 2021 14:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=FlJ5XtXwVmbS91tB5peDXAZu7cO1L50nRQ0YSmxwMg8=;
 b=RjjUOdukeC4Vhi6BGhX1mIc/wrQm68yTfVHb6gryD2buSsC9oDsLkI8LPhS3ow2ATIpZ
 AjDKhLUlb8rOEESNtfEo+RlGpTDT84+X0kZ4NKHSOEShiwc7I7wRn0+xDw5c+sFiD7af
 Ssog9aGY74J5AiMUiYxO8IFCgkpaqduk7BKOSMkdexWd6BT25B0qhPEo2M2a95dRPOFW
 74pjOGBC7rtoxzaVds1cqKLuEbdpnZJ2AxfC2R4SfR8e/QH+R1JZtAURmhHo0SyTiHpa
 GRBaAg/NLJL9Wf4o3kU3RxBu6QoFdCv0t+Fl6k0nTo7And+ic72qUFWqu9j4f50q4LLo UA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8t0kt4a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 14:48:05 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OIm3VD004146;
 Wed, 24 Mar 2021 18:48:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 37d9a62ebt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:48:03 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12OIlgEQ10027494
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 18:47:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE3BE52057;
 Wed, 24 Mar 2021 18:48:00 +0000 (GMT)
Received: from li-23497a81-5215-11cb-9bae-a81330ecc14b.ibm.com (unknown
 [9.171.8.85])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B104052051;
 Wed, 24 Mar 2021 18:48:00 +0000 (GMT)
Subject: Re: [PATCH v2] linux-user/s390x: Use the guest pointer for the
 sigreturn stub
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <be03acc3-8e9f-4715-6936-68013c49b920@vivier.eu>
 <20210324155530.52239-1-krebbel@linux.ibm.com>
 <91794f50-593d-87cc-bf46-56593c204308@vivier.eu>
From: Andreas Krebbel <krebbel@linux.ibm.com>
Message-ID: <e3ffd859-2dae-77b3-093f-06237337f4f4@linux.ibm.com>
Date: Wed, 24 Mar 2021 19:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <91794f50-593d-87cc-bf46-56593c204308@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103240133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=krebbel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 6:53 PM, Laurent Vivier wrote:
> Le 24/03/2021 à 16:55, Andreas Krebbel a écrit :
>> When setting up the pointer for the sigreturn stub in the return
>> address register (r14) we have to use the guest frame pointer instead
>> of the host frame pointer.
>>
>> Note: This only caused problems if Qemu has been built with
>> --disable-pie (as it is in distros nowadays). Otherwise guest_base
>> defaults to 0 hiding the actual problem.
>>
>> Signed-off-by: Andreas Krebbel <krebbel@linux.ibm.com>
>> ---
>>  linux-user/s390x/signal.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
>> index ecfa2a14a9..e9bf865074 100644
>> --- a/linux-user/s390x/signal.c
>> +++ b/linux-user/s390x/signal.c
>> @@ -213,7 +213,8 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
>>      if (ka->sa_flags & TARGET_SA_RESTORER) {
>>          env->regs[14] = (unsigned long) ka->sa_restorer | PSW_ADDR_AMODE;
>>      } else {
>> -        env->regs[14] = (unsigned long) frame->retcode | PSW_ADDR_AMODE;
>> +        env->regs[14] = (target_ulong) (frame_addr + offsetof(rt_sigframe, retcode))
>> +                        | PSW_ADDR_AMODE;
>>          __put_user(S390_SYSCALL_OPCODE | TARGET_NR_rt_sigreturn,
>>                     (uint16_t *)(frame->retcode));
>>      }
>>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
> but if you want to send a v3:

Sure, will do.

> - to be consistent with lines below, use "offsetof(typeof(*frame), ..."
> - in the line above, you can remove the (unsigned long) of the sa_restorer as it is an abi_ulong,

The (target_ulong) cast could probably go away as well since frame_addr is also abi_ulong.

> - don't send the "v2" as a reply to the v1 as it can be hidden in the mail thread and missed by the
> maintainer :)

Ok.

Andreas

> 
> Thanks,
> Laurent
> 


