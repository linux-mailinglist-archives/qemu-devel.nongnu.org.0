Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6D26C24B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 13:52:14 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIVyv-0003RF-S1
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 07:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVui-0006g5-UR
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kIVuh-00088c-Cb
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 07:47:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600256870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6WH2Ef+dgxULexJb3A4wiue+4GPWaUEanFv+M5Lt84=;
 b=fj8Q31xO7d+xQ1lrE1Wgj53z18P+wIYu1bZMl7RK8rRxFd6oz4jkoHGo120jneNtNeu57o
 hUxwj0VFI64od18Mm6rXeSv5mn+YtqRpbIdiZRsdROtlbuNGqr2/dWUZgScDfMbdF/2KpE
 E2uvAWI9HX/RhDr1T/cS7g9gYoYdLMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-Ot2wSCYuNtGWXM7DzS2X7Q-1; Wed, 16 Sep 2020 07:47:48 -0400
X-MC-Unique: Ot2wSCYuNtGWXM7DzS2X7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F811186DD23;
 Wed, 16 Sep 2020 11:47:47 +0000 (UTC)
Received: from thuth.com (ovpn-113-19.ams2.redhat.com [10.36.113.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 40B9C5DA71;
 Wed, 16 Sep 2020 11:47:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 08/24] tests: Convert g_free to g_autofree macro in
 test-logging.c
Date: Wed, 16 Sep 2020 13:47:15 +0200
Message-Id: <20200916114731.102080-9-thuth@redhat.com>
In-Reply-To: <20200916114731.102080-1-thuth@redhat.com>
References: <20200916114731.102080-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 02:35:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

g_autofree are prefer than g_free when possible.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20200915121318.247-17-luoyonggang@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/test-logging.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/test-logging.c b/tests/test-logging.c
index 8a1161de1d..783fe09a27 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -196,7 +196,7 @@ static void rmdir_full(gchar const *root)
 
 int main(int argc, char **argv)
 {
-    gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
+    g_autofree gchar *tmp_path = g_dir_make_tmp("qemu-test-logging.XXXXXX", NULL);
     int rc;
 
     g_test_init(&argc, &argv, NULL);
@@ -212,6 +212,5 @@ int main(int argc, char **argv)
     rc = g_test_run();
 
     rmdir_full(tmp_path);
-    g_free(tmp_path);
     return rc;
 }
-- 
2.18.2


