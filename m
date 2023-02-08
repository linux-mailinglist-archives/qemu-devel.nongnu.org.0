Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32A668F0CC
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:27:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlPR-0006FV-D5; Wed, 08 Feb 2023 09:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pPlPO-00068d-20
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:26:50 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ninad@linux.vnet.ibm.com>)
 id 1pPlPG-0006lY-Uu
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:26:49 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 318EBqLo013272
 for <qemu-devel@nongnu.org>; Wed, 8 Feb 2023 14:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=X+jHQmmJPgVsds/J0IuBMl1rwObGNIazPH5H/zLGbqo=;
 b=al/KhStaJtb4WG2pILMFoseBt6lpKN0c+NqduRJ9He5+AidKMkRoNyYEaeECMOYWxL9P
 dYlEcvz434F6xLHP6I5ltJGhyyZm1t4lIRbEU1x4QpNrGbM7zmFGZIlspApH9zPHj4Qs
 tZI03bEcxktyb421zrfwX+egAN5eO+A0uMjZ9+qUAy/kz0cUvvhCAj0NBQB1A/3r5UC6
 mX4UT7SHqOIjdLlV7F/40VNvljzDYAJzIGmX8wiOXxenxSFhZeShYusYEFJ34wk/Vlh4
 Hy44A+rdtV4vywdTbGb64BtgihWYXKnA9Oqwu0H9w1z9mPxv2ipocq7kglxG9Kd+Ea9H ug== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nmd9n0ctn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:26:39 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 318C7ACP001953
 for <qemu-devel@nongnu.org>; Wed, 8 Feb 2023 14:26:38 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3nhf07k2ws-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 14:26:38 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com
 [10.241.53.104])
 by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 318EQbiV7143990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 8 Feb 2023 14:26:37 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FC785804C
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 14:26:37 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56F3358056
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 14:26:37 +0000 (GMT)
Received: from [9.163.39.56] (unknown [9.163.39.56])
 by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP
 for <qemu-devel@nongnu.org>; Wed,  8 Feb 2023 14:26:37 +0000 (GMT)
Message-ID: <0bdde867-d769-1146-76a7-b8cbe89a13fa@linux.vnet.ibm.com>
Date: Wed, 8 Feb 2023 08:26:37 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Ninad Palsule <ninad@linux.vnet.ibm.com>
Subject: rainier-bmc machine dumping core with latest qemu
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GsfQ7ni6Oi7zN7q4ZiHHflH7LYemNQUC
X-Proofpoint-ORIG-GUID: GsfQ7ni6Oi7zN7q4ZiHHflH7LYemNQUC
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_06,2023-02-08_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080124
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=ninad@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Hello,

I am hitting core dump while running qemu with rainier-bmc machine. I 
started
hitting it after I rebased to latest qemu from master.
Can someone please help?

/home/abc/dev/qemu/build/qemu-system-arm -M rainier-bmc -nographic \
   -kernel 
./fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin \
   -dtb 
./aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb \
   -initrd ./obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz \
   -drive 
file=./obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2,if=sd,index=2 
\
   -append 'rootwait console=ttyS4,115200n8 root=PARTLABEL=rofs-a'



[  OK  ] Started Journal Service.
          Starting Flush Journal to Persistent Storage...
[   45.873184] systemd-journald[156]: Received client request to flush 
runtime journal.
[   45.932231] systemd-journald[156]: File 
/var/log/journal/97cd620eaa284caf980533438c7355c4/system.journal 
corrupted or uncleanly shut down, renaming and replacing.
qemu-system-arm: /home/abc/dev/qemu/block/block-gen.h:43: bdrv_poll_co: 
Assertion `qemu_get_current_aio_context() == qemu_get_aio_context()' failed.

Thread 3 "qemu-system-arm" received signal SIGABRT, Aborted.
[Switching to Thread 0x7ffff6896640 (LWP 3898452)]
__pthread_kill_implementation (no_tid=0, signo=6, 
threadid=140737329587776) at ./nptl/pthread_kill.c:44
44  ./nptl/pthread_kill.c: No such file or directory.


#6  0x00007ffff77e8e96 in __GI___assert_fail
     (assertion=assertion@entry=0x55555603e798 
"qemu_get_current_aio_context() ==
qemu_get_aio_context()", file=file@entry=0x5555560aef28 
"/home/abc/dev/qemu/block/block-gen.h", line=line@entry=43, 
function=function@entry=0x5555560af080 <__PRETTY_FUNCTION__.9> 
"bdrv_poll_co") at ./assert/assert.c:101
#7  0x0000555555da91f9 in bdrv_poll_co (s=0x7ffff68957f0) at 
/home/abc/dev/qemu/block/block-gen.h:43
#8  bdrv_poll_co (s=0x7ffff68957f0) at 
/home/abc/dev/qemu/block/block-gen.h:38
#9  bdrv_getlength (bs=<optimized out>) at block/block-gen.c:310
#10 0x0000555555e3558e in handle_aiocb_write_zeroes 
(opaque=0x7fff419965f0) at ../block/file-posix.c:1741
#11 0x0000555555ef80fd in worker_thread 
(opaque=opaque@entry=0x5555569e2300) at ../util/thread-pool.c:110
#12 0x0000555555ee3901 in qemu_thread_start (args=<optimized out>) at 
../util/qemu-thread-posix.c:505
#13 0x00007ffff7843b43 in start_thread (arg=<optimized out>) at 
./nptl/pthread_create.c:442
#14 0x00007ffff78d5a00 in clone3 () at 
../sysdeps/unix/sysv/linux/x86_64/clone3.S:81

(gdb) p qemu_aio_context
$1 = (AioContext *) 0x5555568b13d0

---------------------------------------


Reproduction steps:

1. Clone and build qemu from https://github.com/qemu/qemu
2. Download following eBMC images

BLD_VERSION=20230205025034
LINUX_VERSION="6.0.19+git0+67c9407e1f"
wget 
https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-initramfs-p10bmc-${BLD_VERSION}.rootfs.cpio.xz

wget 
https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/aspeed-bmc-ibm-rainier--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.dtb

wget 
https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/fitImage-linux.bin--${LINUX_VERSION}-r0-p10bmc-${BLD_VERSION}.bin

wget 
https://jenkins.openbmc.org/view/latest/job/latest-master/label=docker-builder,target=p10bmc/lastStableBuild/artifact/openbmc/build/tmp/deploy/images/p10bmc/obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2
qemu-img resize 
obmc-phosphor-image-p10bmc-${BLD_VERSION}.rootfs.wic.qcow2 16G

3. Run the qemu command as show at the start



