Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEE4361466
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 23:58:15 +0200 (CEST)
Received: from localhost ([::1]:45740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXA06-0006qE-Mb
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 17:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uT-0000j2-Kf
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uR-0001zp-Dl
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618523542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/fhLbR5K3HyCkI+hULT4nKQTRoKHc8/uItuX0msEvnY=;
 b=ZqmHTeNJXKfc/rRT2OkasBiVVfq95uwVwfnxUu1H+LaKp4KuBnd//U/cj8bEM17ttKHEIz
 281G0N5o+XB2TWJJ8eHABrRWwi9ZI4e69f08zGb18TQkXjTl+Gfbq08walEJdD6JDw1NPZ
 i3r0xwUCFH1qyVbeUKFM/mrXVzSZERc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-bl4RYgleN7WHcFkzv2AnDA-1; Thu, 15 Apr 2021 17:52:18 -0400
X-MC-Unique: bl4RYgleN7WHcFkzv2AnDA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AC3C107ACC7;
 Thu, 15 Apr 2021 21:52:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A569B5D9DE;
 Thu, 15 Apr 2021 21:52:15 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] Acceptance tests: prevent shutdown on non-specific target
 tests
Date: Thu, 15 Apr 2021 17:51:39 -0400
Message-Id: <20210415215141.1865467-7-crosa@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

When running tests that are not target specific with various target
binaries, some specific behavior appears.  For s390x, when there's no
guest code running, it will produce GUEST_PANICKED events as the
firmware will shutdown the machine.

With this change, no GUEST_PANICKED *event* will be generated.

For some QMP commands, such as "query-migrate", a proper response
("guest-panicked" for the s390x target) will still be given.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/migration.py | 4 ++--
 tests/acceptance/version.py   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
index 25ee55f36a..b4d46becc6 100644
--- a/tests/acceptance/migration.py
+++ b/tests/acceptance/migration.py
@@ -46,12 +46,12 @@ def assert_migration(self, src_vm, dst_vm):
 
     def do_migrate(self, dest_uri, src_uri=None):
         dest_vm = self.get_vm('-incoming', dest_uri)
-        dest_vm.add_args('-nodefaults')
+        dest_vm.add_args('-nodefaults', '-no-shutdown')
         dest_vm.launch()
         if src_uri is None:
             src_uri = dest_uri
         source_vm = self.get_vm()
-        source_vm.add_args('-nodefaults')
+        source_vm.add_args('-nodefaults', '-no-shutdown')
         source_vm.launch()
         response = source_vm.qmp('migrate', uri=src_uri)
         if 'error' in response:
diff --git a/tests/acceptance/version.py b/tests/acceptance/version.py
index 79b923d4fc..3cf18c9878 100644
--- a/tests/acceptance/version.py
+++ b/tests/acceptance/version.py
@@ -17,7 +17,7 @@ class Version(Test):
     :avocado: tags=quick
     """
     def test_qmp_human_info_version(self):
-        self.vm.add_args('-nodefaults')
+        self.vm.add_args('-nodefaults', '-no-shutdown')
         self.vm.launch()
         res = self.vm.command('human-monitor-command',
                               command_line='info version')
-- 
2.25.4


