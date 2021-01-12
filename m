Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190692F3609
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 17:45:46 +0100 (CET)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzMnh-00007J-4a
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 11:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMjF-0003os-NR
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzMjD-00011c-So
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:41:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610469667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ElPS/L46AyPPgIP7hzlOqkVhWoHQ6xUx/U5otR12FKQ=;
 b=LiAYnawxlFd38ilkia5mpz2CXoX/TllafuPmWoLfUDthO2Kdni2B/dgGcPtcC7dxAOIcKR
 g1DsZqzlfiWJ6IOJVIvOwCxuTy1cWU8DZaEVr5TWxv/CXZ6aFl/l2c61QMDjDNigeMwk6x
 DJlU0ABGEa4ud8IkiDrY4lfcyZPIbIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-e-TPr4ohP4ez-K8bjLIrdQ-1; Tue, 12 Jan 2021 11:41:03 -0500
X-MC-Unique: e-TPr4ohP4ez-K8bjLIrdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 497E0805EE3;
 Tue, 12 Jan 2021 16:41:01 +0000 (UTC)
Received: from thuth.com (ovpn-112-184.ams2.redhat.com [10.36.112.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 736885D9CD;
 Tue, 12 Jan 2021 16:40:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
Subject: [PATCH 3/3] tests/acceptance: Add a test for the virtex-ml507 ppc
 machine
Date: Tue, 12 Jan 2021 17:40:45 +0100
Message-Id: <20210112164045.98565-4-thuth@redhat.com>
In-Reply-To: <20210112164045.98565-1-thuth@redhat.com>
References: <20210112164045.98565-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "And a hippo new year" image from the QEMU advent calendar 2020
can be used to test the virtex-ml507 ppc machine.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/acceptance/machine_ppc.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/acceptance/machine_ppc.py b/tests/acceptance/machine_ppc.py
index 71025d296c..a836e2496f 100644
--- a/tests/acceptance/machine_ppc.py
+++ b/tests/acceptance/machine_ppc.py
@@ -49,3 +49,21 @@ class PpcMachine(Test):
         self.vm.launch()
         wait_for_console_pattern(self, 'QEMU advent calendar 2020',
                                  self.panic_message)
+
+    def test_ppc_virtex_ml507(self):
+        """
+        :avocado: tags=arch:ppc
+        :avocado: tags=machine:virtex-ml507
+        """
+        tar_url = ('https://www.qemu-advent-calendar.org'
+                   '/2020/download/hippo.tar.gz')
+        tar_hash = '306b95bfe7d147f125aa176a877e266db8ef914a'
+        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
+        archive.extract(file_path, self.workdir)
+        self.vm.set_console()
+        self.vm.add_args('-kernel', self.workdir + '/hippo/hippo.linux',
+                         '-dtb', self.workdir + '/hippo/virtex440-ml507.dtb',
+                         '-m', '512')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'QEMU advent calendar 2020',
+                                 self.panic_message)
-- 
2.27.0


