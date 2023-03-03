Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625636A9794
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4t0-0007yP-1T; Fri, 03 Mar 2023 07:51:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4su-0007vw-RQ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:40 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pY4sr-0000VG-ID
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JdP2312WoOZhLmXW7+UuT4K6GVXGf/m2n3vir6Waq1Q=; b=jUHgF4QZN7/DVo2vlwRWg0t2Ct
 tLKH0gvSRLfW9wGTVO17q81IYzlyDzyLkjSkKSNttR/4HPu8ZJwAklrLitj7MAUX6cLLGJVWgZS2a
 zaKckYhGsYK25N7GdCoHf5XqgEsHpVBmVb0eH/gtVRLNf3IQ6GRM7o6xqSBY4NJGGm6QYskL5xmmv
 6Zow1oaNNMzHqq+s1FyR/3xIDDX8xqn/bK2KAkE6diannTflqjxGt5QBu6tH7NGavrWcZ0ZzbM2ZU
 GWwaep4N0IGMf20pj2L8s0sVQ3F8kT4yNNBHxYV+HhyW9fQaVwv/lDGyJu3yxPBEfSVPhAPzBeNpe
 oTahUbyQ==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pY4si-00388C-EN; Fri, 03 Mar 2023 12:51:28 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pY4sh-005KMb-27; Fri, 03 Mar 2023 12:51:27 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>
Subject: [PATCH 1/2] tests/avocado: Add Fedora 34 distro,
 including kernel/initrd checksums
Date: Fri,  3 Mar 2023 12:51:25 +0000
Message-Id: <20230303125126.1269861-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230303125126.1269861-1-dwmw2@infradead.org>
References: <20230303125126.1269861-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+c2a260b7edcf36afa963+7131+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

From: David Woodhouse <dwmw@amazon.co.uk>

The kernel in Fedora 31 doesn't support 'xen_no_vector_callback' on
its command line, so add a slightly newer version as a prelude to
enabling avocado tests for Xen guests.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tests/avocado/avocado_qemu/__init__.py | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index a313e88c07..49e414e267 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -485,6 +485,23 @@ class LinuxDistro:
                                   ' console=tty0'),
                  },
             },
+            '34': {
+                'x86_64':
+                {'checksum': ('b9b621b26725ba95442d9a56cbaa0547'
+                              '84e0779a9522ec6eafff07c6e6f717ea'),
+                 'pxeboot_url': ('https://archives.fedoraproject.org/'
+                                 'pub/archive/fedora/linux/releases/34/'
+                                 'Everything/x86_64/os/images/pxeboot/'),
+                 'kernel_hash': ('085fc6e47f2e3a271b591f3e56739ca9'
+                                 '4c16718837a5f431ab95468e1e95f9eb'),
+                 'initrd_hash': ('d6cd2e03e8188eed6c896fd65ff05f81'
+                                 '2c4c1c8777d630b5909e9a1a4627e337'),
+                 'kernel_params': ('root=UUID=386769a3-cfa5-47c8-8797-'
+                                   'd5ec58c9cb6c ro no_timer_check '
+                                   'net.ifnames=0 console=tty1 '
+                                   'console=ttyS0,115200n8'),
+                },
+            },
         }
     }
 
@@ -513,6 +530,16 @@ def pxeboot_url(self):
         """Gets the repository url where pxeboot files can be found"""
         return self._info.get('pxeboot_url', None)
 
+    @property
+    def kernel_hash(self):
+        """Gets checksum of the pxeboot kernel image"""
+        return self._info.get('kernel_hash', None)
+
+    @property
+    def initrd_hash(self):
+        """Gets checksum of the pxeboot initrd image"""
+        return self._info.get('initrd_hash', None)
+
     @property
     def default_kernel_params(self):
         """Gets the default kernel parameters"""
-- 
2.39.0


