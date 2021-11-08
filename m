Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A32449983
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:22:56 +0100 (CET)
Received: from localhost ([::1]:54242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Q7-0008H5-NQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lh-0001ut-76
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lb-0000qn-W8
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q83GXnv4mn5q9vEHpCdzjj3QzMBEEx65F0uNcqXi278=;
 b=RB2Tqa32/cSXZzHXXSVxLNqb6waq7ioFSW6PGdOjwcY43WhwiZ9I3I5gMwlt1/T7UI1ZPA
 ZDw497IVeaLUdhMZhI5EUrNVtr6FSdwPW1lSqUIubynkURiA6iZ1WG15mYydUt7bNjHvgS
 0tOorTeIIRNbH7MRVSOjAMSjE/V0iBs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-ujqCoBggOry4qF-jEn6_zA-1; Mon, 08 Nov 2021 11:18:10 -0500
X-MC-Unique: ujqCoBggOry4qF-jEn6_zA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so4189169wro.21
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q83GXnv4mn5q9vEHpCdzjj3QzMBEEx65F0uNcqXi278=;
 b=Eq17jb40s9bA5Jdx3oxu7LqrzuEE4m8p/uZZjMHEDzlywy44K6xmZU1+9k7kdbyLEl
 v9plPRUHuDC098y7DVqszqtdMBSPnbNRyDjPiApJTEB9K/7fiJzaWJOHLXo3IRnzsLNX
 ZT27HkwehRxQy0LxjI8Egge/R26V9UhIMtz0xLNxcTD03ZqL4SXUlrotsW/8MP2LyzuR
 RL4KsTW3azg9Ii/Rt4mxa+Bg5/DOsQ7ygvF2oI601pBMoTJPaZSzEcTFovk958IJhzH8
 B9oOzNTWK/A0uTw3NT/CWq0acYpYhNzRtNXfjgX33kDQ7Y256Vd+xs9gVy4xChqn5Tsx
 xiYw==
X-Gm-Message-State: AOAM531vxBpRrb0rJzqQ2YvbM25Fq5wwlvSVAUYbJPIy2bSD3sSubxZv
 sIxXlo5bat6MDuww7vhH5Agk8c8w0htp6jNTWJEBtsSFAZrGEkmDLBXWnPUyw5+nM/98xRkanet
 w3cPbndB6zNOZr3AfzJShBt6YLmE/5LsMQufK8mR9PTlZbxLajTRYRqsbggeMGiSq
X-Received: by 2002:a5d:6151:: with SMTP id y17mr346485wrt.275.1636388289134; 
 Mon, 08 Nov 2021 08:18:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyt67BYfeZJkBTHGMG4syN+U5t3txfagA/LjXH5Oz+mw1/5ioQsPLVptYK7wX7bFrJmmlEOEg==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr346442wrt.275.1636388288901; 
 Mon, 08 Nov 2021 08:18:08 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id h27sm22494640wmc.43.2021.11.08.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:18:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/9] tests/avocado: Introduce QemuUserTest base class
Date: Mon,  8 Nov 2021 17:17:35 +0100
Message-Id: <20211108161739.1371503-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
References: <20211108161739.1371503-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Similarly to the 'System' Test base class with methods for testing
system emulation, the QemuUserTest class contains methods useful to
test user-mode emulation.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211105143416.148332-4-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index 984c554e7d6..e46b3ecb89e 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -17,7 +17,7 @@
 import uuid
 
 import avocado
-from avocado.utils import cloudinit, datadrainer, network, ssh, vmimage
+from avocado.utils import cloudinit, datadrainer, network, process, ssh, vmimage
 from avocado.utils.path import find_command
 
 #: The QEMU build root directory.  It may also be the source directory
@@ -295,6 +295,23 @@ def tearDown(self):
         super().tearDown()
 
 
+class QemuUserTest(QemuBaseTest):
+    """Facilitates user-mode emulation tests."""
+
+    def setUp(self):
+        self._ldpath = []
+        super().setUp('qemu-')
+
+    def add_ldpath(self, ldpath):
+        self._ldpath.append(os.path.abspath(ldpath))
+
+    def run(self, bin_path, args=[]):
+        qemu_args = " ".join(["-L %s" % ldpath for ldpath in self._ldpath])
+        bin_args = " ".join(args)
+        return process.run("%s %s %s %s" % (self.qemu_bin, qemu_args,
+                                            bin_path, bin_args))
+
+
 class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
 
-- 
2.31.1


