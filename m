Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D006951F8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 21:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRfVj-0007Ff-Af; Mon, 13 Feb 2023 15:33:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfVh-0007Dy-Cu; Mon, 13 Feb 2023 15:33:13 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pRfVf-0002wd-UY; Mon, 13 Feb 2023 15:33:13 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9625C2235A;
 Mon, 13 Feb 2023 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676320390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
 b=eGG/reaPzfuMH/T4gAe3SSXa5lLOCZssAbZammyKu+Nudd3P4A19NGqr52DWhERZk9hwwf
 3zuPmgUw0oJj79AqwThznsJtajY8KEhgYhpvXVsTFNRrAL6I4Dq89kuRp62uGxOh0EDRPB
 gvZQ9S6Z/1s/2LjeB/Irf59bidkjn9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676320390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e5tfxhz0XLT506HPN6j8wnNQmjG3RMFDcTBo7NMv6Wg=;
 b=Vo6L1UlH4Mog1a4JhGgsH8agp0gfUaoZP73Ruu20jFjvLtP3CAOj36XGCndyYT67W3yJq3
 972YY9UpTfQCM2AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A4961391B;
 Mon, 13 Feb 2023 20:33:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wOqvE4Oe6mOVMwAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 13 Feb 2023 20:33:07 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH RESEND v5 26/28] arm/Kconfig: Always select SEMIHOSTING when
 TCG is present
Date: Mon, 13 Feb 2023 17:29:25 -0300
Message-Id: <20230213202927.28992-27-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230213202927.28992-1-farosas@suse.de>
References: <20230213202927.28992-1-farosas@suse.de>
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

We are about to enable the build without TCG, so CONFIG_SEMIHOSTING
and CONFIG_ARM_COMPATIBLE_SEMIHOSTING cannot be unconditionally set in
default.mak anymore. So reflect the change in a Kconfig.

Instead of using semihosting/Kconfig, use a target-specific file, so
that the change doesn't affect other architectures which might
implement semihosting in a way compatible with KVM.

The selection from ARM_v7M needs to be removed to avoid a cycle during
parsing.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/devices/arm-softmmu/default.mak | 2 --
 hw/arm/Kconfig                          | 1 -
 target/arm/Kconfig                      | 7 +++++++
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
index 1b49a7830c..cb3e5aea65 100644
--- a/configs/devices/arm-softmmu/default.mak
+++ b/configs/devices/arm-softmmu/default.mak
@@ -40,6 +40,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_SEMIHOSTING=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d157de9b8..ef518c1f1d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -316,7 +316,6 @@ config ARM_V7M
     # currently v7M must be included in a TCG build due to translate.c
     default y if TCG && (ARM || AARCH64)
     select PTIMER
-    select ARM_COMPATIBLE_SEMIHOSTING
 
 config ALLWINNER_A10
     bool
diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3f3394a22b..39f05b6420 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -4,3 +4,10 @@ config ARM
 config AARCH64
     bool
     select ARM
+
+# This config exists just so we can make SEMIHOSTING default when TCG
+# is selected without also changing it for other architectures.
+config ARM_SEMIHOSTING
+    bool
+    default y if TCG && ARM
+    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3


