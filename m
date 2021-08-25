Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54943F7080
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:36:45 +0200 (CEST)
Received: from localhost ([::1]:56368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInSn-00023M-0L
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInRf-00084r-Az
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:35 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:45554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInRd-0004WM-HU
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:35:35 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id DC33B3F7D1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876930;
 bh=gBa/QUEn+x60uEmQYvwR2a3BOLMkpO+tH2n1NevqfSU=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Uq5MQYD9b/wKDZXHTsU7yo+73Jr75aser11ID99V6qggHirrRpW3saTHcsszr9Ndr
 DwAmnL6ubYWufeZsZkGc4pkhoScnmE+Sf/IxE5zp/snauML8tk3gNVok0dX8n36G96
 fCnvJ8A9XK8b7sx+lKMqNc/fUZDt251VVo35+h9Hizi+FtKo/s6feSlDqgCLVKfbZf
 sl50pE744puhH1d1595itxmJpXT7anZ/uBUzJgvmNZVRxWnt1xc+C2zsJfRYRCSRwF
 E771zx+Tla1UVL0d/Kle1mOoWfyFYy41ttqYqbOEGFoweEBRf9vJ2B/xL7cxAP21ql
 bn4uNd6KrVXBA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D61822E8167
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:35:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:28:11 -0000
From: Thomas Huth <1761798@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=nova; status=Incomplete; importance=Medium;
 assignee=None; 
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: libvirt live-migration
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: balazs-gibizer cassano dgilbert-h dsutyagin
 kashyapc melwitt mriedem sean-k-mooney th-huth
X-Launchpad-Bug-Reporter: Matt Riedemann (mriedem)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152303245198.3233.1033096993665779324.malonedeb@wampee.canonical.com>
Message-Id: <162987649130.15935.6826368043866059152.malone@chaenomeles.canonical.com>
Subject: [Bug 1761798] Re: live migration intermittently fails in CI with "VQ
 0 size 0x80 Guest index 0x12c inconsistent with Host index 0x134: delta
 0xfff8"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 5f06b464199f5149ae91be05f41619485bdff8ca
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1761798 <1761798@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Is this still happening with the latest release?

** Changed in: nova
       Status: Confirmed =3D> Incomplete

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1761798

Title:
  live migration intermittently fails in CI with "VQ 0 size 0x80 Guest
  index 0x12c inconsistent with Host index 0x134: delta 0xfff8"

Status in OpenStack Compute (nova):
  Incomplete
Status in QEMU:
  Incomplete

Bug description:
  Seen here:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-
  migration/8de6e74/logs/subnode-2/libvirt/qemu/instance-00000002.txt.gz

  2018-04-05T21:48:38.205752Z qemu-system-x86_64: -chardev pty,id=3Dcharser=
ial0,logfile=3D/dev/fdset/1,logappend=3Don: char device redirected to /dev/=
pts/0 (label charserial0)
  warning: TCG doesn't support requested feature: CPUID.01H:ECX.vmx [bit 5]
  2018-04-05T21:48:43.153268Z qemu-system-x86_64: VQ 0 size 0x80 Guest inde=
x 0x12c inconsistent with Host index 0x134: delta 0xfff8
  2018-04-05T21:48:43.153288Z qemu-system-x86_64: Failed to load virtio-blk=
:virtio
  2018-04-05T21:48:43.153292Z qemu-system-x86_64: error while loading state=
 for instance 0x0 of device '0000:00:04.0/virtio-blk'
  2018-04-05T21:48:43.153347Z qemu-system-x86_64: load of migration failed:=
 Operation not permitted
  2018-04-05 21:48:43.198+0000: shutting down, reason=3Dcrashed

  And in the n-cpu logs on the other host:

  http://logs.openstack.org/37/522537/20/check/legacy-tempest-dsvm-
  multinode-live-migration/8de6e74/logs/screen-n-
  cpu.txt.gz#_Apr_05_21_48_43_257541

  There is a related Red Hat bug:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1450524

  The CI job failures are at present using the Pike UCA:

  ii  libvirt-bin                         3.6.0-1ubuntu6.2~cloud0

  ii  qemu-system-x86                     1:2.10+dfsg-0ubuntu3.5~cloud0

To manage notifications about this bug go to:
https://bugs.launchpad.net/nova/+bug/1761798/+subscriptions


