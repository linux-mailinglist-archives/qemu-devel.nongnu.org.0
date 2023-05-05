Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4620F6F8311
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:36:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuex-00039Y-QG; Fri, 05 May 2023 08:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puueu-00036q-LT; Fri, 05 May 2023 08:35:36 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuer-000557-7Y; Fri, 05 May 2023 08:35:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84B0022AE4;
 Fri,  5 May 2023 12:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683290131; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
 b=MLywpLEikVZVZ/dTKIx8GrtuNLeG81FpJyb0SqvhE7tF3h2KO8B6XwStDjD6VJ/CnEpm/+
 InBj5jCbLIv6QjbS5KVbbw5vHr7AqYDhdVgv/KFkgAvbVJ/uUKniGAGh93qyIO67pQr0Nb
 wYuAF68rxFkKgDlq/a1rHp2aTTxm4BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683290131;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ppt0sa0XAwy+XRuOa3p9oGr7/EBACeoA3VT1BgrZHhI=;
 b=uOokQTEprtud4ekXz10WjrWuQzV6lyVpbj/fjBVsWmRH8ygs6scalnMGc7909N1wWgWQaw
 q7uLTc0sEhDaIrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D05B13513;
 Fri,  5 May 2023 12:35:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cCIqERH4VGTaOgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:29 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 1/3] target/arm: Select SEMIHOSTING when using TCG
Date: Fri,  5 May 2023 09:35:22 -0300
Message-Id: <20230505123524.23401-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230505123524.23401-1-farosas@suse.de>
References: <20230505123524.23401-1-farosas@suse.de>
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

Semihosting has been made a 'default y' entry in Kconfig, which does
not work because when building --without-default-devices, the
semihosting code would not be available.

Make semihosting unconditional when TCG is present.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 39f05b6420..3fffdcb61b 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,13 +1,7 @@
 config ARM
     bool
+    select ARM_COMPATIBLE_SEMIHOSTING if TCG
 
 config AARCH64
     bool
     select ARM
-
-# This config exists just so we can make SEMIHOSTING default when TCG
-# is selected without also changing it for other architectures.
-config ARM_SEMIHOSTING
-    bool
-    default y if TCG && ARM
-    select ARM_COMPATIBLE_SEMIHOSTING
-- 
2.35.3


