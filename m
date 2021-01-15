Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7D2F7CE4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:42:05 +0100 (CET)
Received: from localhost ([::1]:59438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PMb-0000de-07
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:42:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3D-0006rM-Nd
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0P3A-0003H5-4I
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610716913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P0tYVpttXfRb0Qnh1uN5/ixevCObt9P8fBy6EFlQWSs=;
 b=cQhgTWu1oJNkEOP3h8GpHsMov8peUQJDu4fTeQRVk+IdKZ3PRKB5qJH7fFIHbgl3KKWJsp
 UwXuo70cdQX3RqeIuUSNDX3C6jel0nixmNu6MkSVJEA8cini+pLDnIL6QE9IkWfmoISFW+
 0Et70OMnE+C/tedSHueiCwAfsPz4W4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-OiRq-O17OdaiYPZZIp_aDg-1; Fri, 15 Jan 2021 08:21:51 -0500
X-MC-Unique: OiRq-O17OdaiYPZZIp_aDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACEB0107ACF7;
 Fri, 15 Jan 2021 13:21:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98FAF5D756;
 Fri, 15 Jan 2021 13:21:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2D1751800610; Fri, 15 Jan 2021 14:21:46 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/30] audio: fix bit-rotted code
Date: Fri, 15 Jan 2021 14:21:18 +0100
Message-Id: <20210115132146.1443592-3-kraxel@redhat.com>
In-Reply-To: <20210115132146.1443592-1-kraxel@redhat.com>
References: <20210115132146.1443592-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Volker=20R=C3=BCmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-id: 9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de
Message-Id: <20210110100239.27588-2-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 audio/alsaaudio.c | 2 +-
 audio/sdlaudio.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index a8e62542f97e..6787e91bc198 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -599,7 +599,7 @@ static int alsa_open(bool in, struct alsa_params_req *req,
     }
 
 #ifdef DEBUG
-    alsa_dump_info(req, obt, obtfmt, pdo);
+    alsa_dump_info(req, obt, obtfmt, apdo);
 #endif
     return 0;
 
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index bf3cfb845616..00cd12ba66a0 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -215,7 +215,7 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
         return;
     }
 
-    /* dolog ("in callback samples=%zu live=%zu\n", samples, sdl->live); */
+    /* dolog("callback: len=%d avail=%zu\n", len, hw->pending_emul); */
 
     while (hw->pending_emul && len) {
         size_t write_len;
-- 
2.29.2


