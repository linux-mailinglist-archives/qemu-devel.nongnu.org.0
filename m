Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA0F4C5086
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:22:01 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNi2K-0004wj-F2
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:22:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhkR-00072Q-QM
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhkO-0005QP-Fm
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645823002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOuOLyLdCnh99/oAfl/tDKSBuWvbul9urTxuUFywBmo=;
 b=IOfatcmg8mzGk2s0l8yb7tpTGw1V/pYJD5W3nKQozHM48jMtezHt6HQB4k/p2f2ervDvC7
 aJplXYxi0LcPinqv72K4YcrPelxWVQ9d08hFwtZaS/1C4NNcM61IktCXv3TWBSV0XJV90C
 psjpfQaj9MJQH9l7QMiIKx8W99zRIfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-UId7-3ZXMN23XF5Kag9G0Q-1; Fri, 25 Feb 2022 16:03:18 -0500
X-MC-Unique: UId7-3ZXMN23XF5Kag9G0Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AD5D801AAD;
 Fri, 25 Feb 2022 21:03:15 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60C0A2ED79;
 Fri, 25 Feb 2022 21:03:08 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 3/9] Avocado migration test: adapt to "utils.network" API
 namespace change
Date: Fri, 25 Feb 2022 16:01:50 -0500
Message-Id: <20220225210156.2032055-4-crosa@redhat.com>
In-Reply-To: <20220225210156.2032055-1-crosa@redhat.com>
References: <20220225210156.2032055-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eric Farman <farman@linux.ibm.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Fabien Chouteau <chouteau@adacore.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since Avocado 94.0[1], the "avocado.utils.network" dropped a lot of
previously deprecated API names, having the new names into a finer
grained structure.

This simply uses the new API names for the network port utility
module.

[1] - https://avocado-framework.readthedocs.io/en/latest/releases/94_0.html#utility-apis

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 5 +++--
 tests/avocado/migration.py             | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 88cec83e5c..3f15c8a222 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -17,7 +17,8 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, process, ssh, vmimage
+from avocado.utils.network import ports
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -601,7 +602,7 @@ def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
-            self.phone_home_port = network.find_free_port()
+            self.phone_home_port = ports.find_free_port()
             pubkey_content = None
             if ssh_pubkey:
                 with open(ssh_pubkey) as pubkey:
diff --git a/tests/avocado/migration.py b/tests/avocado/migration.py
index 584d6ef53f..4b25680c50 100644
--- a/tests/avocado/migration.py
+++ b/tests/avocado/migration.py
@@ -14,7 +14,7 @@
 from avocado_qemu import QemuSystemTest
 from avocado import skipUnless
 
-from avocado.utils import network
+from avocado.utils.network import ports
 from avocado.utils import wait
 from avocado.utils.path import find_command
 
@@ -57,7 +57,7 @@ def do_migrate(self, dest_uri, src_uri=None):
         self.assert_migration(source_vm, dest_vm)
 
     def _get_free_port(self):
-        port = network.find_free_port()
+        port = ports.find_free_port()
         if port is None:
             self.cancel('Failed to find a free port')
         return port
-- 
2.35.1


