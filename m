Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CB463AAB2
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:18:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozew9-0008Ns-Kx; Mon, 28 Nov 2022 09:16:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevV-0008D3-G3
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevT-0005SY-61
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669644961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ad/8cwhve4H+k8AjNmhbKjCGzt+BN5Wcq1f4Dpmtydk=;
 b=hUIno7zLRkf/k44S1t9K2oHzzXNpQNfLrMN6ToXQhDGcDF2UWBGPW3/koELb+ZJjCqPpWC
 qZxuYeXeIAltMYRy/87CzPJi2r+S1mYTFlgnVfRV5UbrA/nMOLMm1DGwAHxr+YOL8QvTcK
 dnSI+WMXIdjpcNnipTHtYAFoUyuDT88=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-jm_o4ewrOs-JZ9S_TBMGTQ-1; Mon, 28 Nov 2022 09:16:00 -0500
X-MC-Unique: jm_o4ewrOs-JZ9S_TBMGTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 773833C3D279;
 Mon, 28 Nov 2022 14:15:21 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4462166B4D;
 Mon, 28 Nov 2022 14:15:19 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH v2 2/5] Support format or cache specific out file
Date: Mon, 28 Nov 2022 16:15:11 +0200
Message-Id: <20221128141514.388724-3-nsoffer@redhat.com>
In-Reply-To: <20221128141514.388724-1-nsoffer@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Extend the test finder to find tests with format (*.out.qcow2) or cache
specific (*.out.nocache) out file. This worked before only for the
numbered tests.
---
 tests/qemu-iotests/findtests.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
index dd77b453b8..f4344ce78c 100644
--- a/tests/qemu-iotests/findtests.py
+++ b/tests/qemu-iotests/findtests.py
@@ -38,31 +38,37 @@ def chdir(path: Optional[str] = None) -> Iterator[None]:
         os.chdir(saved_dir)
 
 
 class TestFinder:
     def __init__(self, test_dir: Optional[str] = None) -> None:
         self.groups = defaultdict(set)
 
         with chdir(test_dir):
             self.all_tests = glob.glob('[0-9][0-9][0-9]')
             self.all_tests += [f for f in glob.iglob('tests/*')
-                               if not f.endswith('.out') and
-                               os.path.isfile(f + '.out')]
+                               if self.is_test(f)]
 
             for t in self.all_tests:
                 with open(t, encoding="utf-8") as f:
                     for line in f:
                         if line.startswith('# group: '):
                             for g in line.split()[2:]:
                                 self.groups[g].add(t)
                             break
 
+    def is_test(self, fname: str) -> bool:
+        """
+        The tests directory contains tests (no extension) and out files
+        (*.out, *.out.{format}, *.out.{option}).
+        """
+        return re.search(r'.+\.out(\.\w+)?$', fname) is None
+
     def add_group_file(self, fname: str) -> None:
         with open(fname, encoding="utf-8") as f:
             for line in f:
                 line = line.strip()
 
                 if (not line) or line[0] == '#':
                     continue
 
                 words = line.split()
                 test_file = self.parse_test_name(words[0])
-- 
2.38.1


