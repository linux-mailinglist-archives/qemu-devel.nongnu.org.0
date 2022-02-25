Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878194C50AF
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:24:40 +0100 (CET)
Received: from localhost ([::1]:51154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNi4t-0007ze-KB
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:24:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhl4-0007Xu-Gm
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1nNhl2-0005WT-KJ
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:04:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645823047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZuPsnBa/TIN73zdOBhgnN9AsDduVrt/5Sg+K2kLmww=;
 b=Aeeg4jTB40kuZIEw3he7yuJLH12bAR2a1GPewhoBjacY7aROOm8N7NeFkyZa5aCjPoYG5b
 yg0t3YO0GALPCoJWFY7Maeo9kTDxtOoGubZ2nt3mHdPhjikUIf4vM4438jb89EM183umG7
 f3JxmYOLxYvopzCt3GLC87HrNdfq5Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-89GT9vTaN2uwozykbX54GA-1; Fri, 25 Feb 2022 16:04:06 -0500
X-MC-Unique: 89GT9vTaN2uwozykbX54GA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BB91091DA0;
 Fri, 25 Feb 2022 21:04:02 +0000 (UTC)
Received: from p50.localhost.localdomain.com (unknown [10.22.16.50])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F028F2ED79;
 Fri, 25 Feb 2022 21:03:37 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 6/9] tests/avocado/virtiofs_submounts.py: shared_dir may not
 exist
Date: Fri, 25 Feb 2022 16:01:53 -0500
Message-Id: <20220225210156.2032055-7-crosa@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If the test is skipped because of their conditionals, the shared_dir
attribute may not exist.

Check for its existence in the tearDown() method to avoid and
AttributeError.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/avocado/virtiofs_submounts.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
index e6dc32ffd4..d9c2c9d9ef 100644
--- a/tests/avocado/virtiofs_submounts.py
+++ b/tests/avocado/virtiofs_submounts.py
@@ -157,9 +157,10 @@ def tearDown(self):
         except:
             pass
 
-        scratch_dir = os.path.join(self.shared_dir, 'scratch')
-        self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
-                 ignore_error=True)
+        if hasattr(self, 'shared_dir'):
+            scratch_dir = os.path.join(self.shared_dir, 'scratch')
+            self.run(('bash', self.get_data('cleanup.sh'), scratch_dir),
+                     ignore_error=True)
 
     def test_pre_virtiofsd_set_up(self):
         self.set_up_shared_dir()
-- 
2.35.1


