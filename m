Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675BC5E9ED0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 12:14:49 +0200 (CEST)
Received: from localhost ([::1]:49932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocl8S-0006aN-HD
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 06:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpd-0004o9-Qi
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ockpb-0003ez-4T
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 05:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664186118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t+8ci7yIxQ8T3QiJDY00xznjj3eoJ5YaGlNk+syamAw=;
 b=EBGgVZUKRYKASql37RteQkgNdXDtFvysiK5PuT1YVB0BSFw1+feEM/IycJ7o4EsQBJ7+B3
 naxje9S1JmNPLVtZ3Vk/XMYPW0CxpIuK9N3EIRwFMiEGvlsKJDty/zhp3lrGijtUM2/kz+
 gB6orwR2tFgi0Bf0fFZ7NMCNZoY/1Fg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-Ppwqmmw0Mfmjz6l-UexR_w-1; Mon, 26 Sep 2022 05:55:12 -0400
X-MC-Unique: Ppwqmmw0Mfmjz6l-UexR_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 350183810780;
 Mon, 26 Sep 2022 09:55:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 873612084837;
 Mon, 26 Sep 2022 09:55:11 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E75C31803097; Mon, 26 Sep 2022 11:55:09 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexandre Ratchov <alex@caoua.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cal Peake <cp@absolutedigital.net>
Subject: [PULL 01/25] ui/console: Get tab completion working again in the SDL
 monitor vc
Date: Mon, 26 Sep 2022 11:54:45 +0200
Message-Id: <20220926095509.3759409-2-kraxel@redhat.com>
In-Reply-To: <20220926095509.3759409-1-kraxel@redhat.com>
References: <20220926095509.3759409-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cal Peake <cp@absolutedigital.net>

Define a QEMU special key constant for the tab key and add an entry for
it in the qcode_to_keysym table. This allows tab completion to work again
in the SDL monitor virtual console, which has been broken ever since the
migration from SDL1 to SDL2.

Signed-off-by: Cal Peake <cp@absolutedigital.net>
Message-Id: <7054816e-99c-7e2-6737-7cf98cc56e2@absolutedigital.net>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/ui/console.h | 1 +
 ui/console.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index c0520c694c23..e400ee9fa74b 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -70,6 +70,7 @@ void hmp_mouse_set(Monitor *mon, const QDict *qdict);
 /* keysym is a unicode code except for special keys (see QEMU_KEY_xxx
    constants) */
 #define QEMU_KEY_ESC1(c) ((c) | 0xe100)
+#define QEMU_KEY_TAB        0x0009
 #define QEMU_KEY_BACKSPACE  0x007f
 #define QEMU_KEY_UP         QEMU_KEY_ESC1('A')
 #define QEMU_KEY_DOWN       QEMU_KEY_ESC1('B')
diff --git a/ui/console.c b/ui/console.c
index 765892f84f1c..243f2f6e64ae 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1368,6 +1368,7 @@ static const int qcode_to_keysym[Q_KEY_CODE__MAX] = {
     [Q_KEY_CODE_PGUP]   = QEMU_KEY_PAGEUP,
     [Q_KEY_CODE_PGDN]   = QEMU_KEY_PAGEDOWN,
     [Q_KEY_CODE_DELETE] = QEMU_KEY_DELETE,
+    [Q_KEY_CODE_TAB]    = QEMU_KEY_TAB,
     [Q_KEY_CODE_BACKSPACE] = QEMU_KEY_BACKSPACE,
 };
 
-- 
2.37.3


