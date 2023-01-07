Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C01660CD7
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 08:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE3zP-0003iE-Pn; Sat, 07 Jan 2023 02:51:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zG-0003eP-7H
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:31 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pE3zD-0004Ao-2q
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 02:51:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 l1-20020a17090a384100b00226f05b9595so2111041pjf.0
 for <qemu-devel@nongnu.org>; Fri, 06 Jan 2023 23:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3O5Ms/RtpTraGLeGvCx1Y/nQAb5S+FqNP9jL5oxLexo=;
 b=HicwfyeXjZE7cdKrE90Z3AXtdlYNPSVj+vru/RNVnIjQUTDgjJzpdgXA/Qa08y7BVn
 76Vy3yj85zL0NSXU4Y9ZkSRlgkTrAeIQy/XMx9Mq9/cOUaL9NE3PGTF5Rc6Tbaye/Rt+
 qZLwGvVnC70/IYm8qIO23A249YhemxzEKDnhWnbeAQMT643AsuwJl4ra5cFvlhHaiutd
 vKbpyKcicBiTYk6lAs394psfmXE/iOYKsar1sTQFCqD80EhFxp2SYtVmYTSfENTXYC9N
 +hwpc09fzUsRPIMLCivwJAr+IghwrGNyXR8GjwHurmd6Hi3GpC6u4sGc0KK+MMdni18l
 uX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3O5Ms/RtpTraGLeGvCx1Y/nQAb5S+FqNP9jL5oxLexo=;
 b=TNrZZRHCbpRk/w+Uk1wt70opdWeVfGHoPQFtpzk0OYT+9vAth3KZyqSFUa4/deyqNq
 TMsri0OgBog6H/i405eLBLuhq9rv/Bw+JM/DIbWo24sZARjCDyme6eaRXd8SoqyRm+kC
 U4Fs4HtOkRRjB+M4G0mRjmdoA8gkWtD+Gg4LmjfNqRtxdW39Sso+0tE6j3VLKlGbUbQp
 QeB89ydHuDUJkpVptavp/Sm571vRCYlGdkRvuOh014X97/uZ5qBl991aBGoAlwXDTjgr
 a/eO0/bCs1+vog8WwMLvzxI/dZJe50PcYluwkPPg5QqrY9yEhbKU6qpmdtdGnMNAmH7l
 HyUA==
X-Gm-Message-State: AFqh2koXuQkmyja8oX3fJmK84SBbqsXWQK4G0YPTsklLDBTq3ozjLJ87
 3xs2yy2elSolfu16KQeeAUSyAuVRl3H0Bm/2
X-Google-Smtp-Source: AMrXdXuuNRVnuBNAT6jlrtwvsAj2YJ5KYQtVH1NFSmnQ44CYWDvbkDDSx09WzmdPXfK9Y3JL1BZfFQ==
X-Received: by 2002:a17:90a:de04:b0:226:c0ff:20f6 with SMTP id
 m4-20020a17090ade0400b00226c0ff20f6mr10353991pjv.16.1673077884793; 
 Fri, 06 Jan 2023 23:51:24 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:9d81:5b04:51d7:acae])
 by smtp.gmail.com with ESMTPSA id
 bj5-20020a17090b088500b00212e5068e17sm1945119pjb.40.2023.01.06.23.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 23:51:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 05/27] tcg/s390x: Check for long-displacement facility at
 startup
Date: Fri,  6 Jan 2023 23:50:56 -0800
Message-Id: <20230107075118.1814503-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107075118.1814503-1-richard.henderson@linaro.org>
References: <20230107075118.1814503-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

We are already assuming the existance of long-displacement, but were
not being explicit about it.  This has been present since z990.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.h     |  6 ++++--
 tcg/s390x/tcg-target.c.inc | 15 +++++++++++++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/tcg/s390x/tcg-target.h b/tcg/s390x/tcg-target.h
index 645f522058..7f230ed243 100644
--- a/tcg/s390x/tcg-target.h
+++ b/tcg/s390x/tcg-target.h
@@ -52,11 +52,13 @@ typedef enum TCGReg {
 
 #define TCG_TARGET_NB_REGS 64
 
-/* A list of relevant facilities used by this translator.  Some of these
-   are required for proper operation, and these are checked at startup.  */
+/* Facilities required for proper operation; checked at startup. */
 
 #define FACILITY_ZARCH_ACTIVE         2
 #define FACILITY_LONG_DISP            18
+
+/* Facilities that are checked at runtime. */
+
 #define FACILITY_EXT_IMM              21
 #define FACILITY_GEN_INST_EXT         34
 #define FACILITY_LOAD_ON_COND         45
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index dea889ffa1..1fcefba7ba 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -3211,6 +3211,7 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpcode op)
 static void query_s390_facilities(void)
 {
     unsigned long hwcap = qemu_getauxval(AT_HWCAP);
+    const char *which;
 
     /* Is STORE FACILITY LIST EXTENDED available?  Honestly, I believe this
        is present on all 64-bit systems, but let's check for it anyway.  */
@@ -3232,6 +3233,20 @@ static void query_s390_facilities(void)
     if (!(hwcap & HWCAP_S390_VXRS)) {
         s390_facilities[2] = 0;
     }
+
+    /*
+     * Check for all required facilities.
+     * ZARCH_ACTIVE is done via preprocessor check for 64-bit.
+     */
+    if (!HAVE_FACILITY(LONG_DISP)) {
+        which = "long-displacement";
+        goto fail;
+    }
+    return;
+
+ fail:
+    error_report("%s: missing required facility %s", __func__, which);
+    exit(EXIT_FAILURE);
 }
 
 static void tcg_target_init(TCGContext *s)
-- 
2.34.1


