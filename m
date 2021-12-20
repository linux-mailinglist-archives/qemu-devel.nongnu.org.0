Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C90347B218
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 18:28:48 +0100 (CET)
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzMSt-0002kL-9N
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 12:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKvQ-0008H3-Ok
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzKvN-000475-8x
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640015404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3AwsPpgUuSNdDlOl1kFET+xP37V/yny9GnpG+Bw2PTE=;
 b=P7s9MFg5LWz6HntvObIPLbeReLiONWlKRpC+OESVFwC8aY/eqcZlh9KfXuBXk2gRg+hIpP
 Ug0JllVxEvzRZ/+SaEe22V3ctkHKW/OVkGd/38X8a0yl1caOhqXJmf4kguddSz+yLRMAfr
 9lYBdc3X0V3xNoDkOyjEMBrjCA31qAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-s-BxXuQDMXywehvCAfRYJg-1; Mon, 20 Dec 2021 05:28:03 -0500
X-MC-Unique: s-BxXuQDMXywehvCAfRYJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D4811800D50
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 10:28:02 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48E614ABAD;
 Mon, 20 Dec 2021 10:28:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] tests/qtest/virtio-net-failover: Use g_random_int() instead
 of g_test_rand_int()
Date: Mon, 20 Dec 2021 11:27:59 +0100
Message-Id: <20211220102759.311224-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

g_test_rand_int() must not be called before g_test_init(), otherwise
the glib will show a "g_rand_int: assertion 'rand != NULL' failed"
message in the log. So we could change the order here, but actually,
g_test_rand_int() seems also the wrong choice here, since we're using
it to create a temporary file name, which certainly should not depend
on the "--seed" CLI option of the g_test suite. Thus let's use the
g_random_int() function instead.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-failover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-net-failover.c b/tests/qtest/virtio-net-failover.c
index 4b2ba8a106..70b94bf18f 100644
--- a/tests/qtest/virtio-net-failover.c
+++ b/tests/qtest/virtio-net-failover.c
@@ -1308,7 +1308,7 @@ int main(int argc, char **argv)
 {
     const gchar *tmpdir = g_get_tmp_dir();
     gchar *tmpfile = g_strdup_printf("%s/failover_test_migrate-%u-%u",
-                                     tmpdir, getpid(), g_test_rand_int());
+                                     tmpdir, getpid(), g_random_int());
     int ret;
 
     g_test_init(&argc, &argv, NULL);
-- 
2.27.0


