Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D195EBE03
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 11:08:17 +0200 (CEST)
Received: from localhost ([::1]:60256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6Zc-00051f-AC
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 05:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oO-0005KV-Qj
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1od5oJ-0000Hz-EG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664266762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X8MB6qewQt3dNDFWmIT6gK9a8vJJkApS1O6Zso0beBQ=;
 b=F5fReayrsWRncLyQlLqC4uzzjlzMezU2o6W0Qykjm5hjDvY7zk+b+5K+Yp2y8dgQ1CXISz
 JqkMAYvnNE1Jtg02HrxOT4PU5T5ExXQ+HeXw6oBYUs9BthwraTHgW+1Cv+WIruPPNGOLh3
 Al55Tj1NhEI6CPyY5tUOE4G/fl13lKI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-Kks5Mo1UPEmvWbMj-CTwRA-1; Tue, 27 Sep 2022 04:19:21 -0400
X-MC-Unique: Kks5Mo1UPEmvWbMj-CTwRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED4E8185A78F;
 Tue, 27 Sep 2022 08:19:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 87A8017582;
 Tue, 27 Sep 2022 08:19:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 39E67180092D; Tue, 27 Sep 2022 10:19:13 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Qiuhao Li <Qiuhao.Li@outlook.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alexandre Ratchov <alex@caoua.org>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 06/24] ui/clipboard: fix serial priority
Date: Tue, 27 Sep 2022 10:18:54 +0200
Message-Id: <20220927081912.180983-7-kraxel@redhat.com>
In-Reply-To: <20220927081912.180983-1-kraxel@redhat.com>
References: <20220927081912.180983-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220912102455.111765-3-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/clipboard.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/clipboard.c b/ui/clipboard.c
index cd5382fcb0c1..3e2d02d5490c 100644
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


