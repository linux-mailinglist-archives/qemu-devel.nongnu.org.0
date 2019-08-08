Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8431D86471
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 16:36:09 +0200 (CEST)
Received: from localhost ([::1]:52296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvjWS-0000CB-P0
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 10:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hvjVj-0008BV-Br
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 10:35:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hvjVi-00053F-Eg
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 10:35:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37110)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hvjVi-00051y-9C
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 10:35:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BC3B6438B;
 Thu,  8 Aug 2019 14:35:21 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 172EE1001959;
 Thu,  8 Aug 2019 14:34:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 16:34:51 +0200
Message-Id: <20190808143457.14111-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Thu, 08 Aug 2019 14:35:21 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/6] net/eth: Remove duplicated tcp/udp_hdr
 structures
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a preparatory cleanup series.

Commit 75020a70215 introduced 4 very equivalent structures:
- tcp_header and tcp_hdr,
- udp_header and udp_hdr.

Choose the most widely use in the codebase, which happens to
provide convenient bitfields manipulation macros and is not
endian-specific.

Philippe Mathieu-Daud=C3=A9 (6):
  hw/net/virtio-net: Use TCP_HEADER_FLAGS/TCP_HEADER_DATA_OFFSET macros
  net/colo-compare: Use the tcp_header structure
  net/filter-rewriter: Use the tcp_header structure
  hw/net/vmxnet3: Use the tcp_header structure
  net/eth: Remove the unused tcp_hdr structure
  net/eth: Remove the single use of udp_hdr structure

 hw/net/net_rx_pkt.c   |  2 +-
 hw/net/net_tx_pkt.c   |  9 +++++----
 hw/net/virtio-net.c   |  9 ++-------
 include/net/eth.h     | 47 ++++++++-----------------------------------
 net/colo-compare.c    | 14 ++++++-------
 net/filter-rewriter.c | 37 +++++++++++++++++++---------------
 6 files changed, 44 insertions(+), 74 deletions(-)

--=20
2.20.1


