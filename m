Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BEA4A9C0D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:34:47 +0100 (CET)
Received: from localhost ([::1]:43084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0bj-0006mU-E2
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:34:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0XE-0003vE-Lp
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:08 -0500
Received: from [2607:f8b0:4864:20::430] (port=38636
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0X8-0004Dp-3T
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:30:01 -0500
Received: by mail-pf1-x430.google.com with SMTP id e28so5400067pfj.5
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c9ntEH4Bl9l8+RDYaNgJ6bnn3J0oNz9TjchIJzcfklw=;
 b=CcQ12CnIkc+JvkzdfVZpkxla8UL2LL9iC4mLbCcunaq6Ti/+pCaptamaBal6y72vCO
 0BLwmfXXiRcnFE2xLjJ057LgF4ekYRHQwFXjyCJBUAyXH5Ewtf+Hf73QRzFn3XsoEchF
 pOkRxB0ege3No2LXsnzc2dK5B1Zm7D1EmRzZiNqLsD2AgB34WlOUrkchygz9AtN3+LJ3
 eRJbHOE3PyhvT3XDbJw2r4KNq1KaamIZxSggT+xlIrEAl527Rj4eTh31R0LdryxTy7Df
 BqiXDeRFLuMe66CBt+Kiy0m1SlDFVwlaYdWPmr33C5sby+DaNHY/kTTNEsVb+LDjwoFz
 r3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=c9ntEH4Bl9l8+RDYaNgJ6bnn3J0oNz9TjchIJzcfklw=;
 b=H2EL0A1aF8Eg8Ffth66/kyHJb8494Pw8Hol7I1YZ6AKjocC9ib1QhvBwGMaJmKZgam
 tLwON/7QRO4bUvsK0D+VHjUBKyXGAND8ooK8Wuc7h10x2ZDpYcLrUwchG/CzIyjTOsgN
 891GzQYqUtaY7dwqunsYqpO+wwKw6hp7VjfG4ErbiGkUrwm5h+JqR8N7McWicON0eM+C
 HxbatVlUCnbJ7/1VKe7xfpOtpJLV1do4iSeB13pL3itApVmFTDIZBVDx6QpN62WzfY2N
 GUkKHBFRh/Q76lxS2fO02m3vFTZGouS0KEw1p3dKZs4eaSqNLHmpbyFduMz6HZFuPS5P
 pCUA==
X-Gm-Message-State: AOAM530lZ+NHCW2oHmOm10DiFQLBqMebFUZeCb3SzW5cbKpYf3ipQWUs
 Y3EirE27cTrVTne0dZsR+SHHsT2NIq4=
X-Google-Smtp-Source: ABdhPJxzYCVXb3KV3+FyFniQoMz53AZqVRru+jjPX9KdiZywY3ro6pQDjVCdIy+5z07b3jLTptzQiA==
X-Received: by 2002:a05:6a00:b54:: with SMTP id
 p20mr3608208pfo.49.1643988596667; 
 Fri, 04 Feb 2022 07:29:56 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y20sm3042144pfi.78.2022.02.04.07.29.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Feb 2022 07:29:56 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 3/4] qom: Remove user-creatable objects from user emulation
Date: Fri,  4 Feb 2022 16:29:23 +0100
Message-Id: <20220204152924.6253-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204152924.6253-1-f4bug@amsat.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

user-mode don't use user-creatable objects. Restrict it to
sysemu / tools.

Add a stub to avoid a link failure with the global callback:

  /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_initialize_child_with_propsv':
  ../qom/object.c:578: undefined reference to `user_creatable_complete'
  /usr/bin/ld: libqom.fa(qom_object.c.o): in function `object_new_with_propv':
  ../qom/object.c:801: undefined reference to `user_creatable_complete'
  collect2: error: ld returned 1 exit status

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qom/meson.build           | 7 ++++++-
 qom/user_creatable-stub.c | 8 ++++++++
 tests/unit/meson.build    | 2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 qom/user_creatable-stub.c

diff --git a/qom/meson.build b/qom/meson.build
index 062a3789d8..afc60cc19d 100644
--- a/qom/meson.build
+++ b/qom/meson.build
@@ -2,9 +2,14 @@ qom_ss.add(genh)
 qom_ss.add(files(
   'container.c',
   'object.c',
-  'object_interfaces.c',
   'qom-qobject.c',
 ))
 
+if have_system or have_tools
+  qom_ss.add(files('object_interfaces.c'))
+else
+  qom_ss.add(files('user_creatable-stub.c'))
+endif
+
 qmp_ss.add(files('qom-qmp-cmds.c'))
 softmmu_ss.add(files('qom-hmp-cmds.c'))
diff --git a/qom/user_creatable-stub.c b/qom/user_creatable-stub.c
new file mode 100644
index 0000000000..cc3638e20d
--- /dev/null
+++ b/qom/user_creatable-stub.c
@@ -0,0 +1,8 @@
+#include "qemu/osdep.h"
+
+#include "qom/object_interfaces.h"
+
+bool user_creatable_complete(UserCreatable *uc, Error **errp)
+{
+    g_assert_not_reached();
+}
diff --git a/tests/unit/meson.build b/tests/unit/meson.build
index 64a5e7bfde..2cdcd136c9 100644
--- a/tests/unit/meson.build
+++ b/tests/unit/meson.build
@@ -39,7 +39,6 @@ tests = {
   'test-bitcnt': [],
   'test-qgraph': ['../qtest/libqos/qgraph.c'],
   'check-qom-interface': [qom],
-  'check-qom-proplist': [qom],
   'test-qemu-opts': [],
   'test-keyval': [testqapi],
   'test-logging': [],
@@ -51,6 +50,7 @@ tests = {
 
 if have_system or have_tools
   tests += {
+    'check-qom-proplist': [qom],
     'test-qmp-event': [testqapi],
   }
 endif
-- 
2.34.1


