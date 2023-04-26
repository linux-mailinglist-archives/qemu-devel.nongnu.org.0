Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCD6EF9C8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 20:03:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prjRW-000799-Jp; Wed, 26 Apr 2023 14:00:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRT-00075r-74; Wed, 26 Apr 2023 14:00:35 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1prjRR-0006c7-Jm; Wed, 26 Apr 2023 14:00:34 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3633F21A18;
 Wed, 26 Apr 2023 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682532032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZsgszOmKN+TOr00V41iXdRp0Po3EfpgeNDnCG8eRXM=;
 b=imifkWhatvl4MMytNx+Cr7HPF/Vs2Ji2gDJEW+ZbuSrTlrXSbD5qT1e1VD0Pdr9TZi3S7f
 ABrKfort51NmC3oIXDrwPlZWPSV5a36+QBW7vA8rORlwEA/Wm5lMslC7ltDBcIpe/5tB70
 TMFfGdOgu7dw8zz+NP3hFJGU6od2CE4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682532032;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QZsgszOmKN+TOr00V41iXdRp0Po3EfpgeNDnCG8eRXM=;
 b=3yLnN6Tjsh9B3HvOURmgxjL6AMMLsEz3Ct9Sga5gJMsmGkWcFr61RA/4G607arDTIeQVrD
 rorH3YH5yH5xuiCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F30D138F0;
 Wed, 26 Apr 2023 18:00:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uGA2Br1mSWSoVQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 26 Apr 2023 18:00:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features to
 qtests
Date: Wed, 26 Apr 2023 15:00:04 -0300
Message-Id: <20230426180013.14814-5-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230426180013.14814-1-farosas@suse.de>
References: <20230426180013.14814-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We're about to move the TCG-only -cpu max configuration code under
CONFIG_TCG. To be able to do that we need to make sure the qtests
still have some cpu configured even when no other accelerator is
available.

Delineate now what is used with TCG-only and what is also used with
qtests to make the subsequent patches cleaner.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index e9161522b8..6a6a2ece2b 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -25,6 +25,8 @@
 #include "qemu/module.h"
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
+#include "sysemu/qtest.h"
+#include "sysemu/tcg.h"
 #include "kvm_arm.h"
 #include "hvf_arm.h"
 #include "qapi/visitor.h"
@@ -1365,10 +1367,14 @@ static void aarch64_max_initfn(Object *obj)
         return;
     }
 
+    if (tcg_enabled() || qtest_enabled()) {
+        aarch64_a57_initfn(obj);
+    }
+
     /* '-cpu max' for TCG: we currently do this as "A57 with extra things" */
-
-    aarch64_a57_initfn(obj);
-    aarch64_max_tcg_initfn(obj);
+    if (tcg_enabled()) {
+        aarch64_max_tcg_initfn(obj);
+    }
 }
 
 static const ARMCPUInfo aarch64_cpus[] = {
-- 
2.35.3


