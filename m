Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 118F764F334
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IJF-0007P9-8z; Fri, 16 Dec 2022 16:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6IJA-0007Ke-PT; Fri, 16 Dec 2022 16:31:56 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p6IJ9-0005qV-2f; Fri, 16 Dec 2022 16:31:56 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC41A34BF8;
 Fri, 16 Dec 2022 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671226312; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5CG4PGerUxdqx8UYWH7MTKHIghaqlUgu4Ciy6KeonQ=;
 b=I6VlfHdjtOYLRdROMXiUoYTjpBz9ZorRXgsdpu7oOlLN81LBcueWVeTqkBm3lqKzJObDu6
 ybGwvTvm1zpWMYSN2wl3kpVi0ziWmDtsqeThOrin9z/QTJtgAbpAcWJd2wuibZF6Wvte9l
 aA44rWJfIOW/GaX/u8ICzF0Cw4kgT7A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671226312;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B5CG4PGerUxdqx8UYWH7MTKHIghaqlUgu4Ciy6KeonQ=;
 b=ILhXrWT70SZTDPbEQaQJAmp1Y/N7S330dxc+ztyglq0cAxMU9vQbXfbEFUKeGmU1H3qD5L
 QXKWaf4L5guSBvCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5B24138FD;
 Fri, 16 Dec 2022 21:31:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SD8wKsXjnGPAHwAAMHmgww
 (envelope-from <farosas@suse.de>); Fri, 16 Dec 2022 21:31:49 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
Subject: [PATCH 1/5] target/arm: only build psci for TCG
Date: Fri, 16 Dec 2022 18:29:40 -0300
Message-Id: <20221216212944.28229-2-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221216212944.28229-1-farosas@suse.de>
References: <20221216212944.28229-1-farosas@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Cc: Alexander Graf <agraf@csgraf.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
Originally from:
[RFC v14 09/80] target/arm: only build psci for TCG
https://lore.kernel.org/r/20210416162824.25131-10-cfontana@suse.de
---
 target/arm/meson.build | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index 87e911b27f..26e425418f 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -61,10 +61,13 @@ arm_softmmu_ss.add(files(
   'arm-powerctl.c',
   'machine.c',
   'monitor.c',
-  'psci.c',
   'ptw.c',
 ))
 
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+  'psci.c',
+))
+
 subdir('hvf')
 
 target_arch += {'arm': arm_ss}
-- 
2.35.3


