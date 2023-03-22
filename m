Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05E6C4ACC
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 13:37:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pexi7-0006YJ-I2; Wed, 22 Mar 2023 08:36:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexi2-0006QI-6n
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:36:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pexhz-0002JI-8w
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 08:36:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679488610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eYTpi3Ih1WBlNnYCo66bQsOAObFVdyF32uf64jxuYN0=;
 b=JmuTKN2l2lUjMenhj3XF30jAtSNaySejdMuv6z1AmP9J3je/hrmBsoRRH7W2eAec4NAqcQ
 zj9ebiFnJc/1t3WLiPKydySjdVvq73QiBwarV00k5EfYJkrsPHWOFPZdavthNVAcqEjNPk
 nOGUJsWZi+vN4Bg9O7KkpfO9wmaiEi0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-ySye2q5cOEiZFTWQCKgbzw-1; Wed, 22 Mar 2023 08:36:47 -0400
X-MC-Unique: ySye2q5cOEiZFTWQCKgbzw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBA29884621;
 Wed, 22 Mar 2023 12:36:46 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3219D40B934;
 Wed, 22 Mar 2023 12:36:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/2] tests/vm: custom openbsd partitioning to increase /home
 space
Date: Wed, 22 Mar 2023 12:36:39 +0000
Message-Id: <20230322123639.836104-3-berrange@redhat.com>
In-Reply-To: <20230322123639.836104-1-berrange@redhat.com>
References: <20230322123639.836104-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

The openbsd image is 20GB in size, but the automatic partitioning
done by the installer leaves /home with a mere ~3.5 GB of space,
wasting free space across many other partitions that are not
used by our build process:

openbsd$ df
Filesystem  512-blocks      Used     Avail Capacity  Mounted on
/dev/sd0a      1229692    213592    954616    18%    /
/dev/sd0k      7672220        40   7288572     0%    /home
/dev/sd0d      1736604        24   1649752     0%    /tmp
/dev/sd0f      4847676   2505124   2100172    54%    /usr
/dev/sd0g      1326684    555656    704696    44%    /usr/X11R6
/dev/sd0h      4845436   1445932   3157236    31%    /usr/local
/dev/sd0j     10898972         4  10354020     0%    /usr/obj
/dev/sd0i      3343644         4   3176460     0%    /usr/src
/dev/sd0e      2601212     19840   2451312     1%    /var

This change tells the installer todo custom partitioning with
4 GB on /, 256 MB swap, and the remaining ~15GB for /home

openbsd$ df
Filesystem  512-blocks      Used     Avail Capacity  Mounted on
/dev/sd0a      7932412   4740204   2795588    63%    /
/dev/sd0d     32164636        40  30556368     0%    /home

This will avoid ENOSPC failures when tests that need to create
big files (disk images) run in parallel.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/vm/openbsd | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 6af7afac0d..6b4fc29793 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -123,7 +123,32 @@ class OpenBSDVM(basevm.BaseVM):
         self.console_wait_send("timezone",                "UTC\n")
         self.console_wait_send("root disk",               "\n")
         self.console_wait_send("(W)hole disk",            "\n")
-        self.console_wait_send("(A)uto layout",           "\n")
+        self.console_wait_send("(A)uto layout",           "c\n")
+
+        # 4000 MB / as /dev/sd0a, at start of disk
+        self.console_wait_send("sd0>", "a a\n")
+        self.console_wait_send("offset:", "\n")
+        self.console_wait_send("size:", "4000M\n")
+        self.console_wait_send("FS type", "4.2BSD\n")
+        self.console_wait_send("mount point:", "/\n")
+
+        # 256 MB swap as /dev/sd0b
+        self.console_wait_send("sd0*>", "a b\n")
+        self.console_wait_send("offset:", "\n")
+        self.console_wait_send("size:", "256M\n")
+        self.console_wait_send("FS type", "swap\n")
+
+        # All remaining space for /home as /dev/sd0d
+        # NB, 'c' isn't allowed to be used.
+        self.console_wait_send("sd0*>", "a d\n")
+        self.console_wait_send("offset:", "\n")
+        self.console_wait_send("size:", "\n")
+        self.console_wait_send("FS type", "4.2BSD\n")
+        self.console_wait_send("mount point:", "/home\n")
+
+        self.console_wait_send("sd0*>", "q\n")
+        self.console_wait_send("Write new label?:", "y\n")
+
         self.console_wait_send("Location of sets",        "cd0\n")
         self.console_wait_send("Pathname to the sets",    "\n")
         self.console_wait_send("Set name(s)",             "\n")
-- 
2.39.2


