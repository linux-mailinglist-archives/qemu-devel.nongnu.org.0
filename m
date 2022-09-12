Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE45B5877
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:31:19 +0200 (CEST)
Received: from localhost ([::1]:52868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXgik-0003b3-En
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcx-00072c-PP
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oXgcs-0007JG-0H
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662978311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rxxq1tlRUCzgggOroaSy4rkZcbEk0eweqlOTWvGw0NI=;
 b=Q8tHHRH7eLewxJlnTavKWKfrOV8M2oPMpsiOXKuhy9esVwu8GmDtwNA9uGPeh9FWMUykiF
 o2QYmCddyh8DF5yuHz3KdpuA5joa3/PzL7vl2gBuSykUhCorumoguCptcuEaNKaPTR2Liz
 1UkeHMJNkyIhupspT2GxLCTqvPm6rfo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-HJlzfe9qMS6B6di7jJhEhw-1; Mon, 12 Sep 2022 06:25:10 -0400
X-MC-Unique: HJlzfe9qMS6B6di7jJhEhw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C22529AB449
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 10:25:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67FE62028DC1;
 Mon, 12 Sep 2022 10:25:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 2/5] ui/clipboard: fix serial priority
Date: Mon, 12 Sep 2022 14:24:52 +0400
Message-Id: <20220912102455.111765-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220912102455.111765-1-marcandre.lureau@redhat.com>
References: <20220912102455.111765-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The incoming grab event should have a higher serial.
See also "vdagent: introduce VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL":
https://gitlab.freedesktop.org/spice/spice-protocol/-/commit/045a6978d6dbbf7046affc5c321fa8177c8cce56

This is only a relevant fix for the -display dbus, only user of that
function.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 ui/clipboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index cd5382fcb0..3e2d02d549 100644
--- a/ui/clipboard.c
+++ b/ui/clipboard.c
@@ -54,9 +54,9 @@ bool qemu_clipboard_check_serial(QemuClipboardInfo *info, bool client)
     }
 
     if (client) {
-        ok = cbinfo[info->selection]->serial >= info->serial;
+        ok = info->serial >= cbinfo[info->selection]->serial;
     } else {
-        ok = cbinfo[info->selection]->serial > info->serial;
+        ok = info->serial > cbinfo[info->selection]->serial;
     }
 
     trace_clipboard_check_serial(cbinfo[info->selection]->serial, info->serial, ok);
-- 
2.37.3


