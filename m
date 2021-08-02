Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0F03DCFBF
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 06:35:31 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAPfl-0006Eq-RV
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 00:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeJ-0004Gs-Nv
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:33:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mAPeI-000803-4C
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 00:33:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627878837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RIlUTuucYiv8d07NsUlhqg58B69Jo1Hj6DxoDUraArM=;
 b=ey3vfdnlc2StySucgNbjMs9L0Tc3MFzSIysbS7t18wnKJ4HVTDoQ/Y6424kvpofcqMQjad
 Cnd7yNAUPNAQN3SIAJxDP9Vxo8P/02rAPVlVno+2pICQMLjh0jU5O/E0/bpZvtKv4jGxay
 F35UpqPTz2mBwoDl0GBne1FEM1TGA7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-kS0jau72N7y1HYgzZ5FuwA-1; Mon, 02 Aug 2021 00:33:56 -0400
X-MC-Unique: kS0jau72N7y1HYgzZ5FuwA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE055760C0;
 Mon,  2 Aug 2021 04:33:54 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-135.pek2.redhat.com
 [10.72.12.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83E8C544F1;
 Mon,  2 Aug 2021 04:33:51 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 2/5] hw/net/can: sja1000 fix buff2frame_bas and buff2frame_pel
 when dlc is out of std CAN 8 bytes
Date: Mon,  2 Aug 2021 12:33:41 +0800
Message-Id: <20210802043344.44301-3-jasowang@redhat.com>
In-Reply-To: <20210802043344.44301-1-jasowang@redhat.com>
References: <20210802043344.44301-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Qiang Ning <ningqiang1@huawei.com>,
 qemu-stable@nongnu.org, Pavel Pisa <pisa@cmp.felk.cvut.cz>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Pisa <pisa@cmp.felk.cvut.cz>

Problem reported by openEuler fuzz-sig group.

The buff2frame_bas function (hw\net\can\can_sja1000.c)
infoleak(qemu5.x~qemu6.x) or stack-overflow(qemu 4.x).

Reported-by: Qiang Ning <ningqiang1@huawei.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/can/can_sja1000.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/net/can/can_sja1000.c b/hw/net/can/can_sja1000.c
index 42d2f99..34eea68 100644
--- a/hw/net/can/can_sja1000.c
+++ b/hw/net/can/can_sja1000.c
@@ -275,6 +275,10 @@ static void buff2frame_pel(const uint8_t *buff, qemu_can_frame *frame)
     }
     frame->can_dlc = buff[0] & 0x0f;
 
+    if (frame->can_dlc > 8) {
+        frame->can_dlc = 8;
+    }
+
     if (buff[0] & 0x80) { /* Extended */
         frame->can_id |= QEMU_CAN_EFF_FLAG;
         frame->can_id |= buff[1] << 21; /* ID.28~ID.21 */
@@ -311,6 +315,10 @@ static void buff2frame_bas(const uint8_t *buff, qemu_can_frame *frame)
     }
     frame->can_dlc = buff[1] & 0x0f;
 
+    if (frame->can_dlc > 8) {
+        frame->can_dlc = 8;
+    }
+
     for (i = 0; i < frame->can_dlc; i++) {
         frame->data[i] = buff[2 + i];
     }
-- 
2.7.4


