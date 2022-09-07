Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD25B0222
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 12:54:11 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVsh8-0006E1-AK
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 06:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVsY3-0007aO-H8
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 06:44:48 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:36698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVsY1-0008KS-81
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 06:44:47 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F089633CC1;
 Wed,  7 Sep 2022 10:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662547483; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0z7cG8mEp3J7jlzA5MPc2dVAb1rlpv7/bhZb7xlXpk=;
 b=R48m1oRNIkCqbvPbezuhGGoVUM1zwXFvN2+Edc+Z2WBZB4Uj5APUqrvX8sgt0UrwcU35Kv
 QYYw0nShkRbJkFqZ3ICYqL/pIBRatvNSeVOqSN3ARWCbXOn8b+1z4F9lqLevb2RsSquK0P
 UOxgcT0C233BNup7qaqurWSUjKkcXqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662547483;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0z7cG8mEp3J7jlzA5MPc2dVAb1rlpv7/bhZb7xlXpk=;
 b=SkfC1dklLnZJ5FiaAVmRhSVNjug9Bqi5x3QrpnI+Ke+uIx+Ne5q1j6ncWF9iat1+m00nhj
 RxwsddEFL7qRm2BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFB3213AE9;
 Wed,  7 Sep 2022 10:44:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MMayKRt2GGNBUAAAMHmgww
 (envelope-from <cfontana@suse.de>); Wed, 07 Sep 2022 10:44:43 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v2 3/3] accel: abort if we fail to load the accelerator plugin
Date: Wed,  7 Sep 2022 12:44:40 +0200
Message-Id: <20220907104440.22429-4-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220907104440.22429-1-cfontana@suse.de>
References: <20220907104440.22429-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c;
 envelope-from=cfontana@suse.de; helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

if QEMU is configured with modules enabled, it is possible that the
load of an accelerator module will fail.
Abort in this case, relying on module_object_class_by_name to report
the specific load error if any.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/accel-softmmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f52..9fa4849f2c 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -66,6 +66,7 @@ void accel_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
+    ObjectClass *oc;
     AccelOpsClass *ops;
 
     ac_name = object_class_get_name(OBJECT_CLASS(ac));
@@ -73,8 +74,13 @@ void accel_init_ops_interfaces(AccelClass *ac)
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
     ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
+    oc = module_object_class_by_name(ops_name);
+    if (!oc) {
+        error_report("fatal: could not load module for type '%s'", ops_name);
+        abort();
+    }
     g_free(ops_name);
-
+    ops = ACCEL_OPS_CLASS(oc);
     /*
      * all accelerators need to define ops, providing at least a mandatory
      * non-NULL create_vcpu_thread operation.
-- 
2.26.2


