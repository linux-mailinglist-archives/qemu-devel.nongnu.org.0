Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0871345803
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 07:51:57 +0100 (CET)
Received: from localhost ([::1]:45712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOatQ-00058S-B0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 02:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOasF-0004RA-1J
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 02:50:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOasC-0001DL-Dm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 02:50:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOasA-00084y-6j
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 06:50:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2E6D02E8157
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 06:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Mar 2021 06:42:07 -0000
From: Tao Xu <1920871@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: taoxu92
X-Launchpad-Bug-Reporter: Tao Xu (taoxu92)
X-Launchpad-Bug-Modifier: Tao Xu (taoxu92)
Message-Id: <161648172746.20702.497420976182520260.malonedeb@wampee.canonical.com>
Subject: [Bug 1920871] [NEW] netperf UDP_STREAM high packet loss on QEMU tap
 network
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: c0b9a15d3f245e4f7c5e71a9e6251752a8dfba18
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
Reply-To: Bug 1920871 <1920871@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Hi, I boot a guest with "-netdev
tap,id=3Dhn0,vhost=3Doff,br=3Dbr0,helper=3D/usr/local/libexec/qemu-bridge-
helper" network option, and using "netperf -H IP -t UDP_STREAM" to test
guest UDP performance, I got the following output:

Socket  Message  Elapsed      Messages                =

Size    Size     Time         Okay Errors   Throughput
bytes   bytes    secs            #      #   10^6bits/sec

212992   65507   10.00      144710      0    7583.56
212992           10.00          32              1.68

We can find most of UDP packets are lost. But I test another host machine o=
r use "-netdev usr,xxxxx". I can got:
Socket  Message  Elapsed      Messages                =

Size    Size     Time         Okay Errors   Throughput
bytes   bytes    secs            #      #   10^6bits/sec

212992   65507   10.00       18351      0     961.61
212992           10.00       18350            961.56

most of UDP packets are recived.

And If we check the tap qemu used, we can see:
ifconfig tap0
tap0: flags=3D4419<UP,BROADCAST,RUNNING,PROMISC,MULTICAST>  mtu 1500
        inet6 fe80::ecc6:21ff:fe6f:b174  prefixlen 64  scopeid 0x20<link>
        ether ee:c6:21:6f:b1:74  txqueuelen 1000  (Ethernet)
        RX packets 282  bytes 30097 (29.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9086214  bytes 12731596673 (11.8 GiB)
        TX errors 0  dropped 16349024 overruns 0  carrier 0  collisions 0
lots of TX packets are dropped.

list other packet size:

=E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 1
MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168.1=
99.200 () port 0 AF_INET
Socket  Message  Elapsed      Messages                =

Size    Size     Time         Okay Errors   Throughput
bytes   bytes    secs            #      #   10^6bits/sec

212992       1   10.00     2297941      0       1.84
212992           10.00     1462024              1.17

=E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 128
MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168.1=
99.200 () port 0 AF_INET
Socket  Message  Elapsed      Messages                =

Size    Size     Time         Okay Errors   Throughput
bytes   bytes    secs            #      #   10^6bits/sec

212992     128   10.00     2311547      0     236.70
212992           10.00     1359834            139.25

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920871

Title:
  netperf UDP_STREAM high packet loss on QEMU tap network

Status in QEMU:
  New

Bug description:
  Hi, I boot a guest with "-netdev
  tap,id=3Dhn0,vhost=3Doff,br=3Dbr0,helper=3D/usr/local/libexec/qemu-bridge-
  helper" network option, and using "netperf -H IP -t UDP_STREAM" to
  test guest UDP performance, I got the following output:

  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992   65507   10.00      144710      0    7583.56
  212992           10.00          32              1.68

  We can find most of UDP packets are lost. But I test another host machine=
 or use "-netdev usr,xxxxx". I can got:
  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992   65507   10.00       18351      0     961.61
  212992           10.00       18350            961.56

  most of UDP packets are recived.

  And If we check the tap qemu used, we can see:
  ifconfig tap0
  tap0: flags=3D4419<UP,BROADCAST,RUNNING,PROMISC,MULTICAST>  mtu 1500
          inet6 fe80::ecc6:21ff:fe6f:b174  prefixlen 64  scopeid 0x20<link>
          ether ee:c6:21:6f:b1:74  txqueuelen 1000  (Ethernet)
          RX packets 282  bytes 30097 (29.3 KiB)
          RX errors 0  dropped 0  overruns 0  frame 0
          TX packets 9086214  bytes 12731596673 (11.8 GiB)
          TX errors 0  dropped 16349024 overruns 0  carrier 0  collisions 0
  lots of TX packets are dropped.

  list other packet size:

  =E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 1
  MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168=
.199.200 () port 0 AF_INET
  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992       1   10.00     2297941      0       1.84
  212992           10.00     1462024              1.17

  =E2=9E=9C  boot netperf -H 192.168.199.200 -t UDP_STREAM -- -m 128
  MIGRATED UDP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to 192.168=
.199.200 () port 0 AF_INET
  Socket  Message  Elapsed      Messages                =

  Size    Size     Time         Okay Errors   Throughput
  bytes   bytes    secs            #      #   10^6bits/sec

  212992     128   10.00     2311547      0     236.70
  212992           10.00     1359834            139.25

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920871/+subscriptions

