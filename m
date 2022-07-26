Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98903581143
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 12:35:14 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHuC-0004DV-87
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 06:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oGHqJ-0002ZG-2U
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:31:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oGHqF-0001kZ-2W
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:31:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658831466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kVRa8ffHmDgT9+/RpCwukEy2WXxgJ6HQ5P8cvE5cOVM=;
 b=S2f/ghwQcVdkzzCS5Cmq8vAgQzP3j5aZjY04UBm+04Mxn4oCvdHximPa9zUrornka1ZBvc
 FW/azkHZL40MvTbP06oAUkdKcPhenlPnZkdjLMtUGixMf8JxoxqZiDgP+K80qUuHbmv0AR
 zMN1kgXiU2oprRghiOrP0IPVFD62o+c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-jqQrAXltPCG6JNduBTVJIw-1; Tue, 26 Jul 2022 06:31:04 -0400
X-MC-Unique: jqQrAXltPCG6JNduBTVJIw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50CD13C0E212
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 10:31:04 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38C3E40F9D42;
 Tue, 26 Jul 2022 10:31:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] ui: -display dbus requires gbm
Date: Tue, 26 Jul 2022 14:31:00 +0400
Message-Id: <20220726103100.2579854-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

For now, -display dbus also requires GBM, for EGL setup.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1108

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meson.build b/meson.build
index 8a8c415fc1f8..b2c18faa0f4c 100644
--- a/meson.build
+++ b/meson.build
@@ -1679,6 +1679,8 @@ dbus_display = get_option('dbus_display') \
            error_message: '-display dbus requires gdbus-codegen') \
   .require(opengl.found(),
            error_message: '-display dbus requires epoxy/egl') \
+  .require(gbm.found(),
+           error_message: '-display dbus requires gbm') \
   .allowed()
 
 have_virtfs = get_option('virtfs') \
-- 
2.37.0.rc0


