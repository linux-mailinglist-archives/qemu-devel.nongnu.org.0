Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 028044DDB55
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:12:36 +0100 (CET)
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDLH-0005iY-3h
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:12:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5u-0005ye-Gg
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nVD5s-00084w-8r
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647611799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPX8HHOnP/v4x7BOZ274/TNELsNZG1ek9HWnH7MaQuE=;
 b=cW+jwYDjcAVVGD9HNbgV0nNi09DPr8sk0X0RMo+K14PnR0eMJ26TIRKtoQoPXOj90YccAW
 bJdbfxnyWlluXeNJ7YB4aPT+RYNnlYPkwx9AU9LQTxLqa34Nca77wRuY4nEfg6oLme5p3O
 ZQBxrhyhP1+OWlrzRznXqA2Eij7jLgU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-ROPUut2cOs-gxUC4iaj2fg-1; Fri, 18 Mar 2022 09:56:36 -0400
X-MC-Unique: ROPUut2cOs-gxUC4iaj2fg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BCFE38035BA;
 Fri, 18 Mar 2022 13:56:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C2BC26E8E;
 Fri, 18 Mar 2022 13:56:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 18F391800383; Fri, 18 Mar 2022 14:56:34 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] ui/gtk: Ignore 2- and 3-button press events
Date: Fri, 18 Mar 2022 14:56:29 +0100
Message-Id: <20220318135634.2851040-2-kraxel@redhat.com>
In-Reply-To: <20220318135634.2851040-1-kraxel@redhat.com>
References: <20220318135634.2851040-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "K. Lange" <klange@toaruos.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "K. Lange" <klange@toaruos.org>

GTK already produces corresponding GDK_BUTTON_PRESS events
alongside 2BUTTON and 3BUTTON_PRESS events. The 2BUTTON and
3BUTTON_PRESS events were incorrectly being interpreted and
passed to guests as button release events.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/558
Signed-off-by: K. Lange <klange@toaruos.org>
Message-Id: <20220305104521.3583703-1-klange@toaruos.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/gtk.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 1b24a67d7964..c57c36749e0e 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -972,6 +972,10 @@ static gboolean gd_button_event(GtkWidget *widget, GdkEventButton *button,
         return TRUE;
     }
 
+    if (button->type == GDK_2BUTTON_PRESS || button->type == GDK_3BUTTON_PRESS) {
+        return TRUE;
+    }
+
     qemu_input_queue_btn(vc->gfx.dcl.con, btn,
                          button->type == GDK_BUTTON_PRESS);
     qemu_input_event_sync();
-- 
2.35.1


