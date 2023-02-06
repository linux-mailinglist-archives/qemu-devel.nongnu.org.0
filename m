Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF268BFAB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:12:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cc-00061c-9Q; Mon, 06 Feb 2023 09:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2CZ-00060m-3m
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:10:35 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pP2CW-0002Zp-3B
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:10:34 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D561533D27;
 Mon,  6 Feb 2023 14:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRt17INxw+r/097qGsN3dpcq/vEASg9fuWlP5GWMX1g=;
 b=lpA+IOzCKrFDbrWW+Ug4f/kcLUFqVom/CDn1ZCP4/5+P/icPr9lztmr5EUEwmkzi0dPJpC
 GD4Gz1BWDMYh54I5R0jGVFiV9TKy7LdExhJvJt8TyyCtb7XcRkm/cOvkN73HVivAdZlmSY
 JlSDvcL0hfdNEoSi5L//+zXATPWJijM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRt17INxw+r/097qGsN3dpcq/vEASg9fuWlP5GWMX1g=;
 b=5AYePBDWHAo+9NxQ4Et5jOzwJ0m9uIubT6K8A4E4sw1jWzWjSBqbNj4bsNJfxr9GLyTKnv
 YxTGeGCKcRyjZJDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B157D138E7;
 Mon,  6 Feb 2023 14:10:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KNgTHlQK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:28 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 01/10] vl.c: Do not add isa-parallel if it's not present
Date: Mon,  6 Feb 2023 11:08:00 -0300
Message-Id: <20230206140809.26028-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Currently the isa-parallel driver is always added by default
regardless of the presence of the actual code in the build, which can
lead to a crash:

qemu-system-i386: unknown type 'isa-parallel'
Aborted (core dumped)

Check for the presence of the QOM class and do not include
isa-parallel by default if it's not found.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 softmmu/vl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 9177d95d4e..614e6cf66e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1269,7 +1269,8 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_serial) {
         default_serial = 0;
     }
-    if (!has_defaults || machine_class->no_parallel) {
+    if (!has_defaults || machine_class->no_parallel ||
+        !object_class_by_name("isa-parallel")) {
         default_parallel = 0;
     }
     if (!has_defaults || machine_class->no_floppy) {
-- 
2.35.3


