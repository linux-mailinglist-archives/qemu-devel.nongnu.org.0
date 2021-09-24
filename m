Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF17417692
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:08:16 +0200 (CEST)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTls7-0004Iq-3a
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTlly-0004FZ-9n
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTllr-00007Q-DA
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:01:53 -0400
Received: by mail-wr1-x42a.google.com with SMTP id w29so27756265wra.8
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mn6o4esbTbv64dQSoCQREFmo4A23oW/v9xm7Hu6pEOM=;
 b=KfJJ0Hok4UbLnXS2AILTIqbshFPjcrmPYLZrtvPOefVnTYOiuV2M0g4NepetEB6JX+
 LW0mLCzcjlyyKI1GdKjNjetgcBJL19WB9OthbLHEeEoPtbdZs9lP98n6lNUixbka6Prr
 L/PzGlEKeI/O/3V0abTgxgOfAmjcSiN0+vXeuDuiXPxcorsGcjWI9u0T3af/xOhoYjmD
 xBRTwkNXsuLp5pnE9nONPGESlhMt0rsjEhqrguKsuoYzhOHLm8QE1G0PCC4qgmzphW75
 M9WmCgcch8WQG9Yz3kP2qmiYjayNMarxdKk7tIu5YgxYW/MEuuA1UNorBEsCKZvojyto
 vR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mn6o4esbTbv64dQSoCQREFmo4A23oW/v9xm7Hu6pEOM=;
 b=Xc+WQJy4wkPAjSH0hBB4e8+IHSOz2ZFhNBtODGJ5P3mMQ8izxY4shkdR8dNV1/SWi9
 w/YXUR8YSlcMwj/2EXh8TOTa89mJq2pSDnZv6BW9kYGZKWrFg4LPSCLfnMI8DH0sDtQL
 SR70QGdcmkAOoalWgFjfTDu43mhEAg6XOuvlpgn3AI0FgCtJBuH2398RviiBiXfsQ6no
 BgACtWiW2PXRuJkGz9g9mrhVonqZR0ATqNFmFWmgmLVB45wf/No7sqDFwz8EbtdC6p/t
 ESMMULxvyhu1jtpTcQc8M0OKmj4TsZm7UtQhvvC9JqhiK3NsLO+fZqC9pK/U/jKYXkxl
 voRg==
X-Gm-Message-State: AOAM532V5Q+40Rrf+8BBhi+oWPv3vdCdBSh5Cz+ff4LeWPUq6F06R+Wm
 3nx+xb9nfA5CSOGeBt31wmZzsNw9e7pptA==
X-Google-Smtp-Source: ABdhPJwXVWjOx9aRSPDxjcilWOb/VmHY2gKmM+FyKzWjtF+SITH3u9SGsOAKaFxzE3EJcMf/qgGFoA==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr11983134wry.25.1632492105739; 
 Fri, 24 Sep 2021 07:01:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y64sm9292673wmc.38.2021.09.24.07.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 07:01:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qapi: Move RTC_CHANGE back out of target schema
Date: Fri, 24 Sep 2021 15:01:41 +0100
Message-Id: <20210924140142.31398-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210924140142.31398-1-peter.maydell@linaro.org>
References: <20210924140142.31398-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Greg Kurz <groug@kaod.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit effectively reverts commit 183e4281a30962, which moved
the RTC_CHANGE event to the target schema.  That change was an
attempt to make the event target-specific to improve introspection,
but the event isn't really target-specific: it's machine or device
specific.  Putting RTC_CHANGE in the target schema with an ifdef list
reduces maintainability (by adding an if: list with a long list of
targets that needs to be manually updated as architectures are added
or removed or as new devices gain the RTC_CHANGE functionality) and
increases compile time (by preventing RTC devices which emit the
event from being "compile once" rather than "compile once per
target", because qapi-events-misc-target.h uses TARGET_* ifdefs,
which are poisoned in "compile once" files.)

Move RTC_CHANGE back to misc.json.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 22 ++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 4 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/qapi/misc-target.json b/qapi/misc-target.json
index 3b05ad3dbfb..f442421e838 100644
--- a/qapi/misc-target.json
+++ b/qapi/misc-target.json
@@ -2,39 +2,6 @@
 # vim: filetype=python
 #
 
-##
-# @RTC_CHANGE:
-#
-# Emitted when the guest changes the RTC time.
-#
-# @offset: offset between base RTC clock (as specified by -rtc base), and
-#          new RTC clock value
-#
-# Note: This event is rate-limited.
-#
-# Since: 0.13
-#
-# Example:
-#
-# <-   { "event": "RTC_CHANGE",
-#        "data": { "offset": 78 },
-#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
-#
-##
-{ 'event': 'RTC_CHANGE',
-  'data': { 'offset': 'int' },
-  'if': { 'any': [ 'TARGET_ALPHA',
-                   'TARGET_ARM',
-                   'TARGET_HPPA',
-                   'TARGET_I386',
-                   'TARGET_MIPS',
-                   'TARGET_MIPS64',
-                   'TARGET_PPC',
-                   'TARGET_PPC64',
-                   'TARGET_S390X',
-                   'TARGET_SH4',
-                   'TARGET_SPARC' ] } }
-
 ##
 # @rtc-reset-reinjection:
 #
diff --git a/qapi/misc.json b/qapi/misc.json
index 5c2ca3b5566..ce7edd3f7bf 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -523,3 +523,25 @@
  'data': { '*option': 'str' },
  'returns': ['CommandLineOptionInfo'],
  'allow-preconfig': true }
+
+##
+# @RTC_CHANGE:
+#
+# Emitted when the guest changes the RTC time.
+#
+# @offset: offset between base RTC clock (as specified by -rtc base), and
+#          new RTC clock value
+#
+# Note: This event is rate-limited.
+#
+# Since: 0.13
+#
+# Example:
+#
+# <-   { "event": "RTC_CHANGE",
+#        "data": { "offset": 78 },
+#        "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
+#
+##
+{ 'event': 'RTC_CHANGE',
+  'data': { 'offset': 'int' } }
diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
index fba4dfca358..7a185d45400 100644
--- a/hw/ppc/spapr_rtc.c
+++ b/hw/ppc/spapr_rtc.c
@@ -32,7 +32,7 @@
 #include "hw/ppc/spapr.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 4fbafddb226..5ecf96142a1 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -40,7 +40,7 @@
 #include "hw/rtc/mc146818rtc_regs.h"
 #include "migration/vmstate.h"
 #include "qapi/error.h"
-#include "qapi/qapi-events-misc-target.h"
+#include "qapi/qapi-events-misc.h"
 #include "qapi/visitor.h"
 #include "hw/rtc/mc146818rtc_regs.h"
 
-- 
2.20.1


