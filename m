Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F273E16AD
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:14:14 +0200 (CEST)
Received: from localhost ([::1]:43808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe8T-0002Wv-Qk
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBduT-00012P-Iz
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:59:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mBduS-0001W3-42
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 09:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628171983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JrKLxsCMInCEFmk5wNc4Ylgnbo3tU8MazJOHi5RMFHc=;
 b=N99H0NbCJgZu33SrQWhpp/kz5plGtmY+SlzaiM+OT8f8k6a6vs50q6L0gnYL9yNNKYSr0b
 Q9eFTlA3cV4SkM3toGQ3n/2aHeI3jhlQk/itRvI24YttqDlyvFVLT40NaIiH3BancCr3YX
 ExSEEocyIORozSz3L0lSCnOQROnPqHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-gdiDAGNMOoC-2tuVaj6gvA-1; Thu, 05 Aug 2021 09:59:42 -0400
X-MC-Unique: gdiDAGNMOoC-2tuVaj6gvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A61787D542
 for <qemu-devel@nongnu.org>; Thu,  5 Aug 2021 13:59:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF7E57A8D7;
 Thu,  5 Aug 2021 13:59:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/18] ui/vdagent: send empty clipboard when unhandled
Date: Thu,  5 Aug 2021 17:57:11 +0400
Message-Id: <20210805135715.857938-15-marcandre.lureau@redhat.com>
In-Reply-To: <20210805135715.857938-1-marcandre.lureau@redhat.com>
References: <20210805135715.857938-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rather than leaving the agent timing out or hanging, reply to it with an
empty result.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/vdagent.c    | 12 ++++++++++++
 ui/trace-events |  1 +
 2 files changed, 13 insertions(+)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index cd07937a4b..cd49da1ffa 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -375,6 +375,16 @@ static void vdagent_send_clipboard_data(VDAgentChardev *vd,
     vdagent_send_msg(vd, msg);
 }
 
+static void vdagent_send_empty_clipboard_data(VDAgentChardev *vd,
+                                              QemuClipboardSelection selection,
+                                              QemuClipboardType type)
+{
+    g_autoptr(QemuClipboardInfo) info = qemu_clipboard_info_new(&vd->cbpeer, selection);
+
+    trace_vdagent_send_empty_clipboard();
+    vdagent_send_clipboard_data(vd, info, type);
+}
+
 static void vdagent_clipboard_notify(Notifier *notifier, void *data)
 {
     VDAgentChardev *vd = container_of(notifier, VDAgentChardev, cbpeer.update);
@@ -482,6 +492,8 @@ static void vdagent_clipboard_recv_request(VDAgentChardev *vd, uint8_t s, uint32
             vd->cbpending[s] |= (1 << type);
             qemu_clipboard_request(info, type);
         }
+    } else {
+        vdagent_send_empty_clipboard_data(vd, s, type);
     }
 }
 
diff --git a/ui/trace-events b/ui/trace-events
index 1b5f87bc09..b9c0dd0fa1 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -129,6 +129,7 @@ xkeymap_keymap(const char *name) "keymap '%s'"
 vdagent_open(void) ""
 vdagent_close(void) ""
 vdagent_send(const char *name) "msg %s"
+vdagent_send_empty_clipboard(void) ""
 vdagent_recv_chunk(uint32_t size) "size %d"
 vdagent_recv_msg(const char *name, uint32_t size) "msg %s, size %d"
 vdagent_peer_cap(const char *name) "cap %s"
-- 
2.32.0.264.g75ae10bc75


