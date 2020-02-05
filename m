Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC09153A5B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 22:38:30 +0100 (CET)
Received: from localhost ([::1]:57268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izSNR-00050Z-2z
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 16:38:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47498)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robert.foley@linaro.org>) id 1izSJE-0005nr-KI
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:34:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <robert.foley@linaro.org>) id 1izSJD-0006bn-G8
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:34:08 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:36878)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <robert.foley@linaro.org>)
 id 1izSJD-0006Zn-9w
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 16:34:07 -0500
Received: by mail-pf1-x42d.google.com with SMTP id p14so1883704pfn.4
 for <qemu-devel@nongnu.org>; Wed, 05 Feb 2020 13:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=97x70tsGL4/Lrbv+jMvABeOjt9tNQeXwhmwDJh1ToSI=;
 b=TGgdMdSVRErU0JTnEs8tp/DTpBM2tVd59eEt7YOXUZSGolj+VaAX8RYdszz9rfd8d6
 YYebLmQWwG4HEebbdYknLOlBsZ6MR/4GmhZv3pWbZJYlvPudOkNyWuzMyZNBtpGBbjfV
 S9bvp1OHI8bJEpmldDyzdA9Q627xNsVMaJdP8LkIz2+yudepFsJ9rYr95fp8LtyTmGCO
 Jyi+msyqUwU2vmNaVfIx+OhHm65DE6c5i+Ck1newOTVtcWEc7gCEFtUvaQSt36riV0Ye
 mz0LDWHGzIn6olGNJ6Bkr6fzUGq1qxuyS0xvBEJOB1yPecFEox7g9W9YxdLfwgmZgeUt
 JKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=97x70tsGL4/Lrbv+jMvABeOjt9tNQeXwhmwDJh1ToSI=;
 b=Dh7yasIbrhmqkdCyL0ENsrjJIUSx49ZhD279bfMY05/8EHfMaByuksaXOwh/NDN0vL
 P7Iw0azNwQ+C9PV4+zRwFQPbUkooKusWfOm72GBQTwWmRCL4aC2FBuO+LHpOCrv0GTWJ
 wVwb9L46l4K5Jw0Ur6CXk7tvq8vjWgMBR88OEKgY76vZ/nwKGEoW4ahNrbBWCz+66JZi
 gHuM7pCrwKpzvTVBwpAdTHoi32Qx9+SXCxb+xEzwpJfm63sHSV6QuKEOOfXFXejkrs+d
 /sA8wDTQB3DH7gM9nNQ2KffH1AUFY9+eLznDg2R2LpmDt+tIa4+VDxHgmIANfGfBxJsp
 3X8w==
X-Gm-Message-State: APjAAAUu10ts1NCZ+JPJcMh20BlrRWwsDPmUkjj+Cv98olvPRy53ve27
 Xf2shi921IgiejTiH+EWOD5fAy/Es5g=
X-Google-Smtp-Source: APXvYqwueasSDkdHtJlEZwg7UkNgypODmlcxi7Daz/GtXw40/0q13UMtQto41R+ujbRFDePoe4MG2w==
X-Received: by 2002:a62:ac03:: with SMTP id v3mr38338256pfe.17.1580938446017; 
 Wed, 05 Feb 2020 13:34:06 -0800 (PST)
Received: from Rfoley-MA01.usrd.futurewei.com ([12.111.81.71])
 by smtp.gmail.com with ESMTPSA id p4sm724576pgh.14.2020.02.05.13.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 13:34:05 -0800 (PST)
From: Robert Foley <robert.foley@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/14] tests/vm: allow wait_ssh() to specify command
Date: Wed,  5 Feb 2020 16:29:17 -0500
Message-Id: <20200205212920.467-12-robert.foley@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200205212920.467-1-robert.foley@linaro.org>
References: <20200205212920.467-1-robert.foley@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::42d
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
Cc: fam@euphon.net, philmd@redhat.com, alex.bennee@linaro.org,
 robert.foley@linaro.org, peter.puhov@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows for waiting for completion of arbitrary commands.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
---
 tests/vm/basevm.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 97d55f8030..ebedbce4ae 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -433,24 +433,24 @@ class BaseVM(object):
     def print_step(self, text):
         sys.stderr.write("### %s ...\n" % text)
 
-    def wait_ssh(self, wait_root=False, seconds=300):
+    def wait_ssh(self, wait_root=False, seconds=300, cmd="exit 0"):
         # Allow more time for VM to boot under TCG.
         if not kvm_available(self.arch):
             seconds *= self.tcg_ssh_timeout_multiplier
         starttime = datetime.datetime.now()
         endtime = starttime + datetime.timedelta(seconds=seconds)
-        guest_up = False
+        cmd_success = False
         while datetime.datetime.now() < endtime:
-            if wait_root and self.ssh_root("exit 0") == 0:
-                guest_up = True
+            if wait_root and self.ssh_root(cmd) == 0:
+                cmd_success = True
                 break
-            elif self.ssh("exit 0") == 0:
-                guest_up = True
+            elif self.ssh(cmd) == 0:
+                cmd_success = True
                 break
             seconds = (endtime - datetime.datetime.now()).total_seconds()
             logging.debug("%ds before timeout", seconds)
             time.sleep(1)
-        if not guest_up:
+        if not cmd_success:
             raise Exception("Timeout while waiting for guest ssh")
 
     def shutdown(self):
-- 
2.17.1


