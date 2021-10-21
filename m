Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE922436755
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 18:12:18 +0200 (CEST)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdafx-0005Tn-Dh
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 12:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mdach-000300-FK
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:08:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1mdace-0003AW-Cf
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 12:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634832526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FEm6XrRv3Sfhnf3LSxQCRvrJiH9AB8xQa07yPX4BSSY=;
 b=YAv29q5Vsc4hS0OI/ZHkHIW02mfxQAK4CbuMc3b77W7NHPe50Ot7rdORT3KAwKPMI/e98L
 k4nGS2n0mvQUqeEdd9swFRub0FIWjMr5j3YzyeZQUnxSg9mA7t4ok3EXOKnD65wT2vrqes
 RekF7EZE4fRFF549EqzTWHs7fvJ4fOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-Nde-uApvO-GkDWSabgz7GQ-1; Thu, 21 Oct 2021 12:08:45 -0400
X-MC-Unique: Nde-uApvO-GkDWSabgz7GQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 101E880DDE6
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 16:08:35 +0000 (UTC)
Received: from fenrir.redhat.com (unknown [10.22.16.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 961D768D7D;
 Thu, 21 Oct 2021 16:08:34 +0000 (UTC)
From: Jon Maloy <jmaloy@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] e1000: fix tx re-entrancy problem
Date: Thu, 21 Oct 2021 12:10:47 -0400
Message-Id: <20211021161047.578751-1-jmaloy@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jmaloy@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fact that the MMIO handler is not re-entrant causes an infinite
loop under certain conditions:

Guest write to TDT ->  Loopback -> RX (DMA to TDT) -> TX

We now eliminate the effect of this problem locally in e1000, by adding
a boolean in struct E1000State indicating when the TX side is busy. This
will cause any entering new call to return early instead of interfering
with the ongoing work, and eliminates any risk of looping.

This is intended to address CVE-2021-20257.

Signed-off-by: Jon Maloy <jmaloy@redhat.com>
---
 hw/net/e1000.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index a30546c5d5..f5bc81296d 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -107,6 +107,7 @@ struct E1000State_st {
         e1000x_txd_props props;
         e1000x_txd_props tso_props;
         uint16_t tso_frames;
+        bool busy;
     } tx;
 
     struct {
@@ -763,6 +764,11 @@ start_xmit(E1000State *s)
         return;
     }
 
+    if (s->tx.busy) {
+        return;
+    }
+    s->tx.busy = true;
+
     while (s->mac_reg[TDH] != s->mac_reg[TDT]) {
         base = tx_desc_base(s) +
                sizeof(struct e1000_tx_desc) * s->mac_reg[TDH];
@@ -789,6 +795,7 @@ start_xmit(E1000State *s)
             break;
         }
     }
+    s->tx.busy = false;
     set_ics(s, 0, cause);
 }
 
-- 
2.31.1


