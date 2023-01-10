Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31809664BB2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 19:54:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFJhq-0001au-3C; Tue, 10 Jan 2023 13:50:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFJhk-0001ab-Ru
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:50:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFJhh-0008Rb-Um
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 13:50:36 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AIiBHj026153; Tue, 10 Jan 2023 18:50:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CiHAf1W9PeDA9++NDQN00VKsjo2cwouUZk+yKukuOvA=;
 b=KLdMrIQbD0WhxALJNqq6nJyx/IZJloV6TKagbepUgoly+nEAmwz7NWrjMm/vm6sS2J8z
 wdilIY+X6c4RqH1lGWEYPjh+QB3Oc5lPmPhHKlPrC2qhIRjYtJlJoEVocUispJSB0ueG
 cozk2HWdvYBJm4sJYpduM3RH4q5tAxZTdL4xoitiChk70RtJqhv0MaITgdDN5HViFKPn
 gsl3qAANR9WhYXU8RbOCv50dy1d92kqvm66E/UNy2theFa3qnVEIeYFhueYKnzTb+lFQ
 YNNSGOt1QWbzGH8TSeRyNdFQ7N4gIgju6BJ9oGpL9lhkfIx5bMzWrCFGfVpuWliKkWtB 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1dj9g41g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 18:50:29 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AIjXlI031052;
 Tue, 10 Jan 2023 18:50:29 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1dj9g410-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 18:50:29 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30AHNe4w029230;
 Tue, 10 Jan 2023 18:50:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([9.208.130.97])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3my0c7r56f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 18:50:28 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AIoRTk25559790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 18:50:27 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66CCC58067;
 Tue, 10 Jan 2023 18:50:27 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADD155805D;
 Tue, 10 Jan 2023 18:50:26 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 18:50:26 +0000 (GMT)
Message-ID: <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
Date: Tue, 10 Jan 2023 13:50:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Eric Auger <eric.auger@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
In-Reply-To: <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VHTKyrNYqT04TXbx6Q0pIR4BpESco5yr
X-Proofpoint-ORIG-GUID: v6MdO93uAMdQJEPsSw2qCaiZV5Ed-3eY
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_07,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301100120
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/6/23 10:16, Stefan Berger wrote:
> 
> 
> On 1/6/23 07:10, Peter Maydell wrote:
>> I'm seeing an intermittent hang on the s390 CI runner in the
>> bios-tables-test test. It looks like we've deadlocked because:
>>
>>   * the TPM device is waiting for data on its socket that never arrives,
>>     and it's holding the iothread lock
>>   * QEMU is therefore not making forward progress;
>>     in particular it is unable to handle qtest queries/responses
>>   * the test binary thread 1 is waiting to get a response to its
>>     qtest command, which is not going to arrive
>>   * test binary thread 3 (tpm_emu_ctrl_thread) is has hit an
>>     assertion and is trying to kill QEMU via qtest_kill_qemu()
>>   * qtest_kill_qemu() is only a "SIGTERM and wait", so will wait
>>     forever, because QEMU won't respond to the SIGTERM while it's
>>     blocked waiting for the TPM device to release the iothread lock
>>   * because the ctrl-thread is waiting for QEMU to exit, it's never
>>     going to send the data that would unblock the TPM device emulation
>>
> [...]
> 
>>
>> Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
>> #0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
>> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
>> usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
>> #1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
>> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
>> waitpid.c:38
>> #2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
>> ../tests/qtest/libqtest.c:206
>> #3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
>> ../tests/qtest/libqtest.c:229
>> #4  0x000003ff8f0c288e in g_hook_list_invoke () from
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #5  <signal handler called>
>> #6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>> #7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
>> #8  0x000003ff8f0feda8 in g_assertion_message () from
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #9  0x000003ff8f0fedfe in g_assertion_message_expr () from
>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
>> ../tests/qtest/tpm-emu.c:189
> 
> This here seems to be the root cause. An unknown control channel command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().
> 
> https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189
> 
> 
> 
>          ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
>          if (ret <= 0) {
>              break;
>          }
> 
>          cmd = be32_to_cpu(cmd);
>          switch (cmd) {
>   [...]
>          default:
>              g_debug("unimplemented %u", cmd);
>              g_assert_not_reached();                <------------------
>          }
> 
> I will run this test case in an endless loop on an x86_64 host and see what we get there ...

I could not recreate the issue running the  test on a ppc64 and x86_64 host. There we like >100k test runs on ppc64 and >40k on x86_64. Also simulating the reception of an unsupported command did not lead to a hang like shown here.

Further, it's not clear to me how to check the status of a process before calling wait() in a portable way. kill -0 on a <defunct> process, which has exited to to SIGTERM, still returns 0, so this check doesn't work to determine whether the process has exited.

    Stefan


> 
>    Stefan
> 
> 
>> #11 0x000003ff8f0ffb7c in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
>> #12 0x000003ff8eb07e66 in start_thread (arg=0x3ff8dafe900) at
>> pthread_create.c:477
>> #13 0x000003ff8e9fcbe6 in thread_start () at
>> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

