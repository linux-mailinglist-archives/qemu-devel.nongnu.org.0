Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACE64BCE2
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:11:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Adx-00082F-KB; Tue, 13 Dec 2022 14:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adv-00081Z-GR; Tue, 13 Dec 2022 14:08:43 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adt-0006Le-Rw; Tue, 13 Dec 2022 14:08:43 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7E2131FE29;
 Tue, 13 Dec 2022 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670958520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRXZFTKL9nLSzPS9nIZA64DhKhT1iA29WEygE2gGquk=;
 b=wsPkNxQCqpgnH7ChddBaFN0BiWf+jEKpVRZ9+S2opNrsJzoCp7/PyiINcE7ibkNApHAlCJ
 5QzI2JDDqrTMPbnharY8xpQ6gQ8oxYgWpvmqHEJK/K9XQi55cocmcvo4krt6A5imMD2XAk
 7wLFGH0U8KxItpA4WN3kIwoizlVEkrg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670958520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRXZFTKL9nLSzPS9nIZA64DhKhT1iA29WEygE2gGquk=;
 b=o4JPFhvfEs3IRxko/uVzsRgMk3H4vMueku7d3RSmzG/TGUyJSMwbJYcGWEvR9J7xaIfPMT
 VqC5g/+Ns2SLTIAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC2E2138F9;
 Tue, 13 Dec 2022 19:08:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eP5OHLXNmGOcBwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:37 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 6/6] target/arm: cleanup cpu includes
Date: Tue, 13 Dec 2022 16:05:37 -0300
Message-Id: <20221213190537.511-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

From: Claudio Fontana <cfontana@suse.de>

Remove some unused headers.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
[added back some includes that are still needed at this point]
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from https://lore.kernel.org/r/20210416162824.25131-1-cfontana@suse.de

[RFC v14 46/80] target/arm: cleanup cpu includes
---
 target/arm/cpu.c   | 1 -
 target/arm/cpu64.c | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 38d066c294..2e59d16529 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -26,7 +26,6 @@
 #include "target/arm/idau.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
-#include "qapi/visitor.h"
 #include "cpu.h"
 #ifdef CONFIG_TCG
 #include "hw/core/tcg-cpu-ops.h"
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 3d74f134f5..fe231f3d7d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -21,13 +21,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
-#ifdef CONFIG_TCG
-#include "hw/core/tcg-cpu-ops.h"
-#endif /* CONFIG_TCG */
 #include "qemu/module.h"
-#if !defined(CONFIG_USER_ONLY)
-#include "hw/loader.h"
-#endif
 #include "sysemu/kvm.h"
 #include "sysemu/hvf.h"
 #include "kvm_arm.h"
-- 
2.35.3


