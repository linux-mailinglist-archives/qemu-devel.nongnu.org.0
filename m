Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD534953D3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:02:40 +0100 (CET)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAble-0004V0-Uy
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgL-00049N-HS
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:49 -0500
Received: from [2a00:1450:4864:20::32b] (port=55112
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgG-00039S-VY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:36:48 -0500
Received: by mail-wm1-x32b.google.com with SMTP id p18so11757650wmg.4
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/oscYornx9l41iZuVB3Pz+TVY1Yhhb7KSEf+uo+HW3I=;
 b=T8wKo8tWvkZ/iXTpVDWlTawFNQlajizhis3C6rZ0ltb+mRPu8+VOpOYCLfleZIB9Cu
 gAgYXKnYS60KOd4TmMyMVvKGZ1ExBK0K9Qap0OHKCa5UX4jvh0BE3+m7si8yPZSbaA3S
 4HCbfv3M6smcwKFv+qMie66bF3mOnHbJwO1btUHOhmNhmKTwU/49vPQIL730KPmrqhO9
 wEriW92UxltyfSnpROZeKWnxyieCk1ELZKmnEokDLvZjwicHpEJ78S1kXrIWwAlUMdjw
 7iHx4W13j3KJMkAo+W8Yndtg3tMW1T6mOS8SxcgF36suIsz3KF10PGszLdt3NPC2jzeg
 FSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/oscYornx9l41iZuVB3Pz+TVY1Yhhb7KSEf+uo+HW3I=;
 b=stjAsolNtHXpG4ziDrkzF19NPEBbIAN6rW6nTe4UzFFXDN8fEeJjFkr+35e7sqEgK3
 c0Neuz2Il/nGpCqbelw5qWg3sP86RHBkIhtXrFYM/21nMPTo4qV9O3rY33yAri90Ypv2
 yQtWZi1tNKVaqVwCSmMQqMgJlDHNFQMdL/PoDIQaXBu7+X8HitjJULBev5DX4jKS05qZ
 yQuSdYyYyqmWnL5E4UH+VTyaByd/C7sY82CTWBBcGFNzxS0LzGaMtWHaBx29D1NHvdo1
 TsVrVm0aVsypIPUSr1mKZkcQiu4C7UFv+OYu7xHVDYBrQJqhhaDpfGjtCYPLaRjVPBMs
 Xt+w==
X-Gm-Message-State: AOAM530h3TCEK4LrxpeXZyaFhJ/xMSF9vDywltok92XclEZgeCdSZVQN
 2H9EtzLKfKux81ChWaPgTj7BzQFmY55n1w==
X-Google-Smtp-Source: ABdhPJyvNqVJmbCMCDHanFvQkrrDPxtTORfrPL/MXfapZ3Zh9rSSVckbeM9phbH7ebljattT8ojjjA==
X-Received: by 2002:a5d:6d0d:: with SMTP id e13mr31898988wrq.634.1642682202794; 
 Thu, 20 Jan 2022 04:36:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.36.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:36:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/38] virtio-mem: Correct default THP size for ARM64
Date: Thu, 20 Jan 2022 12:36:04 +0000
Message-Id: <20220120123630.267975-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gavin Shan <gshan@redhat.com>

The default block size is same as to the THP size, which is either
retrieved from "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size"
or hardcoded to 2MB. There are flaws in both mechanisms and this
intends to fix them up.

  * When "/sys/kernel/mm/transparent_hugepage/hpage_pmd_size" is
    used to getting the THP size, 32MB and 512MB are valid values
    when we have 16KB and 64KB page size on ARM64.

  * When the hardcoded THP size is used, 2MB, 32MB and 512MB are
    valid values when we have 4KB, 16KB and 64KB page sizes on
    ARM64.

Co-developed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-id: 20220111063329.74447-2-gshan@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/virtio/virtio-mem.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index 04c223b0c97..1ca45336dc2 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -46,14 +46,25 @@
  */
 #define VIRTIO_MEM_MIN_BLOCK_SIZE ((uint32_t)(1 * MiB))
 
-#if defined(__x86_64__) || defined(__arm__) || defined(__aarch64__) || \
-    defined(__powerpc64__)
-#define VIRTIO_MEM_DEFAULT_THP_SIZE ((uint32_t)(2 * MiB))
-#else
-        /* fallback to 1 MiB (e.g., the THP size on s390x) */
-#define VIRTIO_MEM_DEFAULT_THP_SIZE VIRTIO_MEM_MIN_BLOCK_SIZE
+static uint32_t virtio_mem_default_thp_size(void)
+{
+    uint32_t default_thp_size = VIRTIO_MEM_MIN_BLOCK_SIZE;
+
+#if defined(__x86_64__) || defined(__arm__) || defined(__powerpc64__)
+    default_thp_size = 2 * MiB;
+#elif defined(__aarch64__)
+    if (qemu_real_host_page_size == 4 * KiB) {
+        default_thp_size = 2 * MiB;
+    } else if (qemu_real_host_page_size == 16 * KiB) {
+        default_thp_size = 32 * MiB;
+    } else if (qemu_real_host_page_size == 64 * KiB) {
+        default_thp_size = 512 * MiB;
+    }
 #endif
 
+    return default_thp_size;
+}
+
 /*
  * We want to have a reasonable default block size such that
  * 1. We avoid splitting THPs when unplugging memory, which degrades
@@ -86,11 +97,8 @@ static uint32_t virtio_mem_thp_size(void)
     if (g_file_get_contents(HPAGE_PMD_SIZE_PATH, &content, NULL, NULL) &&
         !qemu_strtou64(content, &endptr, 0, &tmp) &&
         (!endptr || *endptr == '\n')) {
-        /*
-         * Sanity-check the value, if it's too big (e.g., aarch64 with 64k base
-         * pages) or weird, fallback to something smaller.
-         */
-        if (!tmp || !is_power_of_2(tmp) || tmp > 16 * MiB) {
+        /* Sanity-check the value and fallback to something reasonable. */
+        if (!tmp || !is_power_of_2(tmp)) {
             warn_report("Read unsupported THP size: %" PRIx64, tmp);
         } else {
             thp_size = tmp;
@@ -98,7 +106,7 @@ static uint32_t virtio_mem_thp_size(void)
     }
 
     if (!thp_size) {
-        thp_size = VIRTIO_MEM_DEFAULT_THP_SIZE;
+        thp_size = virtio_mem_default_thp_size();
         warn_report("Could not detect THP size, falling back to %" PRIx64
                     "  MiB.", thp_size / MiB);
     }
-- 
2.25.1


