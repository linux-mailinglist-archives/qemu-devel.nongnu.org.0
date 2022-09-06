Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C515AE93E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 15:18:00 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVYSd-0007d5-RT
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 09:17:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXAf-0005mS-Ur
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:55:14 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:47108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1oVXAa-0006bo-MY
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 07:55:10 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD6C333858;
 Tue,  6 Sep 2022 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662465304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0z7cG8mEp3J7jlzA5MPc2dVAb1rlpv7/bhZb7xlXpk=;
 b=UWwn6mqzIe+QwuvmVS+0aOwQcpWtT862cgo1Fj20OvM4WjYBpvf54fa5+BfUCHNwqvmJev
 2r7OP8/UCil9EODZ2T/lP5fOaeDqhr6noBLRJyNawpCRuWf4ztF3otU25vZnIRelVkUJA1
 bPVl0ORmGdlOTbKCtKJu5b59/GPuMZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662465304;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L0z7cG8mEp3J7jlzA5MPc2dVAb1rlpv7/bhZb7xlXpk=;
 b=aGe1MIvPydBmgXNFT3/uVHmE3v3JpL0qaAQgEOmejLTdxi5lgR6rs1gD4mAb3VRYyBekVp
 U71n5uFotwgxRyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9748213A19;
 Tue,  6 Sep 2022 11:55:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KDyMIxg1F2NYMwAAMHmgww
 (envelope-from <cfontana@suse.de>); Tue, 06 Sep 2022 11:55:04 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, dinechin@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 3/3] accel: abort if we fail to load the accelerator plugin
Date: Tue,  6 Sep 2022 13:55:01 +0200
Message-Id: <20220906115501.28581-4-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220906115501.28581-1-cfontana@suse.de>
References: <20220906115501.28581-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
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


