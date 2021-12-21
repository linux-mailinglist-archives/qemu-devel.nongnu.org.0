Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0315447BA71
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:08:53 +0100 (CET)
Received: from localhost ([::1]:36398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZGV-0000zY-SS
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ7f-0001dB-NK
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:59:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZ7e-0001fO-8D
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 01:59:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640069981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NPxNJl2P8NzMZgu63BRXG6ySBfg6/iOpK/WPgt+1bc=;
 b=iBjMyPHpXt2grXKZvaES/v1AOT7fe2vTb0nCBjdXmRnMMccEiNwnRhXAFOf0KI0EmrTw8t
 pKUp33J4IMd3c3FFCZCQA006XrlTD0sf/dYi65vlDMQ2L9SCEYGglP7+76ZhyGZqwN59CY
 sreTTS69rSnuVsfUH+vSxb/uwTVTkqg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-Uhkzp8O_ORiWhDlIU8D2Ww-1; Tue, 21 Dec 2021 01:59:40 -0500
X-MC-Unique: Uhkzp8O_ORiWhDlIU8D2Ww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3C0A801B31;
 Tue, 21 Dec 2021 06:59:39 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15FED38E02;
 Tue, 21 Dec 2021 06:59:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/36] ui/vdagent: replace #if 0 with protocol version check
Date: Tue, 21 Dec 2021 10:58:21 +0400
Message-Id: <20211221065855.142578-3-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/vdagent.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/ui/vdagent.c b/ui/vdagent.c
index 1f8fc77ee8f3..64e00170017f 100644
--- a/ui/vdagent.c
+++ b/ui/vdagent.c
@@ -87,8 +87,10 @@ static const char *cap_name[] = {
     [VD_AGENT_CAP_MONITORS_CONFIG_POSITION]       = "monitors-config-position",
     [VD_AGENT_CAP_FILE_XFER_DISABLED]             = "file-xfer-disabled",
     [VD_AGENT_CAP_FILE_XFER_DETAILED_ERRORS]      = "file-xfer-detailed-errors",
-#if 0
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 0)
     [VD_AGENT_CAP_GRAPHICS_DEVICE_INFO]           = "graphics-device-info",
+#endif
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 1)
     [VD_AGENT_CAP_CLIPBOARD_NO_RELEASE_ON_REGRAB] = "clipboard-no-release-on-regrab",
     [VD_AGENT_CAP_CLIPBOARD_GRAB_SERIAL]          = "clipboard-grab-serial",
 #endif
@@ -110,7 +112,7 @@ static const char *msg_name[] = {
     [VD_AGENT_CLIENT_DISCONNECTED]   = "client-disconnected",
     [VD_AGENT_MAX_CLIPBOARD]         = "max-clipboard",
     [VD_AGENT_AUDIO_VOLUME_SYNC]     = "audio-volume-sync",
-#if 0
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 0)
     [VD_AGENT_GRAPHICS_DEVICE_INFO]  = "graphics-device-info",
 #endif
 };
@@ -128,7 +130,7 @@ static const char *type_name[] = {
     [VD_AGENT_CLIPBOARD_IMAGE_BMP]  = "bmp",
     [VD_AGENT_CLIPBOARD_IMAGE_TIFF] = "tiff",
     [VD_AGENT_CLIPBOARD_IMAGE_JPG]  = "jpg",
-#if 0
+#if CHECK_SPICE_PROTOCOL_VERSION(0, 14, 3)
     [VD_AGENT_CLIPBOARD_FILE_LIST]  = "files",
 #endif
 };
-- 
2.34.1.8.g35151cf07204


