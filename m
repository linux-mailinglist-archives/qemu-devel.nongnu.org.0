Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8797A6F8310
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 14:36:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuex-00038x-AM; Fri, 05 May 2023 08:35:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuev-00037M-71; Fri, 05 May 2023 08:35:37 -0400
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1puuet-00057r-LO; Fri, 05 May 2023 08:35:36 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C1E822AE2;
 Fri,  5 May 2023 12:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683290134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
 b=pvbs+270X86deJmnBRjBI+wvDQWUq8ok83Vn3GYYl8ne9tEpqfxxAzh1ajzEeznXHvNpQ8
 8OKwpP8coz+dbuT//q00jX212i2AsGlvdKANF50IHl5pg7N+K/84LlzMevmdDmrqxhlHsO
 EsURlBBm03qLjbmJH905Afay2zgFaww=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683290134;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6AcepwaYQZJzCLCMuL7Qdisp+94Cje2KJcI1iLK7IHU=;
 b=AQ2H282z6/CEIg3hWgoA8t1xRCn4ShmOeo/jFoRdSn27Ms4SQpigpghqy/3Etc386/LmfH
 s3UWB7W5/4XDxDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 026F913513;
 Fri,  5 May 2023 12:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aFrcLhP4VGTaOgAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 05 May 2023 12:35:31 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is enabled
Date: Fri,  5 May 2023 09:35:23 -0300
Message-Id: <20230505123524.23401-3-farosas@suse.de>
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

We cannot allow this config to be disabled at the moment as not all of
the relevant code is protected by it.

Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
is now possible that nothing selects ARM_V7M (e.g. when doing a
--without-default-devices build).

Return the CONFIG_ARM_V7M entry to a state where it is always selected
whenever TCG is available.

Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/Kconfig b/target/arm/Kconfig
index 3fffdcb61b..5947366f6e 100644
--- a/target/arm/Kconfig
+++ b/target/arm/Kconfig
@@ -1,6 +1,7 @@
 config ARM
     bool
     select ARM_COMPATIBLE_SEMIHOSTING if TCG
+    select ARM_V7M if TCG
 
 config AARCH64
     bool
-- 
2.35.3


