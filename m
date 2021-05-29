Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99363394B3F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 11:16:57 +0200 (CEST)
Received: from localhost ([::1]:47354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmv5U-0007Jg-Nc
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 05:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmv23-000301-EL
 for qemu-devel@nongnu.org; Sat, 29 May 2021 05:13:23 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:55316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lmv20-0000fJ-5w
 for qemu-devel@nongnu.org; Sat, 29 May 2021 05:13:23 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ADBB121915;
 Sat, 29 May 2021 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622279598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RLLpKzaG6cee9YoeuvdoRHLOhiqV7lPKVjXnQJR+5c=;
 b=ykylH80xEmwxgMd21Qls+Am+RypWoqSTD20zrUMEAKHyvYo32N13VBtqkNUBSn9bPFOlmp
 wD08aKkXlJlyRMwO+gUvcgzNQqxQ5T1r1sNjzRa3lp/2KfoDy7Uny1fPtG+ol2p2lX8gA7
 A9YL/fgbeg0Klc0TSlSbiW81iwI+8Sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622279598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RLLpKzaG6cee9YoeuvdoRHLOhiqV7lPKVjXnQJR+5c=;
 b=VUMBoPN7OJgUBq3ojM8vbVmDbzggH7zjcBinnkn5SNbz6NlbY72o2YYlaT1iYHD9hc5Pj9
 AYD9y77TYu77UABA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C3FD4118DD;
 Sat, 29 May 2021 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622279598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RLLpKzaG6cee9YoeuvdoRHLOhiqV7lPKVjXnQJR+5c=;
 b=ykylH80xEmwxgMd21Qls+Am+RypWoqSTD20zrUMEAKHyvYo32N13VBtqkNUBSn9bPFOlmp
 wD08aKkXlJlyRMwO+gUvcgzNQqxQ5T1r1sNjzRa3lp/2KfoDy7Uny1fPtG+ol2p2lX8gA7
 A9YL/fgbeg0Klc0TSlSbiW81iwI+8Sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622279598;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RLLpKzaG6cee9YoeuvdoRHLOhiqV7lPKVjXnQJR+5c=;
 b=VUMBoPN7OJgUBq3ojM8vbVmDbzggH7zjcBinnkn5SNbz6NlbY72o2YYlaT1iYHD9hc5Pj9
 AYD9y77TYu77UABA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id cPj/La0FsmCbEwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Sat, 29 May 2021 09:13:17 +0000
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Siddharth Chandrasekaran <sidcha@amazon.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 2/2] i386: run accel_cpu_instance_init as instance_post_init
Date: Sat, 29 May 2021 11:13:13 +0200
Message-Id: <20210529091313.16708-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210529091313.16708-1-cfontana@suse.de>
References: <20210529091313.16708-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: imap.suse.de;
	none
X-Spam-Score: 1.00
X-Spamd-Result: default: False [1.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 REPLY(-4.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[13]; MID_CONTAINS_FROM(1.00)[];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2]
Received-SPF: pass client-ip=195.135.220.28; envelope-from=cfontana@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This partially fixes host and max cpu initialization,
by running the accel cpu initialization only after all instance
init functions are called for all X86 cpu subclasses.

Partial Fix.

Fixes: 48afe6e4eabf ("i386: split cpu accelerators from cpu.c, using AccelCPUClass")
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/i386/cpu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6bcb7dbc2c..ae148fbd2f 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6422,6 +6422,11 @@ static void x86_cpu_register_feature_bit_props(X86CPUClass *xcc,
     x86_cpu_register_bit_prop(xcc, name, w, bitnr);
 }
 
+static void x86_cpu_post_initfn(Object *obj)
+{
+    accel_cpu_instance_init(CPU(obj));
+}
+
 static void x86_cpu_initfn(Object *obj)
 {
     X86CPU *cpu = X86_CPU(obj);
@@ -6473,9 +6478,6 @@ static void x86_cpu_initfn(Object *obj)
     if (xcc->model) {
         x86_cpu_load_model(cpu, xcc->model);
     }
-
-    /* if required, do accelerator-specific cpu initializations */
-    accel_cpu_instance_init(CPU(obj));
 }
 
 static int64_t x86_cpu_get_arch_id(CPUState *cs)
@@ -6810,6 +6812,8 @@ static const TypeInfo x86_cpu_type_info = {
     .parent = TYPE_CPU,
     .instance_size = sizeof(X86CPU),
     .instance_init = x86_cpu_initfn,
+    .instance_post_init = x86_cpu_post_initfn,
+
     .abstract = true,
     .class_size = sizeof(X86CPUClass),
     .class_init = x86_cpu_common_class_init,
-- 
2.26.2


