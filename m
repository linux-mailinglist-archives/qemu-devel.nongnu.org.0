Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CA6C2D8D
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 10:05:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXuZ-0000OJ-Lh; Tue, 21 Mar 2023 05:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuY-0000O2-0O
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1peXuW-0001lM-E0
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 05:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679389441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AgK4wygSPELOpiFGSCtUt00Nxqa7d+Vmm2uKT2n8E1s=;
 b=Z4wZtXlFtdE58DPzBtu1Be1QhGSCzgaSQ3mQeGL/cSB6Ih2xnY6E62ButOqu1VWqmExGD9
 J5G3heVP/Q4ljHC7Welpq9Et6n4XThrlEH2/EIXyK4UF5G3vSM9QIYqBsQhLJZTQI5nogf
 eoCPrEC2imfU+jj4il/eLOdfN0WSgR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-dAlBC6XaNdWHab5CQcVjeg-1; Tue, 21 Mar 2023 05:03:59 -0400
X-MC-Unique: dAlBC6XaNdWHab5CQcVjeg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1F23810B0D;
 Tue, 21 Mar 2023 09:03:59 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C7640C94AC;
 Tue, 21 Mar 2023 09:03:58 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PULL 5/7] ui: return the default console cursor when con == NULL
Date: Tue, 21 Mar 2023 13:03:32 +0400
Message-Id: <20230321090334.1841607-6-marcandre.lureau@redhat.com>
In-Reply-To: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
References: <20230321090334.1841607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

VNC code relies on con==NULL to mean the default console.

Fixes:
https://gitlab.com/qemu-project/qemu/-/issues/1548

Fixes: commit 385ac97f8 ("ui: keep current cursor with QemuConsole")
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reported-by: Helge Konetzka <hk@zapateado.de>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230319111017.1319880-1-marcandre.lureau@redhat.com>
---
 ui/console.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index f3783021e5..6e8a3cdc62 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -2303,6 +2303,9 @@ QemuConsole *qemu_console_lookup_unused(void)
 
 QEMUCursor *qemu_console_get_cursor(QemuConsole *con)
 {
+    if (con == NULL) {
+        con = active_console;
+    }
     return con->cursor;
 }
 
-- 
2.39.2


