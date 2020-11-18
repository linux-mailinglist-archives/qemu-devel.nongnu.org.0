Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD272B78B3
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 09:32:36 +0100 (CET)
Received: from localhost ([::1]:59038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfItG-0008Su-SQ
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 03:32:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kfIqp-0006yK-Dc
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:30:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kfIqn-0004KP-K1
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 03:30:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605688200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BBPs0OKWqz/sjWUM7hu7JTT11nO0e2pkx2tYDYKSCIs=;
 b=Yb7zUkpxBckwP8a6Q+06kM9/Plsmgajc5FmiTLy+lksb24CYasUh7S0SLPvI7DZ/vDDkIE
 g96xAnx4P4BBlJdE8h7/ZUKJEaRzlZp+pfpWkGflzHfyA+ckmm5qHRX/0IDcPhSCCQwgxT
 RixOn76hGk8XXUAo7nEKXlYnS+TUdqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-RTM1r4G4PP-E7qFuhMDsCg-1; Wed, 18 Nov 2020 03:29:51 -0500
X-MC-Unique: RTM1r4G4PP-E7qFuhMDsCg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C57386ABD9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 08:29:50 +0000 (UTC)
Received: from localhost (unknown [10.36.110.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2216EF4F;
 Wed, 18 Nov 2020 08:29:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] dbus-vmstate: replace g_return with error handling
Date: Wed, 18 Nov 2020 12:29:42 +0400
Message-Id: <20201118082942.34167-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since g_input_stream_read_all() may return less than requested when the
stream is malformed, we should treat this condition as a runtime user
error (g_return are for programming errors).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/dbus-vmstate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index bd050e8e9c..616d291cfb 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
                                      &bytes_read, NULL, &err)) {
             goto error;
         }
-        g_return_val_if_fail(bytes_read == len, -1);
+        if (bytes_read != len) {
+            error_report("%s: Failed to read proxy Id", __func__);
+            return -1;
+        }
         id[len] = 0;
 
         trace_dbus_vmstate_loading(id);
-- 
2.29.0


