Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034FD3BC9
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:00:08 +0200 (CEST)
Received: from localhost ([::1]:47464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIqmN-0007Ca-C6
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqdm-0004Pn-W6
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richardw.yang@linux.intel.com>) id 1iIqdl-00066F-U5
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:57822)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
 id 1iIqdl-00065Q-MC
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 04:51:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 01:51:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,283,1566889200"; d="scan'208";a="224271741"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
 by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2019 01:51:11 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/4] migration/multifd: use pages->allocated instead of the
 static max
Date: Fri, 11 Oct 2019 16:50:48 +0800
Message-Id: <20191011085050.17622-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011085050.17622-1-richardw.yang@linux.intel.com>
References: <20191011085050.17622-1-richardw.yang@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.88
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
Cc: qemu-devel@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

multifd_send_fill_packet() prepares meta data for following pages to
transfer. It would be more proper to fill pages->allocated instead of
static max value, especially we want to support flexible packet size.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 migration/ram.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index cf30171f44..6a3bef0434 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -791,13 +791,12 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
 static void multifd_send_fill_packet(MultiFDSendParams *p)
 {
     MultiFDPacket_t *packet = p->packet;
-    uint32_t page_max = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     int i;
 
     packet->magic = cpu_to_be32(MULTIFD_MAGIC);
     packet->version = cpu_to_be32(MULTIFD_VERSION);
     packet->flags = cpu_to_be32(p->flags);
-    packet->pages_alloc = cpu_to_be32(page_max);
+    packet->pages_alloc = cpu_to_be32(p->pages->allocated);
     packet->pages_used = cpu_to_be32(p->pages->used);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
-- 
2.17.1


