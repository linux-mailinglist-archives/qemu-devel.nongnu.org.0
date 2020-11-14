Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7092B2BB7
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Nov 2020 07:02:06 +0100 (CET)
Received: from localhost ([::1]:57382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdodR-0008UX-48
	for lists+qemu-devel@lfdr.de; Sat, 14 Nov 2020 01:02:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdocI-00082W-Fn
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:00:54 -0500
Received: from indium.canonical.com ([91.189.90.7]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdocG-0005fQ-9H
 for qemu-devel@nongnu.org; Sat, 14 Nov 2020 01:00:54 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdocE-000445-ER
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:00:50 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3C7932E811E
 for <qemu-devel@nongnu.org>; Sat, 14 Nov 2020 06:00:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2020 05:54:54 -0000
From: Thomas Jansen <1758091@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mithi th-huth
X-Launchpad-Bug-Reporter: Thomas Jansen (mithi)
X-Launchpad-Bug-Modifier: Thomas Jansen (mithi)
References: <152173369238.18239.3128002656943169497.malonedeb@chaenomeles.canonical.com>
Message-Id: <160533329483.30361.12433357495346880248.launchpad@wampee.canonical.com>
Subject: [Bug 1758091] Re: vmxnet3 unable to send IPv6 ESP packets
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: 1de7740e5e9b17183cfcef0d81e399d688d35586
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 22:45:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1758091 <1758091@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1758091

Title:
  vmxnet3 unable to send IPv6 ESP packets

Status in QEMU:
  New

Bug description:
  My vmxnet3 network driver (in a closed source custom OS) is unable to
  send network packets that are structured as follows: Ethernet-
  Header(IPv6-Header(ESP(encrypted data))). I can verify that the packet
  is sent in the VM but is dropped in qemu. I first encountered this
  problem on qemu 2.10.1 but master is affected as well. After some
  debug printing in qemu I could identify the following call chain as
  being problematic:

  eth_is_ip6_extension_header_type
  eth_parse_ipv6_hdr
  net_tx_pkt_parse_headers
  net_tx_pkt_parse
  vmxnet3_process_tx_queue

  The problem seems to be the definition of the ESP header
  (https://en.wikipedia.org/wiki/IPsec#Encapsulating_Security_Payload)
  that does not follow the standard IPv6 extension header format
  starting with next type and length. Thus the parsed ext_hdr in
  eth_parse_ipv6_hdr does not contain valid data, in particular the
  length will contain bogus data and lead to a info->full_hdr_len that
  is larger than the packet itself and the loop would then try to read
  beyond the end of the packet.

  Using the e1000 driver I can send these packets. My guess is that the
  net_tx_pkt_parse function is not called in that case.

  My guess for a fix would be to remove "case IP6_ESP:" from
  eth_is_ip6_extension_header_type and not regard the ESP header as a
  IPv6 extension header. In a quick test this seems to fix the problem.
  But that should be verified by someone who is familiar with the code.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1758091/+subscriptions

