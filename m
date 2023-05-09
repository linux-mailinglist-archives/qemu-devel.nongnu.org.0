Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8AC6FC342
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 11:53:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwK1c-0005Wg-FA; Tue, 09 May 2023 05:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pwK1X-0005Sl-Bn
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:52:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1pwK1V-0005xy-Uq
 for qemu-devel@nongnu.org; Tue, 09 May 2023 05:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683625965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CkmwlFbjP+S/fRpHno0l/DfR8/XqWdyN+IJPUI5O/s=;
 b=cByCUpesDZ1Btq3iWNX1eqCkMBPufxTe63Unqqe3bpSaOTBJCJK7Nvhydi9s433iMVrCcp
 98AxC62XjsZGjxuP8gAMdZvle/ifcKZqDOrhIDsxdrRsG1YFlZemzI1xqwT/zdhf/YPi5w
 e1X6MFzA67qW1ujs2qDWVIUHVoPpl04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-530-pWt_RR72MKWGkpOLJkE6OA-1; Tue, 09 May 2023 05:52:42 -0400
X-MC-Unique: pWt_RR72MKWGkpOLJkE6OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A341C185A79C;
 Tue,  9 May 2023 09:52:41 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7034C63F3D;
 Tue,  9 May 2023 09:52:39 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>
Subject: [PATCH v4 5/6] ui: add helpers for virtio-multitouch events
Date: Tue,  9 May 2023 11:53:44 +0200
Message-Id: <20230509095345.42600-6-slp@redhat.com>
In-Reply-To: <20230509095345.42600-1-slp@redhat.com>
References: <20230509095345.42600-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add helpers for generating Multi-touch events from the UI backends that
can be sent to the guest through a virtio-multitouch device.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/input.h |  5 +++++
 ui/input.c         | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/ui/input.h b/include/ui/input.h
index 2a3dffd417..c29a730a71 100644
--- a/include/ui/input.h
+++ b/include/ui/input.h
@@ -64,6 +64,11 @@ int qemu_input_scale_axis(int value,
 void qemu_input_queue_rel(QemuConsole *src, InputAxis axis, int value);
 void qemu_input_queue_abs(QemuConsole *src, InputAxis axis, int value,
                           int min_in, int max_in);
+void qemu_input_queue_mtt(QemuConsole *src, InputMultiTouchType type, int slot,
+                          int tracking_id);
+void qemu_input_queue_mtt_abs(QemuConsole *src, InputAxis axis, int value,
+                              int min_in, int max_in,
+                              int slot, int tracking_id);
 
 void qemu_input_check_mode_change(void);
 void qemu_add_mouse_mode_change_notifier(Notifier *notify);
diff --git a/ui/input.c b/ui/input.c
index fc75f1353c..1aad64b07c 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -547,6 +547,42 @@ void qemu_input_queue_abs(QemuConsole *src, InputAxis axis, int value,
     qemu_input_event_send(src, &evt);
 }
 
+void qemu_input_queue_mtt(QemuConsole *src, InputMultiTouchType type,
+                          int slot, int tracking_id)
+{
+    InputMultiTouchEvent mtt = {
+        .type = type,
+        .slot = slot,
+        .tracking_id = tracking_id,
+    };
+    InputEvent evt = {
+        .type = INPUT_EVENT_KIND_MTT,
+        .u.mtt.data = &mtt,
+    };
+
+    qemu_input_event_send(src, &evt);
+}
+
+void qemu_input_queue_mtt_abs(QemuConsole *src, InputAxis axis, int value,
+                              int min_in, int max_in, int slot, int tracking_id)
+{
+    InputMultiTouchEvent mtt = {
+        .type = INPUT_MULTI_TOUCH_TYPE_DATA,
+        .slot = slot,
+        .tracking_id = tracking_id,
+        .axis = axis,
+        .value = qemu_input_scale_axis(value, min_in, max_in,
+                                       INPUT_EVENT_ABS_MIN,
+                                       INPUT_EVENT_ABS_MAX),
+    };
+    InputEvent evt = {
+        .type = INPUT_EVENT_KIND_MTT,
+        .u.mtt.data = &mtt,
+    };
+
+    qemu_input_event_send(src, &evt);
+}
+
 void qemu_input_check_mode_change(void)
 {
     static int current_is_absolute;
-- 
2.38.1


