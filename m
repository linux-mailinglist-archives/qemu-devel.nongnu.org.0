Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8125851826F
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 12:38:41 +0200 (CEST)
Received: from localhost ([::1]:34090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlpvU-0007Ek-8v
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 06:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqt-0003yn-H8; Tue, 03 May 2022 06:33:56 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:50705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1nlpqr-0003fM-0s; Tue, 03 May 2022 06:33:54 -0400
Received: by mail-pj1-x102c.google.com with SMTP id iq10so14978563pjb.0;
 Tue, 03 May 2022 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2cK9QMjyJBK9LE5fBjUDlyQq92UtB2If4iM6Ue3ErBI=;
 b=mpwln3uBHIzZMVpluWOVkdNAjP23naHlk/LpmmKk6jPbQ0XQSOMyZRlaMfReNpOPgj
 corDQV77nS+dmUiDrxcPqBQLl2xfOqOlf6wJHvmisA/9237RYQD7vh9Zv9Y2wDh7nQuf
 hrS5jNA+HSpw1BKbr42qM7CQrqEQDuvzPh3/JAGSEfl+DBQFiXijqI4c9lSnUYu5SIDx
 1DVhv0DHW2+4AWrn+TOVv5V1K1htq45aogC4jSuJ/0EjwoIUvQRQj/nldtTfUY9BWRkE
 kWkxpdX/ZgUoDJmzh3P+noyrj9JLY+3DE18ArN5clx4ySihzMz6Ijiq67b7nV2KER+bO
 +IwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2cK9QMjyJBK9LE5fBjUDlyQq92UtB2If4iM6Ue3ErBI=;
 b=X3VXl56bwqZ1uCroBEn8nmF2zybsWEqFdpIQ96ItcJyEl4SdkIodMe7EV7dJ2OFKrA
 2BqRNTPncXn2aBBS0RgQL1w7VpLKDzFY+GBuRgMGxUJ3tmpEm0QN6GOc7swI6ASoqIyu
 QLMqU/mtblsMCfYhScKgqJsitqDDIbaN9mqNs2ZKZVHdnG5lRUNO2hfe+j6vIiVIHtqH
 ES247MOwobsXVDFFnw6+a/0JsGQBuwlIHeFm0CVTDi+LjEBVzzBuhXnqTNGV+pJ4Jbth
 G338HN50Dug0/jnAaacupimH1HKhdqeWEVI64xPBCwvDu53LRMgIZ+DYoOh131hNlJ/A
 hO0A==
X-Gm-Message-State: AOAM531BvPihdMtqHc9mlT7BtcRgTEqiVijUiOVBOkau8udePHiND3G5
 Y9XIO3Fh4H0G2WDuF5r6YE1G8TUFZxcksA==
X-Google-Smtp-Source: ABdhPJypfe+sTDxD5QFS7mhbwzJh/J0bFM0n2XjzyjgCqTUuEiEUiuIxPzfjcxKjlCx1+fLywZ3OZA==
X-Received: by 2002:a17:90b:3503:b0:1d1:c700:e484 with SMTP id
 ls3-20020a17090b350300b001d1c700e484mr3927997pjb.245.1651574031037; 
 Tue, 03 May 2022 03:33:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-108-62.tpgi.com.au.
 [193.116.108.62]) by smtp.gmail.com with ESMTPSA id
 x48-20020a056a000bf000b0050dc76281dcsm6056301pfu.182.2022.05.03.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 03:33:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] tcg/ppc: Optimize memory ordering generation with
 lwsync
Date: Tue,  3 May 2022 20:33:33 +1000
Message-Id: <20220503103334.2046414-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503103334.2046414-1-npiggin@gmail.com>
References: <20220503103334.2046414-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

lwsync orders more than just LD_LD, importantly it matches x86 and
s390 default memory ordering.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 target/ppc/cpu.h         | 2 ++
 tcg/ppc/tcg-target.c.inc | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index c2b6c987c0..0b0e9761cd 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -28,6 +28,8 @@
 
 #define TCG_GUEST_DEFAULT_MO 0
 
+#define PPC_LWSYNC_MO (TCG_MO_LD_LD | TCG_MO_LD_ST | TCG_MO_ST_ST)
+
 #define TARGET_PAGE_BITS_64K 16
 #define TARGET_PAGE_BITS_16M 24
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 3ff845d063..b87fc2383e 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -1834,7 +1834,7 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
 {
     uint32_t insn = HWSYNC;
     a0 &= TCG_MO_ALL;
-    if (a0 == TCG_MO_LD_LD) {
+    if ((a0 & PPC_LWSYNC_MO) == a0) {
         insn = LWSYNC;
     }
     tcg_out32(s, insn);
-- 
2.35.1


