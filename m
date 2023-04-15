Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C316E2F5F
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 08:46:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnZfG-0004dM-9f; Sat, 15 Apr 2023 02:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pnZf6-0004WO-Qt
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 02:45:30 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pnZf3-00034k-PQ
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 02:45:28 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 2801342F57
 for <qemu-devel@nongnu.org>; Sat, 15 Apr 2023 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1681541115;
 bh=M4Ut3JmIztYSMAYj6JPGBVrQgr+WCysX28mHQC4sVcY=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ZUBhWzJMUkeD+5dxB2Ox02IQT5cyft/RHxUpnFhLqEy8zIyXsckSgojIG6L5/ZFim
 9EiADoPf8ETPiJ4UbPOl2hnSRrgI3woDkWYWyF/2rI2fiYRYuARoboNKGif7nWLXpw
 ri4f/vdBTFTvypvxSjmVBulSIPu5mNnKB5bS/EAsRqGHljiPdtzXhGR0UURCSTIfsb
 f3ApVJhobOvM4SN5Ek7wOXF+cDdKk1YneECsXktoQ00KkczANxwG3h7FQx8Fk95R8+
 e8y9llpzvUNEF9LtMTfQ7Y3ivVlbuicXaFQhvLctRny473+sZkdZPPjAMzgVGr+s4D
 gtPdwlyg969Wg==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 751923F587
 for <qemu-devel@nongnu.org>; Sat, 15 Apr 2023 06:45:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Apr 2023 06:37:15 -0000
From: =?utf-8?q?Mark_Karpel=C3=A8s?= <1903470@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jay7x laurent-vivier magicaltux
 marcandre-lureau
X-Launchpad-Bug-Reporter: =?utf-8?q?Mark_Karpel=C3=A8s_=28magicaltux=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Mark_Karpel=C3=A8s_=28magicaltux=29?=
References: <160488704585.18602.6390058369473747228.malonedeb@soybean.canonical.com>
Message-Id: <168154063581.13921.5814987265770972535.malone@gac.canonical.com>
Subject: [Bug 1903470] Re: qemu 5.1.0: Add UNIX socket support for netdev
 socket
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="87e01a184063d9dc53acb2343d6484f5546064fd"; Instance="production"
X-Launchpad-Hash: 780fd725d3bf3521c92e09764e9e13ffeca01c24
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1903470 <1903470@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Despite what is said in an earlier comment, qemu(1) has no information
on -netdev stream or -netdev dgram.

The best help I could find comes from the patch description:

https://patchew.org/QEMU/20221021090922.170074-1-lvivier@redhat.com/

Example use:

-netdev stream,id=3Dsocket0,server=3Doff,addr.type=3Dunix,addr.path=3D/tmp/=
qemu0

Also useful to note that the reconnect argument is only going to be
available in qemu 8.0.0 (not released yet)

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903470

Title:
  qemu 5.1.0: Add UNIX socket support for netdev socket

Status in QEMU:
  Expired

Bug description:
  Note: this is a feature request.

  qemu has a way to connect instances using a socket:

  -netdev socket,id=3Dstr[,fd=3Dh][,listen=3D[host]:port][,connect=3Dhost:p=
ort]

  This can also be used to connect a qemu instance to something else
  using a socket connection, however there is no authentication or
  security to the connection, so rather than using a port which can be
  accessed by any user on the machine, having the ability to use or
  connect to UNIX sockets would be helpful, and adding this option
  should be fairly trivial.

  UNIX sockets can be found in various parts of qemu (monitor, etc) so I
  believe having this on network would make sense.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903470/+subscriptions


