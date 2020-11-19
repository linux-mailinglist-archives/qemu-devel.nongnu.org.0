Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5872B98CB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:01:11 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfnJ0-0001Te-Oy
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:01:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFd-0008Gm-F7; Thu, 19 Nov 2020 11:57:41 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kfnFb-0004dG-Ap; Thu, 19 Nov 2020 11:57:41 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJGXa1a181704; Thu, 19 Nov 2020 11:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=uByfQEScrj9BOZ3xp7HT3RzYQqfpUNyJWTgb6BPfTdY=;
 b=WSf5eutixgNckxD7zWV9XTxj60q7u2mAa2xxUDHinXNsTlpLINfp4LsU0sU79/NUnSJJ
 782AQOvlWeOO86cPv8LeuwzDKcRO2MgcWtAH39UneMBnD0gmXnj9+qKzRzG1CNrqGkNx
 AJvVDfnjgsMDmx0h1l+nTaozc8Elj1rKf8n0XbzumQHOGTcG0Gr0Ia9hD2FdCzEFL8BP
 /9Jsj5jA1mwOmERUqZkK273z1T0eNd0ZWHjGmST+FWVPtF3TESphtS2MvJZ8PpP+pxNF
 VtgKCxcMeUdVzSyCZKv3b/zuFx25Q9M4UzZ6gJF5+TTQIysnYnxdI9gp3mXkji6dy1Op Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wumaanb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:36 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AJGYR5Y187193;
 Thu, 19 Nov 2020 11:57:36 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34wumaanah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 11:57:35 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJGpbe5032131;
 Thu, 19 Nov 2020 16:57:34 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 34w4yfh95f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 16:57:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AJGvVuj58196372
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 16:57:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B7554C062;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B8F84C05A;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 19 Nov 2020 16:57:31 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 040FEE23AA; Thu, 19 Nov 2020 17:57:31 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH 0/2] pc-bios/s390 fixes for reboot-to-vfio-ccw
Date: Thu, 19 Nov 2020 17:57:27 +0100
Message-Id: <20201119165729.63351-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_09:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011190118
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 qemu-devel@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x@nongnu.org, Jared Rossi <jrossi@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Conny, Thomas,

I've come across a couple problems when installing a guest onto a
vfio-ccw disk. They were noticed when booting off an ISO via virtio,
and writing the new guest OS to a vfio-ccw connected disk. The
installation works correctly, in that the disk can be booted and
used perfectly fine. But the end of the install process reboots to
the new disk, and we end up with an error that looks like this:

Rebooting.
LOADPARM=[        ]
cio device error
  ssid  : 0x0000000000000000
  cssid : 0x0000000000000000
  sch_no: 0x0000000000000002
  ctrl-unit type: 0x0000000000003990

Interrupt Response Block Data:
: 0x0000000000003990
    Function Ctrl : [Start]
    Activity Ctrl : [Start-Pending]
    Status Ctrl : [Alert] [Primary] [Secondary] [Status-Pending]
    Device Status :
    Channel Status : [Program-Check]
    cpa=: 0x0000000000000008
    prev_ccw=: 0x0008000080002018
    this_ccw=: 0x0600001860000080
Eckd Dasd Sense Data (fmt 32-bytes):
    Channel Status : [Program-Check]
    Sense Condition Flags :
    Residual Count     =: 0x0000000000000000
    Phys Drive ID      =: 0x0000000000000000
    low cyl address    =: 0x0000000000000000
    head addr & hi cyl =: 0x0000000000000000
    format/message     =: 0x0000000000000000
    fmt-dependent[0-7] =: 0x0000000000000000
    fmt-dependent[8-15]=: 0x000000004a200f00
    prog action code   =: 0x0000000000000000
    Configuration info =: 0x00000000000040e0
    mcode / hi-cyl     =: 0x0000000000000000
    cyl & head addr [0]=: 0x0000000000000000
    cyl & head addr [1]=: 0x0000000000000000
    cyl & head addr [2]=: 0x0000000000000000
dasd-ipl: Failed to run Read IPL channel program

The problem can be easily (and quickly) reproduced by defining
XML with two different guest disks, such as:

    <disk type='block' device='disk'>
      <driver name='qemu' type='raw'/>
      <source dev='/dev/disk/by-path/ccw-0.0.1234'/>
      <target dev='vda' bus='virtio'/>
      <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x0000'/>
    </disk>
    <hostdev mode='subsystem' type='mdev' managed='no' model='vfio-ccw'>
      <source>
        <address uuid='12345678-1234-1234-1234-123456789abc'/>
      </source>
      <address type='ccw' cssid='0xfe' ssid='0x0' devno='0x1235'/>
    </hostdev>

Boot the guest off disk 1234, issue `chreipl 0.0.1235`, and reboot.
Interestingly, going the other direction (1235->1234) works fine.

Two things occur here. First, the DASD IPL code builds a Read IPL
Format-0 CCW at address zero, but assumes that the memory is already
zero. If data is already present (which on reboot it does, and is
probably a PSW), it might be included in that CCW. Patch 1 is a
pretty straightforward fix for this. (Might this one be appropriate
for 5.2?)

Secondly, the jump code looks at a couple memory locations to determine
what jump to perform. But in this virtio-to-vfio jump, we should give
precedence to the data at address zero, rather than the not-yet-cleared
memory. Patch 2 swaps the order of these checks to enable this, and
doesn't appear to affect normal disk boots. But there are a hundred
other boot combinations that I haven't tried here, so could use some
feedback on this one. I do recognize that this leaves no difference
between the "if (!memcmp())" case and not, but left it this way to
help better visualize the change I'm making.

Coda:
I didn't include rebuilt bios patch(es) here, but certainly can.
Also, I'm on holiday all next week; so apologies in advance for
sending a couple patches and then hiding shortly thereafter. :)

Eric Farman (2):
  pc-bios: s390x: Ensure Read IPL memory is clean
  pc-bios: s390x: Give precedence to reset PSW

 pc-bios/s390-ccw/dasd-ipl.c |  3 +++
 pc-bios/s390-ccw/jump2ipl.c | 20 ++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.17.1


