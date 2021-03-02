Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5277132A927
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:18:38 +0100 (CET)
Received: from localhost ([::1]:38878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9bR-0007ox-Ax
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:18:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9Ls-00017z-7H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:02:32 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:44538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lH9Ln-0008Er-Cl
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:02:30 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 5F3452E159D;
 Tue,  2 Mar 2021 21:02:21 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 AabajxEOFm-2JxSLNDf; Tue, 02 Mar 2021 21:02:21 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1614708141; bh=mWKMmE6/68gzbOL2eN6sq4/sF3RMZWcJV9Nbs34UHA8=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=lbBmMabdS/ETQnzfWQmLx3rqK7Z0qGw/iIzMGVpEnz3zW1D1YoTC1ZMVVagWGearw
 Xftt/sFk8W4RDClGqymlft+mr27k+vTp59n0nREEdJqofysA4FEN4dv4o3MeMFll1P
 1CjqNa9fVCXSNTJcsnNne7bCKjqWjR2639SQR4B4=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8002::1:1a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 onVeXhLyoo-2Io02V9K; Tue, 02 Mar 2021 21:02:19 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v6 0/5] Introducing QMP query-netdev command
Date: Tue,  2 Mar 2021 21:02:00 +0300
Message-Id: <20210302180205.5009-1-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Stefan Weil <sw@weilnetz.de>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, Vincenzo Maffione <v.maffione@gmail.com>,
 yc-core@yandex-team.ru, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch series introduces a new QMP command "query-netdev" to get
information about currently attached backend network devices (netdevs).

Also, since the "info_str" field of "NetClientState" is now deprecated,
we no longer use it for netdevs, only for NIC/hubports.

The HMP command "info network" now also uses QAPI structure inside.

Usage example:

-> { "execute": "query-netdev" }
<- { "return": [
         {
             "listen": "127.0.0.1:90",
             "type": "socket",
             "peer-id": "hub0port1",
             "id": "__org.qemu.net1"
         },
         {
             "script": "/etc/qemu-ifup",
             "downscript": "/etc/qemu-ifdown",
             "ifname": "tap0",
             "type": "tap",
             "peer-id": "net5",
             "vnet_hdr": true,
             "id": "tap0"
         },
         {
             "ipv6": true,
             "ipv4": true,
             "host": "10.0.2.2",
             "ipv6-dns": "fec0::3",
             "ipv6-prefix": "fec0::",
             "net": "10.0.2.0/255.255.255.0",
             "ipv6-host": "fec0::2",
             "type": "user",
             "peer-id": "net0",
             "dns": "10.0.2.3",
             "hostfwd": [
                 {
                     "str": "tcp::20004-:22"
                 }
             ],
             "ipv6-prefixlen": 64,
             "id": "netdev0",
             "restrict": false
         }
     ]
   }

v5->v6:
- Add QAPI visitor to generate info_str replacement directly from NetdevInfo.
- Make info_str dynamically allocated.
- Make commit messages more meaningful.

v4->v5:
- Enable qtest of query-netdevs for AVR and RX archs.
- Bump "Since" version in QAPI to 6.0.

v3->v4:
- Rename "query-netdevs" to "query-netdev".
- Copy netdev drivers to new QAPI enum "NetBackend".

v2->v3:
- Remove NIC and hubports from query-netdevs.
- Remove several fields from NetdevInfo since they are unnecessary.
- Rename field @peer to @peer-id.
- Add support of vhost-vdpa.
- Keep "info_str" for NIC/hubports, but remove it for netdevs.

v1->v2:
- Rewrite HMP "info network" to get information from results of QMP command.
- Remove obsolete field "info_str" from "NetClientState".

Alexey Kirillov (5):
  qapi: net: Add query-netdev command
  tests: Add tests for query-netdev command
  net: Move NetClientState.info_str to dynamic allocations
  hmp: Use QAPI NetdevInfo in hmp_info_network
  net: Do not fill legacy info_str for backends

 hw/net/xen_nic.c                  |   5 +-
 include/net/net.h                 |   5 +-
 include/qapi/hmp-output-visitor.h |  30 +++++
 net/l2tpv3.c                      |   8 +-
 net/net.c                         |  75 ++++++++++--
 net/netmap.c                      |   7 ++
 net/slirp.c                       | 126 ++++++++++++++++++-
 net/socket.c                      |  92 ++++++++++----
 net/tap-win32.c                   |  10 +-
 net/tap.c                         | 107 +++++++++++++++--
 net/vde.c                         |  25 +++-
 net/vhost-user.c                  |  20 +++-
 net/vhost-vdpa.c                  |  15 ++-
 qapi/hmp-output-visitor.c         | 193 ++++++++++++++++++++++++++++++
 qapi/meson.build                  |   1 +
 qapi/net.json                     |  80 +++++++++++++
 tests/qtest/meson.build           |   3 +
 tests/qtest/test-query-netdev.c   | 120 +++++++++++++++++++
 18 files changed, 860 insertions(+), 62 deletions(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c
 create mode 100644 tests/qtest/test-query-netdev.c

-- 
2.25.1


