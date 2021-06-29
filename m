Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FD3B79E0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 23:30:13 +0200 (CEST)
Received: from localhost ([::1]:42590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyLJ6-0001vh-Ha
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 17:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyLHj-0008Ml-1S
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:28:47 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:49214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyLHh-0004kl-99
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 17:28:46 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FA91226EA;
 Tue, 29 Jun 2021 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625002123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa+labxdjR4IyVCKDF0/nFJ1Fzb864WBc37lKGdMpLs=;
 b=yrEJe5GEVVOZzu8nDW7Zh79KTBNrxD5St3tBoLiUabVOGUrxuIUx2NU9F0la7kIdz4m8a6
 BaPWDAdNcSuzpmPs564/iIjgBhzeOt3aB/TlnNIphR8nmtnxVh1biSRwu+XKTqS8bU83Yd
 B3ZQ/2StAjT0YR7tomifYHAdeqqJcFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625002123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa+labxdjR4IyVCKDF0/nFJ1Fzb864WBc37lKGdMpLs=;
 b=TtvyH+2udh/bJ0EoqywGI4uVQW4WHUAHhv0Ly2BxLmYRLPcCRzJGMOV/BgQ+S16uDNdZNt
 lwk0FN5RjWUZtYBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E1A9D11906;
 Tue, 29 Jun 2021 21:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625002123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa+labxdjR4IyVCKDF0/nFJ1Fzb864WBc37lKGdMpLs=;
 b=yrEJe5GEVVOZzu8nDW7Zh79KTBNrxD5St3tBoLiUabVOGUrxuIUx2NU9F0la7kIdz4m8a6
 BaPWDAdNcSuzpmPs564/iIjgBhzeOt3aB/TlnNIphR8nmtnxVh1biSRwu+XKTqS8bU83Yd
 B3ZQ/2StAjT0YR7tomifYHAdeqqJcFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625002123;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qa+labxdjR4IyVCKDF0/nFJ1Fzb864WBc37lKGdMpLs=;
 b=TtvyH+2udh/bJ0EoqywGI4uVQW4WHUAHhv0Ly2BxLmYRLPcCRzJGMOV/BgQ+S16uDNdZNt
 lwk0FN5RjWUZtYBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 0KNnKYmQ22AtQQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Tue, 29 Jun 2021 21:28:41 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 2/2] modules: Fix warning in module_arch documentation
Date: Tue, 29 Jun 2021 18:28:19 -0300
Message-Id: <20210629212819.24389-3-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629212819.24389-1-jziviani@suse.de>
References: <20210629212819.24389-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
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
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, "Jose R. Ziviani" <jziviani@suse.de>,
 kraxel@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes a small issue in the module_arch documentation that
caused the build system to complain:
module.h:127: warning: Function parameter or member
              'name' not described in 'module_arch'
module.h:127: warning: Excess function parameter
              'arch' description in 'module_arch'

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 include/qemu/module.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 8bc80535a4..456e190a55 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -115,7 +115,7 @@ void module_allow_arch(const char *arch);
 /**
  * module_arch
  *
- * @arch: target architecture
+ * @name: module name
  *
  * This module is for target architecture @arch.
  *
-- 
2.32.0


