Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB776591037
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 13:42:59 +0200 (CEST)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMT46-0007lV-4L
	for lists+qemu-devel@lfdr.de; Fri, 12 Aug 2022 07:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oMT0R-0006AQ-8A
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:39:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:28654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oMT0O-0001WF-7s
 for qemu-devel@nongnu.org; Fri, 12 Aug 2022 07:39:10 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27CBH6sr005292;
 Fri, 12 Aug 2022 11:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : reply-to : in-reply-to :
 content-type : content-transfer-encoding : mime-version; s=pp1;
 bh=iPknlSTE/Pxbt+BimcbBv9higskgRSDTbix5Dg9EFsI=;
 b=AXclQqfsrA/PzV7j++7qdQT7O6otajKbgNtKVBj6lbim5nXgfYvAs85uVxuNw653TYy7
 jCxylhg+uHeNMYCzgrHQ2U4sPf/9qvCVMxNKKsHt0qWEC2jiTtaYr2HcSQaI+QZtdya3
 C91Ix6OU0VEucvzpaj8fKztP7YmEJZ7qLShXTk6CImnuxgaPJzr5XmzVqiIZKSLOy0Yn
 Kc/9lJE87QrKNCXAXb2l8UWgUTcJ7ObxTzJtwT9ZAiFvwk82Xu2FazNHtJGmF0wCz1Zf
 IBKSBjqFKMgiDNDWTd5q25doE3Ge+NpBOGr/C74lHUrEiYwHpcQ3ezIkL4EyCASX9S3U wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwnuv0h0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:39:05 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27CBIo90013244;
 Fri, 12 Aug 2022 11:39:04 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hwnuv0gye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:39:04 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27CBKpPB015252;
 Fri, 12 Aug 2022 11:39:03 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma05wdc.us.ibm.com with ESMTP id 3hvcmrme8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Aug 2022 11:39:03 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27CBd2nA65405364
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Aug 2022 11:39:02 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0EB9AE05C;
 Fri, 12 Aug 2022 11:39:02 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEB6CAE060;
 Fri, 12 Aug 2022 11:39:00 +0000 (GMT)
Received: from [9.65.221.90] (unknown [9.65.221.90])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Aug 2022 11:39:00 +0000 (GMT)
Message-ID: <fcc03c35-d2c6-a124-d9d0-958056476f20@linux.ibm.com>
Date: Fri, 12 Aug 2022 08:38:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Content-Language: en-US
To: Claudio Imbrenda <imbrenda@linux.ibm.com>,
 =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 alex.bennee@linaro.org, armbru@redhat.com
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
 <YvT1wC0vi2juO5n3@redhat.com> <20220811155623.25f0d4b4@p-imbrenda>
 <YvUL2+Y6td7Ak0N/@redhat.com>
 <42b6bfa1-1983-b065-6b0d-9b5d89465f9b@linux.ibm.com>
 <20220812092623.19058f32@p-imbrenda>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <muriloo@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220812092623.19058f32@p-imbrenda>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N-o1-F7EU5SNg3iRSd6ER4mMIXFg_6Sy
X-Proofpoint-GUID: UEgc0H4TZtQ4wpZqqwy0ePhTvcC9JPqP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-12_08,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208120032
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: muriloo@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/12/22 04:26, Claudio Imbrenda wrote:
> On Thu, 11 Aug 2022 23:05:52 -0300
> Murilo Opsfelder Araújo <muriloo@linux.ibm.com> wrote:
>
>> On 8/11/22 11:02, Daniel P. Berrangé wrote:
>> [...]
>>>>> Hmm, I was hoping you could just use SIGKILL to guarantee that this
>>>>> gets killed off.  Is SIGKILL delivered too soon to allow for the
>>>>> main QEMU process to have exited quickly ?
>>>>
>>>> yes, I tried. qemu has not finished exiting when the signal is
>>>> delivered, the cleanup process dies before qemu, which defeats the
>>>> purpose
>>>
>>> Ok, too bad.
>>>
>>>>> If so I wonder what happens when systemd just delivers SIGKILL to
>>>>> all processes in the cgroup - I'm not sure there's a guarantee it
>>>>> will SIGKILL the main qemu before it SIGKILLs this helper
>>>>
>>>> I'm afraid in that case there is no guarantee.
>>>>
>>>> for what it's worth, both virsh shutdown and destroy seem to do things
>>>> properly.
>>>
>>> Hmm, probably because libvirt tells QEMU to exit before systemd comes
>>> along and tells everything in the cgroup to die with SIGKILL.
>>
>> It seems Libvirt sends SIGKILL if qemu process doesn't terminate within 10
>> seconds after Libvirt sent SIGTERM:
>>
>> https://gitlab.com/libvirt/libvirt/-/blob/0615df084ec9996b5df88d6a1b59c557e22f3a12/src/util/virprocess.c#L375
>
> but this is fine.
>
> with asynchronous teardown, qemu will exit almost immediately when
> receiving SIGTERM, and the cleanup process will start cleaning up.

Under normal and orderly conditions, yes.

>> So I guess this patch happened to work with Libvirt because the main qemu
>> process terminated before the timeout and before SIGKILL was delivered.
>
> it seems so
>
>>
>> The cleanup process is trying to solve the problem where the main qemu process
>> takes too long to terminate. However, if the cleanup process itself takes too
>> long, SIGKILL will be sent by Libvirt anyway.
>
> but that is not a problem, the sole purpose of the cleanup process is
> to terminate _after_ qemu. it doesn't matter what happens after qemu
> has terminated. if you look at the patch, after going to great lengths
> to assure that qemu has terminated, all the child process does is
> _exit(0).
>
>>
>> Perhaps we can describe this situation in the parameter help, e.g.: If
>> management layer decides to send SIGKILL (e.g.: due to timeout or deliberate
>> decision), the cleanup process can exit before the main process, deceiving its
>> purpose.
>
> if the management layer (or the user) decides to send SIGKILL
> immediately to the whole cgroup without sending SIGTERM first, then
> this whole asynchronous teardown mechanism is defeated, yes.

This situation is what we likely want to describe in the parameter help. I don't
want to give users the false impression that this option will *always* behave
the manner we expect it to work *most* of the time.

--
Murilo

