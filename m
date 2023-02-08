Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FE368F818
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:31:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPq8I-0007Ar-AQ; Wed, 08 Feb 2023 14:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq89-00077E-CR; Wed, 08 Feb 2023 14:29:21 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pPq87-0006LR-A8; Wed, 08 Feb 2023 14:29:21 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1F2F32281C;
 Wed,  8 Feb 2023 19:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675884557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Sr6k0UBoZ4rpW7+N3yTty4+4axcyqsEsxFDoi5sJPA=;
 b=VT2fxf7k+hkMcimf/3u5pZJl9rhgbQNvV3r06L/sac5uLbYz8l8LPfDb3tN/CK24XTvIck
 /G1ygUauOK6JgNtonYao4FVZYG5b30YpGUM7K5BJr2QDUniEtEOK+ZJWmIW8Lv1a4tq/OL
 Wni1zbfcilPPC37zjHVUraaDuOw4mYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675884557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Sr6k0UBoZ4rpW7+N3yTty4+4axcyqsEsxFDoi5sJPA=;
 b=zIr9xg9zT8tR6lfY686A1wYMgaaOjHRgnTaovkFSVkn0nrFoj7lSGGxVG1erntfBl724NT
 xtf0kqU8krbEJAAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B982013425;
 Wed,  8 Feb 2023 19:29:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eOtOIAv442NiHQAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:29:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH v2 09/10] hw/arm: Select e1000e for sbsa-ref machine
Date: Wed,  8 Feb 2023 16:26:53 -0300
Message-Id: <20230208192654.8854-10-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208192654.8854-1-farosas@suse.de>
References: <20230208192654.8854-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
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

This machine explicitly selects the e1000e network adapter if no other
option was given in the command line. Make sure e1000e is present in
the build.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 823f8b11f1..5022d519ea 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -233,6 +233,7 @@ config SBSA_REF
     select USB_EHCI_SYSBUS
     select WDT_SBSA
     select ARM_GICV3_TCG
+    select E1000E_PCI_EXPRESS
 
 config SABRELITE
     bool
-- 
2.35.3


