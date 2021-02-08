Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FBE313FE7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:06:35 +0100 (CET)
Received: from localhost ([::1]:59870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Cnq-0001T1-OM
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:06:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96kW-0003Bx-JC
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l96k5-00055X-LZ
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612791496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nm/ExYlKufTmMZyvqaMCH5BvpDN6afR/9tY/eyJ/hhU=;
 b=dNw+7DDLvIc+bG7LhjYUPFlwNqO5lA2jfNZyyOtYeTIkHe6DSwmadrQy0TQl80N00hLPdX
 fiJaZU1WOIXafWXt1yPHwv8X8xY/fiGNzARqgWEmelC4kcOLcRjWB90eRbTObApI+j94g3
 2S4aY/0QZjOSirdvGzSWDaVnpprSySg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-5fdcgSwmMqqWOhj-7-af8g-1; Mon, 08 Feb 2021 08:38:14 -0500
X-MC-Unique: 5fdcgSwmMqqWOhj-7-af8g-1
Received: by mail-wr1-f71.google.com with SMTP id m7so13267516wro.12
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nm/ExYlKufTmMZyvqaMCH5BvpDN6afR/9tY/eyJ/hhU=;
 b=o3ejoUAXUnVfPJ1EtOKq24Yja7QIU5uUe3OdGLouQLOMUkjO75d0XKJMZoDlCZKwG5
 hloXBGzEewy7JrFp0iEzOC83zSFwOm+XhxK11n4+sLGMxVNZnkECNBByo7ngxXq1gzdQ
 JnTmVLbsB2K2JEEiAJo26+vRyiJcx+RDoYksVIwTjNzFA7m6r9XJnBdeWt/aIuJ0fX25
 VpQoqxoDrhVse+2w8v8iRHKJuynVhujNvgM0FHlIWuM0spqe1O2ys3X6rYkH5rlTFNAL
 VIlPc0EhkZx21ZyPWE6pPQF6jCF2ZJv/UgPdSMdwpXcMH744ahObIs+mjZBGv1Q6Db3x
 VgNQ==
X-Gm-Message-State: AOAM533aozkvJlVVfkmpEeAvs/qVc33DspMoSNHBJP3CzAa9gMYQpumZ
 9TDJaahOrRYKFAsY3i5i38mTPJOyMcAL303yGBsKkNjkQYm4baoV/GB47OR5D2MXNfwiFkt8CiU
 9B09BtN+FNU0BfTfqBqs2A/+8HhA0oMKJkZb+eHehNpgmncktu5q5shePKOrd5iZR
X-Received: by 2002:a1c:7d41:: with SMTP id y62mr14448718wmc.139.1612791493039; 
 Mon, 08 Feb 2021 05:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtxV+C9+SWVwL6VXEnWtsInoVEWIAsYlI5B4HmtwQuM1Med9IZ75/uYsQMXDoQ25gTqLpzoQ==
X-Received: by 2002:a1c:7d41:: with SMTP id y62mr14448698wmc.139.1612791492755; 
 Mon, 08 Feb 2021 05:38:12 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s64sm22086029wms.21.2021.02.08.05.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 05:38:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/18] tests/acceptance/boot_linux: rename misleading cloudinit
 method
Date: Mon,  8 Feb 2021 14:37:04 +0100
Message-Id: <20210208133711.2596075-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210208133711.2596075-1-philmd@redhat.com>
References: <20210208133711.2596075-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

There's no downloading happening on that method, so let's call it
"prepare" instead.  While at it, and because of it, the current
"prepare_boot" and "prepare_cloudinit" are also renamed.

The reasoning here is that "prepare_" methods will just work on the
images, while "set_up_" will make them effective to the VM that will
be launched.  Inspiration comes from the "virtiofs_submounts.py"
tests, which this expects to converge more into.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210203172357.1422425-3-crosa@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/acceptance/boot_linux.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 2ac3e575874..bcd923bb4a0 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -57,7 +57,7 @@ def download_boot(self):
             self.cancel('Failed to download/prepare boot image')
         return boot.path
 
-    def download_cloudinit(self, ssh_pubkey=None):
+    def prepare_cloudinit(self, ssh_pubkey=None):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
@@ -85,15 +85,15 @@ def setUp(self, ssh_pubkey=None):
         super(BootLinux, self).setUp()
         self.vm.add_args('-smp', '2')
         self.vm.add_args('-m', '1024')
-        self.prepare_boot()
-        self.prepare_cloudinit(ssh_pubkey)
+        self.set_up_boot()
+        self.set_up_cloudinit(ssh_pubkey)
 
-    def prepare_boot(self):
+    def set_up_boot(self):
         path = self.download_boot()
         self.vm.add_args('-drive', 'file=%s' % path)
 
-    def prepare_cloudinit(self, ssh_pubkey=None):
-        cloudinit_iso = self.download_cloudinit(ssh_pubkey)
+    def set_up_cloudinit(self, ssh_pubkey=None):
+        cloudinit_iso = self.prepare_cloudinit(ssh_pubkey)
         self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
     def launch_and_wait(self):
-- 
2.26.2


