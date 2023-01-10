Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC82664CC6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 20:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFKb9-0004zp-W5; Tue, 10 Jan 2023 14:47:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFKb8-0004zg-GB
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:47:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFKb6-0004FF-75
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 14:47:50 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30AJQqB2006424; Tue, 10 Jan 2023 19:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=7mYxHy13UCVwF9cmohnNsr7l2tgX//4NHkNTy4cxn7s=;
 b=l1d7OJY4bbmccZg+5A6APvrdx6G/dRAaC4rhqz7fAyZ7cS9gYZRWKDwGonyO4EwzWxVw
 DELMLbOFn/NyXCgEkLTLBUNUOui4+dtvcp40qdJTU6b2xl451uRUw3XMcAaWajP6sMGK
 Y2QUtl8kUh/9A34+E+FRDVfOrLL+Ufpyh6dUhWLRwU0A7eky592rn5e/1Ej5F8HDZ/hg
 KENqdlylbJkcR4NHY965ZYL0S3dWaubjdz2EbSwTR8nMZkWRadeVsxMhMSfosOFJb0y0
 hTowtj5lBrMUDUKLs8aeWJudbwfJKMO1LsPrhUbctEM51KZqLc42zDPnN5QFyFJgGPYh Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1e6crf14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:47:44 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30AJRt5x008748;
 Tue, 10 Jan 2023 19:47:44 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1e6crf0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:47:44 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30AIWcDr017136;
 Tue, 10 Jan 2023 19:47:43 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
 by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3my0c7ukp3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Jan 2023 19:47:43 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30AJlgMA7799320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Jan 2023 19:47:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9E2B5805B;
 Tue, 10 Jan 2023 19:47:41 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AB9C58058;
 Tue, 10 Jan 2023 19:47:41 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 10 Jan 2023 19:47:41 +0000 (GMT)
Message-ID: <410f90dd-4ad1-2294-f1b3-9c7f9aeba113@linux.ibm.com>
Date: Tue, 10 Jan 2023 14:47:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
 <Y728JSBMRtdl1VUK@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <Y728JSBMRtdl1VUK@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 57qTuPtMFeQRz8DwGT8mC_Lo74ZVC20j
X-Proofpoint-ORIG-GUID: 81TCOC9XPgfKeuiiDYD9_Lj7oNC6DbjX
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-10_08,2023-01-10_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301100124
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 1/10/23 14:27, Daniel P. Berrangé wrote:
> On Tue, Jan 10, 2023 at 01:50:26PM -0500, Stefan Berger wrote:
>>
>>
>> On 1/6/23 10:16, Stefan Berger wrote:
>>> This here seems to be the root cause. An unknown control channel
>>> command was received from the TPM emulator backend by the control channel thread and we end up in g_assert_not_reached().
>>>
>>> https://github.com/qemu/qemu/blob/master/tests/qtest/tpm-emu.c#L189
>>>
>>>
>>>
>>>           ret = qio_channel_read(ioc, (char *)&cmd, sizeof(cmd), NULL);
>>>           if (ret <= 0) {
>>>               break;
>>>           }
>>>
>>>           cmd = be32_to_cpu(cmd);
>>>           switch (cmd) {
>>>    [...]
>>>           default:
>>>               g_debug("unimplemented %u", cmd);
>>>               g_assert_not_reached();                <------------------
>>>           }
>>>
>>> I will run this test case in an endless loop on an x86_64 host and see what we get there ...
>>
>> I could not recreate the issue running the  test on a ppc64 and x86_64
>> host. There we like >100k test runs on ppc64 and >40k on x86_64. Also
>> simulating the reception of an unsupported command did not lead to a
>> hang like shown here.
> 
> Assuming your ppc64 host is running an little endian OS, and
> we're only seeing the test failure on s390x, then it points towards
> the problem being an endianness issue in the TPM code. Something
> missing a byteswap somewhere along the way ?

Yes, my ppc64 machine is also little endian. If the issue  was not an intermittent but a permanent
failure I would look for something like that. I would think it's more some sort of initialization
issue, like a value on the stack that occasionally set to an undesirable value -- maybe even in a
dependency.

    Stefan

> 
> 
> With regards,
> Daniel

