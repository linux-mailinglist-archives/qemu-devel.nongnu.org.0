Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF47D68BFC3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 15:14:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2Cy-000695-D2; Mon, 06 Feb 2023 09:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Cj-00066c-Uv; Mon, 06 Feb 2023 09:10:46 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pP2Ci-0002gG-FA; Mon, 06 Feb 2023 09:10:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CD85233CF9;
 Mon,  6 Feb 2023 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675692642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp4o1O8f765MbOnRuP5UY6glSkqkwGjbVkLqSoECOQI=;
 b=ppeVkGJLN7wTtutOd6i4/98cAPqW4C6ImEaBa2ZbVdeZ2UPmgIUoWOaHmfjLL2xG3pOziN
 GKySULC2Yb8O5hs4fFtfoIUfHny0TKQqf3QvRkoa82+0WGF5f/Fv231+Mg8/RbTO8DTN6t
 HIgbK3FxOQis/cMdvJOvuX9tz6hyZx0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675692642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lp4o1O8f765MbOnRuP5UY6glSkqkwGjbVkLqSoECOQI=;
 b=teOz5c/9zyHdz0sN8mxrayyQ5mhXqNrd5YPx5iJtNR5z8RbErNhqDFEFaaX+QJ0StZVz39
 iAFaUKxzuoQvqoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72C04138E7;
 Mon,  6 Feb 2023 14:10:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IDu+DmEK4WOgQAAAMHmgww
 (envelope-from <farosas@suse.de>); Mon, 06 Feb 2023 14:10:41 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
Subject: [PATCH 07/10] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102 machine
Date: Mon,  6 Feb 2023 11:08:06 -0300
Message-Id: <20230206140809.26028-8-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230206140809.26028-1-farosas@suse.de>
References: <20230206140809.26028-1-farosas@suse.de>
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

This machine hardcodes initialization of the USB device, so select the
corresponding Kconfig. It is not enough to have it as "default y if
XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
disables the default selection resulting in:

$ ./qemu-system-aarch64 -M xlnx-zcu102
qemu-system-aarch64: missing object type 'usb_dwc3'
Aborted (core dumped)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 296d4f5176..552e3d04ee 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -405,6 +405,7 @@ config XLNX_VERSAL
     select OR_IRQ
     select XLNX_BBRAM
     select XLNX_EFUSE_VERSAL
+    select XLNX_USB_SUBSYS
 
 config NPCM7XX
     bool
-- 
2.35.3


