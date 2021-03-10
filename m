Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1D3341FA
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 16:48:20 +0100 (CET)
Received: from localhost ([::1]:49160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK14N-0007EG-4S
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 10:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK11l-00065W-8M
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:45:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lK11g-0004G8-7k
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 10:45:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615391130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=d/N0VhDL2yGMq6q/W3SJVxwvbgNCHvojYF7AnakoP9c=;
 b=YQR9A7LZaR4IlKM83qjxQpLXgGFI2HIdnnFm/5Oy0j5tc4/Bia9Tm010HwV/iE+qRXPy+h
 Y/j7QHwHAd2o4+0qRIP4pMcKDvXKORpPjyAVHM1Hw5DjpjdbQG4kV1eCnZDAlUKHE40F1P
 BcxPZl1PX9hZm1lz5tbM43mflAKDKYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-cTB5GehgNsac8kCZmz_Imw-1; Wed, 10 Mar 2021 10:45:29 -0500
X-MC-Unique: cTB5GehgNsac8kCZmz_Imw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 044C157;
 Wed, 10 Mar 2021 15:45:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A43F1196E3;
 Wed, 10 Mar 2021 15:45:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-timer: allow freeing a NULL timer
Date: Wed, 10 Mar 2021 10:45:26 -0500
Message-Id: <20210310154526.463850-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 5f8e93c3e2 ("util/qemu-timer: Make timer_free() imply timer_del()", 2021-01-08)
it is not possible anymore to pass a NULL pointer to timer_free().  Previously
it would do nothing as it would simply pass NULL down to g_free().

Rectify this, which also fixes "-chardev braille" when there is no device.

Reported-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/timer.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index 1678238384..88ef114689 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -629,8 +629,10 @@ void timer_del(QEMUTimer *ts);
  */
 static inline void timer_free(QEMUTimer *ts)
 {
-    timer_del(ts);
-    g_free(ts);
+    if (ts) {
+        timer_del(ts);
+        g_free(ts);
+    }
 }
 
 /**
-- 
2.26.2


