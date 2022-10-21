Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0443607421
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 11:33:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oloPX-0000a6-UK
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 05:33:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olmHX-0003Fx-Js
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 03:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHI-0003Ch-Gq
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:15 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olmHG-0005lv-UM
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 03:17:12 -0400
Received: by mail-pl1-x635.google.com with SMTP id p3so630944pld.10
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 00:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=o56kSLLBNoFLwbAZl/9+QyojBjnZvDdrCEmWB4pFQbqQchdoTaoYJtrYZ8SRJj483s
 8rWCrqwI38t/ySSTp/WgmRZ8MNUwC+0BqKCaNNxklIWVhK2YzvzBGtkHQiDFBpkNJTFq
 S583q8HDufFOMGDxB5ykaq1RYd5cS29jch4hPxXZclyandvA7PBR57fQgDAmBSRxr00W
 T/i/wNJf8aEbPf12hNPrKjT90nEgWZ2X4YCqZr4uj/QdEQX4YF/VZwviHdXcVkNy0GAZ
 zXwqByciq3f0aKxU71rKkAI2U98gWp7TGhZ/d4mUCaFGArInYrO6HtFY7pTMttAo+cG1
 Fk/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5vQArXkcT1RDMZRTO1vvTA3LiXCIJpRLbh9UK0Nx/ps=;
 b=Vcw5H8GqEkcfyvLsNFqdvx6vKqP3JcMOnDWz35liqV8vNqe1cpdYdURPrzPXUyQjFV
 k6iSqPiG7qVIa8f5qLZCRf7bJx0U+OQH52kIjFCzeIGRkel1ewLhDYIQqSoryxfCAP12
 UBbUorfPPRESp9yVp5JbXI4zrV7w7q9xQBYXxFCwy3HZQi+5dU038wawRPik1aNrC90B
 DN5R/Rgmt1ifKp34Ynp47LZJfn4HGgzSVUkv10WLXc+1z1Xda55xjSnjQkBZ8gqPybXV
 EpINyzZuULWkukkXrtEar3vjpjPAh6rdT8708/f+axdnHeGOtsDGRxHTESb6d+AXTU2K
 qenw==
X-Gm-Message-State: ACrzQf2FTse5V0DKRTIW2W+RNFPndID50xRprjXaNVgyYGc9ZTbe3XtZ
 Ufl+9y4zFPlV7DEqtl8QXA/T9yjiduBpLiIE
X-Google-Smtp-Source: AMsMyM6E+ZomfEvKVL2L+hTMTBuv5UCAnvoCRt2XdCs/PYZL8AO5AUh2QhFwfWca2yNQo/4D+ZEf8w==
X-Received: by 2002:a17:90a:4983:b0:20a:9509:8347 with SMTP id
 d3-20020a17090a498300b0020a95098347mr56055297pjh.101.1666336629452; 
 Fri, 21 Oct 2022 00:17:09 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a638c49000000b0041cd5ddde6fsm13003327pgn.76.2022.10.21.00.17.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 00:17:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/36] tcg: Introduce TCGCallReturnKind and
 TCGCallArgumentKind
Date: Fri, 21 Oct 2022 17:15:29 +1000
Message-Id: <20221021071549.2398137-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221021071549.2398137-1-richard.henderson@linaro.org>
References: <20221021071549.2398137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare to replace a bunch of separate ifdefs with a
consistent way to describe the abi of a function call.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tcg-internal.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 2c06b5116a..f574743ff8 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,21 @@
 
 #define TCG_HIGHWATER 1024
 
+/*
+ * Describe the calling convention of a given argument type.
+ */
+typedef enum {
+    TCG_CALL_RET_NORMAL,         /* by registers */
+} TCGCallReturnKind;
+
+typedef enum {
+    TCG_CALL_ARG_NORMAL,         /* by registers (continuing onto stack) */
+    TCG_CALL_ARG_EVEN,           /* like normal, but skipping odd slots */
+    TCG_CALL_ARG_EXTEND,         /* for i32, as a sign/zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_U,       /*      ... as a zero-extended i64 */
+    TCG_CALL_ARG_EXTEND_S,       /*      ... as a sign-extended i64 */
+} TCGCallArgumentKind;
+
 typedef struct TCGHelperInfo {
     void *func;
     const char *name;
-- 
2.34.1


