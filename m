Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3A309563
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Jan 2021 14:34:09 +0100 (CET)
Received: from localhost ([::1]:53034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5qO8-00053h-42
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 08:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5qM4-000489-CJ
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 08:32:01 -0500
Received: from indium.canonical.com ([91.189.90.7]:58536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l5qKt-0004Dh-Mx
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 08:31:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l5qKn-0004oi-Ci
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 13:30:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5D8EC2E813A
 for <qemu-devel@nongnu.org>; Sat, 30 Jan 2021 13:30:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 Jan 2021 13:21:06 -0000
From: P J P <1913873@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: P J P (pjps)
References: <161200949811.14050.15321983107539308514.malonedeb@wampee.canonical.com>
Message-Id: <161201286723.32620.16263820378894875544.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1913873] Re: QEMU: net: vmxnet: integer overflow may crash guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: 652f6978051e495974b9200e43767f5de006d8ad
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

** Information type changed from Private Security to Public Security

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

