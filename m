Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6043E31BE
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 00:27:02 +0200 (CEST)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC8Iw-0006zx-16
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 18:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mC8Hb-0004W1-AH
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:25:39 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:58830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mC8HY-0003Ls-RQ
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 18:25:39 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id EE8773F314
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 22:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628288731;
 bh=qrNitBSIAEW4SucGWYbeJC1VPdk/4CVGTRYcoTSOHSE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:Message-Id:
 Subject;
 b=cFs60L0t01hLUcNEIvcDwPgE3YSrIJ8ItNuFGaGVkKLUoTf9+dD52JitpAYF0ke/q
 MB68pM24xEZkDiixC4eCwjcrVX6QbZWThMsU7gaat8/EvrvhvL/kwi3OWiBvW3OEJN
 NW8jckBZdKiBTOw0nf2J6GLe1rwaSfrPS4EWARclTAeKKkReRJVWGEh8FPYwHqrEfF
 C3lekFW3wQGOy53IP9/U6XDDLv/mj7T2y5FSxPY51MDYGPEx+NsvLMH8CL4WJiMM8i
 uEwoIPocwxK3MRhp13RMsBU1lTGKJiQmPTY//KiNZf1p5jwS/aQmbQJeroCSnd+4JP
 /oy6bE5n47wHw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E4252E8139
 for <qemu-devel@nongnu.org>; Fri,  6 Aug 2021 22:25:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Aug 2021 22:19:46 -0000
From: Arthur Lyubochenya <1939179@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alterman
X-Launchpad-Bug-Reporter: Arthur Lyubochenya (alterman)
X-Launchpad-Bug-Modifier: Arthur Lyubochenya (alterman)
Message-Id: <162828838699.17021.15925888753867381066.malonedeb@soybean.canonical.com>
Subject: [Bug 1939179] [NEW] qemu-ga fsfreeze crashes the kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c08a1e23be9b835a8d0e7a32b2e55270fac05933"; Instance="production"
X-Launchpad-Hash: af5ae832f5711edaa545b7d0219d23e49657f7fb
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1939179 <1939179@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hello,

Still required your attention, duplicate from:
https://bugs.launchpad.net/bugs/1807073
https://bugs.launchpad.net/bugs/1813045

We use mainly Cloudlinux, Debian and Centos.
We experienced many crashes on our qemu instances based on Cloudlinux durin=
g a snapshot.
The issue is not related to CloudLinux directly, but to Qemu agent, which d=
oes not freeze the file system(s) correctly. What is actually happening:

When VM backup is invoked, Qemu agent freezes the file systems, so no singl=
e change will be made during the backup. But Qemu agent does not respect th=
e loop* devices in freezing order (we have checked its sources), which lead=
s to the next situation:
1) freeze loopback fs
              ---> send async reqs to loopback thread
2) freeze main fs
3) loopback thread wakes up and trying to write data to the main fs, which =
is still frozen, and this finally leads to the hung task and kernel crash.

Moreover, a lot of Proxmox users are complaining about the issue as well:
https://forum.proxmox.com/threads/error-vm-100-qmp-command-guest-fsfreeze-t=
haw-failed-got-timeout.68082/
https://forum.proxmox.com/threads/problem-with-fsfreeze-freeze-and-qemu-gue=
st-agent.65707/

** Affects: qemu
     Importance: Undecided
         Status: New

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1939179

Title:
  qemu-ga fsfreeze crashes the kernel

Status in QEMU:
  New

Bug description:
  Hello,

  Still required your attention, duplicate from:
  https://bugs.launchpad.net/bugs/1807073
  https://bugs.launchpad.net/bugs/1813045

  We use mainly Cloudlinux, Debian and Centos.
  We experienced many crashes on our qemu instances based on Cloudlinux dur=
ing a snapshot.
  The issue is not related to CloudLinux directly, but to Qemu agent, which=
 does not freeze the file system(s) correctly. What is actually happening:

  When VM backup is invoked, Qemu agent freezes the file systems, so no sin=
gle change will be made during the backup. But Qemu agent does not respect =
the loop* devices in freezing order (we have checked its sources), which le=
ads to the next situation:
  1) freeze loopback fs
                ---> send async reqs to loopback thread
  2) freeze main fs
  3) loopback thread wakes up and trying to write data to the main fs, whic=
h is still frozen, and this finally leads to the hung task and kernel crash.

  Moreover, a lot of Proxmox users are complaining about the issue as well:
  https://forum.proxmox.com/threads/error-vm-100-qmp-command-guest-fsfreeze=
-thaw-failed-got-timeout.68082/
  https://forum.proxmox.com/threads/problem-with-fsfreeze-freeze-and-qemu-g=
uest-agent.65707/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1939179/+subscriptions


