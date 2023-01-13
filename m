Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812EE66999D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:09:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKiI-0006na-2A; Fri, 13 Jan 2023 09:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKiB-0006jE-6G; Fri, 13 Jan 2023 09:07:15 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pGKi9-0002ib-NE; Fri, 13 Jan 2023 09:07:14 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 349E04DE3E;
 Fri, 13 Jan 2023 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673618832; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
 b=xpHQOYeLHFrF14S2x0Yh8NCJ7VXZHscjkPQC/oimMIanM9ZobA8bWrF52H5HQxfliOJTtE
 vYdBNvuLihW9Bc05HTtbiekQ3LcjQUWI22IaLvrPbpwFnsF9bUkPiGgwzXyQlh03kWWClC
 r042hIMjBwoAQJODIdT+sx6C4zW4P1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673618832;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFCLtdp68XCkucr0GBNgmDryKCRj7k/2ikV3JWwMC5g=;
 b=wQruSaskzwx0e2QuCXAstCp5KqoEt19RkZxNR5Vabg3wQpbuhxUYLxrtHBEfUFljzhiuaX
 U6y+JX7pBhdRHEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92CD71358A;
 Fri, 13 Jan 2023 14:07:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8GHxFo1lwWP8DQAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 13 Jan 2023 14:07:09 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [RFC PATCH v3 15/28] target/arm: Don't access TCG code when debugging
 with KVM
Date: Fri, 13 Jan 2023 11:04:06 -0300
Message-Id: <20230113140419.4013-16-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230113140419.4013-1-farosas@suse.de>
References: <20230113140419.4013-1-farosas@suse.de>
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

When TCG is disabled this part of the code should not be reachable, so
wrap it with an ifdef for now.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 4bda0590c7..2af75d0904 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -254,6 +254,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_host = NULL;
         ptw->out_rw = false;
     } else {
+#ifdef CONFIG_TCG
         CPUTLBEntryFull *full;
         int flags;
 
@@ -270,6 +271,9 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
         ptw->out_rw = full->prot & PAGE_WRITE;
         pte_attrs = full->pte_attrs;
         pte_secure = full->attrs.secure;
+#else
+        g_assert_not_reached();
+#endif
     }
 
     if (regime_is_stage2(s2_mmu_idx)) {
-- 
2.35.3


