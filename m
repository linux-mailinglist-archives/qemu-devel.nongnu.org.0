Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CC7367F20
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 12:57:47 +0200 (CEST)
Received: from localhost ([::1]:33902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZX1m-0001R7-Rk
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 06:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrz-0005q2-LW; Thu, 22 Apr 2021 06:47:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrx-00054B-N3; Thu, 22 Apr 2021 06:47:38 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p6so37629057wrn.9;
 Thu, 22 Apr 2021 03:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AsKH3RYUFA9evmZE7qWhREuizy9iouUOsbLguH/0Dwo=;
 b=PHby2C+q7Qpy2K19+TtUakRQosfU2qUjQbLwtOpzIxZHU117tOuDuV17z7raLMPzig
 zRO2bIt7NfEHnKEcYWJ/7/dT0g2fxBD8wWk2fBypMan9AhJgcNbme44OlnNSYXxyUeoO
 +rBTamBbsxhkPQpcqkPC9PjcjlAQguo47kNsHgYcRQx89sS5w9t049zBZHcoRR239Tiv
 oJAR6apMHrqEVsAcEJATYSTfxFlMcRen8vR9VSOqBAaUrtQzAEz1XcsvJSNc8xbPzCVW
 /XJDI2tuzJG8mRVIc6o5Pr1CnorZESQhvQGTdpk8eI97hRKsBb4RGHryEMG848IJA9Qx
 p9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AsKH3RYUFA9evmZE7qWhREuizy9iouUOsbLguH/0Dwo=;
 b=iFtJzdANjlg0j8l0HAaNRW5KPZaJcCWgF5lgUfX6mDXTJmoAoOK+UiUqhCwfCL0JeB
 2LZ8DWdLbTaQOlvkZYZ4pxtw75gqCZ95S4ue+I785zime+LivjPOKmnCYi7hHwmSszK6
 UWiGL+bPE0a7Uk4vJSsAib/ppNoKEt9gZfhOUTTmsjomgc6N/H71cOfbIXqdGyIcVwvI
 F/zv8JyrsnNNIKnxDNcCULNlkw+nfiI2uoOy5eSRRJOD8XAgekiqipl+5jb7Yvc9aXhX
 KICcxPWvuaS/Seir1z6gwHUWAmgxvWad+21CY2HubO5T47/yNNhiBoNTaLSug0oAdJSg
 nC+A==
X-Gm-Message-State: AOAM530hL2fV2RMn1d96jidGjqRTwAipIbv1E2yuJh/UYDX5M0Dwzb9Z
 UW+pF7pg9sY1EIFFIclYAeurOpxfHa9KUw==
X-Google-Smtp-Source: ABdhPJyt/JrPTuXIEEPy5JUAGWTeYdmJ248XgzKoq8icKnbgDAgzSYsIyTNT7vtqwh9cmD49TJzhUQ==
X-Received: by 2002:adf:dd50:: with SMTP id u16mr3396495wrm.380.1619088454641; 
 Thu, 22 Apr 2021 03:47:34 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q17sm2931911wro.33.2021.04.22.03.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/15] cpu: Directly use get_memory_mapping() fallback
 handlers in place
Date: Thu, 22 Apr 2021 12:46:54 +0200
Message-Id: <20210422104705.2454166-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No code uses CPUClass::get_memory_mapping() outside of hw/core/cpu.c:

  $ git grep -F -- '->get_memory_mapping'
  hw/core/cpu.c:87:    cc->get_memory_mapping(cpu, list, errp);
  hw/core/cpu.c:439:    k->get_memory_mapping = cpu_common_get_memory_mapping;
  target/i386/cpu.c:7422:    cc->get_memory_mapping = x86_cpu_get_memory_mapping;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 1de00bbb474..5abf8bed2e4 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,13 +83,11 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->get_memory_mapping(cpu, list, errp);
-}
+    if (cc->get_memory_mapping) {
+        cc->get_memory_mapping(cpu, list, errp);
+        return;
+    }
 
-static void cpu_common_get_memory_mapping(CPUState *cpu,
-                                          MemoryMappingList *list,
-                                          Error **errp)
-{
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
@@ -419,7 +417,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->parse_features = cpu_common_parse_features;
     k->get_arch_id = cpu_common_get_arch_id;
     k->has_work = cpu_common_has_work;
-    k->get_memory_mapping = cpu_common_get_memory_mapping;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
-- 
2.26.3


