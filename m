Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AF4363209
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:46:21 +0200 (CEST)
Received: from localhost ([::1]:45912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqtY-0004iG-4I
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpa-0007uE-Lt
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:53863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpY-0008D3-Pm
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id w186so11506388wmg.3
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7day9DhC61WQqaXafSI9VSAm85w5/UtVfa1WqeTXupw=;
 b=QbDNFdC3L8zX+Qk9Hk/Wk8i5E1dvv+J227eA9xmlaMO6LVl+NyUmMPRw/2RX99QPyr
 B0xGXJQPl+BEfnBre4aehoDKJgu1Zm4/QIJ5QdGkMzH4YeLgvT+lBQEXpngD0lYwl44F
 FbBOfQMkypTlyXLc3uwCEQDVu8W+4KKi8barw4dOz9xybi7TWNii3B1uIlzKix51/C6D
 pBvUAYIuvTm0Xt55gJHyirC4jHCFqRGwvDFJ0RUSidpBTt0vAC26Fvlf7cZrQdlJPdYh
 zAfEft8bnBri1vc+ZAOqU/4ADrWRUzIr9zu/9UQN8VFGB+hEw2JnIUewKVF/f5uB85zs
 4DyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7day9DhC61WQqaXafSI9VSAm85w5/UtVfa1WqeTXupw=;
 b=pk9qkSZwq6ShDKNVBeEdXYDe4BTsUF5Odl0GUUWD3IWhzY0USp5q/UxO4KEtQsSyHi
 CMzOXcX2b2TnTxzvEkJrZVB33wvSBhx+1Q1BQMza7EMgVclPFRwmfe4WyKhagj06tiVj
 WriFdNISw8QrMQpzCcGCkmsOqr83jajqWvlbFYQuVRlxUEz4nZ4LzwyXbs3m4hrU7PFi
 Nhvvl1M4DQO2zg5F0CLgyPI7nJ+fGd3HNQJvleP9ZGvAtw6crRv+YVeV3GIFuYhAM/ES
 jhOd+wJA3x+0BHaj3YY/GEJpKVT8PhP+nVzMTfMMhmS0/7dMOsWIaQWMnuahOdfutb0V
 8ScQ==
X-Gm-Message-State: AOAM5311LDMvt2qbb75XCT185THEIqK4u6ro04FBCZ5H4GfiWUfmBsp5
 tXXLTC9siGXNIgKNV/9GYkG5o69Wu1pTF+Om
X-Google-Smtp-Source: ABdhPJwvVAkrd6f6FzJf4DNM3y9t3ZFEHc0nwfFN3biafSZ0bwJtbX8scvP7a/+Wtl+G77SB+mWgVw==
X-Received: by 2002:a1c:457:: with SMTP id 84mr13589219wme.38.1618688531516;
 Sat, 17 Apr 2021 12:42:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] hw/arm/armsse: Make SSE-300 use Cortex-M55
Date: Sat, 17 Apr 2021 20:42:03 +0100
Message-Id: <20210417194205.17057-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SSE-300 has a Cortex-M55 (which was the whole reason for us
modelling it), but we forgot to actually update the code to let it
have a different CPU type from the IoTKit and SSE-200.  Add CPU type
as a field for ARMSSEInfo instead of hardcoding it to always use a
Cortex-M33.

Buglink: https://bugs.launchpad.net/qemu/+bug/1923861
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416104010.13228-1-peter.maydell@linaro.org
---
 hw/arm/armsse.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 170dea8632d..2e5d0679e7b 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -56,6 +56,7 @@ typedef struct ARMSSEDeviceInfo {
 
 struct ARMSSEInfo {
     const char *name;
+    const char *cpu_type;
     uint32_t sse_version;
     int sram_banks;
     int num_cpus;
@@ -501,6 +502,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_IOTKIT,
         .sse_version = ARMSSE_IOTKIT,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 1,
         .num_cpus = 1,
         .sys_version = 0x41743,
@@ -519,6 +521,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE200,
         .sse_version = ARMSSE_SSE200,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m33"),
         .sram_banks = 4,
         .num_cpus = 2,
         .sys_version = 0x22041743,
@@ -537,6 +540,7 @@ static const ARMSSEInfo armsse_variants[] = {
     {
         .name = TYPE_SSE300,
         .sse_version = ARMSSE_SSE300,
+        .cpu_type = ARM_CPU_TYPE_NAME("cortex-m55"),
         .sram_banks = 2,
         .num_cpus = 1,
         .sys_version = 0x7e00043b,
@@ -719,8 +723,7 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("armv7m%d", i);
         object_initialize_child(OBJECT(&s->cluster[i]), name, &s->armv7m[i],
                                 TYPE_ARMV7M);
-        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
-                             ARM_CPU_TYPE_NAME("cortex-m33"));
+        qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type", info->cpu_type);
         g_free(name);
         name = g_strdup_printf("arm-sse-cpu-container%d", i);
         memory_region_init(&s->cpu_container[i], obj, name, UINT64_MAX);
-- 
2.20.1


