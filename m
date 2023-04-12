Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AB86DF4E1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 14:19:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmZR9-0001qf-Mc; Wed, 12 Apr 2023 08:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZR0-0001fq-9V; Wed, 12 Apr 2023 08:18:47 -0400
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pmZQy-0001CX-QL; Wed, 12 Apr 2023 08:18:46 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C69ED1F6E6;
 Wed, 12 Apr 2023 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681301922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGCbUEzChtUbhrQrVpqp86FoTCjne173/p1DBZAkO+A=;
 b=F0bfJBamU30Qp8s93nn9CdnYMip9dkmqp7vdjobwB2GIIPXn3JdqYC2BpTuXHThvtuVprM
 i7MpgmkcbMZQRPMXk5ai4Tk1p3vJhpNIclmQev5oeunIle+oL6YBrxnX1TVmbTm2LMCV2H
 wqESloTp6NVPuqlFOyMkFFdexj7UmQc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681301922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VGCbUEzChtUbhrQrVpqp86FoTCjne173/p1DBZAkO+A=;
 b=JZ74/lnttLkoIMCJNunha//B4zFfcssTFB1AQh90hdpZOVM4/rOIIPUxYtsB2oIzmZToUK
 tpLqeokOgr6p1SAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2594132C7;
 Wed, 12 Apr 2023 12:18:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SIjaHZ+hNmSMUgAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 12 Apr 2023 12:18:39 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v10 02/11] target/arm: Remove dead code from
 cpu_max_set_sve_max_vq
Date: Wed, 12 Apr 2023 09:18:20 -0300
Message-Id: <20230412121829.14452-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230412121829.14452-1-farosas@suse.de>
References: <20230412121829.14452-1-farosas@suse.de>
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

The sve-max-vq property has been removed from the -cpu max used with
KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
reachable.

Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/cpu64.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 61a6b52aa6..f0dd041cfb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -336,12 +336,6 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
         error_setg(errp, "unsupported SVE vector length");
         error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-- 
2.35.3


