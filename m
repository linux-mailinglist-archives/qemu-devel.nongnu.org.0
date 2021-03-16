Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436AD33E06F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 22:24:51 +0100 (CET)
Received: from localhost ([::1]:37154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHBK-0000pa-At
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 17:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2k-0005jZ-9I
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMH2e-0003Xb-PI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 17:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615929352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EZtJYDQX+XcSW7/XY3Jkdf8eH7R1x9pqkUBgdJY7Deg=;
 b=f+ijuGCyUorJspoTeQIjRtqSpoHNDbrvIQVfdjKFe7kIFJDejgv9gl2UcHD/2ZQryMM81P
 FfebFii3tzr5fyQ6NE6YZVbFQCZKtvsKh6iv3dTNUFt1Bo7mKUTVPga6v37zn+ncHTElP7
 /hd0Ow/uG5tee79H1h+xymX3WV7FGVU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-nqx6CsSrM3SuHryG2Jvf5w-1; Tue, 16 Mar 2021 17:15:50 -0400
X-MC-Unique: nqx6CsSrM3SuHryG2Jvf5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B9B9100C61B
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 21:15:49 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE4A91378D;
 Tue, 16 Mar 2021 21:15:48 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/16] qemu-timer: allow freeing a NULL timer
Date: Tue, 16 Mar 2021 17:15:31 -0400
Message-Id: <20210316211531.1649909-17-pbonzini@redhat.com>
In-Reply-To: <20210316211531.1649909-1-pbonzini@redhat.com>
References: <20210316211531.1649909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Markus Armbruster <armbru@redhat.com>
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
index 5e76e3f8c2..301fa47b42 100644
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


