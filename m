Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF52434BE5A
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 20:51:47 +0200 (CEST)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQaVm-0007iD-Su
	for lists+qemu-devel@lfdr.de; Sun, 28 Mar 2021 14:51:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaQG-0002OQ-N1
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:46:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lQaQE-0001B9-R6
 for qemu-devel@nongnu.org; Sun, 28 Mar 2021 14:46:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616957160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsNbzokXUBnh9Fz6v2IEB30C4nOjOr8tWj6XpAo9scA=;
 b=B60LMAdYsD2aj3PWfqn24YiTHIjB/BHzJwjJEKi8arsmasd0gPqU7jqrYB8o/l5WQp1i7f
 pokHrtk4J+VWVFV7t4QRro+xj2fmPGQQuUQzQh68+q1OVTAsp2/3KUqaN8XswVi9g/OVW7
 uZzbK2yIswylUXLUHceCzPXNHMV2sFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-r2o--SxFM2-Zp5SorsvGcA-1; Sun, 28 Mar 2021 14:45:56 -0400
X-MC-Unique: r2o--SxFM2-Zp5SorsvGcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 396941853020;
 Sun, 28 Mar 2021 18:45:55 +0000 (UTC)
Received: from localhost (unknown [10.36.110.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E09C5D6A1;
 Sun, 28 Mar 2021 18:45:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 02/10] dbus-vmstate: Increase the size of input stream buffer
 used during load
Date: Sun, 28 Mar 2021 22:45:25 +0400
Message-Id: <20210328184533.752840-3-marcandre.lureau@redhat.com>
In-Reply-To: <20210328184533.752840-1-marcandre.lureau@redhat.com>
References: <20210328184533.752840-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Priyankar Jain <priyankar.jain@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Priyankar Jain <priyankar.jain@nutanix.com>

This commit fixes an issue where migration is failing in the load phase
because of a false alarm about data unavailability.

Following is the error received when the amount of data to be transferred
exceeds the default buffer size setup by G_BUFFERED_INPUT_STREAM(4KiB),
even when the maximum data size supported by this backend is 1MiB
(DBUS_VMSTATE_SIZE_LIMIT):

  dbus_vmstate_post_load: Invalid vmstate size: 4364
  qemu-kvm: error while loading state for instance 0x0 of device 'dbus-vmstate/dbus-vmstate'

This commit sets the size of the input stream buffer used during load to
DBUS_VMSTATE_SIZE_LIMIT which is the maximum amount of data a helper can
send during save phase.
Secondly, this commit makes sure that the input stream buffer is loaded before
checking the size of the data available in it, rectifying the false alarm about
data unavailability.

Fixes: 5010cec2bc87 ("Add dbus-vmstate object")
Signed-off-by: Priyankar Jain <priyankar.jain@nutanix.com>
Message-Id: <cdaad4718e62bf22fd5e93ef3e252de20da5c17c.1612273156.git.priyankar.jain@nutanix.com>
[ Modified printf format for gsize ]
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 backends/dbus-vmstate.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
index 2a0d2e4a31..9cfd758c42 100644
--- a/backends/dbus-vmstate.c
+++ b/backends/dbus-vmstate.c
@@ -204,6 +204,8 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
     m = g_memory_input_stream_new_from_data(self->data, self->data_size, NULL);
     s = g_data_input_stream_new(m);
     g_data_input_stream_set_byte_order(s, G_DATA_STREAM_BYTE_ORDER_BIG_ENDIAN);
+    g_buffered_input_stream_set_buffer_size(G_BUFFERED_INPUT_STREAM(s),
+                                            DBUS_VMSTATE_SIZE_LIMIT);
 
     nelem = g_data_input_stream_read_uint32(s, NULL, &err);
     if (err) {
@@ -244,11 +246,23 @@ static int dbus_vmstate_post_load(void *opaque, int version_id)
         }
 
         len = g_data_input_stream_read_uint32(s, NULL, &err);
+        if (len > DBUS_VMSTATE_SIZE_LIMIT) {
+            error_report("%s: Invalid vmstate size: %u", __func__, len);
+            return -1;
+        }
+
+        g_buffered_input_stream_fill(G_BUFFERED_INPUT_STREAM(s), len, NULL,
+                                     &err);
+        if (err) {
+            goto error;
+        }
+
         avail = g_buffered_input_stream_get_available(
             G_BUFFERED_INPUT_STREAM(s));
-
-        if (len > DBUS_VMSTATE_SIZE_LIMIT || len > avail) {
-            error_report("%s: Invalid vmstate size: %u", __func__, len);
+        if (len > avail) {
+            error_report("%s: Not enough data available to load for Id: '%s'. "
+                "Available data size: %zu, Actual vmstate size: %u",
+                __func__, id, avail, len);
             return -1;
         }
 
-- 
2.29.0


