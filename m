Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23AD50BE69
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:13:40 +0200 (CEST)
Received: from localhost ([::1]:38520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwqh-0000sX-Rn
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:13:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWs-0000uC-MT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:11 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:35497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWq-0007G6-Tv
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:53:10 -0400
Received: by mail-pl1-x62e.google.com with SMTP id b7so12100774plh.2
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxknAb8WZp8/c3OBXmugT+dPS7TU38e5j5a7fcIuSm4=;
 b=IoymGMkaQHLkEE9DJgGqrb/WVJDXocJ8mKxYjwS/N/Ao2cu+rc8QbywJ+On1zN4UbS
 roaVfdnVLYN7Aoz4t5rvFSfS47WqgVZ5j7kGPabNiWt9EYNR0oWcp9FjQy48pu6xAXbF
 k3ynDJLCmhCYp/aZ/mAg3Pwt2v7xsPrnymh/TeVXHgW0dt7FuSGhFVIsdP2Ck5Y/GofY
 GoikMdeFmI99Q+1jvGlyK886MHAwJDF85VB6FwitXITxt7QJizGSzhwicyG9TUfVo6mw
 N/ddwhrnxJFQMBgA+fKZCNAl9C0aY8ek5JeV1wnYSc+eZ6oecjpoohkE7eNbPajO/hQc
 yQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxknAb8WZp8/c3OBXmugT+dPS7TU38e5j5a7fcIuSm4=;
 b=GQrN0h9wfTbx7e1NO3DS45VEBvNk+B/ozZoH0gWyBcRZuXorOcNrVXe2bjIMG2Ck3E
 JSX+Cxu0sHQYcUglRffd5xm7nUCdrsMHo1u+Xyf1km9vOyl4juTl9ij1YvV7F+tK3YTj
 bj6D4kNwEjxHxdb8zNGQ0zuvAHs5kkwngBsB7iJXc1b34y3ZP6Vpmrql99u6ja55f/KB
 qR42eLisrCj/03ht+rAJhOKvr/ekOW9yME66wANgkgc9NoaRjw5G6G9iZdBVG9n2CT3s
 Utwbbl7HZFLzLFXZFho75qyBRO+EGeE66P4LOzEdXq1Dy83DemSLotrVGnDXWjhJwbsj
 suGA==
X-Gm-Message-State: AOAM531ldf2FVzCS9hfiKQ1D2zoYsi9n/LAA4wpsHIKdEg9AS+nsvJPY
 yBizWDk8v54VZv1w0nywecbCrhvCHplNFngm
X-Google-Smtp-Source: ABdhPJzVnHWWKCxYz8GzBr7PECnKswcjN05aYvRw+sjH0LQCVRw61y/EZqsmwszJP7xPBzQcFpobYQ==
X-Received: by 2002:a17:902:8304:b0:155:d594:5c04 with SMTP id
 bd4-20020a170902830400b00155d5945c04mr5286451plb.105.1650646387729; 
 Fri, 22 Apr 2022 09:53:07 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:53:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 15/68] target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
Date: Fri, 22 Apr 2022 09:51:45 -0700
Message-Id: <20220422165238.1971496-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Split NUM_CORE_REGS into components that can be used elsewhere.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-3-amir.gonnen@neuroblade.ai>
[rth: Split out of a larger patch for shadow register sets.]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220421151735.31996-16-richard.henderson@linaro.org>
---
 target/nios2/cpu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 3198c17213..09dc38a4e7 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -56,9 +56,11 @@ struct Nios2CPUClass {
 #define EXCEPTION_ADDRESS     0x00000004
 #define FAST_TLB_MISS_ADDRESS 0x00000008
 
+#define NUM_GP_REGS 32
+#define NUM_CR_REGS 32
 
 /* GP regs + CR regs + PC */
-#define NUM_CORE_REGS (32 + 32 + 1)
+#define NUM_CORE_REGS (NUM_GP_REGS + NUM_CR_REGS + 1)
 
 /* General purpose register aliases */
 #define R_ZERO   0
@@ -79,7 +81,7 @@ struct Nios2CPUClass {
 #define R_RA     31
 
 /* Control register aliases */
-#define CR_BASE  32
+#define CR_BASE  NUM_GP_REGS
 #define CR_STATUS    (CR_BASE + 0)
 #define   CR_STATUS_PIE  (1 << 0)
 #define   CR_STATUS_U    (1 << 1)
-- 
2.34.1


