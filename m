Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1388347D12B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:43:37 +0100 (CET)
Received: from localhost ([::1]:43218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n001v-0003gl-SO
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:43:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsw-0001JC-PE
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzss-00072v-5W
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xykkt6Z3Ra1B4KvEgNzsN/0gvucadKbt9IM1q85ysJo=;
 b=f+H0LsNjpTYZyqkcfYzjBbO8L/EHv6w74wVGbXDO5gPs1BIoPhBRYAKQzTu7N8sczSfrS7
 GuT9CJi+5+8z/e/BUr/5TvSJOsRo3mwyxMqXNGmF5NMxI0IMow6AzaWUdGn9ucWpfYs+7I
 USXx5zngplZ9jga4Il4kmBwK/cAb6bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-N-NgwmUdMMObprNlRlH1eA-1; Wed, 22 Dec 2021 06:34:02 -0500
X-MC-Unique: N-NgwmUdMMObprNlRlH1eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B40781CCB4;
 Wed, 22 Dec 2021 11:34:01 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E26F7B015;
 Wed, 22 Dec 2021 11:34:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] tests/qtest/virtio-net-failover: Use g_file_open_tmp() to
 create temporary file
Date: Wed, 22 Dec 2021 12:32:59 +0100
Message-Id: <20211222113259.823203-10-thuth@redhat.com>
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
References: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_test_rand_int() must not be called before g_test_init(), otherwise
the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
message in the log. So we could change the order here, but actually,
it's safer to use g_file_open_tmp() anyway, so let's use that function
now instead.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211222083652.776592-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 4b2ba8a106..22ad54bb95 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1306,13 +1306,15 @@ static void test_multi_in(gconstpointer opaque)
 
 int main(int argc, char **argv)
 {
-    const gchar *tmpdir = g_get_tmp_dir();
-    gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
-                                     tmpdir, getpid(), g_test_rand_int());
+    gchar *tmpfile;
     int ret;
 
     g_test_init(&argc, &argv, NULL);
 
+    ret = g_file_open_tmp("failover_test_migrate-XXXXXX", &tmpfile, NULL);
+    g_assert_true(ret >= 0);
+    close(ret);
+
     qtest_add_func("failover-virtio-net/params/error/id", test_error_id);
     qtest_add_func("failover-virtio-net/params/error/pcie", test_error_pcie);
     qtest_add_func("failover-virtio-net/params/on", test_on);
-- 
2.27.0


