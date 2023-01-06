Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C26603CD
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 16:59:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDp7L-0000t8-DY; Fri, 06 Jan 2023 10:58:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDp7I-0000sq-7k
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:58:48 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pDp7G-0006Tr-0o
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 10:58:47 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 306EpbKT020912; Fri, 6 Jan 2023 15:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jvlzEZyfmPRERBRb9TDosiqiPqqYY2AMqtFZh97e0Sc=;
 b=mHlyfAVMNXKwRh7GrAN7o6TvdbgGhkz73FDqO7bGdmOBmtU/zoK+yRI2BO1eYezKU1q4
 36sm3FQJaFp/JiIJPG/sVGtNMyM90kAFGMU869I/sIySSsAUkuL46oWIiFU0FEp1XZ/W
 me067ZsTwpfp70SvDZ2ud26OqH3H40VDVA/GxmOQEZ9dvy8oD8qtRAp5UkU0nJnmVUk9
 EgY38wkkpjgt6JEmHNz3UcnADNqwJ1dv/Iw+WY7hlLqooneEZ+/TSLBe4+cwzdLwR7xs
 hfnH960aooEPPjgJLb6OY/LL9/k6yQt0o/QNbKAcB+Zjvxev3d40LZ9Rzz8XhhBABo0V Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mxfhnh2a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:58:42 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 306F7ocY016430;
 Fri, 6 Jan 2023 15:58:41 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mxfhnh29u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:58:41 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 306Ebp3u025691;
 Fri, 6 Jan 2023 15:58:40 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
 by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3mtcq7va3k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Jan 2023 15:58:40 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 306FwdXL37683838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Jan 2023 15:58:39 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1774A58056;
 Fri,  6 Jan 2023 15:58:39 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D53158052;
 Fri,  6 Jan 2023 15:58:38 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Fri,  6 Jan 2023 15:58:38 +0000 (GMT)
Message-ID: <cb290995-fbe7-af49-8f1a-8ef5cba74047@linux.ibm.com>
Date: Fri, 6 Jan 2023 10:58:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <CAFEAcA8Er1f=KzsOhBeMgt2+8-sTua6mQU_708fjRSSrzNu+CA@mail.gmail.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <CAFEAcA8Er1f=KzsOhBeMgt2+8-sTua6mQU_708fjRSSrzNu+CA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uLKVCseUmrPG4TPMzUtP7CE1n6LQkpTo
X-Proofpoint-ORIG-GUID: 9inAh_ZE_Jj2jS7JQ63sxZ-RuWPFLYhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_10,2023-01-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060120
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939, SPF_HELO_NONE=0.001,
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



On 1/6/23 10:39, Peter Maydell wrote:
> On Fri, 6 Jan 2023 at 15:16, Stefan Berger <stefanb@linux.ibm.com> wrote:
>>
>>
>>
>> On 1/6/23 07:10, Peter Maydell wrote:
>>> I'm seeing an intermittent hang on the s390 CI runner in the
>>> bios-tables-test test. It looks like we've deadlocked because:

>>
>>>
>>> Thread 3 (Thread 0x3ff8dafe900 (LWP 2661316)):
>>> #0  0x000003ff8e9c6002 in __GI___wait4 (pid=<optimized out>,
>>> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=<optimized out>,
>>> usage=usage@entry=0x0) at ../sysdeps/unix/sysv/linux/wait4.c:27
>>> #1  0x000003ff8e9c5f72 in __GI___waitpid (pid=<optimized out>,
>>> stat_loc=stat_loc@entry=0x2aa0b42c9bc, options=options@entry=0) at
>>> waitpid.c:38
>>> #2  0x000002aa0952a516 in qtest_wait_qemu (s=0x2aa0b42c9b0) at
>>> ../tests/qtest/libqtest.c:206
>>> #3  0x000002aa0952a58a in qtest_kill_qemu (s=0x2aa0b42c9b0) at
>>> ../tests/qtest/libqtest.c:229
>>> #4  0x000003ff8f0c288e in g_hook_list_invoke () from
>>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>>> #5  <signal handler called>
>>> #6  __GI_raise (sig=sig@entry=6) at ../sysdeps/unix/sysv/linux/raise.c:50
>>> #7  0x000003ff8e9240a2 in __GI_abort () at abort.c:79
>>> #8  0x000003ff8f0feda8 in g_assertion_message () from
>>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>>> #9  0x000003ff8f0fedfe in g_assertion_message_expr () from
>>> /lib/s390x-linux-gnu/libglib-2.0.so.0
>>> #10 0x000002aa09522904 in tpm_emu_ctrl_thread (data=0x3fff5ffa160) at
>>> ../tests/qtest/tpm-emu.c:189
>>
>> This here seems to be the root cause. An unknown control channel command
>> was received from the TPM emulator backend by the control channel thread
>> and we end up in g_assert_not_reached().
> 
> Yeah. It would be good if we didn't deadlock without printing
> the assertion, though...
> 
> I guess we could improve qtest_kill_qemu() so it doesn't wait
> indefinitely for QEMU to exit but instead sends a SIGKILL 20
> seconds after the SIGTERM. (Annoyingly, there is no convenient
> "waitpid but with a timeout" function...)

Yes, wait5(&to,...) doesn't exist, yet. I guess one would have to use a loop sending signal 0 to the pid for 20 seconds?

Though I'd really like to know where that data race is coming from and why we get an unknown command. I am now running this on a ppc64 and x86_64 host over the weekend to see what happens. All good so far.

    Stefan
> 
> thanks
> -- PMM

