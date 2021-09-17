Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E6C40F16C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 06:42:53 +0200 (CEST)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR5i8-0003KI-7m
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 00:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mR5gM-0002KJ-Da
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 00:41:02 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:53604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mR5gJ-0002qs-37
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 00:41:02 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 982144053B
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1631853653;
 bh=TDEtO63H70MjbHqEZDo0yBGMILDgb4D+24kPlGv9G6g=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=S3Jq58XqmPAE25W9pFhMxdG5IEb1gOuIw+ZGlhsHYSB9azpl0fojI34nfPbgwXqUu
 sOIw5r7mSvrNjGO2IqvYqrsZAz/zCBIU81zx2iqoFcxJfsgCUkkUdppNnmNgAIXAE7
 WhIY3pLCIGvyHANcRUVJJp4NZZGEflAnYsv4iME4Hxvy7w4WW2qWBjFmoIyF7r8IId
 OqyjbzoM+g6SP5flOywtM213B3bOzmIJRxaQlAOKmvO4vmpRn5kjM944dWee3oDlv+
 Pc2ojBmHn6JpESetFgbOodlquuFqPkx2Jt/A0kO5kQiaOaG0G7uH4yTKn3h2o36Pin
 m6Kqbi+eEOrjg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4F7D92E818D
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 04:40:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Sep 2021 04:33:22 -0000
From: Sebastian Unger <1749393@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided;
 assignee=christian.ehrhardt@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu;
 component=main; status=Triaged; importance=Medium; assignee=None; 
X-Launchpad-Bug-Tags: arm linux-user qemu-20.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: doko gerard-f-vidal-4 hertzog janitor komainu8
 laurent-vivier paelzer peterogden pmaydell racb rth sebunger44
X-Launchpad-Bug-Reporter: =?utf-8?q?Rapha=C3=ABl_Hertzog_=28hertzog=29?=
X-Launchpad-Bug-Modifier: Sebastian Unger (sebunger44)
References: <151859702399.9461.6832978283203997178.malonedeb@chaenomeles.canonical.com>
Message-Id: <163185320302.31483.12647085014559152121.malone@gac.canonical.com>
Subject: [Bug 1749393] Re: sbrk() not working under qemu-user with a
 PIE-compiled binary?
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5b65b151acd4c2f8a97ca7e6060e3b23123c0959"; Instance="production"
X-Launchpad-Hash: ac7cee3a04e727d02771725d074c92e713701495
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
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
Reply-To: Bug 1749393 <1749393@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I'm running qemu-arm version 4.2.1 (Debian 1:4.2-3ubuntu6.17) on Ubuntu
20.04.03, but I seem to still be affected by this (or something very
much like it). In my case it is armhf exim4 crashing while creating a
chroot on an amd64 host. The final command run from deeply within
exim4's postinst is:

/usr/sbin/exim4 -C /var/lib/exim4/config.autogenerated.tmp -bV

and produces

Exim version 4.93 #5 built 28-Apr-2021 13:19:17
Copyright (c) University of Cambridge, 1995 - 2018
(c) The Exim Maintainers and contributors in ACKNOWLEDGMENTS file, 2007 - 2=
018
Berkeley DB: Berkeley DB 5.3.28: (September  9, 2013)
Support for: crypteq iconv() IPv6 GnuTLS move_frozen_messages DANE DKIM DNS=
SEC Event I18N OCSP PRDR SOCKS TCP_Fast_Open
Lookups (built-in): lsearch wildlsearch nwildlsearch iplsearch cdb dbm dbmj=
z dbmnz dnsdb dsearch nis nis0 passwd
Authenticators: cram_md5 plaintext
Routers: accept dnslookup ipliteral manualroute queryprogram redirect
Transports: appendfile/maildir/mailstore autoreply lmtp pipe smtp
Fixed never_users: 0
Configure owner: 0:0
Size of off_t: 8
qemu: uncaught target signal 11 (Segmentation fault) - core dumped
Segmentation fault (core dumped)

Interestingly, even

/usr/sbin/exim4 -C /dev/null -bV

produces the same result, so it likely doesn't depend on any
configuration at my end and should be reproducible.

Please let me know if there is anything I can do to help debug further.

Should I create a separate ticket?

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749393

Title:
  sbrk() not working under qemu-user with a PIE-compiled binary?

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Triaged

Bug description:
  [Impact]

   * The current space reserved can be too small and we can end up
     with no space at all for BRK. It can happen to any case, but is
     much more likely with the now common PIE binaries.

   * Backport the upstream fix which reserves a bit more space while loading
     and giving it back after interpreter and stack is loaded.

  [Test Plan]

   * On x86 run:
  sudo apt install -y qemu-user-static docker.io
  sudo docker run --rm arm64v8/debian:bullseye bash -c 'apt update && apt i=
nstall -y wget'
  ...
  Running hooks in /etc/ca-certificates/update.d...
  done.
  Errors were encountered while processing:
   libc-bin
  E: Sub-process /usr/bin/dpkg returned an error code (1)

 =20
  [Where problems could occur]

   * Regressions would be around use-cases of linux-user that is
     emulation not of a system but of binaries.
     Commonly uses for cross-tests and cross-builds so that is the
     space to watch for regressions

  [Other Info]
  =20
   * n/a


  ---

  In Debian unstable, we recently switched bash to be a PIE-compiled
  binary (for hardening). Unfortunately this resulted in bash being
  broken when run under qemu-user (for all target architectures, host
  being amd64 for me).

  $ sudo chroot /srv/chroots/sid-i386/ qemu-i386-static /bin/bash
  bash: xmalloc: .././shell.c:1709: cannot allocate 10 bytes (0 bytes alloc=
ated)

  bash has its own malloc implementation based on sbrk():
  https://git.savannah.gnu.org/cgit/bash.git/tree/lib/malloc/malloc.c

  When we disable this internal implementation and rely on glibc's
  malloc, then everything is fine. But it might be that glibc has a
  fallback when sbrk() is not working properly and it might hide the
  underlying problem in qemu-user.

  This issue has also been reported to the bash upstream author and he sugg=
ested that the issue might be in qemu-user so I'm opening a ticket here. He=
re's the discussion with the bash upstream author:
  https://lists.gnu.org/archive/html/bug-bash/2018-02/threads.html#00080

  You can find the problematic bash binary in that .deb file:
  http://snapshot.debian.org/archive/debian/20180206T154716Z/pool/main/b/ba=
sh/bash_4.4.18-1_i386.deb

  The version of qemu I have been using is 2.11 (Debian package qemu-
  user-static version 1:2.11+dfsg-1) but I have had reports that the
  problem is reproducible with older versions (back to 2.8 at least).

  Here are the related Debian bug reports:
  https://bugs.debian.org/889869
  https://bugs.debian.org/865599

  It's worth noting that bash used to have this problem (when compiled as a=
 PIE binary) even when run directly but then something got fixed in the ker=
nel and now the problem only appears when run under qemu-user:
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1518483

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1749393/+subscriptions


