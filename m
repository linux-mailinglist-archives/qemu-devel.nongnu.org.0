Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4891FF394
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 15:46:50 +0200 (CEST)
Received: from localhost ([::1]:40728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlusT-0007Hw-Ja
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 09:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1jlur2-0005Sz-0B
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:45:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25306
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <maxime.coquelin@redhat.com>)
 id 1jlur0-00024U-5g
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 09:45:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592487917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5iOXy87a3V3x2Y3WPRqq6iILEy+SafEqiF8HiiGrD6s=;
 b=BCS9oXZOCvHlDskAZK479NR/9Z5fdkC0KA6Fb4L4V++9ovBQvjLtzBIYrctdShnANFJ57q
 30witlhQzXVsKtfmJfbJ0mvYT6w5SBkF9kZrGN5pQbYXzWgFXEbjSscgQXSyPfko1Qnbe2
 bab5e2ioELndarRFINh/hyk8h6T0voo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-NvePuTkJMn61PZu8I-PwBw-1; Thu, 18 Jun 2020 09:45:15 -0400
X-MC-Unique: NvePuTkJMn61PZu8I-PwBw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B65BC107ACCD
 for <qemu-devel@nongnu.org>; Thu, 18 Jun 2020 13:45:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 968B45C220;
 Thu, 18 Jun 2020 13:45:06 +0000 (UTC)
From: Maxime Coquelin <maxime.coquelin@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, lulu@redhat.com, amorenoz@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v3] docs: vhost-user: add Virtio status protocol feature
Date: Thu, 18 Jun 2020 15:45:01 +0200
Message-Id: <20200618134501.145747-1-maxime.coquelin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=maxime.coquelin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=maxime.coquelin@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:32:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch specifies the VHOST_USER_SET_STATUS and
VHOST_USER_GET_STATUS requests, which are sent by
the master to update and query the Virtio status
in the backend.

Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>
---
Changes since v2:
=================
- Typo: fix missing # (Jason)

Changes since v1:
=================
- Only keep the spec part in this patch, the implementation will
  be part of Cindy's Vhost vDPA series it depends on. The goal is
  to be able to implement it in next DPDK release even if Qemu part
  is not merged.
- Add GET_STATUS after discussions with Michael and Jason. It can
  be used by the master to ensure FEATURES_OK bit set is
  acknowledged by the backend.

 docs/interop/vhost-user.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
index 688b7c6900..10e3e3475e 100644
--- a/docs/interop/vhost-user.rst
+++ b/docs/interop/vhost-user.rst
@@ -816,6 +816,7 @@ Protocol features
   #define VHOST_USER_PROTOCOL_F_RESET_DEVICE         13
   #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
   #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
+  #define VHOST_USER_PROTOCOL_F_STATUS               16
 
 Master message types
 --------------------
@@ -1307,6 +1308,29 @@ Master message types
   ``VHOST_USER_ADD_MEM_REG`` message, this message is used to set and
   update the memory tables of the slave device.
 
+``VHOST_USER_SET_STATUS``
+  :id: 39
+  :equivalent ioctl: VHOST_VDPA_SET_STATUS
+  :slave payload: N/A
+  :master payload: ``u64``
+
+  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
+  successfully negotiated, this message is submitted by the master to
+  notify the backend with updated device status as defined in the Virtio
+  specification.
+
+``VHOST_USER_GET_STATUS``
+  :id: 40
+  :equivalent ioctl: VHOST_VDPA_GET_STATUS
+  :slave payload: ``u64``
+  :master payload: N/A
+
+  When the ``VHOST_USER_PROTOCOL_F_STATUS`` protocol feature has been
+  successfully negotiated, this message is submitted by the master to
+  query the backend for its device status as defined in the Virtio
+  specification.
+
+
 Slave message types
 -------------------
 
-- 
2.26.2


