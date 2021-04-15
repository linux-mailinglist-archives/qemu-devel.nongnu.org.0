Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AD361464
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 23:55:55 +0200 (CEST)
Received: from localhost ([::1]:40264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX9xq-0004Ws-H1
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 17:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uQ-0000cz-7V
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uN-0001xv-7G
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618523538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+NfWOz55xxZzpQYzc0k/q704CVd37G4rSeYOrY2kess=;
 b=HayvYKR9eMwfYScHsqw5MZGcZWBejtLNrntIGgmW847shVATpWePgfhLy1aUouRU3rn2gz
 N0Varf1/IynmyJ3x7WhCJPHO9F80FErDOvnL8zsC0Q2KAaX0SzT0VoB+qPZpsOyhLDhrUa
 qOMkizzpAYD07rIiK3gWxpdbJrlvAH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-Xdz7CnQrOzux20LBqxClcA-1; Thu, 15 Apr 2021 17:52:14 -0400
X-MC-Unique: Xdz7CnQrOzux20LBqxClcA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC74E81744F;
 Thu, 15 Apr 2021 21:52:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3855D9DE;
 Thu, 15 Apr 2021 21:52:02 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] tests/acceptance/migration.py: cancel test if migration
 is not supported
Date: Thu, 15 Apr 2021 17:51:37 -0400
Message-Id: <20210415215141.1865467-5-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-1-crosa@redhat.com>
References: <20210415215141.1865467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FIXME: check if there's a way to query migration support before
actually requesting migration.

Some targets/machines contain devices that do not support migration.
Let's acknowledge that and cancel the test as early as possible.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/migration.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 792639cb69..25ee55f36a 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -53,7 +53,11 @@ def do_migrate(self, dest_uri, src_uri=None):
         source_vm = self.get_vm()
         source_vm.add_args('-nodefaults')
         source_vm.launch()
-        source_vm.qmp('migrate', uri=src_uri)
+        response = source_vm.qmp('migrate', uri=src_uri)
+        if 'error' in response:
+            if 'desc' in response['error']:
+                msg = response['error']['desc']
+            self.cancel('Migration does not seem to be supported: %s' % msg)
         self.assert_migration(source_vm, dest_vm)
 
     def _get_free_port(self):
-- 
2.25.4


