Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E242966DC47
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 12:24:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHk3c-0001aK-7H; Tue, 17 Jan 2023 06:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHk3U-0001ZR-Dg
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pHk3S-0002Nr-Mw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 06:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673954582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J0v6lTWM2mhusOLKFJEKqtN1XGPMHPCtS7OmYD4Ej0s=;
 b=egYqqNnx2PlLyTZ7UJ0FTS5HnGvHfbJiGOqx3oZBmFeTh5vwMTrEfjzfF93rVP2sKU26Qh
 trwd9f5ISV87Lg1zC1+taqIUQ4CC8+GkPOVqdPtttV3wX/UqjnAJkdCVPlOVHlq9/L+8rp
 EWGKcKjSGg9CMQCNa49KrVC2YDZ0C6s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-weAw1cRlNkCjqXiwH0ZHZg-1; Tue, 17 Jan 2023 06:23:00 -0500
X-MC-Unique: weAw1cRlNkCjqXiwH0ZHZg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AEB4101A521
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 11:23:00 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0B847AE5;
 Tue, 17 Jan 2023 11:22:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v5 4/8] migration/vmstate: Introduce VMSTATE_WITH_TMP_TEST()
 and VMSTATE_BITMAP_TEST()
Date: Tue, 17 Jan 2023 12:22:45 +0100
Message-Id: <20230117112249.244096-5-david@redhat.com>
In-Reply-To: <20230117112249.244096-1-david@redhat.com>
References: <20230117112249.244096-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

We'll make use of both next in the context of virtio-mem.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/migration/vmstate.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 64680d824e..28a3b92aa1 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -719,8 +719,9 @@ extern const VMStateInfo vmstate_info_qlist;
  *        '_state' type
  *    That the pointer is right at the start of _tmp_type.
  */
-#define VMSTATE_WITH_TMP(_state, _tmp_type, _vmsd) {                 \
+#define VMSTATE_WITH_TMP_TEST(_state, _test, _tmp_type, _vmsd) {     \
     .name         = "tmp",                                           \
+    .field_exists = (_test),                                         \
     .size         = sizeof(_tmp_type) +                              \
                     QEMU_BUILD_BUG_ON_ZERO(offsetof(_tmp_type, parent) != 0) + \
                     type_check_pointer(_state,                       \
@@ -729,6 +730,9 @@ extern const VMStateInfo vmstate_info_qlist;
     .info         = &vmstate_info_tmp,                               \
 }
 
+#define VMSTATE_WITH_TMP(_state, _tmp_type, _vmsd) \
+    VMSTATE_WITH_TMP_TEST(_state, NULL, _tmp_type, _vmsd)
+
 #define VMSTATE_UNUSED_BUFFER(_test, _version, _size) {              \
     .name         = "unused",                                        \
     .field_exists = (_test),                                         \
@@ -752,8 +756,9 @@ extern const VMStateInfo vmstate_info_qlist;
 /* _field_size should be a int32_t field in the _state struct giving the
  * size of the bitmap _field in bits.
  */
-#define VMSTATE_BITMAP(_field, _state, _version, _field_size) {      \
+#define VMSTATE_BITMAP_TEST(_field, _state, _test, _version, _field_size) { \
     .name         = (stringify(_field)),                             \
+    .field_exists = (_test),                                         \
     .version_id   = (_version),                                      \
     .size_offset  = vmstate_offset_value(_state, _field_size, int32_t),\
     .info         = &vmstate_info_bitmap,                            \
@@ -761,6 +766,9 @@ extern const VMStateInfo vmstate_info_qlist;
     .offset       = offsetof(_state, _field),                        \
 }
 
+#define VMSTATE_BITMAP(_field, _state, _version, _field_size) \
+    VMSTATE_BITMAP_TEST(_field, _state, NULL, _version, _field_size)
+
 /* For migrating a QTAILQ.
  * Target QTAILQ needs be properly initialized.
  * _type: type of QTAILQ element
-- 
2.39.0


