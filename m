Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 747483CEE18
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:26:10 +0200 (CEST)
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5am9-0000xc-I3
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5aiu-0003kD-0n
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:48 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:35701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5ais-0000kO-CR
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:22:47 -0400
Received: by mail-pf1-x42f.google.com with SMTP id d12so17779922pfj.2
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bSI7+FYoYzIRMvsyeEg3j2XXfVWM2GYuNosumX6OIpk=;
 b=etIlMujv0SwxfGrGEVLV30JDq1F12pC8c//fPzSLdieAZL/1xVuH3lvFtsylk7IkxN
 HyxTAnPTnH/HW970e1LXm2n7qrjdzd9HZ/tZ6cMazDOLVv5fiENJfJgvc+tQiyqqNPRK
 PK7er8rhdwcSQayvlJJRYTrygW4LoNeO2w8XNFd5GVokkMo4r+hT+wfiP+jOaQdqBZPt
 0LYPb8uMC4plrwv38imfd/g3F1NfXDLCokwAGwGIGo7CclXLh7uUY8LICcbkrNrzR7no
 u/EONKCc3xQ25npiWIHzFvLDtcgYXu8sTfZfwJgy4QhjKxsiGQCC2aDBVrw6UR29lwq7
 qY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bSI7+FYoYzIRMvsyeEg3j2XXfVWM2GYuNosumX6OIpk=;
 b=iqjj3iEexrl/LmsOz+FwNPBaT7UfjLu2TUlPPqGwF65zsL64p6OZwvAZgSQt0nwY2f
 UCvhftLAMYOUNCM71xlplGKG+eanaeZ41rwNzJHUFLS7QKZGKOSFGcNC98AxYO+ggNA1
 vIINmhNwkknYgQ3QCKwOGbF05pctM3NVFcHuLWchxzE3jj7xZeXauKxtf03tTkaI45ub
 f69nY3isEPbnhoF+AApSsUK1AK6+Igr4v5adL61hBsK/Hrrr8R02G0NBIHzOryMp46K+
 hzyVPVLHbhGLRpT5v+0JqzFJUptwtk7OXX6oQP/eizyMGdKSbgHNuYrF1VEyfYZMzzi5
 G81w==
X-Gm-Message-State: AOAM533hWDEnfI+/0e5xwOV987UC4Uvr+5+MSlZ4uqOcVglA3Bq9ggsF
 GTXaxjyZThdzmUGsXQj74k2coGYyuweAJQ==
X-Google-Smtp-Source: ABdhPJxGyvbPI1M9bQkDWtmZe9wkD6iME1An6pZH4PRF25UHNppFHGzp3umdzZ3KdpsOzg0gZaq3qQ==
X-Received: by 2002:a62:b413:0:b029:327:75dd:c8da with SMTP id
 h19-20020a62b4130000b029032775ddc8damr28015921pfn.34.1626729764855; 
 Mon, 19 Jul 2021 14:22:44 -0700 (PDT)
Received: from localhost.localdomain (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id e4sm25008434pgi.94.2021.07.19.14.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 14:22:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 v4 01/15] accel/tcg: Reduce CF_COUNT_MASK to match
 TCG_MAX_INSNS
Date: Mon, 19 Jul 2021 11:22:25 -1000
Message-Id: <20210719212239.428740-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210719212239.428740-1-richard.henderson@linaro.org>
References: <20210719212239.428740-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The space reserved for CF_COUNT_MASK was overly large.
Reduce to free up cflags bits and eliminate an extra test.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20210717221851.2124573-2-richard.henderson@linaro.org>
---
 include/exec/exec-all.h   | 4 +++-
 accel/tcg/translate-all.c | 5 ++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 754f4130c9..dfe82ed19c 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -492,7 +492,9 @@ struct TranslationBlock {
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
     uint32_t cflags;    /* compile flags */
-#define CF_COUNT_MASK  0x00007fff
+
+/* Note that TCG_MAX_INSNS is 512; we validate this match elsewhere. */
+#define CF_COUNT_MASK  0x000001ff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
 #define CF_MEMI_ONLY   0x00010000 /* Only instrument memory ops */
 #define CF_USE_ICOUNT  0x00020000
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 4df26de858..5cc01d693b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1428,11 +1428,10 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     max_insns = cflags & CF_COUNT_MASK;
     if (max_insns == 0) {
-        max_insns = CF_COUNT_MASK;
-    }
-    if (max_insns > TCG_MAX_INSNS) {
         max_insns = TCG_MAX_INSNS;
     }
+    QEMU_BUILD_BUG_ON(CF_COUNT_MASK + 1 != TCG_MAX_INSNS);
+
     if (cpu->singlestep_enabled || singlestep) {
         max_insns = 1;
     }
-- 
2.25.1


