Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9FF4CC70B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:27:41 +0100 (CET)
Received: from localhost ([::1]:42768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPs33-0000rl-1F
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzL-0001wV-WE
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:52 -0500
Received: from [2a00:1450:4864:20::32b] (port=38868
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001aF-97
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:23:51 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so4821838wms.3
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uXh/JEg5Ojwyym5i/HIshpVVO/CoNEWjAFuxDcAMKaM=;
 b=t0kvC9pLVwUMkJQ4I3iU4/DxiKZBqLj20I4aoau3o5xkZgwlCdfX2ZlTIRvHvQwfRF
 tEXJNPIWlWRJcBMltI6ueZSYuuCT7tVlUjbP3SlIa9GujD92TkSOqPa7v5Tm5/MBSgVY
 DGksTdMhOuabrknUVRT9F83S3AkafioBQ5FrGy0ntl7myl/8+ossWuhBMkygXHGeOO70
 NCEcExPJsnysQrkDrn2zAiAYyPF3w4vih+wWdCWsCB/CeC2EvvU9TfNXh0dRWuuccbwD
 5By4sgoegm2ZepJ6fO1e6Stf9H225tjpqPqIESF7nAJ73CAvYhgzSC1K/KEI8pvlkg1Q
 cqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uXh/JEg5Ojwyym5i/HIshpVVO/CoNEWjAFuxDcAMKaM=;
 b=mPnpumG5JlbfBE/F/v/M8JybwnX47+RhKl0BVy8LyCcBqWThFyuqKzzELzhfgY3VOe
 U/QHohWWqav1EjMy0hktk0r1u36MsK+/4qs+/9bsvvMxFw/7gjpM55phlTZje4HsnT4Z
 o7DrXT8o0V5nvFHyPfM1YnJ/KAj31M5jWJPAI6Q/+l25sKEtWHr95S1Efm9B2EIr6Kqm
 40Wc9+VhgzNw3QCyA8JN3KWhxo37yXzhd47OtGc7Djjt3+cDNVmBLHKXmt2aZMQJl/wO
 kO45wCENRdO4YFcYOKF5fu9T9q818zRFlXlzgHUoHEfpAoIvyBX4xtCSi/1iOc7QtCe+
 4vGw==
X-Gm-Message-State: AOAM533x463fi4uC8LiL5D3FlXsfQm2bRF/7lNRa2D424cWTHDw2vggw
 Se0xn7cEO+R3uaKr6dKlpNlsjwKN1LbAiw==
X-Google-Smtp-Source: ABdhPJw1hDvsWIdNpZlB2zaI0HTZKKFVPKjfbn6B6fawSKBkqqAN1+WWDKS3Dq100jUAX7fqK69XbA==
X-Received: by 2002:a7b:c347:0:b0:37e:68e6:d85c with SMTP id
 l7-20020a7bc347000000b0037e68e6d85cmr5022675wmj.176.1646339027932; 
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 4/5] hw/intc/arm_gicv3: Fix missing spaces in error log
 messages
Date: Thu,  3 Mar 2022 20:23:40 +0000
Message-Id: <20220303202341.2232284-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

We forgot a space in some log messages, so the output ended
up looking like
gicv3_dist_write: invalid guest write at offset 0000000000008000size 8

with a missing space before "size". Add the missing spaces.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_dist.c | 4 ++--
 hw/intc/arm_gicv3_its.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index 4164500ea96..28d913b2114 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -838,7 +838,7 @@ MemTxResult gicv3_dist_read(void *opaque, hwaddr offset, uint64_t *data,
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badread(offset, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
          * so use MEMTX_ERROR returns from leaf functions as a way to
@@ -879,7 +879,7 @@ MemTxResult gicv3_dist_write(void *opaque, hwaddr offset, uint64_t data,
     if (!r) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_dist_badwrite(offset, data, size, attrs.secure);
         /* The spec requires that reserved registers are RAZ/WI;
          * so use MEMTX_ERROR returns from leaf functions as a way to
diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 9f4df6a8cbb..b96b874afdf 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -1313,7 +1313,7 @@ static MemTxResult gicv3_its_read(void *opaque, hwaddr offset, uint64_t *data,
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest read at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_its_badread(offset, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
@@ -1349,7 +1349,7 @@ static MemTxResult gicv3_its_write(void *opaque, hwaddr offset, uint64_t data,
     if (!result) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid guest write at offset " TARGET_FMT_plx
-                      "size %u\n", __func__, offset, size);
+                      " size %u\n", __func__, offset, size);
         trace_gicv3_its_badwrite(offset, data, size);
         /*
          * The spec requires that reserved registers are RAZ/WI;
-- 
2.25.1


