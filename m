Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5CB690C73
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 16:09:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQ8X9-0003y5-50; Thu, 09 Feb 2023 10:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pQ8X4-0003xj-ID; Thu, 09 Feb 2023 10:08:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pQ8X2-0005co-C6; Thu, 09 Feb 2023 10:08:18 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 319F1EpB016725; Thu, 9 Feb 2023 15:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=3PEYcRDqJ0RCGesziFBjvjosS+5ifuGa48qZCBMheaA=;
 b=nL5iN0S5gX+FNIOtGT/PnVM4/z94FBlj4Tncb/aoCq7+drRKWmrr9R/q9EK0vJ5qV9Ll
 avnuWNsZQinenp/oPTvTeJyX1Mw9Q8KFfK1RVoREE8ClA9cU3/BbAejEhsU+qHYQ4gy+
 DbPlc6PrfXuiRPsHuWfb9lmgMpSiozdCXa1kPWboT4Yx1iEBHcOpjHRnD4WnkIfbaGl+
 donXZfye691KiG8IuxPGIe3MrufMXNzAc1g9I7HWtjOnjNYde79Xas+l/IBJXwZoL0LA
 OQJk8sIoxWB9VdPZHAgD2k9DtgP2+sXt95n6zPowGanTNryEMw0F0dkgDQe8yvgmEdsc fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn33wrd4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 15:07:52 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319F1IYN017017;
 Thu, 9 Feb 2023 15:07:23 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn33wrc1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 15:07:23 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319C0GrQ001965;
 Thu, 9 Feb 2023 15:07:02 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3nhf07sema-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Feb 2023 15:07:02 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 319F708a57344356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Feb 2023 15:07:01 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7FFE5805D;
 Thu,  9 Feb 2023 15:07:00 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A698558043;
 Thu,  9 Feb 2023 15:07:00 +0000 (GMT)
Received: from [9.163.33.163] (unknown [9.163.33.163])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  9 Feb 2023 15:07:00 +0000 (GMT)
Message-ID: <e1db1cf6-0721-6a20-9a9a-5890893d9a1a@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2023 09:07:00 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Subject: Re: rainier-bmc machine dumping core with latest qemu
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>
References: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
 <0853197a-6bf9-cd11-180c-7f110e32a812@linaro.org>
 <5239d7f8-15ac-9922-13b6-14a8bc0dff45@redhat.com>
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
In-Reply-To: <5239d7f8-15ac-9922-13b6-14a8bc0dff45@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pNGJV5A_1a4oZ5scZ21auYUJ5O9EdJ8g
X-Proofpoint-ORIG-GUID: s2yYoudeTiFG1vetr3CMn5RmTzhf2KwE
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302090143
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Hi Emanuele,


On 2/9/23 5:24 AM, Emanuele Giuseppe Esposito wrote:
> Adding Kevin too.
>
> I can't reproduce your issue. I tried the exact steps showed in your
> mail, both with BLD_VERSION=20230205025034 (not anymore latest compose)
> and BLD_VERSION=20230209025037 (currently latest), and the VM boots till
> the login screen.
>
> Talking with Kevin it looks like handle_aiocb_write_zeroes() should not
> use bdrv_getlength() but rather raw_co_getlength().
> Could you try replacing it in block/file-posix.c line 1741 and rebuild
> and see if it works?

Yes, I built it using raw_co_getlength() and now I am not hitting the abort.

Thanks for your time.

>
> Thank you,
> Emanuele
>
> Am 08/02/2023 um 15:56 schrieb Philippe Mathieu-Daudé:
>> Cc'ing Emanuele.
>>
>> On 8/2/23 15:26, Ninad Palsule wrote:
>>> Hello,
>>>
>>> I am hitting core dump while running qemu with rainier-bmc machine. I
>>> started
>>> hitting it after I rebased to latest qemu from master.
>>> Can someone please help?
>>>
>>> /home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
>>>     -kernel
>>> ./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
>>>     -dtb
>>> ./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb \
>>>     -initrd
>>> ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
>>>     -drive
>>> file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 \
>>>     -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'
>>>
>>>
>>>
>>> [  OK  ] Started Journal Service.
>>>            Starting Flush Journal to Persistent Storage...
>>> [   45.873184] systemd-journald[156]: Received client request to flush
>>> runtime journal.
>>> [   45.932231] systemd-journald[156]: File
>>> /var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal
>>> corrupted or uncleanly shut down, renaming and replacing.
>>> qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43:
>>> bdrv_poll_co: Assertion `qemu_get_current_aio_context() ==
>>> qemu_get_aio_context()' failed.
>>>
>>> Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
>>> [Switching to Thread 0x7ffff6896640 (LWP 3898452)]
>>> __pthread_kill_implementation (no_tid=0, signo=6,
>>> threadid=140737329587776) at ./nptl/pthread_kill.c:44
>>> 44  ./nptl/pthread_kill.c: No such file or directory.
>>>
>>>
>>> #6  0x00007ffff77e8e96 in __GI___assert_fail
>>>       (assertion=assertion@entry=0x55555603e798
>>> "qemu_get_current_aio_context() ==
>>> qemu_get_aio_context()", file=file@entry=0x5555560aef28
>>> "/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43,
>>> function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9>
>>> "bdrv_poll_co") at ./assert/assert.c:101
>>> #7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at
>>> /home/abc/dev/qemu/block/block-gen.h:43
>>> #8  bdrv_poll_co (s=0x7ffff68957f0) at
>>> /home/abc/dev/qemu/block/block-gen.h:38
>>> #9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
>>> #10 0x0000555555e3558e in handle_aiocb_write_zeroes
>>> (opaque=0x7fff419965f0) at ../block/file-posix.c:1741
>>> #11 0x0000555555ef80fd in worker_thread
>>> (opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
>>> #12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at
>>> ../util/qemu-thread-posix.c:505
>>> #13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at
>>> ./nptl/pthread_create.c:442
>>> #14 0x00007ffff78d5a00 in clone3 () at
>>> ../sysdeps/unix/sysv/linux/x86_64/clone3.S:81
>>>
>>> (gdb) p qemu_aio_context
>>> $1 = (AioContext *) 0x5555568b13d0
>>>
>>> ---------------------------------------
>>>
>>>
>>> Reproduction steps:
>>>
>>> 1. Clone and build qemu from https://github.com/qemu/qemu
>>> 2. Download following eBMC images
>>>
>>> BLD_VERSION=20230205025034
>>> LINUX_VERSION="6.0.19+git0+67c9407e1f"
>>> wget
>>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz
>>>
>>> wget
>>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb
>>>
>>> wget
>>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin
>>>
>>> wget
>>> https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
>>> qemu-img resize
>>> obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G
>>>
>>> 3. Run the qemu command as show at the start
>>>
>>>
>>>

