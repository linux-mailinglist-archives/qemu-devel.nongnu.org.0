Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7695AD0AC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 12:54:30 +0200 (CEST)
Received: from localhost ([::1]:33998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV9kL-0003p4-JE
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 06:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oV96u-00066A-K6
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:13:44 -0400
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:52768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oV96s-0004KE-SF
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 06:13:44 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DA0B05D520;
 Mon,  5 Sep 2022 10:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662372819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r/cfW6vgytWrTxSi6+sDaeWt5A6r9iTW8kf35ywd6Pk=;
 b=PLJGszmYbH7DL474TTwFdHqdnhB76gzgCc7u5fnL1hGzQE4uUFUMeBcL3tsbhifDyfiehO
 N3OUSqKQ3BHLqsG9Y77q0IsoSKbUjRFyUEnsnZpxqKbMyYHM2lWz4uXF9WMDNX4VWJt8uY
 o0INAkWrMFKDNcfiPnzlaiZJQ0VS9DY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662372819;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=r/cfW6vgytWrTxSi6+sDaeWt5A6r9iTW8kf35ywd6Pk=;
 b=wTamrQpM9isauGjGSI3z2eWmK6v9/kuRoMbo0Ea/rv5iKmfpD7XiUYWopoJzQTCp8AMsbZ
 lZ6e80EMt3BpiYBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DE7713A66;
 Mon,  5 Sep 2022 10:13:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8PZDJNPLFWOlPwAAMHmgww
 (envelope-from <cfontana@suse.de>); Mon, 05 Sep 2022 10:13:39 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-devel@nongnu.org
Subject: [PATCH] accel: print an error message and exit if plugin not loaded
Date: Mon,  5 Sep 2022 12:13:32 +0200
Message-Id: <20220905101332.1986-1-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d;
 envelope-from=cfontana@suse.de; helo=smtp-out2.suse.de
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

If module_load_one, module_load_file fail for any reason
(permissions, plugin not installed, ...), we need to provide some notification
to the user to understand that this is happening; otherwise the errors
reported on initialization will make no sense to the user.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 accel/accel-softmmu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/accel/accel-softmmu.c b/accel/accel-softmmu.c
index 67276e4f52..807708ee86 100644
--- a/accel/accel-softmmu.c
+++ b/accel/accel-softmmu.c
@@ -66,15 +66,21 @@ void accel_init_ops_interfaces(AccelClass *ac)
 {
     const char *ac_name;
     char *ops_name;
+    ObjectClass *oc;
     AccelOpsClass *ops;
 
     ac_name = object_class_get_name(OBJECT_CLASS(ac));
     g_assert(ac_name != NULL);
 
     ops_name = g_strdup_printf("%s" ACCEL_OPS_SUFFIX, ac_name);
-    ops = ACCEL_OPS_CLASS(module_object_class_by_name(ops_name));
+    oc = module_object_class_by_name(ops_name);
+    if (!oc) {
+        error_report("fatal: could not find module object of type \"%s\", "
+                     "plugin might not be loaded correctly", ops_name);
+        exit(EXIT_FAILURE);
+    }
     g_free(ops_name);
-
+    ops = ACCEL_OPS_CLASS(oc);
     /*
      * all accelerators need to define ops, providing at least a mandatory
      * non-NULL create_vcpu_thread operation.
-- 
2.26.2


