Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156D2F76A0
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 11:26:42 +0100 (CET)
Received: from localhost ([::1]:35730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0MJV-0004Wi-CW
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 05:26:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHS-0002sL-TT
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l0MHR-0007rj-Dr
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 05:24:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610706272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qJPJOwoXCkGwbiSuYbbJgdkoZrMN9/UHCtD1+osMbYU=;
 b=dCQNkX8psPjqaTWEhmD5rehxXBTZnj6t5TMMYtWLoLasMBQtqNTXZVkDJDMhk65N5ZdPCK
 yYyfphIXImhhpM//xar8zyPtzw7Z0FAf7CLbTPKGHj8Sq6BdOr4jGn+8So8ri/FKFOizfG
 JxsGbe713RV/fj1JC0WqTmt02b/r0RQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-8gPTT4lcPwWtdDAJSocEMA-1; Fri, 15 Jan 2021 05:24:30 -0500
X-MC-Unique: 8gPTT4lcPwWtdDAJSocEMA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A09015723;
 Fri, 15 Jan 2021 10:24:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C0F60BF3;
 Fri, 15 Jan 2021 10:24:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 85EE91800607; Fri, 15 Jan 2021 11:24:24 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/11] ui/gtk: don't try to redefine SI prefixes
Date: Fri, 15 Jan 2021 11:24:14 +0100
Message-Id: <20210115102424.1360437-2-kraxel@redhat.com>
In-Reply-To: <20210115102424.1360437-1-kraxel@redhat.com>
References: <20210115102424.1360437-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Volker Rümelin <vr_qemu@t-online.de>

Redefining SI prefixes is always wrong. 1s has per definition
1000ms. Remove the misnamed named constant and replace it with
a comment explaining the frequency to period conversion in two
simple steps. Now you can cancel out the unit mHz in the comment
with the implicit unit mHz in refresh_rate_millihz and see why
the implicit unit ms for update_interval remains.

Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
Message-Id: <20201213165724.13418-1-vr_qemu@t-online.de>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/gtk.h | 2 --
 ui/gtk.c         | 3 ++-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index eaeb450f913e..80851fb4c7e1 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -24,8 +24,6 @@
 #include "ui/egl-context.h"
 #endif
 
-#define MILLISEC_PER_SEC 1000000
-
 typedef struct GtkDisplayState GtkDisplayState;
 
 typedef struct VirtualGfxConsole {
diff --git a/ui/gtk.c b/ui/gtk.c
index e8474456df88..a83c8c3785e1 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -798,7 +798,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ?
                                                    vc->window : s->window);
     if (refresh_rate_millihz) {
-        vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / refresh_rate_millihz;
+        /* T = 1 / f = 1 [s*Hz] / f = 1000*1000 [ms*mHz] / f */
+        vc->gfx.dcl.update_interval = 1000 * 1000 / refresh_rate_millihz;
     }
 
     fbw = surface_width(vc->gfx.ds);
-- 
2.29.2


