Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C7E4C1E38
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:08:57 +0100 (CET)
Received: from localhost ([::1]:51122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzoe-0007Lr-62
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzlE-00051D-8E
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:24 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:41146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzlB-0005Qn-UI
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:23 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD82161919;
 Wed, 23 Feb 2022 22:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06768C340E7;
 Wed, 23 Feb 2022 22:05:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="awY7NnOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645653917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P4ovfwdUD1X2Y5KbzB3Em8ah+UEym9W3EkRSqF247no=;
 b=awY7NnOuzpNXi126ohYHv/dK0AEGJosLdDAfK5B8W8GsL75iQnM7JBOPyYyRcN/ZCqs0r8
 sik75qGnqWecorYLRCnHp4iKtGBl/YRO+ppF0bsEyRMs+4+vJumbmwx8oxKpIeo29D5p41
 doFEFyydCqOGCkSSdVQwi3A6pgpsGsw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5794f5a0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Feb 2022 22:05:17 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-crypto@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] random: add mechanism for VM forks to reinitialize crng
Date: Wed, 23 Feb 2022 23:04:55 +0100
Message-Id: <20220223220456.666193-2-Jason@zx2c4.com>
In-Reply-To: <20220223220456.666193-1-Jason@zx2c4.com>
References: <20220223220456.666193-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kys@microsoft.com,
 sthemmin@microsoft.com, ehabkost@redhat.com, adrian@parity.io, mst@redhat.com,
 decui@microsoft.com, haiyangz@microsoft.com, ben@skyportsystems.com,
 raduweis@amazon.com, wei.liu@kernel.org, linux@dominikbrodowski.net,
 gregkh@linuxfoundation.org, graf@amazon.com, tytso@mit.edu, jannh@google.com,
 imammedo@redhat.com, colmmacc@amazon.com, ardb@kernel.org, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When a VM forks, we must immediately mix in additional information to
the stream of random output so that two forks or a rollback don't
produce the same stream of random numbers, which could have catastrophic
cryptographic consequences. This commit adds a simple API, add_vmfork_
randomness(), for that.

Cc: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: Theodore Ts'o <tytso@mit.edu>
Cc: Jann Horn <jannh@google.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c  | 53 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/random.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 536237a0f073..95584f6646f9 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -508,6 +508,40 @@ static size_t crng_pre_init_inject(const void *input, size_t len,
 	return len;
 }
 
+/*
+ * This mixes unique_vm_id directly into the base_crng key as soon as
+ * possible, similarly to crng_pre_init_inject(), even if the crng is
+ * already running, in order to immediately branch streams from prior
+ * VM instances.
+ */
+static void crng_vmfork_inject(const void *unique_vm_id, size_t len)
+{
+	unsigned long flags, next_gen;
+	struct blake2s_state hash;
+
+	spin_lock_irqsave(&base_crng.lock, flags);
+
+	/*
+	 * Update the generation, while locked, as early as possible
+	 * This will mean unlocked reads of the generation will
+	 * cause a reseeding of per-cpu crngs, and those will spin
+	 * on the base_crng lock waiting for the rest of this function
+	 * to complete, which achieves the goal of blocking the
+	 * production of new output until this is done.
+	 */
+	next_gen = base_crng.generation + 1;
+	if (next_gen == ULONG_MAX)
+		++next_gen;
+	WRITE_ONCE(base_crng.generation, next_gen);
+
+	blake2s_init(&hash, sizeof(base_crng.key));
+	blake2s_update(&hash, base_crng.key, sizeof(base_crng.key));
+	blake2s_update(&hash, unique_vm_id, len);
+	blake2s_final(&hash, base_crng.key);
+
+	spin_unlock_irqrestore(&base_crng.lock, flags);
+}
+
 static void _get_random_bytes(void *buf, size_t nbytes)
 {
 	u32 chacha_state[CHACHA_STATE_WORDS];
@@ -935,6 +969,7 @@ static bool drain_entropy(void *buf, size_t nbytes)
  *	void add_hwgenerator_randomness(const void *buffer, size_t count,
  *					size_t entropy);
  *	void add_bootloader_randomness(const void *buf, size_t size);
+ *	void add_vmfork_randomness(const void *unique_vm_id, size_t size);
  *	void add_interrupt_randomness(int irq);
  *
  * add_device_randomness() adds data to the input pool that
@@ -966,6 +1001,11 @@ static bool drain_entropy(void *buf, size_t nbytes)
  * add_device_randomness(), depending on whether or not the configuration
  * option CONFIG_RANDOM_TRUST_BOOTLOADER is set.
  *
+ * add_vmfork_randomness() adds a unique (but not neccessarily secret) ID
+ * representing the current instance of a VM to the pool, without crediting,
+ * and then immediately mixes that ID into the current base_crng key, so
+ * that it takes effect prior to a reseeding.
+ *
  * add_interrupt_randomness() uses the interrupt timing as random
  * inputs to the entropy pool. Using the cycle counters and the irq source
  * as inputs, it feeds the input pool roughly once a second or after 64
@@ -1195,6 +1235,19 @@ void add_bootloader_randomness(const void *buf, size_t size)
 }
 EXPORT_SYMBOL_GPL(add_bootloader_randomness);
 
+/*
+ * Handle a new unique VM ID, which is unique, not secret, so we
+ * don't credit it, but we do mix it into the entropy pool and
+ * inject it into the crng.
+ */
+void add_vmfork_randomness(const void *unique_vm_id, size_t size)
+{
+	add_device_randomness(unique_vm_id, size);
+	if (crng_ready())
+		crng_vmfork_inject(unique_vm_id, size);
+}
+EXPORT_SYMBOL_GPL(add_vmfork_randomness);
+
 struct fast_pool {
 	union {
 		u32 pool32[4];
diff --git a/include/linux/random.h b/include/linux/random.h
index 6148b8d1ccf3..51b8ed797732 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -34,6 +34,7 @@ extern void add_input_randomness(unsigned int type, unsigned int code,
 extern void add_interrupt_randomness(int irq) __latent_entropy;
 extern void add_hwgenerator_randomness(const void *buffer, size_t count,
 				       size_t entropy);
+extern void add_vmfork_randomness(const void *unique_vm_id, size_t size);
 
 extern void get_random_bytes(void *buf, size_t nbytes);
 extern int wait_for_random_bytes(void);
-- 
2.35.1


