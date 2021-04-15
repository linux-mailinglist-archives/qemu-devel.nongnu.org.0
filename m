Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CF36121A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 20:29:12 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX6jn-0002jW-Pa
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 14:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lX6gS-0001ir-UH
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:25:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:55406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lX6gP-0001lc-Uw
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 14:25:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lX6gN-00072H-4f
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 18:25:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1C1F72E8047
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 18:25:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Apr 2021 18:15:26 -0000
From: Gautam Dawar <1924603@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: v5.1.0
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gdawar
X-Launchpad-Bug-Reporter: Gautam Dawar (gdawar)
X-Launchpad-Bug-Modifier: Gautam Dawar (gdawar)
Message-Id: <161851052657.18499.4390060645724242620.malonedeb@wampee.canonical.com>
Subject: [Bug 1924603] [NEW] Incorrect feature negotiation for vhost-vdpa
 netdevice
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="929bdb49da44562d032228b8f93c5c598dae8678"; Instance="production"
X-Launchpad-Hash: d9b8a8d59a42be33555ca97867cd41c037ff47a6
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
Reply-To: Bug 1924603 <1924603@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

QEMU cmdline:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
./x86_64-softmmu/qemu-system-x86_64 -machine accel=3Dkvm -m 2G -hda  /gauta=
m/centos75_1.qcow2 -name gautam,process=3Dgautam -enable-kvm -netdev vhost-=
vdpa,id=3Dmynet0,vhostdev=3D/dev/vhost-vdpa-0 -device virtio-net-pci,netdev=
=3Dmynet0,mac=3D02:AA:BB:DD:00:20,disable-modern=3Doff,page-per-vq=3Don -cp=
u host --nographic

Host OS:
=3D=3D=3D=3D=3D=3D=3D=3D
Linux kernel 5.11 running on x86 host

Guest OS:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
CentOS 7.5

Root cause analysis:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

For vhost-vdpa netdevice, the feature negotiation results in sending the
superset of features received from device in call to get_features vdpa
ops callback.

During the feature-negotiation phase, the acknowledged feature bits are
initialized with backend_features  and then checked for supported
feature bits in vhost_ack_features():

void vhost_net_ack_features(struct vhost_net *net, uint64_t features)
{
  net->dev.acked_features =3D net->dev.backend_features;
  vhost_ack_features(&net->dev, vhost_net_get_feature_bits(net), features);
}

 =

The vhost_ack_features() function just builds up on the dev.acked_features =
and never trims it down:

void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits, ui=
nt64_t features)
{     const int *bit =3D feature_bits;

      while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
           uint64_t bit_mask =3D (1ULL << *bit);      =


            if (features & bit_mask)
                 hdev->acked_features |=3D bit_mask;

            bit++;
       }
}

Because of this hdev->acked_features is always minimally equal to the
value of device features and this is the value that is passed to the
device in set_features callback:

static int vhost_dev_set_features(struct vhost_dev *dev, bool enable_log)
{
       uint64_t *features =3D dev->acked_features;
       .....
       r =3D dev->vhost_ops->*vhost_set_features*(dev, features);
}

** Affects: qemu
     Importance: Undecided
         Status: New


** Tags: v5.1.0

** Tags added: v5.1.0

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1924603

Title:
  Incorrect feature negotiation for vhost-vdpa netdevice

Status in QEMU:
  New

Bug description:
  QEMU cmdline:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  ./x86_64-softmmu/qemu-system-x86_64 -machine accel=3Dkvm -m 2G -hda  /gau=
tam/centos75_1.qcow2 -name gautam,process=3Dgautam -enable-kvm -netdev vhos=
t-vdpa,id=3Dmynet0,vhostdev=3D/dev/vhost-vdpa-0 -device virtio-net-pci,netd=
ev=3Dmynet0,mac=3D02:AA:BB:DD:00:20,disable-modern=3Doff,page-per-vq=3Don -=
cpu host --nographic

  Host OS:
  =3D=3D=3D=3D=3D=3D=3D=3D
  Linux kernel 5.11 running on x86 host

  Guest OS:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  CentOS 7.5

  Root cause analysis:
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  For vhost-vdpa netdevice, the feature negotiation results in sending
  the superset of features received from device in call to get_features
  vdpa ops callback.

  During the feature-negotiation phase, the acknowledged feature bits
  are initialized with backend_features  and then checked for supported
  feature bits in vhost_ack_features():

  void vhost_net_ack_features(struct vhost_net *net, uint64_t features)
  {
    net->dev.acked_features =3D net->dev.backend_features;
    vhost_ack_features(&net->dev, vhost_net_get_feature_bits(net), features=
);
  }

   =

  The vhost_ack_features() function just builds up on the dev.acked_feature=
s and never trims it down:

  void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits, =
uint64_t features)
  {     const int *bit =3D feature_bits;

        while (*bit !=3D VHOST_INVALID_FEATURE_BIT) {
             uint64_t bit_mask =3D (1ULL << *bit);      =


              if (features & bit_mask)
                   hdev->acked_features |=3D bit_mask;

              bit++;
         }
  }

  Because of this hdev->acked_features is always minimally equal to the
  value of device features and this is the value that is passed to the
  device in set_features callback:

  static int vhost_dev_set_features(struct vhost_dev *dev, bool enable_log)
  {
         uint64_t *features =3D dev->acked_features;
         .....
         r =3D dev->vhost_ops->*vhost_set_features*(dev, features);
  }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1924603/+subscriptions

