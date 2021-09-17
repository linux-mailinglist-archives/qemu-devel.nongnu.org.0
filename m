Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28F40FDF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:34:28 +0200 (CEST)
Received: from localhost ([::1]:46832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGol-0001py-NK
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeS-0003Xk-M1
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:33617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeQ-0005Xo-7V
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:48 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so7881148wme.0
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6650I+sSBOEI7t+EMaHgrH7WtFrcTMt2scZY/FxCdUo=;
 b=DBFcLQWEEe/rbjcBv9MGtHw7F6smFCW+8N1DpFY8NFhHLiv10JLZ3bjg7/RxuaCMW4
 9g6j+G+FQkju3M/QjE1vKwbJftLaRob1eZMfxjhDS2UkNFswAl3LS25H9wjfYQ0xQe8Y
 E6cFK49on4CBo+cMIzRJYU7YtRJFr2XC9E09u37xmnZ8KZPOsfZccgjeDluNYc4o2ByV
 n8ZC8uxfT6ndI/G3KxCS1XtTi+SxVut5YXZ0WgUqTWi6a4Tz8O0qGt3zBbaS1v3rRsH/
 6Bx0ammYrgVTpmSgrHYjtA5hCVHPVyISKKoRcEnnnUyJRU/3QQ1N7SRxCd5pA2nUXMk2
 t/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6650I+sSBOEI7t+EMaHgrH7WtFrcTMt2scZY/FxCdUo=;
 b=q62e6iHELbDJ4ssSyhBCrImgom7qQOZiBRmtD/hndi17wLQ4T3TQPk2gGu3/ljb3oI
 giF1C1DE0o9TGZsTirYnwOHDAD1ZoeGs/qM74SvCnFqkgkPli63J1b40ofpAEIQM4/gZ
 vTyP55OtrOmCgKF3p0cdn/1bO7Vlybhx15m0qt6j/rg7g6PFIwe/pHqjeYwoY8qabLUW
 zTXxZBdifVte6fUQB8CdDM544iZPjwohRbE6GHhBn+A+JSHM6pzNCwBZkvU9IfP02taG
 5V8gbfA/FujFzEFh6ur9nh8OAwes6kBGdM907EGICQt4pFK+OiA0Vupem9vrbu3EV+Ow
 s9dg==
X-Gm-Message-State: AOAM533Ic4Tg+C4snEAho2R1y8sjA+HSP2iwjgbTlzydahas0E+kUHXa
 GAnvc2+jCzm08mR+HvrhohQleg==
X-Google-Smtp-Source: ABdhPJx8oTlQ+P5jYyKcMEtHRBeT9ph6DY29S4FLn0UnQk4wFrwKx67w3oA0RIKclFxafud2mo9gBg==
X-Received: by 2002:a1c:ed0a:: with SMTP id l10mr11535695wmh.140.1631895824891; 
 Fri, 17 Sep 2021 09:23:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s24sm6522268wmh.34.2021.09.17.09.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BA0C91FF9D;
 Fri, 17 Sep 2021 17:23:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/11] python: Update for pylint 2.10
Date: Fri, 17 Sep 2021 17:23:27 +0100
Message-Id: <20210917162332.3511179-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 John Snow <jsnow@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

A few new annoyances. Of note is the new warning for an unspecified
encoding when opening a text file, which actually does indicate a
potentially real problem; see
https://www.python.org/dev/peps/pep-0597/#motivation

Use LC_CTYPE to determine an encoding to use for interpreting QEMU's
terminal output. Note that Python states: "language code and encoding
may be None if their values cannot be determined" -- use a platform
default as a backup.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210916040955.628560-2-jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 python/qemu/machine/machine.py | 9 ++++++++-
 python/setup.cfg               | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a7081b1845..51b6e79a13 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -19,6 +19,7 @@
 
 import errno
 from itertools import chain
+import locale
 import logging
 import os
 import shutil
@@ -290,8 +291,14 @@ def get_pid(self) -> Optional[int]:
         return self._subp.pid
 
     def _load_io_log(self) -> None:
+        # Assume that the output encoding of QEMU's terminal output
+        # is defined by our locale. If indeterminate, use a platform default.
+        _, encoding = locale.getlocale()
+        if encoding is None:
+            encoding = locale.getpreferredencoding(do_setlocale=False)
         if self._qemu_log_path is not None:
-            with open(self._qemu_log_path, "r") as iolog:
+            with open(self._qemu_log_path, "r",
+                      encoding=encoding) as iolog:
                 self._iolog = iolog.read()
 
     @property
diff --git a/python/setup.cfg b/python/setup.cfg
index 83909c1c97..0f0cab098f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -104,6 +104,7 @@ good-names=i,
 [pylint.similarities]
 # Ignore imports when computing similarities.
 ignore-imports=yes
+ignore-signatures=yes
 
 # Minimum lines number of a similarity.
 # TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
-- 
2.30.2


