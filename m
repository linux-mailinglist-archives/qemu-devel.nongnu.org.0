Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCC530999F
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 02:22:45 +0100 (CET)
Received: from localhost ([::1]:47990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l61Rr-0006IB-Ka
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 20:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l61Q2-0005Xw-8r
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 20:20:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:56860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l61Py-0004Lx-Nt
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 20:20:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l61Px-0007DT-GB
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 01:20:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 76FB22E8137
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 01:20:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 01:08:38 -0000
From: Alexander Bulekov <1913873@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: Alexander Bulekov (a1xndr)
References: <161200949811.14050.15321983107539308514.malonedeb@wampee.canonical.com>
Message-Id: <161205531885.4385.14211646817598014842.malone@soybean.canonical.com>
Subject: [Bug 1913873] Re: QEMU: net: vmxnet: integer overflow may crash guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: d5959e182390d669bfab5f480af35d2a76aaec1a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1913873 <1913873@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this the same as https://bugs.launchpad.net/qemu/+bug/1890152 ?

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913873

Title:
  QEMU: net: vmxnet: integer overflow may crash guest

Status in QEMU:
  New

Bug description:
  * Gaoning Pan from Zhejiang University & Ant Security Light-Year Lab repo=
rted a malloc failure
    issue locates in vmxnet3_activate_device() of qemu/hw/net/vmxnet3.c NIC=
 emulator

  * This issue is reproducible  because while activating the NIC device, vm=
xnet3_activate_device
    does not validate guest supplied configuration values against predefine=
d min/max limits.

  @@ -1420,6 +1420,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
       vmxnet3_setup_rx_filtering(s);
       /* Cache fields from shared memory */
       s->mtu =3D VMXNET3_READ_DRV_SHARED32(d, s->drv_shmem, devRead.misc.m=
tu);
  +    assert(VMXNET3_MIN_MTU <=3D s->mtu && s->mtu < VMXNET3_MAX_MTU);    =
<=3D Did not check if MTU is within range
       VMW_CFPRN("MTU is %u", s->mtu);
   =

       s->max_rx_frags =3D
  @@ -1473,6 +1474,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
           /* Read rings memory locations for TX queues */
           pa =3D VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.txRingBa=
sePA);
           size =3D VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.txRing=
Size);
  +        if (size > VMXNET3_TX_RING_MAX_SIZE) {                      <=3D=
 Did not check TX ring size
  +            size =3D VMXNET3_TX_RING_MAX_SIZE;
  +        }
   =

           vmxnet3_ring_init(d, &s->txq_descr[i].tx_ring, pa, size,
                             sizeof(struct Vmxnet3_TxDesc), false);
  @@ -1483,6 +1487,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
           /* TXC ring */
           pa =3D VMXNET3_READ_TX_QUEUE_DESCR64(d, qdescr_pa, conf.compRing=
BasePA);
           size =3D VMXNET3_READ_TX_QUEUE_DESCR32(d, qdescr_pa, conf.compRi=
ngSize);
  +        if (size > VMXNET3_TC_RING_MAX_SIZE) {                       <=
=3D Did not check TC ring size =

  +            size =3D VMXNET3_TC_RING_MAX_SIZE;
  +        }
           vmxnet3_ring_init(d, &s->txq_descr[i].comp_ring, pa, size,
                             sizeof(struct Vmxnet3_TxCompDesc), true);
           VMXNET3_RING_DUMP(VMW_CFPRN, "TXC", i, &s->txq_descr[i].comp_rin=
g);
  @@ -1524,6 +1531,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
               /* RX rings */
               pa =3D VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.rxRingBa=
sePA[j]);
               size =3D VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.rxRing=
Size[j]);
  +            if (size > VMXNET3_RX_RING_MAX_SIZE) {                   <=
=3D Did not check RX ring size
  +                size =3D VMXNET3_RX_RING_MAX_SIZE;
  +            }
               vmxnet3_ring_init(d, &s->rxq_descr[i].rx_ring[j], pa, size,
                                 sizeof(struct Vmxnet3_RxDesc), false);
               VMW_CFPRN("RX queue %d:%d: Base: %" PRIx64 ", Size: %d",
  @@ -1533,6 +1543,9 @@ static void vmxnet3_activate_device(VMXNET3State *s)
           /* RXC ring */
           pa =3D VMXNET3_READ_RX_QUEUE_DESCR64(d, qd_pa, conf.compRingBase=
PA);
           size =3D VMXNET3_READ_RX_QUEUE_DESCR32(d, qd_pa, conf.compRingSi=
ze);
  +        if (size > VMXNET3_RC_RING_MAX_SIZE) {                      <=3D=
 Did not check RC ring size
  +            size =3D VMXNET3_RC_RING_MAX_SIZE;
  +        }

  This may lead to potential integer overflow OR OOB buffer access
  issues.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913873/+subscriptions

