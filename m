Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0653032B669
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:02:13 +0100 (CET)
Received: from localhost ([::1]:40154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOKa-0000Sd-0K
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lHOHw-0007Y1-DQ
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:59:29 -0500
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:34940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lekiravi@yandex-team.ru>)
 id 1lHOHr-0004HE-SA
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 04:59:27 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 0F2642E159C;
 Wed,  3 Mar 2021 12:59:19 +0300 (MSK)
Received: from vla5-d6d5ce7a4718.qloud-c.yandex.net
 (vla5-d6d5ce7a4718.qloud-c.yandex.net [2a02:6b8:c18:341e:0:640:d6d5:ce7a])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Yde6ClwwhQ-xIxSMHKG; Wed, 03 Mar 2021 12:59:18 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1614765558; bh=13Oc7DM6MmyK0eAsUQqEpz94FAGI8joGzd7oyzYKa04=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=lsjkEAg8bmshp+24u6p+ZrCu8qCeGK3XkCx20rlU2rdTOCNRpN0T+Bhk+rM8P65Wh
 jXSOSAsrj8apT0LPvYY2kSBOK5KYY1i2vU+oP/Q5KDIKQZa79PIG8hu/77pmkQKOLv
 YDFOsosnNqsIV6QltOwlhvMJfxDgW76hpjost+7c=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:107:880d:3c89:fcd8:ca75])
 by vla5-d6d5ce7a4718.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 w0BjtEeJGw-xInKm6qD; Wed, 03 Mar 2021 12:59:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Alexey Kirillov <lekiravi@yandex-team.ru>
To: Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 0/5] Introducing QMP query-netdev command
Date: Wed,  3 Mar 2021 12:59:05 +0300
Message-Id: <20210303095910.78277-1-lekiravi@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=lekiravi@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

v6->v7:
- Use macroses QAPI_LIST_PREPEND and QAPI_LIST_APPEND for lists.
- Reorder NetBackend entries in alphabetical order.

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
 net/net.c                         |  73 +++++++++--
 net/netmap.c                      |   7 ++
 net/slirp.c                       | 124 ++++++++++++++++++-
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
 18 files changed, 856 insertions(+), 62 deletions(-)
 create mode 100644 include/qapi/hmp-output-visitor.h
 create mode 100644 qapi/hmp-output-visitor.c
 create mode 100644 tests/qtest/test-query-netdev.c

-- 
2.25.1


