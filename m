Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3964449961
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:20:17 +0100 (CET)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7NY-00044h-Lt
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:20:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LV-0001eH-KP
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LT-0000p3-NE
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y6zrXawNuyqiVyJ30mXD2GbOXw3akV02RKQxe7ID2q4=;
 b=ULRu3RLIB2lj6g+YFsiqJGzPLzxtmiUJy4fs4KqDqbeGfVSGcn+mMEjl4cEqiVBGKxfjE3
 2RWDGOFuBNjusuD33R3T59r0YclaVi7HNURw1KG5coIGVzN7Ghg/12tBnuJGqvfjqGln6l
 G4By6aacnNRjopYhPzee+XJXh2A7u88=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-VumbrikUMgO7NRboMPeUKg-1; Mon, 08 Nov 2021 11:18:05 -0500
X-MC-Unique: VumbrikUMgO7NRboMPeUKg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so6404082wmj.7
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y6zrXawNuyqiVyJ30mXD2GbOXw3akV02RKQxe7ID2q4=;
 b=AztZMPxoSxMgy1iWZstFC70n//PpHqmPUSKoSko6pDQP80alS+wjqesPfp83kDDIQy
 4QWO1TEXSuHUlHI/R3/D+U/3Y7zMg4A4jJJi0VA9qZ9MpnzI93FEOA1tvjV1Zu0HNhJk
 fc78Cx04pVcr4wXf7PJog823He2AN0LgqdpDlKQDWKC17U2RhcH3LuA/I8SAszKu6W9o
 sMg+EHbGyfl2h0Ggl1YpZ1qFeD78Y5XPmRO3lf6xrOKdalUcObqznKh+cuD4d2IOE5ci
 l9UIYfAqFxUFpVTmb7vnxUepPmFuVYzzATeWxNwLym5JCPEALG69JuBuxbGuZrTSzaVm
 uJMg==
X-Gm-Message-State: AOAM532HA9fQhtsSUqZEJoNi2R3B8C457p/s+Ddp89zoDyx0iJ+7mdji
 qk1Tghh4qhHrceJd38kgB3IVeaP1/I4tq1B2s2+ibC/TqUPmmB16JESLJgWU3W8mOm/tfxQgHEx
 DEQoUrbGDsTUrw9B83rV8c3nCl7BgNbKaOFXUoh0pgEdl9QS4P1TV7XqTHylEtanx
X-Received: by 2002:a5d:6151:: with SMTP id y17mr345723wrt.275.1636388283921; 
 Mon, 08 Nov 2021 08:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEeKeZb3TcTYwVYViy2tBtU5eKsZUrCow4QVSzJ4P+3w6Vg1LbbaMc1xXq44U2KKNspGctUQ==
X-Received: by 2002:a5d:6151:: with SMTP id y17mr345694wrt.275.1636388283726; 
 Mon, 08 Nov 2021 08:18:03 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id n7sm17009343wra.37.2021.11.08.08.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:18:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/9] tests/avocado: Make pick_default_qemu_bin() more generic
Date: Mon,  8 Nov 2021 17:17:34 +0100
Message-Id: <20211108161739.1371503-5-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make pick_default_qemu_bin() generic to find qemu-system or
qemu-user binaries.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211105143416.148332-3-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index a495e106d03..984c554e7d6 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -45,7 +45,7 @@ def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
 
-def pick_default_qemu_bin(arch=None):
+def pick_default_qemu_bin(bin_prefix='qemu-system-', arch=None):
     """
     Picks the path of a QEMU binary, starting either in the current working
     directory or in the source tree root directory.
@@ -64,7 +64,7 @@ def pick_default_qemu_bin(arch=None):
     # qemu binary path does not match arch for powerpc, handle it
     if 'ppc64le' in arch:
         arch = 'ppc64'
-    qemu_bin_relative_path = "./qemu-system-%s" % arch
+    qemu_bin_relative_path = os.path.join(".", bin_prefix + arch)
     if is_readable_executable_file(qemu_bin_relative_path):
         return qemu_bin_relative_path
 
@@ -179,14 +179,14 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
-    def setUp(self):
+    def setUp(self, bin_prefix):
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
         self.cpu = self.params.get('cpu',
                                    default=self._get_unique_tag_val('cpu'))
 
-        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
+        default_qemu_bin = pick_default_qemu_bin(bin_prefix, arch=self.arch)
         self.qemu_bin = self.params.get('qemu_bin',
                                         default=default_qemu_bin)
         if self.qemu_bin is None:
@@ -214,7 +214,7 @@ class Test(QemuBaseTest):
     def setUp(self):
         self._vms = {}
 
-        super().setUp()
+        super().setUp('qemu-system-')
 
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
-- 
2.31.1


