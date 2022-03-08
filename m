Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEAF4D1129
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:38:45 +0100 (CET)
Received: from localhost ([::1]:36406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUQe-0007kU-Na
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:38:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU91-0005BP-In
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:32 -0500
Received: from [2607:f8b0:4864:20::530] (port=38856
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8z-0006Jn-W8
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:31 -0500
Received: by mail-pg1-x530.google.com with SMTP id 132so15683848pga.5
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ois2JoZ1sznM8822SyfVxQPmV9CSqStEGCSJaWikHEs=;
 b=gJdbN11Y6frWYAEA2OiUSlZTHPOV+1Oh64stV3JA50SQv7CrcMvmJvf/esq/1z681P
 mwNS0cwUvt8F7oWYElX4Et9QCWWAmiFUckunEWySMtxhLTG/6P3C310Ap9Tx2p23+9M5
 +vcJW8iopjajnBZh2KMnOpJvgLuhLMO3QnCknc/r4t2HkmW0iD8KBgxz2oBagoo1WhkE
 HTpmd0oYsryJLOPP7f1Ssw6nauP/YhYAXYsE44XmlqWFfuMCoRlFhN8YYmd0ypqnQLBk
 Dch1SrbNps7L3U0TteBpjOLa4KWpLKt6s87YDrhLKowVHRMh3JQLs+qFgl7Gr773ibAE
 N0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ois2JoZ1sznM8822SyfVxQPmV9CSqStEGCSJaWikHEs=;
 b=TA+ZDBtrS37VdMDl84zVXKFRFksdSUgr4y+zW+WyBl8NOWjifegaklvIW1+SJrXf/P
 6hTkChVAJX5Ttg+Z407cnfOSxmQoLwY/HiaPzRKuATn6yJn0PvVFjWs/FBZwmYQ8+5JK
 v7ut+bm6pYeFxpgClNoM+/XT8X1Bugr3X+YDENJDwrFlzaIGW0FFZnR5O3hC0SOGAW8+
 eExfEVsYxicyzoZbN+b0TWsf1K/NUrD2DoxFC6ychuoZzs0Z/paanStyNViidy08FXSN
 tFZRIxoISou10jNT0sTu5YCGuR2JB1TkcesMFQdeGFus/p8D7UfzGPOuys5k8BtGFf64
 skxw==
X-Gm-Message-State: AOAM530+HbvNQPdI3zNLT2/XRG2+zWGifk+b6SzQeyTCjlEj6AF8InU9
 9gXL8xix66ZJOnbelwQVsd7BnvPTBe4oqA==
X-Google-Smtp-Source: ABdhPJzpbf32BHjWhqnKQ1gxsN2FOYyAoUd5nmFWZuY51AF9PlftlDb/6Za1gkibWuhiT/xTBAq12Q==
X-Received: by 2002:a62:8085:0:b0:4df:443c:7227 with SMTP id
 j127-20020a628085000000b004df443c7227mr16942943pfd.34.1646724028262; 
 Mon, 07 Mar 2022 23:20:28 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/33] target/nios2: Use hw/registerfields.h for
 CR_EXCEPTION fields
Date: Mon,  7 Mar 2022 21:19:44 -1000
Message-Id: <20220308072005.307955-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sink the set of env->exception to the end of nios2_cpu_do_interrupt.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    |  4 ++++
 target/nios2/helper.c | 24 +++---------------------
 2 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index 26618baa70..35b4d88859 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -105,6 +105,10 @@ FIELD(CR_STATUS, NMI, 22, 1)
 #define CR_CPUID         5
 #define CR_CTL6          6
 #define CR_EXCEPTION     7
+
+FIELD(CR_EXCEPTION, CAUSE, 2, 5)
+FIELD(CR_EXCEPTION, ECCFTL, 31, 1)
+
 #define CR_PTEADDR       8
 #define   CR_PTEADDR_PTBASE_SHIFT 22
 #define   CR_PTEADDR_PTBASE_MASK  (0x3FF << CR_PTEADDR_PTBASE_SHIFT)
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 3c49b0cfbf..eb354f78e2 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -64,9 +64,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_IH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->exception &= ~(0x1F << 2);
-        env->exception |= (cs->exception_index & 0x1F) << 2;
-
         env->regs[R_EA] = env->pc + 4;
         env->pc = cpu->exception_addr;
         break;
@@ -83,9 +80,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->status |= CR_STATUS_EH;
             env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->exception &= ~(0x1F << 2);
-            env->exception |= (cs->exception_index & 0x1F) << 2;
-
             env->tlbmisc &= ~CR_TLBMISC_DBL;
             env->tlbmisc |= CR_TLBMISC_WR;
 
@@ -98,9 +92,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
             env->status |= CR_STATUS_EH;
             env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-            env->exception &= ~(0x1F << 2);
-            env->exception |= (cs->exception_index & 0x1F) << 2;
-
             env->tlbmisc |= CR_TLBMISC_DBL;
 
             env->pc = cpu->exception_addr;
@@ -116,9 +107,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_EH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->exception &= ~(0x1F << 2);
-        env->exception |= (cs->exception_index & 0x1F) << 2;
-
         if ((env->status & CR_STATUS_EH) == 0) {
             env->tlbmisc |= CR_TLBMISC_WR;
         }
@@ -140,9 +128,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_EH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->exception &= ~(0x1F << 2);
-        env->exception |= (cs->exception_index & 0x1F) << 2;
-
         env->pc = cpu->exception_addr;
         break;
 
@@ -158,9 +143,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_EH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->exception &= ~(0x1F << 2);
-        env->exception |= (cs->exception_index & 0x1F) << 2;
-
         env->pc = cpu->exception_addr;
         break;
 
@@ -183,9 +165,6 @@ void nios2_cpu_do_interrupt(CPUState *cs)
         env->status |= CR_STATUS_EH;
         env->status &= ~(CR_STATUS_PIE | CR_STATUS_U);
 
-        env->exception &= ~(0x1F << 2);
-        env->exception |= (cs->exception_index & 0x1F) << 2;
-
         env->pc = cpu->exception_addr;
         break;
 
@@ -194,6 +173,9 @@ void nios2_cpu_do_interrupt(CPUState *cs)
                   cs->exception_index);
         break;
     }
+
+    env->exception = FIELD_DP32(env->exception, CR_EXCEPTION, CAUSE,
+                                cs->exception_index);
 }
 
 hwaddr nios2_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
-- 
2.25.1


