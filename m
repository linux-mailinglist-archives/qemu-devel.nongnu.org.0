Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090606602E4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDoSg-00047x-CL; Fri, 06 Jan 2023 10:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDoSb-00045m-Nl
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:16:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDoSZ-0003Oq-D7
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:16:45 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 306Cx2mv029069; Fri, 6 Jan 2023 15:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=8bqrkuISwtfp7mW+ZHKAgMmzPIa3CegW4Xcy7s4u9Fw=;
 b=e9DWR6gNdzEqXnt6hfLd/osHNCMgW+ogjOFFS68rRRkahkxMDma6UhP4M4tIkm6sdVQC
 EV6fTNwaMAUFBWrP7/jYT1c87kYVGsdXSEolE/uXn8s8Ylb/WIc/x5CGSoGBjHjKsz8M
 A/ihwj9JdyHxpBSTOPjyiH2XYojTkMkpqWNjogQZvVMdbSAgmMJJ9dCNeL0OuFFNeJpJ
 4wpQLmTjnONoIRVdwFt371/KsnHb4cpKHOB3PGaUICO80EzkewpjjcgHHNfTdw/T0eL4
 T/TumdbwU5dAOs5EjXUkKJKRMLDidO1mp31f72v/VcKVB+EJM8r4Q2Flph20JhZMsZuf 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mxdee2je5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:16:39 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 306DQTo2024775;
 Fri, 6 Jan 2023 15:16:39 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mxdee2jdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:16:39 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 306FGLsJ026337;
 Fri, 6 Jan 2023 15:16:38 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma05wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7m555-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:16:38 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 306FGbHX28312104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Jan 2023 15:16:37 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7A8758045;
 Fri,  6 Jan 2023 15:16:37 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07EF558050;
 Fri,  6 Jan 2023 15:16:37 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  6 Jan 2023 15:16:36 +0000 (GMT)
Message-ID: <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
Date: Fri, 6 Jan 2023 10:16:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Eric Auger <eric.auger@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 00XQ-37VbeRVwup_gqEpvLdAWWahcBn2
X-Proofpoint-ORIG-GUID: stdMNN-irSIcF9lKHX36dVt0KM_qg4Yw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_08,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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



On 1/6/23 07:10, Peter Maydell wrote:
> I'm seeing an intermittent hang on the s390 CI runner in the
> bios-tables-test test. It looks like we've deadlocked because:
> 
>   * the TPM device is waiting for data on its socket that never arrives,
>     and it's holding the iothread lock
>   * QEMU is therefore not making forward progress;
>     in particular it is unable to handle qtest queries/responses
>   * the test binary thread 1 is waiting to get a response to its
>     qtest command, which is not going to arrive
>   * test binary thread 3 (tpm_emu_ctrl_thread) is has hit an
>     assertion and is trying to kill QEMU via qtest_kill_qemu()
>   * qtest_kill_qemu() is only a "SIGTERM and wait", so will wait
>     forever, because QEMU won't respond to the SIGTERM while it's
>     blocked waiting for the TPM device to release the iothread lock
>   * because the ctrl-thread is waiting for QEMU to exit, it's never
>     going to send the data that would unblock the TPM device emulation
> 
[...]

> 
> Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
> #0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
> usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
> #1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
> waitpid.c:38
> #2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
> ../tests/qtest/libqtest.c:206
> #3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
> ../tests/qtest/libqtest.c:229
> #4  0x000003ff8f0c288e in g_hook_list_invoke () from
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #5  <signal handler called>
> #6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
> #7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
> #8  0x000003ff8f0feda8 in g_assertion_message () from
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #9  0x000003ff8f0fedfe in g_assertion_message_expr () from
> /lib/s390x-linux-gnu/libglib-2.0.so.0
> #10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
> ../tests/qtest/tpm-emu.c:189

This here seems to be the root cause. An unknown control channel command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().

https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189



         ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
         if (ret <= 0) {
             break;
         }

         cmd = be32_to_cpu(cmd);
         switch (cmd) {
  [...]
         default:
             g_debug("unimplemented %u", cmd);
             g_assert_not_reached();                <------------------
         }

I will run this test case in an endless loop on an x86_64 host and see what we get there ...

   Stefan


> #11 0x000003ff8f0ffb7c in ?? () from /lib/s390x-linux-gnu/libglib-2.0.so.0
> #12 0x000003ff8eb07e66 in start_thread (arg=0x3ff8dafe900) at
> pthread_create.c:477
> #13 0x000003ff8e9fcbe6 in thread_start () at
> ../sysdeps/unix/sysv/linux/s390/s390-64/clone.S:65

