Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81A68BFA3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:11:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cz-0006A6-CG; Mon, 06 Feb 2023 09:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cl-000672-EW; Mon, 06 Feb 2023 09:10:48 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ck-0002gd-2W; Mon, 06 Feb 2023 09:10:47 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A929133D27;
 Mon,  6 Feb 2023 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZXJRI3amPAYNCwVYdZzgSDNv7iQO8gV9ZNjrmjggUI=;
 b=B+Ckmfx/59LljsiW3ZPHHzPqGZxVnxsCTztOmITUhTCwHwSPhJci+bhKv/Hug9A5vtGXth
 XAjFvlP6SZIn9RqBQ6Jr7YOaoX/MZiTu+61PzeecSzp8dC34Vea7zggKX/Quc7k4Dk3LlG
 tmJD0uXRK+/7KYJc6mGdfUUebNXqcDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692644;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HZXJRI3amPAYNCwVYdZzgSDNv7iQO8gV9ZNjrmjggUI=;
 b=iaWTxJTTnGdF8LDLnhuYLxvmBU//hRQtzNtCOjh5r3IEXxXBKQ/SSKi2LoZaQggtThimcN
 9ptycREOXHItLiBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 47302138E7;
 Mon,  6 Feb 2023 14:10:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oA0SBGMK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:43 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 08/10] hw/arm: Select GICV3_TCG for sbsa-ref machine
Date: Mon,  6 Feb 2023 11:08:07 -0300
Message-Id: <20230206140809.26028-9-farosas@suse.de>
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

This machine hardcodes the creation of the interrupt controller, so
make sure the dependency is explicitly described in the Kconfig.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 552e3d04ee..823f8b11f1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -232,6 +232,7 @@ config SBSA_REF
     select PL061 # GPIO
     select USB_EHCI_SYSBUS
     select WDT_SBSA
+    select ARM_GICV3_TCG
 
 config SABRELITE
     bool
-- 
2.35.3


