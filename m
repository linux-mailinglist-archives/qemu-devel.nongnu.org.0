Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286504D04C2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:58:54 +0100 (CET)
Received: from localhost ([::1]:40188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGhB-0008No-8r
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:58:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW6-0001tg-Vr
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:27 -0500
Received: from [2a00:1450:4864:20::432] (port=37885
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW5-0007lh-An
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id q14so8728712wrc.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GANdenYBNkwkak0rQWxlFry8Hc7CxTND/movhx4GhWc=;
 b=IKz0htit7869nNO9uEz6541f34HfujznBcbW+adLOt29A8h8YwkVg9eczAnQCHlLyl
 kcotL+qKhh7rgV7Iw0iM5/UkvCM2ljKMDAXhM2fuuhbbKL5gd+/AnFUWY84EZ9UErDfx
 m39W+nJqhSMHCCjOYUkjKZaCLRXLPu/9A7II3kPjOtxZBytD6E/Fay+XfoBemoYnlAf4
 MZ2JujxKEBbZlx++eXa9N5C2q74W5uWcdkxXa3hb/5ATmb4v1xT4hnx6zoOHk0B+dwsH
 sJq7B29Yenb4YbhA5HZApbx2RDavIn409Cr+k6ljXe7ZSXhC/dnM2V0CjbiIKrE2D2o3
 M5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GANdenYBNkwkak0rQWxlFry8Hc7CxTND/movhx4GhWc=;
 b=ND+W+04nP0ZUaD1p2/8cqKNKH5a+WpXFICXLCBAHCvNVK1R1jDcKFXPyT0Y1uHXzpd
 65dxrV3wBJcQBwta048m7F1hd+jHcufttqxg9Ecv0hAUMQmzOYkPNhsf5/F6m5wojl9s
 qxD2hT9VZV2WI/drldzyYbdFx6uJ4eJ6hZw7pK7tuPRVGEtH5HdNvwHrTZkFTwPOcXnA
 dZBSr8sWpkVZH5e152o+2SWv3WCUOvxCVgzkIYlRGLJSYm9Do3bwxIKH7wA2ZBbUf6w3
 UShnIg6bhJoZI3jSI3C6PBxs/X1RnK0T+jSqOIHkU/gDDTEIb3mn3ZuHQj6WR/RbylED
 JufA==
X-Gm-Message-State: AOAM5305/sh+P7h5oq4BnQgSyjEjPDLFjkLWwjO0m1/Vw52VU03qjF1L
 2+ZHUSOUi5+90cb43wmSVy4+2M6DjxB5jg==
X-Google-Smtp-Source: ABdhPJycSbHO1G3ys77xvSARk+BG4byZdwV+fnhvT4N7nzgj0xxI2MRg8iB7TRjhR0WSSxIyT7u8nQ==
X-Received: by 2002:adf:dc91:0:b0:1f0:728c:8faf with SMTP id
 r17-20020adfdc91000000b001f0728c8fafmr9151784wrj.287.1646671643781; 
 Mon, 07 Mar 2022 08:47:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/18] hw/intc/arm_gicv3: Fix missing spaces in error log
 messages
Date: Mon,  7 Mar 2022 16:47:05 +0000
Message-Id: <20220307164709.2503250-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220303202341.2232284-5-peter.maydell@linaro.org
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


