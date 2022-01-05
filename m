Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DD485313
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 13:56:32 +0100 (CET)
Received: from localhost ([::1]:58350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n55qB-0008At-Os
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 07:56:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XC-0003Pu-DE
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1n55XA-0000Uh-Tp
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 07:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641386212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xsC9iPIOeYNhZ3O5zjjc+CBXKT8A4HmLz0toqFh6Xk4=;
 b=HdwdgITRihKVMAt5990+FrJWh9rfMYZO3GsPg/iZSzWeSYDL5JDBcUB42FiVtd6cO7s7kV
 GwMFftNKhEkrpq2W4C7H31YNtlQ4t96RDd83jdUs0yBaRIeP6Axm6Xivea16RZogEjlFWM
 Jpz7OM7e26f8BJ2FilW70DWpbz5a928=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-mc1RVpbQPPyc3geVBFmJEw-1; Wed, 05 Jan 2022 07:36:49 -0500
X-MC-Unique: mc1RVpbQPPyc3geVBFmJEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9D6C3D98;
 Wed,  5 Jan 2022 12:36:47 +0000 (UTC)
Received: from thuth.com (dhcp-192-229.str.redhat.com [10.33.192.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCDA42376A;
 Wed,  5 Jan 2022 12:36:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/8] tests/unit/test-util-sockets: Use g_file_open_tmp() to
 create temp file
Date: Wed,  5 Jan 2022 13:36:08 +0100
Message-Id: <20220105123612.432038-5-thuth@redhat.com>
In-Reply-To: <20220105123612.432038-1-thuth@redhat.com>
References: <20220105123612.432038-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Similarly to commit e63ed64c6d1 ("tests/qtest/virtio-net-failover:
Use g_file_open_tmp() to create temporary file"), avoid calling
g_test_rand_int() before g_test_init(): use g_file_open_tmp().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211224234504.3413370-1-philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-util-sockets.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-util-sockets.c b/tests/unit/test-util-sockets.c
index 72b9246529..896247e3ed 100644
--- a/tests/unit/test-util-sockets.c
+++ b/tests/unit/test-util-sockets.c
@@ -305,9 +305,11 @@ static void test_socket_unix_abstract(void)
     };
     int i;
 
+    i = g_file_open_tmp("unix-XXXXXX", &addr.u.q_unix.path, NULL);
+    g_assert_true(i >= 0);
+    close(i);
+
     addr.type = SOCKET_ADDRESS_TYPE_UNIX;
-    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
-                                         getpid(), g_random_int());
     addr.u.q_unix.has_abstract = true;
     addr.u.q_unix.abstract = true;
     addr.u.q_unix.has_tight = false;
-- 
2.27.0


