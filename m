Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D92AF5B25F5
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 20:37:15 +0200 (CEST)
Received: from localhost ([::1]:50214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWMOo-0003LV-Vq
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 14:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWMI6-0006ZU-Bz
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 14:30:18 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:46772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oWMI4-0003UQ-Ku
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 14:30:18 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 35C501F8EC;
 Thu,  8 Sep 2022 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662661815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GnPO9oPplYtfCXf/s+TDMotIuBgv8MnpOwbdzvmLeQ=;
 b=pnuGcamW0+ytRNzwaHJuYJTGA9gWnFbkOETgb+aGWQC5EmAgbS//DLu2fDPigXeOTEth0w
 /NbvUZ3sAqIOMv/kimI0STloQIMopmD8RlyOBmyMB1O29DQ+D3oDbc/omB0kyY8Pu0e9Ku
 BVjImYTgROQ22kP8FAh44/eUTBTPidg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662661815;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GnPO9oPplYtfCXf/s+TDMotIuBgv8MnpOwbdzvmLeQ=;
 b=msQzr6h8B/UBud3xAAoz5ieIlv6DKAoji9S87JVKNoQziPVjBH4hmx7So6HjyJF08Eq6+u
 UCJk+DzmSPLNIJAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E30DE13A72;
 Thu,  8 Sep 2022 18:30:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GZFNrY0GmM4NwAAMHmgww
 (envelope-from <cfontana@suse.de>); Thu, 08 Sep 2022 18:30:14 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH v4 3/3] accel: abort if we fail to load the accelerator plugin
Date: Thu,  8 Sep 2022 20:30:12 +0200
Message-Id: <20220908183012.17667-4-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220908183012.17667-1-cfontana@suse.de>
References: <20220908183012.17667-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if QEMU is configured with modules enabled, it is possible that the
load of an accelerator module will fail.
Abort in this case, relying on module_object_class_by_name to report
the specific load error if any.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


