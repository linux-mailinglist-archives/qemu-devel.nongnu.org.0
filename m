Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C793C78F0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:25:04 +0200 (CEST)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Ptn-000860-7K
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppx-00027O-N7
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppu-0008Fo-Ok
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:21:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S5dZ8DclsjkpdzCUuxjcyTgqtpLFUVUhRxkTUrExvOw=;
 b=gy9WwOH2Fs0IYWuuIIG8Kjt9VzjlFQl433kHQ3IyEUXLbF3v2JdOjQeX2T50bUb/5mim1a
 5agT7mmSxTSe95vOd/VUs0v7XnUVCo0iE1RkqILYzaklSctLDDLMnUUzJSteVuDEiwr/Sl
 1LUjN1reZEMV7kl44OD9S8xlqDK+d8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-zWyC23B-PMCR7cZ374EWgg-1; Tue, 13 Jul 2021 17:20:59 -0400
X-MC-Unique: zWyC23B-PMCR7cZ374EWgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02FE8100B3AC;
 Tue, 13 Jul 2021 21:20:57 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B158519C59;
 Tue, 13 Jul 2021 21:20:54 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/23] Acceptance Tests: Add default kernel params and pxeboot
 url to the KNOWN_DISTROS collection
Date: Tue, 13 Jul 2021 17:19:09 -0400
Message-Id: <20210713211923.3809241-10-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

When running LinuxTests we may need to run the guest with
custom params. It is practical to store the pxeboot URL
and the default kernel params so that the
tests just need to fetch those and augment the kernel params.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210706131729.30749-3-eric.auger@redhat.com>
[CR: split long lines]
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 58 +++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 256befafc4..1de1edce0d 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -317,17 +317,59 @@ class LinuxDistro:
             '31': {
                 'x86_64':
                 {'checksum': ('e3c1b309d9203604922d6e255c2c5d09'
-                              '8a309c2d46215d8fc026954f3c5c27a0')},
+                              '8a309c2d46215d8fc026954f3c5c27a0'),
+                 'pxeboot_url': ('https://archives.fedoraproject.org/'
+                                 'pub/archive/fedora/linux/releases/31/'
+                                 'Everything/x86_64/os/images/pxeboot/'),
+                 'kernel_params': ('root=UUID=b1438b9b-2cab-4065-a99a-'
+                                   '08a96687f73c ro no_timer_check '
+                                   'net.ifnames=0 console=tty1 '
+                                   'console=ttyS0,115200n8'),
+                },
                 'aarch64':
                 {'checksum': ('1e18d9c0cf734940c4b5d5ec592facae'
-                              'd2af0ad0329383d5639c997fdf16fe49')},
+                              'd2af0ad0329383d5639c997fdf16fe49'),
+                'pxeboot_url': 'https://archives.fedoraproject.org/'
+                               'pub/archive/fedora/linux/releases/31/'
+                               'Everything/aarch64/os/images/pxeboot/',
+                'kernel_params': ('root=UUID=b6950a44-9f3c-4076-a9c2-'
+                                  '355e8475b0a7 ro earlyprintk=pl011,0x9000000'
+                                  ' ignore_loglevel no_timer_check'
+                                  ' printk.time=1 rd_NO_PLYMOUTH'
+                                  ' console=ttyAMA0'),
+                },
                 'ppc64':
                 {'checksum': ('7c3528b85a3df4b2306e892199a9e1e4'
                               '3f991c506f2cc390dc4efa2026ad2f58')},
                 's390x':
                 {'checksum': ('4caaab5a434fd4d1079149a072fdc789'
                               '1e354f834d355069ca982fdcaf5a122d')},
-            }
+            },
+            '32': {
+                'aarch64':
+                {'checksum': ('b367755c664a2d7a26955bbfff985855'
+                              'adfa2ca15e908baf15b4b176d68d3967'),
+                'pxeboot_url': ('http://dl.fedoraproject.org/pub/fedora/linux/'
+                                'releases/32/Server/aarch64/os/images/'
+                                'pxeboot/'),
+                'kernel_params': ('root=UUID=3df75b65-be8d-4db4-8655-'
+                                  '14d95c0e90c5 ro no_timer_check net.ifnames=0'
+                                  ' console=tty1 console=ttyS0,115200n8'),
+                },
+            },
+            '33': {
+                'aarch64':
+                {'checksum': ('e7f75cdfd523fe5ac2ca9eeece68edc1'
+                              'a81f386a17f969c1d1c7c87031008a6b'),
+                'pxeboot_url': ('http://dl.fedoraproject.org/pub/fedora/linux/'
+                                'releases/33/Server/aarch64/os/images/'
+                                'pxeboot/'),
+                'kernel_params': ('root=UUID=d20b3ffa-6397-4a63-a734-'
+                                  '1126a0208f8a ro no_timer_check net.ifnames=0'
+                                  ' console=tty1 console=ttyS0,115200n8'
+                                  ' console=tty0'),
+                 },
+            },
         }
     }
 
@@ -351,6 +393,16 @@ def checksum(self):
     def checksum(self, value):
         self._info['checksum'] = value
 
+    @property
+    def pxeboot_url(self):
+        """Gets the repository url where pxeboot files can be found"""
+        return self._info.get('pxeboot_url', None)
+
+    @property
+    def default_kernel_params(self):
+        """Gets the default kernel parameters"""
+        return self._info.get('kernel_params', None)
+
 
 class LinuxTest(Test, LinuxSSHMixIn):
     """Facilitates having a cloud-image Linux based available.
-- 
2.31.1


