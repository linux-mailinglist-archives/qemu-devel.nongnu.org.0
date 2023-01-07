Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24A660CE3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 09:01:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zO-0003hX-Vl; Sat, 07 Jan 2023 02:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zI-0003fL-0r
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:32 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zG-0004Bb-2E
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:31 -0500
Received: by mail-pl1-x62a.google.com with SMTP id g16so4046332plq.12
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pl6m9fDdisq4GmQDkEZFQS6azRJHS2Fs7LoduCza5oY=;
 b=c5Io0GZFYb5SM9ueisdezTKuETHkPzDUI+MQNYji5BamQkL1CtOlc5OrbaQ43UvAlC
 6n3onWfMRcps/4wjIy2wF6w8EEe8QzvL1U0lfskiRJF0u9ebdkInjL3kbzsXxw6gfmB8
 oZgTbJpKO6zKm6qp6dttn4JKA5sq/R22ZXfINdyCjM3MNx4r7M1nX9hvxKnJizHz4YN6
 K4LQdnomCFGz8HzhNiBt5+DMZoLR0YDmrTdmKQaKX32suipiauXNkBpsWcNJxGMxG9MG
 UyxqzFjdZckDq7JFbAAWhHdZ5eQJPZhE3c/yvxz8h5Hj2b7Oq6cCIKJN8425wNUYuyxM
 gkMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pl6m9fDdisq4GmQDkEZFQS6azRJHS2Fs7LoduCza5oY=;
 b=Kv/Nd9Kza+7MPsrYIvXpk63ev1+hLXUC3N7Q9bNtDKMuDTFHbV5+VFH9jMAw3PnTQ4
 X75fLf9RXR7M8xXyBTXp/elfHinpaP24MsfovoYBmrvJNE5NxCslwqqZFSFt7CTNb8h4
 ucIeSPFphVoh6YyjOCPsu9PslJQoHGfuX5tI7u2eDb6ff4jfAlS5ocR76nGfqv+9OYEF
 EvAaQm9v7pv1hC0BGUyRAQD9qYZl4BZ8g7JIk2bP1FNXxANfQHkTNMLrM2PQbCFWBG2c
 qpEaqJYEapPW4USxwJhb74IKdsmBVDCI1nK8ruQY96ISevQeYrtcTBwHWpNmMVMe9JZe
 31fg==
X-Gm-Message-State: AFqh2krCGzOPss8HxZK3VBgCRdaR8XbS+qygGFff5H6Zn36UkdFCzytR
 UmuG1RBqdQqMlDVXqZtmPc8SIgc0F3GhA7/3
X-Google-Smtp-Source: AMrXdXvai9F6OakcFg22/5z5tbayu1RxwqrjM6tZQ8/qQ8pPHFBLOlabrQVNEIp7bOWJ8700QTFctw==
X-Received: by 2002:a17:90a:f10d:b0:219:705c:7193 with SMTP id
 cc13-20020a17090af10d00b00219705c7193mr61191910pjb.11.1673077888590; 
 Fri, 06 Jan 2023 23:51:28 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 09/27] tcg/s390x: Remove FAST_BCR_SER facility check
Date: Fri,  6 Jan 2023 23:51:00 -0800
Message-Id: <20230107075118.1814503-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The fast-bcr-serialization facility is bundled into facility 45,
along with load-on-condition.  We are checking this at startup.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     | 1 -
 tcg/s390x/tcg-target.c.inc | 3 ++-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 31d5510d2d..fc9ae82700 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -62,7 +62,6 @@ typedef enum TCGReg {
 
 /* Facilities that are checked at runtime. */
 
-#define FACILITY_FAST_BCR_SER         45
 #define FACILITY_DISTINCT_OPS         45
 #define FACILITY_LOAD_ON_COND2        53
 #define FACILITY_VECTOR               129
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 29a64ad0fe..dd58f0cdb5 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2431,7 +2431,8 @@ static inline void tcg_out_op(TCGContext *s, TCGOpcode opc,
         /* The host memory model is quite strong, we simply need to
            serialize the instruction stream.  */
         if (args[0] & TCG_MO_ST_LD) {
-            tcg_out_insn(s, RR, BCR, HAVE_FACILITY(FAST_BCR_SER) ? 14 : 15, 0);
+            /* fast-bcr-serialization facility (45) is present */
+            tcg_out_insn(s, RR, BCR, 14, 0);
         }
         break;
 
-- 
2.34.1


