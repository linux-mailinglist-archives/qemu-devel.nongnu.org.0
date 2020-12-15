Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30F2DB69D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 23:44:52 +0100 (CET)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJ3r-0000Su-46
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 17:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ0w-00071j-PO
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:41:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpJ0u-00071T-4p
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 17:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608072106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RGZ9G3AcSp41vyTlVP9av6PsOl8GUOq3lpOSCUV4aw=;
 b=C5tO7x+X5KzKMVjPM7pJB+di4wgSzRHzARiFTial5k5VKPDq/1n2gXH1+gD8rSTTNPTCdd
 uBpb1h8ZjxT2z0WPCZmGI7Ivvov2+VJI+aTI0lkdvjQmusiCe9e/3ALgvxvFFoTnDcQSS6
 P8qkrPmRNtztNhi/WtOPfrEW97BZGq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-dl3nDUx3NZSMEwSyyLErjQ-1; Tue, 15 Dec 2020 17:41:44 -0500
X-MC-Unique: dl3nDUx3NZSMEwSyyLErjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F87D195D560;
 Tue, 15 Dec 2020 22:41:43 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5C0027C27;
 Tue, 15 Dec 2020 22:41:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH 1/2] test-char: Destroy chardev correctly at
 char_file_test_internal()
Date: Tue, 15 Dec 2020 17:41:32 -0500
Message-Id: <20201215224133.3545901-2-ehabkost@redhat.com>
In-Reply-To: <20201215224133.3545901-1-ehabkost@redhat.com>
References: <20201215224133.3545901-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit 1e419ee68fa5 ("chardev: generate an internal id when none
given") changed the reference ownership semantics of
qemu_chardev_new(NULL, ...): now all chardevs created using
qemu_chardev_new() are added to the /chardevs QOM container, and
the caller does not own a reference to the newly created object.

However, the code at char_file_test_internal() had not been
updated and was calling object_unref() on a chardev object it
didn't own.  This makes the chardev be destroyed, but leaves a
dangling pointer in the /chardev container children list, and
seems to be the cause of the following char_serial_test() crash:

  Unexpected error in object_property_try_add() at ../qom/object.c:1220: \
      attempt to add duplicate property 'serial-id' to object (type 'container')
  ERROR test-char - too few tests run (expected 38, got 9)

Update the code to use object_unparent() at the end of
char_file_test_internal(), to make sure the chardev will be
correctly removed from the QOM tree.

Fixes: 1e419ee68fa5 ("chardev: generate an internal id when none given")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 tests/test-char.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-char.c b/tests/test-char.c
index 953e0d1c1f..06102977b6 100644
--- a/tests/test-char.c
+++ b/tests/test-char.c
@@ -1298,7 +1298,7 @@ static void char_file_test_internal(Chardev *ext_chr, const char *filepath)
     g_assert(strncmp(contents, "hello!", 6) == 0);
 
     if (!ext_chr) {
-        object_unref(OBJECT(chr));
+        object_unparent(OBJECT(chr));
         g_unlink(out);
     }
     g_free(contents);
-- 
2.28.0


