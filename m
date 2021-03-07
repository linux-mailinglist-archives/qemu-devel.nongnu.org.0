Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930832FE5E
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 02:43:26 +0100 (CET)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIiS5-0006UI-7u
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 20:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNz-0002v8-Lq
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIiNy-0005OR-4F
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 20:39:11 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 mz6-20020a17090b3786b02900c16cb41d63so1208022pjb.2
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 17:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ghpdt26qcrbgy2OSaWqHre3TiZBxfghqLDZzAialyXE=;
 b=MNscHIEQGcvkYYMLI8SjIicZ2GDIWV0rzHcuu7oc7jr6pCA0dLsS8bQVXQIgzIIsE+
 EKKY1G+qxbyVEI2pC4FkTDeF9QlWm6Vi+27ygBnqdq9ilglpZ4ztWRUxZFNKxhSq59bS
 9VSx6vNOyvQ75WI4407aAKwjVpg+9UNv9n2VpqT2MkCJDGzR4c8HT4so+JrDu0ZqZ1P8
 ljYbs/cp4h6inHbYscth5xcv2edepHl0Lkp9ExebXcUfQVP234h1dzdB9jb734H5p3md
 hJEa6lPhrq32lxFPJxF5+PWZskHfs2kVk9S9tNCGp4R8QYdA3kFU5LZVj4Fnzj59qzw0
 7jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ghpdt26qcrbgy2OSaWqHre3TiZBxfghqLDZzAialyXE=;
 b=b4yQysnZMkfvWs284e30wKvtxDri62DEMANi33qcR2Yjucg+er+0ARejWHO/YhhEcd
 D+ezTCPW52rl3EEU+CUqtqXpaMo9J3Toenjj/R6A+byLhDcYl4JfAx1mwFxkvNV+5z+Y
 wqjCubwwDEnZSRrkIGeRSq8drn2AuEfe7h8NWalt7Oxal336kuJBJHrSAsedTFXw14Tq
 KhfvRdRpeZC/hBy9HHzy9M69hs5MQTtYroVPwXzoVYU5N7kZMrfVIjRJzaxaWlmIudgP
 KpkOBWvItg05xWw1z5f0iYXqDJyDiFSZyL/s+rp6Q5wPCCg1bia3CZoU37GVxMKYVpJ3
 rmPA==
X-Gm-Message-State: AOAM531m+o7pr6Etv5akxQlv3ngUoAiFNz+oFQ9BpA8lftC1O9wPecC1
 cU6S5R/2lrP8dfhIvwmlslqD/r9EVtwLzQ==
X-Google-Smtp-Source: ABdhPJyIM9JpOrV118HCeMyrP57xtdCSe1QeIdh+svrgpADI4wX7aRMjZbAIcI1+E/G2/1b46y9LZA==
X-Received: by 2002:a17:90a:d682:: with SMTP id
 x2mr18564431pju.139.1615081148649; 
 Sat, 06 Mar 2021 17:39:08 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id v14sm6518044pju.19.2021.03.06.17.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 17:39:08 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] target/hexagon: Fix shift amount check in fASHIFTL/fLSHIFTR
Date: Sat,  6 Mar 2021 17:39:04 -0800
Message-Id: <20210307013905.115019-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210307013905.115019-1-richard.henderson@linaro.org>
References: <20210307013905.115019-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Fixes: a646e99cb90 ("Hexagon (target/hexagon) macros")
Eliminate the following Coverity CIDs (Bad bit shift operation)
    325227
    325292
    325425
    325526
    325561
    325564
    325578
    325637
    325736
    325748
    325786
    325815
    325837

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1614879425-9259-1-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/macros.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/hexagon/macros.h b/target/hexagon/macros.h
index 78c4efb5cb..cfcb8173ba 100644
--- a/target/hexagon/macros.h
+++ b/target/hexagon/macros.h
@@ -459,7 +459,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
                    : (fCAST##REGSTYPE##s(SRC) >> (SHAMT)))
 #define fASHIFTR(SRC, SHAMT, REGSTYPE) (fCAST##REGSTYPE##s(SRC) >> (SHAMT))
 #define fLSHIFTR(SRC, SHAMT, REGSTYPE) \
-    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
+    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##u(SRC) >> (SHAMT)))
 #define fROTL(SRC, SHAMT, REGSTYPE) \
     (((SHAMT) == 0) ? (SRC) : ((fCAST##REGSTYPE##u(SRC) << (SHAMT)) | \
                               ((fCAST##REGSTYPE##u(SRC) >> \
@@ -469,7 +469,7 @@ static inline void gen_logical_not(TCGv dest, TCGv src)
                               ((fCAST##REGSTYPE##u(SRC) << \
                                  ((sizeof(SRC) * 8) - (SHAMT))))))
 #define fASHIFTL(SRC, SHAMT, REGSTYPE) \
-    (((SHAMT) >= 64) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
+    (((SHAMT) >= (sizeof(SRC) * 8)) ? 0 : (fCAST##REGSTYPE##s(SRC) << (SHAMT)))
 
 #ifdef QEMU_GENERATE
 #define fLOAD(NUM, SIZE, SIGN, EA, DST) MEM_LOAD##SIZE##SIGN(DST, EA)
-- 
2.25.1


