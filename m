Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4357C22E0E0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jul 2020 17:38:09 +0200 (CEST)
Received: from localhost ([::1]:43628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jzij1-0007lO-SG
	for lists+qemu-devel@lfdr.de; Sun, 26 Jul 2020 11:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jzidY-00059X-E7
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 11:32:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1jzidT-00035j-Uw
 for qemu-devel@nongnu.org; Sun, 26 Jul 2020 11:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595777540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DCwPF8ANWHOt4Il/FO+UNElk4D19SFc8L1s8Gu42+dI=;
 b=iFiDr1/tSWCx+7zfhu7ijfPEQWqGXSs62Hjv+XmyEFN79XyrwGZ4768wQ0hikemCAI2m3/
 2lf+DuqNQxill5WelKo0uMnx6tLdMF8m1FpYOpxHbCHfn5Y/sIpJcMvD/lRehqG4f0/fLO
 rUsKhq2lIhObzPVdDFIp1x0UCg/mvpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-c6uzd0_3O--n2gi87T3OZQ-1; Sun, 26 Jul 2020 11:32:18 -0400
X-MC-Unique: c6uzd0_3O--n2gi87T3OZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80FC58015F4;
 Sun, 26 Jul 2020 15:32:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAA1F5D9DC;
 Sun, 26 Jul 2020 15:32:13 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] test-char: abort on serial test error
Date: Sun, 26 Jul 2020 19:32:10 +0400
Message-Id: <20200726153210.919957-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=marcandre.lureau@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/26 11:32:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are having issues debugging and bisecting this issue that happen
mostly on patchew. Let's make it abort where it failed to gather some
new informations.

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/test-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-char.c b/tests/test-char.c
index 614bdac2df8..d35cc839bc6 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -1200,7 +1200,7 @@ static void char_serial_test(void)
 
     /* test tty alias */
     qemu_opt_set(opts, "backend", "tty", &error_abort);
-    chr = qemu_chr_new_from_opts(opts, NULL, NULL);
+    chr = qemu_chr_new_from_opts(opts, NULL, &error_abort);
     g_assert_nonnull(chr);
     object_unparent(OBJECT(chr));
 
-- 
2.28.0.rc1.6.gae46588be0


