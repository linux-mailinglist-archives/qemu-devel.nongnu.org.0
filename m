Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A482C211E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 10:26:45 +0100 (CET)
Received: from localhost ([::1]:52498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khUay-0004pE-P7
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 04:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1khUZR-0004H7-VT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:25:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1khUZO-0006Bu-Rx
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 04:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606209905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=poLfg7L88RRtAgKXvx70cOjtVMZjq9ru030EzHdY378=;
 b=Y67kmFkAg/czyHLKsmYhi8AT4VQ4g8BQ9kYihZG39Uyo4e5vVM5xxtsjIR7zIo7r9v0aDG
 OjGDyTPl9+YtFcCXXjgsOiSs0FDw5Cy0wsY4PjSkbWgw7wujDyWWdgpyJKjGg+YIiE2ISh
 2zPXv2Zia0eF4kaRJTm4lDmwEYrSn/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-g3N8wqtRMZ6Wj3Ju68Q1jg-1; Tue, 24 Nov 2020 04:25:03 -0500
X-MC-Unique: g3N8wqtRMZ6Wj3Ju68Q1jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 524238144EE;
 Tue, 24 Nov 2020 09:25:01 +0000 (UTC)
Received: from f32-work.redhat.com (unknown [10.40.194.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A981E60864;
 Tue, 24 Nov 2020 09:24:59 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/net/dp8393x: fix integer underflow in
 dp8393x_do_transmit_packets()
Date: Tue, 24 Nov 2020 10:24:45 +0100
Message-Id: <20201124092445.658647-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jasowang@redhat.com, pgn@zju.edu.cn, mcascell@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An integer underflow could occur during packet transmission due to 'tx_len' not
being updated if SONIC_TFC register is set to zero. Check for negative 'tx_len'
when removing existing FCS.

RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=1899722
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Gaoning Pan <pgn@zju.edu.cn>
---
 hw/net/dp8393x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
index 674b04b354..205c0decc5 100644
--- a/hw/net/dp8393x.c
+++ b/hw/net/dp8393x.c
@@ -495,6 +495,10 @@ static void dp8393x_do_transmit_packets(dp8393xState *s)
         } else {
             /* Remove existing FCS */
             tx_len -= 4;
+            if (tx_len < 0) {
+                SONIC_ERROR("tx_len is %d\n", tx_len);
+                break;
+            }
         }
 
         if (s->regs[SONIC_RCR] & (SONIC_RCR_LB1 | SONIC_RCR_LB0)) {
-- 
2.28.0


