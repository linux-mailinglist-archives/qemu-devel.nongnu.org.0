Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD843AEFEE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 18:43:01 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvN0m-0007NF-A7
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 12:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMmx-00070f-NN
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:44 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvMms-0007SI-P4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 12:28:43 -0400
Received: by mail-wr1-x42b.google.com with SMTP id i94so20363423wri.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ye94kK+c9X5Qdb3oLfHimMsgJSBTnBwqNDEcye+BmeI=;
 b=S2KWGgoSiKfF/jAGJzkBumxuYfJYT2NMQY/c/zN+vopqyzVi4oMB59pVIlnJOao5wP
 SE7ErOaj0TOVrwhMvQgcsIvBpMrJLGvuiL5rX0/4CaIVUz0Z57N2ldWpn+BEDOo1trBa
 qfjG984zzb0av9xR1lWtDew+W0O3TQAkdltD8N2UcVmWee74hAtpbZfnc587J6bVXfs/
 EId8aj+dPW/qgeg7C0ENmqZmmduMRb47E3tOxTPPRjQk/wBdo9LHrhfgkauh4OdU/5pK
 oASvG8cJBbQesaTNJUEY+xpUDt6gKQaGEql9KRsUr/OQaYNVnFFrEAIU9e2zAjPcBEXg
 Kqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye94kK+c9X5Qdb3oLfHimMsgJSBTnBwqNDEcye+BmeI=;
 b=o2fpsNnzAHEibX9P1mcc5gPnNgxk7rBoXO0wU4al8+REvDmuU7uXYVm/UDO/qCVrUv
 kF2ssVub4GaJo4mC28tKCd7Jw3AkejsR/dAcus1BZa//UVc4NqCoDJ4fXHHBkcJP27p+
 INH/KJxN+Pupmzbhd+D1ktjA/X64/l+Uyuoyc7w2JTUWDvMjJLry+M7JOCy5DRcf4qrr
 mzEdwtMQjmyPsixpXOpavyrv7yjvG6qTaW8hT4ecy4OIOafQbW2kWzZtc4rtrRntQyEC
 jelF8aqxx2ncjTKj3h7Wru3BAyPyd+yZUivix62HPcYAa5fp5HfQWih+WYysVe8SwM2t
 dJQQ==
X-Gm-Message-State: AOAM533wErs+mWNUQ91t6907wgopwY5jWRKmleVKJZusfIWZUR/fhND7
 wOunwMk31TjwvDG2EixBjhxwyLL8PLIxdGjd
X-Google-Smtp-Source: ABdhPJx0g26Lb51GaaNmwpXA4ntdEk6Y56hUpARJk75J6iqEA7gG3ve+DsiyN6PRaIgYfBsV2QwU9Q==
X-Received: by 2002:adf:f9cf:: with SMTP id w15mr22296604wrr.151.1624292917380; 
 Mon, 21 Jun 2021 09:28:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n65sm11615496wme.21.2021.06.21.09.28.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 09:28:37 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/57] target/arm: Use acpi_ghes_present() to see if we report
 ACPI memory errors
Date: Mon, 21 Jun 2021 17:27:39 +0100
Message-Id: <20210621162833.32535-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621162833.32535-1-peter.maydell@linaro.org>
References: <20210621162833.32535-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virt_is_acpi_enabled() function is specific to the virt board, as
is the check for its 'ras' property.  Use the new acpi_ghes_present()
function to check whether we should report memory errors via
acpi_ghes_record_errors().

This avoids a link error if QEMU was built without support for the
virt board, and provides a mechanism that can be used by any future
board models that want to add ACPI memory error reporting support
(they only need to call acpi_ghes_add_fw_cfg()).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Dongjiu Geng <gengdongjiu1@gmail.com>
Message-id: 20210603171259.27962-4-peter.maydell@linaro.org
---
 target/arm/kvm64.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 37ceadd9a9d..59982d470d3 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1410,14 +1410,10 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
 {
     ram_addr_t ram_addr;
     hwaddr paddr;
-    Object *obj = qdev_get_machine();
-    VirtMachineState *vms = VIRT_MACHINE(obj);
-    bool acpi_enabled = virt_is_acpi_enabled(vms);
 
     assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
 
-    if (acpi_enabled && addr &&
-            object_property_get_bool(obj, "ras", NULL)) {
+    if (acpi_ghes_present() && addr) {
         ram_addr = qemu_ram_addr_from_host(addr);
         if (ram_addr != RAM_ADDR_INVALID &&
             kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
-- 
2.20.1


