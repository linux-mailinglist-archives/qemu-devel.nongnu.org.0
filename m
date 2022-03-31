Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B74EE2F2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 22:54:53 +0200 (CEST)
Received: from localhost ([::1]:32886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na1oh-00068a-Sv
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 16:54:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1na1nr-0005Rd-4K
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:53:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1na1nn-0000zD-P5
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 16:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648760034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0SCqFw4/YACwba+Cwk6eebpnTo/ShK090ltbcLGug5o=;
 b=YRDAvRS9SvIiiX8tfz7ZtpzTcCfyOuNncKKLMCnhhSW8vxP77u0seaRVrvNpHDT6bgFPwc
 djZFv9BXVEpE9dQaOCfCumdA7XS8SDrWoEgoX7qujbpuviPcQ8syHVBwVjGbILFk5O2bg+
 QfhZKj8DEwOv1VsRX2iXwb99k1nWQTI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-226-NBJqPueVPBK0kVPwoCa1Pw-1; Thu, 31 Mar 2022 16:53:51 -0400
X-MC-Unique: NBJqPueVPBK0kVPwoCa1Pw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C294980281D;
 Thu, 31 Mar 2022 20:53:49 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2440F53C9;
 Thu, 31 Mar 2022 20:53:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] qga: replace usleep() with g_usleep()
Date: Fri,  1 Apr 2022 00:53:39 +0400
Message-Id: <20220331205339.2048330-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The latter simply requires glib.h, while the former is not in the
Windows API (but provided by mingw header & CRT)

Also simplify the expression for 1/10s.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index 1deb0ee2fbfe..6a5be23225d0 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -610,7 +610,7 @@ static gboolean channel_event_cb(GIOCondition condition, gpointer data)
          * host-side chardev. sleep a bit to mitigate this
          */
         if (s->virtio) {
-            usleep(100 * 1000);
+            g_usleep(G_USEC_PER_SEC / 10);
         }
         return true;
     default:
-- 
2.35.1.693.g805e0a68082a


