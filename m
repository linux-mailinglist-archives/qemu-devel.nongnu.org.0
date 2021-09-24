Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FE2416B80
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 08:22:11 +0200 (CEST)
Received: from localhost ([::1]:59798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTeb4-00087i-MU
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 02:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8901221e72=pdel@fb.com>)
 id 1mTeZF-0005wf-N9
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:20:18 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:30036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=8901221e72=pdel@fb.com>)
 id 1mTeZB-0003D3-3I
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 02:20:15 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NNg3MA013080
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 23:20:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=oa101Q2nzLw8QUQHa8f3FlzIcGwmN/GnEQlCtKg0obk=;
 b=jeD/Z1Ko2DSufjAKVWcJJfpigk4f1nIknuudFsGxxP5Dei7AeCYd9pEWuSrjTEMevtVM
 o/nFY+4R2JrdtCOIcdUBwmsmAcQH692V8xc8+gtJj2W2xRYAC7mPLXgjtTpDNG/df41o
 6qwa7wjqL9NNVuFFUUAnxkw/lvppHHh8tA0= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3b93fuhp9s-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 23:20:02 -0700
Received: from intmgw001.46.prn1.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 23 Sep 2021 23:20:00 -0700
Received: by devvm660.prn0.facebook.com (Postfix, from userid 385188)
 id 9C78D3E4FC96; Thu, 23 Sep 2021 23:19:55 -0700 (PDT)
From: <pdel@fb.com>
To: 
CC: <clg@kaod.org>, <joel@jms.id.au>, <rashmica.g@gmail.com>,
 <patrick@stwcx.xyz>, <qemu-devel@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PATCH 0/1] hw: aspeed_gpio: Fix GPIO array indexing
Date: Thu, 23 Sep 2021 23:19:52 -0700
Message-ID: <20210924061953.1996620-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-FB-Source: Intern
X-Proofpoint-GUID: 5zzNV5vYhhaOut_Op4kja8lVO_sCNaia
X-Proofpoint-ORIG-GUID: 5zzNV5vYhhaOut_Op4kja8lVO_sCNaia
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_01,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 suspectscore=0
 phishscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2109240035
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=8901221e72=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Delevoryas <pdel@fb.com>

Hey everyone,

I think there might be a bug aspeed_gpio_update, when it's selecting a
GPIO IRQ to update. I was testing booting Facebook's OpenBMC platform
"YosemiteV2" (fby2), and I was hitting a segfault in QEMU:

qemu-system-arm -machine ast2500-evb \
    -drive file=3Dfby2.mtd,format=3Draw,if=3Dmtd \
    -serial stdio -display none
...
Setup Caching for Bridge IC info..done.
Setup Front Panel Daemon..done.
Setup fan speed...
FAN CONFIG : Single Rotor FAN
Unexpected 4 Servers config! Run FSC 4 TLs Config as default config
Setting Zone 0 speed to 70%
Setting Zone 1 speed to 70%
ok: run: fscd: (pid 1726) 0s
done.
Powering fru 1 to ON state...
Segmentation fault (core dumped)

In gdb:

Thread 3 "qemu-system-arm" received signal SIGSEGV, Segmentation fault.
[Switching to Thread 0x7ffff20ee700 (LWP 1840353)]
qemu_set_irq (irq=3D0xffffffff00000000, level=3D1) at ../hw/core/irq.c:45
45          irq->handler(irq->opaque, irq->n, level);
(gdb) p irq
$1 =3D (qemu_irq) 0xffffffff00000000
(gdb) up
#1  0x00005555558e36f5 in aspeed_gpio_update (s=3D0x7ffff7ecffb0, regs=3D0x=
7ffff7ed0c94, value=3D128) at ../hw/gpio/aspeed_gpio.c:287
287                     qemu_set_irq(s->gpios[offset], !!(new & mask));
(gdb) p s->gpios
$2 =3D {0x0 <repeats 228 times>}
(gdb) p offset
$3 =3D 231
(gdb) p set
$5 =3D 7
(gdb) p gpio
$4 =3D 7

The commit message for the fix has a little more info on the bug here,
see that for more info.

I tested this by verifying that after this diff, I can boot this fby2
platform. I don't see any unit or qtest's for aspeed gpio's, maybe I
could add one? I figured that, first, I could just put out an email to
let everyone know about it, and get the diff reviewed.

The image I was using is here:

https://github.com/peterdelevoryas/openbmc/releases/tag/fby2.debug.mtd

Peter Delevoryas (1):
  hw: aspeed_gpio: Fix GPIO array indexing

 hw/gpio/aspeed_gpio.c         | 80 +++++++++++++++--------------------
 include/hw/gpio/aspeed_gpio.h |  5 +--
 2 files changed, 35 insertions(+), 50 deletions(-)

--=20
2.30.2


