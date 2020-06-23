Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7DB206552
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 23:42:06 +0200 (CEST)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnqg8-0002BH-5u
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 17:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnqf1-0001Uy-R4
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 17:40:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:60696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnqez-0003We-OA
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 17:40:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jnqew-0008LH-L8
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 21:40:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 745F42E8109
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 21:40:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2020 21:35:47 -0000
From: Eric Blake <1884831@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake tobias-hunger
X-Launchpad-Bug-Reporter: TobiasHunger (tobias-hunger)
X-Launchpad-Bug-Modifier: Eric Blake (eblake)
References: <159294358125.13789.3860026407311199131.malonedeb@wampee.canonical.com>
Message-Id: <159294814773.16548.4367549975584519679.malone@chaenomeles.canonical.com>
Subject: [Bug 1884831] Re: qemu-nbd fails to discard bigger chunks
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 7237684235b2980e64cbe2fdafb57b5ae56f8d8c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 16:25:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1884831 <1884831@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's get nbd.ko out of the picture.  The problem can be reproduced in
user space (here, where I built qemu-nbd to log trace messages to
stderr):

$ truncate --size=3D3G file
$ qemu-nbd -f raw file --trace=3Dnbd_\*
$ nbdsh -u nbd://localhost:10810 -c 'h.trim(3*1024*1024*1024,0)'
Traceback (most recent call last):
  File "/usr/lib64/python3.8/runpy.py", line 194, in _run_module_as_main
    return _run_code(code, main_globals, None,
  File "/usr/lib64/python3.8/runpy.py", line 87, in _run_code
    exec(code, run_globals)
  File "/usr/lib64/python3.8/site-packages/nbd.py", line 1762, in <module>
    nbdsh.shell()
  File "/usr/lib64/python3.8/site-packages/nbdsh.py", line 100, in shell
    exec (c, d, d)
  File "<string>", line 1, in <module>
  File "/usr/lib64/python3.8/site-packages/nbd.py", line 1098, in trim
    return libnbdmod.trim (self._o, count, offset, flags)
nbd.Error: nbd_trim: trim: command failed: Input/output error (EIO)

and looking at the trace output from qemu-nbd, I see:
493771@1592948038.044141:nbd_negotiate_success Negotiation succeeded
493771@1592948038.044167:nbd_trip Reading request
493771@1592948038.044262:nbd_receive_request Got request: { magic =3D 0x256=
09513, .flags =3D 0x0, .type =3D 0x4, from =3D 0, len =3D 3221225472 }
493771@1592948038.044272:nbd_co_receive_request_decode_type Decoding type: =
handle =3D 1, type =3D 4 (trim)
493771@1592948038.044291:nbd_co_send_structured_error Send structured error=
 reply: handle =3D 1, error =3D 5 (EIO), msg =3D 'discard failed'

so this is definitely a case of qemu as NBD server NOT honoring requests
between 2G and 4G.  I'll have a patch posted soon.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884831

Title:
  qemu-nbd fails to discard bigger chunks

Status in QEMU:
  New

Bug description:
  This report is moved from systemd to here:
  https://github.com/systemd/systemd/issues/16242

  A qemu-nbd device reports that it can discard a lot of bytes:

  cat /sys/block/nbd0/queue/discard_max_bytes
  2199023255040

  And indeed, discard works with small images:

  $ qemu-img create -f qcow2 /tmp/image.img 2M
  $ sudo qemu-nbd --connect=3D/dev/nbd0 /tmp/image.img
  $ sudo blkdiscard /dev/nbd0

  but not for bigger ones (still smaller than discard_max_bytes):

  $ qemu-img create -f qcow2 /tmp/image.img 5G
  $ sudo qemu-nbd --connect=3D/dev/nbd0 /tmp/image.img
  $ sudo blkdiscard /dev/nbd0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884831/+subscriptions

