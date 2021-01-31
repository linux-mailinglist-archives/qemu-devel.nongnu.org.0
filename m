Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12682309F2C
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 23:06:34 +0100 (CET)
Received: from localhost ([::1]:56778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6KrY-0008Rc-Fc
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 17:06:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6Kqg-0007vx-Oo
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 17:05:38 -0500
Received: from indium.canonical.com ([91.189.90.7]:35266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l6Kqe-00028s-L1
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 17:05:38 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l6Kqc-0001LY-St
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 22:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D1D8E2E804B
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 22:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 21:56:18 -0000
From: Vjaceslavs Klimovs <1913969@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: vklimovs
X-Launchpad-Bug-Reporter: Vjaceslavs Klimovs (vklimovs)
X-Launchpad-Bug-Modifier: Vjaceslavs Klimovs (vklimovs)
Message-Id: <161213017826.4056.12759150225792580313.malonedeb@soybean.canonical.com>
Subject: [Bug 1913969] [NEW] unable to migrate non shared storage when TLS is
 used
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: c3babba24468b6fb9a5cbbe3c30e7403ac78f661
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1913969 <1913969@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Operating system: Gentoo
Architecture: x86_64
kernel version: 5.4.72, 5.10.11
libvirt version: at least 6.9.0, 6.10.0, 7.0.0
Hypervisor and version: qemu 5.1.0, 5.2.0

With software versions described above and following configurations:
libvirt:
key_file =3D "/etc/ssl/libvirt/server.lan.key"
cert_file =3D "/etc/ssl/libvirt/server.lan.crt"
ca_file =3D "/etc/ssl/libvirt/ca.crt"
log_filters=3D"3:remote 4:event 3:util.json 3:rpc 1:*"
log_outputs=3D"1:file:/var/log/libvirt/libvirtd.log"
qemu:
default_tls_x509_cert_dir =3D "/etc/ssl/qemu"
default_tls_x509_verify =3D 1
migration with tls:
virsh # migrate vm1 qemu+tls://server2.lan/system --persistent --undefineso=
urce --copy-storage-all --verbose --tls
never succeeds. Progress stops typically at high progress amounts (95%-98%)=
, and network traffic drastically drops as well (from 1 gbps+ to nothing). =
domjobinfo progress also stops. Without --tls migrations succeed without is=
sues without any other changes to hosts or configurations.

Note: I reported this originally as libvirt bug:
https://gitlab.com/libvirt/libvirt/-/issues/108.

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1913969

Title:
  unable to migrate non shared storage when TLS is used

Status in QEMU:
  New

Bug description:
  Operating system: Gentoo
  Architecture: x86_64
  kernel version: 5.4.72, 5.10.11
  libvirt version: at least 6.9.0, 6.10.0, 7.0.0
  Hypervisor and version: qemu 5.1.0, 5.2.0

  With software versions described above and following configurations:
  libvirt:
  key_file =3D "/etc/ssl/libvirt/server.lan.key"
  cert_file =3D "/etc/ssl/libvirt/server.lan.crt"
  ca_file =3D "/etc/ssl/libvirt/ca.crt"
  log_filters=3D"3:remote 4:event 3:util.json 3:rpc 1:*"
  log_outputs=3D"1:file:/var/log/libvirt/libvirtd.log"
  qemu:
  default_tls_x509_cert_dir =3D "/etc/ssl/qemu"
  default_tls_x509_verify =3D 1
  migration with tls:
  virsh # migrate vm1 qemu+tls://server2.lan/system --persistent --undefine=
source --copy-storage-all --verbose --tls
  never succeeds. Progress stops typically at high progress amounts (95%-98=
%), and network traffic drastically drops as well (from 1 gbps+ to nothing)=
. domjobinfo progress also stops. Without --tls migrations succeed without =
issues without any other changes to hosts or configurations.

  Note: I reported this originally as libvirt bug:
  https://gitlab.com/libvirt/libvirt/-/issues/108.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1913969/+subscriptions

