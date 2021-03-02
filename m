Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C74132A90F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:13:47 +0100 (CET)
Received: from localhost ([::1]:50606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9Wk-0000xs-95
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:13:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Ho-0003Il-NO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:23 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hg-0007dI-L3
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:14 -0500
Received: by mail-pg1-x534.google.com with SMTP id a4so14325479pgc.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOf1cOZjDd8LNAISdQKRprouUUYWtBc1pn+qViLGVw8=;
 b=PT4FxuaYl1otNlvVZDjG/wvJmuFdsVUmN7BsDAL/c6t5SPAqE55UYXDAVGOtP+iHAp
 ShQkPDhzlb9rr7TBefKAfgpRqltUaxZLrmtxpp5hijnHApBJGQJM6TT7BIvIv2uzY1y5
 GUPD1cz8u2Hi/RhKLz0iEYw0aUzCaUbCiB0G8Ue09BMpKAzzrh02+88bPFAOq4P4/O2K
 DdpauTf4ayJN7Abw3p6VgsR5j3DxYGJXCi4eLKznBjJGaOnnLhHKmMDAkVUgxXyLchoj
 ZBtk57EwxAqTVguGVUMx+MZTEWBLQvFYR0DhOz0RAVtAGUKPp8BT9pzMl41lkixm6sT8
 D5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOf1cOZjDd8LNAISdQKRprouUUYWtBc1pn+qViLGVw8=;
 b=h6VJYTpRH6hOXtZT/9TAu1f1fvmsgjG0F57e0ECDDTlrCkOIkJ2xSPDxj3QQpm94tS
 mmzJa1Wx5Epc/Qins/UaZ5RrfoEqmPt1LfA63hHQ1ctkJnMXqWndrsb0S10plaBth0dK
 Kxhqh/kxV+xxXu4x73covkEysPI5Bl2YngW0xs8W6ZHyL+QxqxELTzpl47mQ8sj8r6+N
 Np7B+1azKHdJfyjl7DmcV2pplR1b2xiEW1qq/R582SFjlqQ1xIBbpJekn4jPyTEDJTER
 m/bIBPhmzJvfuG/3vpDH6iR1V1P2YPLghe28fJTtk8OHrKK/SoOrwRti0MbsHNGNN90B
 KlnA==
X-Gm-Message-State: AOAM531pDmfKCpBn7BHG4BpaFQucdx10u7POQd0D5zLVe29vmLASaoua
 U6sGLwCYbrB/7dnpBgkbhC71lAPDjvkbLw==
X-Google-Smtp-Source: ABdhPJwFTcvW4B7DWfrUelagSjR2Bqm8rdE8rIIx7eq8sKoL0gbG9phiYL1m5XQIV5rmE7JXHVr69A==
X-Received: by 2002:a63:f1d:: with SMTP id e29mr16527458pgl.98.1614707890626; 
 Tue, 02 Mar 2021 09:58:10 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:10 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/27] include/exec: lightly re-arrange TranslationBlock
Date: Tue,  2 Mar 2021 09:57:40 -0800
Message-Id: <20210302175741.1079851-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Lets make sure all the flags we compare when looking up blocks are
together in the same place.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210224165811.11567-5-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index acf66ab692..75f8c3981a 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -448,9 +448,6 @@ struct TranslationBlock {
     target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
     target_ulong cs_base; /* CS base for this block */
     uint32_t flags; /* flags defining in which context the code was generated */
-    uint16_t size;      /* size of target code for this block (1 <=
-                           size <= TARGET_PAGE_SIZE) */
-    uint16_t icount;
     uint32_t cflags;    /* compile flags */
 #define CF_COUNT_MASK  0x00007fff
 #define CF_LAST_IO     0x00008000 /* Last insn may be an IO access.  */
@@ -464,6 +461,11 @@ struct TranslationBlock {
     /* Per-vCPU dynamic tracing state used to generate this TB */
     uint32_t trace_vcpu_dstate;
 
+    /* Above fields used for comparing */
+    uint16_t size;      /* size of target code for this block (1 <=
+                           size <= TARGET_PAGE_SIZE) */
+    uint16_t icount;
+
     struct tb_tc tc;
 
     /* first and second physical page containing code. The lower bit
-- 
2.25.1


