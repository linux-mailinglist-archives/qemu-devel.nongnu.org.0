Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A658E32BC4B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 22:51:55 +0100 (CET)
Received: from localhost ([::1]:35860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHZPO-0000se-NU
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 16:51:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZL8-0003FI-R3; Wed, 03 Mar 2021 16:47:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHZL7-00027A-6R; Wed, 03 Mar 2021 16:47:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id u14so25378319wri.3;
 Wed, 03 Mar 2021 13:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=Sw8DnTnEunZLoUFkAq5ehEtw5KzHSFE8RcKZI0xIwI3y4kkr8vtPH5KdYIM2dMB0tM
 dDKvIkpk2pdhYAVsGqo2WPtvup+Oahey4/henkaku+823S6hlg5lEU0yAdNwt304jwm8
 qD6y3lPn8HeKUbJVYmzT84mJ/ZqsStb1cuhSxlMzJql8kDgTX0mLXDnIWEatwlmW+oRU
 3zW6wNtP1nIIDl0HQ+cLV0Da0nZ1xwTVRMOGYf1Usa1vsDdeK0mZ0vfoheHGFDfD2izu
 nMJQOO2Fydg0nrqrQkuHNYqO4abCf+/o2JQvSOVK4GlTFgCSmcQPDDmsf0BHjlTkr87B
 Suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=alNnX6GeE8sTwFbIWBvN2VrnGh2+v4nR5yjKLFDEoAw=;
 b=qVt4XUUDX/4I1Ir70aJYOEstEWm9bofxhv2Ziz6wE6hPNjFpRLrNtAuld4Id53lL72
 nFEWVeGCrzDuVOX9wOAByvRcuxK8IGgeVP29i+94ZnZarICIFSnX+BV5GU+uhC8oiYig
 sO/+IIwSuYqDm9braVE/TBNNCT6Bjrd1lv8a1VyKnfrT6DdBLVtUJNJlOAXc4s2rRTv2
 uuojjqtHOzcIivgrb4lKh0Ph8iplzeB14zdVMbIWZy2tbT9wSBuKl7eW7GaaVmCcMGpB
 VWIvQyTNK0fHBp+kh8O4hE1axx1TukQ4TRKtQtp+XoYv1Pd7wstpZmvKNuZD/YfggoIj
 XVVA==
X-Gm-Message-State: AOAM531d9H9AXV7eMbDTCoz/bbfnLz5jMP3YqVD5uhjeuNHnJWsFkDKr
 xqmYLxqWNo8rJyQiBK9hy+rxufW7FY0=
X-Google-Smtp-Source: ABdhPJyu4L3Uv9xjofCNQfzlxl0Bmhv5Ay1kX/ZVhDrO7OpMVdGJBxmvbyNGuTAv2BHequ5z9sR6nA==
X-Received: by 2002:a5d:4e0e:: with SMTP id p14mr795983wrt.64.1614808046419;
 Wed, 03 Mar 2021 13:47:26 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g16sm15070689wrs.76.2021.03.03.13.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 13:47:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Date: Wed,  3 Mar 2021 22:46:43 +0100
Message-Id: <20210303214708.1727801-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303214708.1727801-1-f4bug@amsat.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the cpu_virtio_is_big_endian() generic helper to avoid
calling CPUClass internal virtio_is_big_endian() one.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 +++++++++
 hw/core/cpu.c         | 8 ++++++--
 hw/virtio/virtio.c    | 4 +---
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2d43f78819f..b12028c3c03 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
  */
 int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
+/**
+ * cpu_virtio_is_big_endian:
+ * @cpu: CPU
+
+ * Returns %true if a CPU which supports runtime configurable endianness
+ * is currently big-endian.
+ */
+bool cpu_virtio_is_big_endian(CPUState *cpu);
+
 #endif /* CONFIG_USER_ONLY */
 
 /**
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 4dce35f832f..daaff56a79e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
     return 0;
 }
 
-static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
+bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->virtio_is_big_endian) {
+        return cc->virtio_is_big_endian(cpu);
+    }
     return target_words_bigendian();
 }
 
@@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
-    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 1fd1917ca0f..fe6a4be99e4 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
 
 static enum virtio_device_endian virtio_current_cpu_endian(void)
 {
-    CPUClass *cc = CPU_GET_CLASS(current_cpu);
-
-    if (cc->virtio_is_big_endian(current_cpu)) {
+    if (cpu_virtio_is_big_endian(current_cpu)) {
         return VIRTIO_DEVICE_ENDIAN_BIG;
     } else {
         return VIRTIO_DEVICE_ENDIAN_LITTLE;
-- 
2.26.2


