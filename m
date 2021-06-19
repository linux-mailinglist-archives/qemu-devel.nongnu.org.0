Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A119D3ADB25
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:36:54 +0200 (CEST)
Received: from localhost ([::1]:34574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luetp-0006c9-O3
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejw-0003g8-15
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:40 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:45948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejt-0003cq-TT
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:39 -0400
Received: by mail-pf1-x429.google.com with SMTP id k6so10268802pfk.12
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v8CiO3nSkXbT0WhEZ00oCKiNO74Wj3K+LBYSZKxDzQk=;
 b=a60ao3DebrBOIqT41FxhejwwcY/LtElXJ0RCsU0qFxL77fE8buGmBybmX/sl8WReHM
 nkofI/nzJpkR7C4lzGfyzUcXHk5kJNC1uqvqgfpLSr2URrkcizSEmzSK6QKwDJh4b8gn
 Ku3wZ5wcBRYdqIsuOYaw4B7cIdYKL6xxGqw/Xx6S/rTk19CPe8LbtuX4Vxh5ytknGnBX
 Qp+d7O9uoyLInxOko6tzsy/rFAzmK3KL12IABCVJJvCgdyiUy4FJZh53SBWwtcA1WwLD
 wpBhE9oHpOeRbzakW+VgBet0cRsun13PH2RLWK9oa4yWePL2seiwSbJBjM063xDW61Go
 qY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v8CiO3nSkXbT0WhEZ00oCKiNO74Wj3K+LBYSZKxDzQk=;
 b=ucvcXZORu+sEN9bQHAMlIe1FDmgiDWlKGtZzRAx7JQuzFraMFuBB3Pvsx1TSqXB4oq
 1rHar4YekhfE5U4Ea9JJISn00JhcTRf8CSpK3BpuMbrLYbsee9GVwT46oc6AaINhZQbV
 kWHZAxng08U08I19KN0whMLo9rCUt41xYFssQfzW8r2gTINXnXbXtCrhBqibB1MTnFRW
 o2/ejHEMHkL63HjFf9wShLgwmW8XRX12sZdnsZPHXZU7Z4y/jgq+aX3K9P8HL8266jKG
 qYp5msiMsGZpFnminLY8xyhnXWjlmpqzA81kCnIDfdtpf4CcAiRRdA4xUQxkpSitOzx3
 1o4A==
X-Gm-Message-State: AOAM530FL+q2OwoKoCxmEsVV8fC0ZVPQdu24R5w7RRPe+y4aQPINlEot
 S0lmBPlo52et8049hFWjpfcp8QQbLAX69A==
X-Google-Smtp-Source: ABdhPJy4PGy0jUjulSW0W318zuaY0RVerCQyjyFqHg7ZIubvkk83X9qCa619oGFcTYzHTaXw/wWSwg==
X-Received: by 2002:a05:6a00:797:b029:2f9:6ddb:9d5e with SMTP id
 g23-20020a056a000797b02902f96ddb9d5emr10840439pfu.35.1624123596697; 
 Sat, 19 Jun 2021 10:26:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] softmmu/memory: Disallow short writes
Date: Sat, 19 Jun 2021 10:26:24 -0700
Message-Id: <20210619172626.875885-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
Cc: alex.bennee@linaro.org, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Writes smaller than impl.min_access_size would require a
read-modify-write cycle, which could have side effects.

The present behaviour seems to be to extend the current write
to min_access_size.  While we could continue that, so far all
of the instances I have seen have been either device model
errors or the fuzzer intentionally doing bad things.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/memory.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7373d89600..2fe237327d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -548,6 +548,26 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     }
 
     /* FIXME: support unaligned access? */
+    /*
+     * Check for a small access.
+     */
+    if (unlikely(size < access_size_min)) {
+        /*
+         * Logically, we cannot support short writes without a read-modify
+         * cycle, and many mmio registers have side-effects on read.
+         * In practice, this appears to be either (1) model error,
+         * or (2) guest error via the fuzzer.
+         */
+        if (write) {
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid short write: %s "
+                          "hwaddr: 0x%" HWADDR_PRIx " size: %u "
+                          "min: %u max: %u\n", __func__,
+                          memory_region_name(mr), addr, size,
+                          access_size_min, access_size_max);
+            return MEMTX_ERROR;
+        }
+    }
+
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
     if (memory_region_big_endian(mr)) {
-- 
2.25.1


