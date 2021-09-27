Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C36419B06
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:13:32 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuC3-0001Ru-Bt
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1l-0002E8-CQ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu1j-0002sf-PS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cA6omHLKJTr0G5Ch5LiMvS/MMlK5eI4IqUB/lSzT8zs=;
 b=JlRsfDtWDM6ZiiGEb0DC7YwXCxG5kK2NmwGnjfSL+zHK8LAgpbaTF/u0egjyezliGOM/s6
 f/2MvKwVrKY+bFldnIPp9Q5j2fFDB4UrucWobb1RvpL7IYtyURaqESEH/fu2c3q3cnjjKo
 IlZQRIdeF2ohRK46n0amm83WCMFXXaY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-D7pGIe9-M063C4b6WwBSqg-1; Mon, 27 Sep 2021 13:02:49 -0400
X-MC-Unique: D7pGIe9-M063C4b6WwBSqg-1
Received: by mail-wm1-f71.google.com with SMTP id
 p25-20020a1c5459000000b0030cac3d9db1so503757wmi.6
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cA6omHLKJTr0G5Ch5LiMvS/MMlK5eI4IqUB/lSzT8zs=;
 b=Njz16jrkdWAlBSeH5T9eYjcAzjRmcJUDhV2m5wsV6mILrNcgOdMB3JlNqvUsma1oiK
 0SIaeIRN9tVc+suZ6YqmpKu2/V22R67aPwLfwOzP67EF+3W0Q39OfSSmgWziPuVrRMfN
 wwJ7Ngw1Y6nKBZmu0Buv7hkaJtR4HzCtat3twcy7WTKnsSSrSq5z78kSPZV7QL+VNBoO
 G+t0iRWV1Ygr1TrJxcwoMrUe7mcQS8DDflMAJ1YP9LvGxh30MTHSOJht2wYhATMYjW77
 GyEw8X/hJMVnmTpBqPSlS74PemT3l9j691tUIuelZJ5V3dEArKyaNKFoKlfRmCE4c0cq
 mDtw==
X-Gm-Message-State: AOAM530Tw2PBGM4hxbd9V6lbaYbFbII37AnUvo7fYE0Xw75kIJ+7brwv
 6tc27e/ifY8mF+IHL9diXUkxOMpxNOPoJBiAaFVXrXKewLdI9MmlIRXGK1qEj0aEn0CDbPmg4YL
 3KOa8Mhzkc3c00q1Pm7ZJPJiv3dJgrQLXYn9sS4ghOh+bIoelO9MjuLJKxr5NeZcI
X-Received: by 2002:a5d:648b:: with SMTP id o11mr1033798wri.315.1632762167199; 
 Mon, 27 Sep 2021 10:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3f47lrrl4dYetRoKOPnwDf2mvRl0hTXZID0GO433ZNxXJdQR3ftylYcd769CgK32t6CQeFQ==
X-Received: by 2002:a5d:648b:: with SMTP id o11mr1033763wri.315.1632762166930; 
 Mon, 27 Sep 2021 10:02:46 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y197sm100012wmc.18.2021.09.27.10.02.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:02:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/21] tests/acceptance: add replay kernel test for alpha
Date: Mon, 27 Sep 2021 19:02:10 +0200
Message-Id: <20210927170227.2014482-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch adds record/replay test which boots Linux
kernel on alpha platform. The test uses kernel binaries
taken from boot_linux_console test.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <162737553482.1735673.10021851966976933952.stgit@pasha-ThinkPad-X280>
---
 tests/acceptance/replay_kernel.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 93251819927..c68a9537301 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -222,6 +222,23 @@ def test_s390x_s390_ccw_virtio(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=9)
 
+    def test_alpha_clipper(self):
+        """
+        :avocado: tags=arch:alpha
+        :avocado: tags=machine:clipper
+        """
+        kernel_url = ('http://archive.debian.org/debian/dists/lenny/main/'
+                      'installer-alpha/20090123lenny10/images/cdrom/vmlinuz')
+        kernel_hash = '3a943149335529e2ed3e74d0d787b85fb5671ba3'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+
+        uncompressed_kernel = archive.uncompress(kernel_path, self.workdir)
+
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.run_rr(uncompressed_kernel, kernel_command_line, console_pattern, shift=9,
+            args=('-nodefaults', ))
+
     def test_ppc64_pseries(self):
         """
         :avocado: tags=arch:ppc64
-- 
2.31.1


