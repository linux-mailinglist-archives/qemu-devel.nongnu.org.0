Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A874039238C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 02:04:08 +0200 (CEST)
Received: from localhost ([::1]:42066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm3VP-0001SZ-Ox
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 20:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FQ-0005qD-Ab
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:36762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lm3FJ-0004YE-Tz
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:47:36 -0400
Received: by mail-pl1-x62b.google.com with SMTP id a7so1425521plh.3
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BW0oJJiLXi4mMD8lNsTsa4jEjRDlHenk7c8JGyBfsms=;
 b=DEEjKRHitq+9e+gjaooNQ+uz6zLaSPkFORlVQ0x3iqd6Y8zAookfGaEYrPnTuHbCJ2
 vA8PwmkgMn4qxDCF6RhLSjId7fpzk6+ODuqYp2O9xTiaNDqTdr4sq7Ev8iyIh+Wl7yp1
 EGFhddtxwN2PlVeqs0+pQqRNB9+PThxhHyBHf6E+OPsMHBZ/sg816ObDwt56Mig4kSC6
 iVVRVojlC+TLV0hpGiT61nrIrnsfjGrJwhLOyHNA7yp78Emk4cEuiND+a/7m7UiBTJmQ
 4psHfpk5l5btmbdTx4FDD5u3gYe6VOcHXfAQddpPFOOX9SFtmoufkGQCcvkxB+uO5VQH
 JQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BW0oJJiLXi4mMD8lNsTsa4jEjRDlHenk7c8JGyBfsms=;
 b=ojFbpxia+LqbXfvoF0hTkd870b9eWZq6CidWWzUtRH94pfiOjiOFyEZ5+eUeiicb20
 wLtp9o4S+MfA4CvXoNUl408tWc9+0ief3/7zTGrD4Sey58AgoybsAd+b1hDy9viqpKDO
 qnLnJKyhJH+/7WmVAQpQTrNRIBHm5kKo2UAF+PkKsBYd0+QavF9aN9hRDsmbgFOw5nLy
 C8OdvqJmCNdDmDUgTthz7QZXaiEWlUVbFJAFQU2x+THVi0ji6cgt2kDXG0YkzXqw/yqM
 FqQdhl2YPps5UDVtUTAXlkdIKOKjFhH0yEhsIHhqiiDwI38F354c+mLiRh775UBbG4wC
 6Dyg==
X-Gm-Message-State: AOAM533zt3eoFEbzjkRB4Tn2XOxNA56ImFk5bcxlSKoS0bMXJDo1IpBg
 DxHmKdsS2berrShpqpuYSNoI87/nJPKTaA==
X-Google-Smtp-Source: ABdhPJwUdtn8FPHsgPLDfRXhNgP5au03A+ohnJgG/CdeqO3IVHc2fVElPasDRG4gX88BtX2GM/+afw==
X-Received: by 2002:a17:90b:1091:: with SMTP id
 gj17mr6452262pjb.129.1622072848675; 
 Wed, 26 May 2021 16:47:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id g13sm285355pfi.18.2021.05.26.16.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 16:47:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/31] cpu: Move AVR target vmsd field from CPUClass to
 DeviceClass
Date: Wed, 26 May 2021 16:46:59 -0700
Message-Id: <20210526234710.125396-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526234710.125396-1-richard.henderson@linaro.org>
References: <20210526234710.125396-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

See rationale in previous commit. Targets should use the vmsd field
of DeviceClass, not CPUClass. As migration is not important on the
AVR target, break the migration compatibility and set the DeviceClass
vmsd field. To feel safer, increment the vmstate version.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210517105140.1062037-14-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/cpu.c     | 2 +-
 target/avr/machine.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index 37a8ebcc86..3353bcb9fc 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -213,7 +213,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
-    cc->legacy_vmsd = &vms_avr_cpu;
+    dc->vmsd = &vms_avr_cpu;
     cc->disas_set_info = avr_cpu_disas_set_info;
     cc->gdb_read_register = avr_cpu_gdb_read_register;
     cc->gdb_write_register = avr_cpu_gdb_write_register;
diff --git a/target/avr/machine.c b/target/avr/machine.c
index de264f57c3..16f7a3e031 100644
--- a/target/avr/machine.c
+++ b/target/avr/machine.c
@@ -98,8 +98,8 @@ static const VMStateInfo vms_eind = {
 
 const VMStateDescription vms_avr_cpu = {
     .name = "cpu",
-    .version_id = 0,
-    .minimum_version_id = 0,
+    .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(env.pc_w, AVRCPU),
         VMSTATE_UINT32(env.sp, AVRCPU),
-- 
2.25.1


