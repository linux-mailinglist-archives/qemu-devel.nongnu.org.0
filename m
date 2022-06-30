Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD75623B3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:59:09 +0200 (CEST)
Received: from localhost ([::1]:48026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70Jg-0001H8-If
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704c-0004X3-GJ; Thu, 30 Jun 2022 15:43:36 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:37398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704a-0006Ho-1k; Thu, 30 Jun 2022 15:43:34 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so182439otu.4; 
 Thu, 30 Jun 2022 12:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gqG1MrFnf/zoyVWbNAUhll06w1FbMzzB81I8IuFAfUI=;
 b=TBV/DNL7vAXB0aYyY0kB6ZiMRtZzFvHABURsaDhstYKdY7p41G2f4RmQLhCS3epOi2
 p8Jw3fPV36aCdNsmFp9NLuf0ggD4+hy3WYUBipALGSz0jmTTrT+HANRHgHTbWWhrTVRl
 xIA5XSWUzl9fokzTGVYThYthcb0m0E49dwBvspLnliXT4pdB52L21m79hvtWRYEHEzkx
 kTLhdhTgu3tKtHQUWyWhs9CmmCKbesecvyef8xhBQFKhSUOECGDMAVR3zMU48HxPHISX
 MMbdcDcOLXkCEoDuzRIb1RKqz/ujugG+CzJqJhHveVPIsYkQOk6JjvfmNCVEkhVsyD0L
 FeKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqG1MrFnf/zoyVWbNAUhll06w1FbMzzB81I8IuFAfUI=;
 b=Cvw4Q87XUTRT/tVAgvcijJUn0ULYogcOPKNZ0kxbpJd1ta5d/Ud0uOupxS0LxYT0cC
 H6dRivZ2yojRYs728HuwB2Wr0hPYXNEGeteivZdnH2zBhE1MNBS6sRFC5nKEqdQMQ8Dc
 tQ8aeShQEh85qtq0/9Wf1SE7AKinlz87GP0N/nq2+pk+YGHta+3UOJ+M9FVKrsWOhJsm
 pfUxF6Z4n0FPpS2KDb4hZujp8zKbpZU/INYpp5hUQ9/wCknqwB6429VRVMjSjbgj0T4r
 FpK1auXt2k5ZadwZVOArJDfkId3955noyQSZvKCXruQ83za4KM23bw0ECYaRU9rxx314
 +t1g==
X-Gm-Message-State: AJIora+nQrJPjtGVuOIicnkCfLE8dzsfmLEZASD1wD/rJnkg6ZzkETyI
 A6TNZW8FjLy6CCQGFikCXNf/pJ9l+G0=
X-Google-Smtp-Source: AGRyM1txGpHiHpeeeAkLc9KLB5fbBo3zGm2A5kC8+dfn1grm0aIN0g7OQRKCA1sQ2TJtpXBN3Hug3g==
X-Received: by 2002:a05:6830:128c:b0:616:e0e9:9009 with SMTP id
 z12-20020a056830128c00b00616e0e99009mr4949055otp.225.1656618208718; 
 Thu, 30 Jun 2022 12:43:28 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 9/9] spapr.c: handle clock freq read errors in spapr_dt_cpu()
Date: Thu, 30 Jun 2022 16:42:49 -0300
Message-Id: <20220630194249.886747-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Let's put the default spapr clock value in a SPAPR_CLOCK_FREQ for better
readability.

After that, make 'cpufreq' default to SPAPR_CLOCK_FREQ if
kvmppc_get_clockfreq() fails to read the clock from the DT.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr.c         | 12 +++++++++++-
 include/hw/ppc/spapr.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f66e3cbe38..80189c78be 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -654,7 +654,7 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
                        0xffffffff, 0xffffffff};
     uint32_t tbfreq = kvm_enabled() ? kvmppc_get_tbfreq()
         : SPAPR_TIMEBASE_FREQ;
-    uint32_t cpufreq = kvm_enabled() ? kvmppc_get_clockfreq(NULL) : 1000000000;
+    uint32_t cpufreq = SPAPR_CLOCK_FREQ;
     uint32_t page_sizes_prop[64];
     size_t page_sizes_prop_size;
     unsigned int smp_threads = ms->smp.threads;
@@ -699,6 +699,16 @@ static void spapr_dt_cpu(CPUState *cs, void *fdt, int offset,
     }
 
     _FDT((fdt_setprop_cell(fdt, offset, "timebase-frequency", tbfreq)));
+
+    if (kvm_enabled()) {
+        Error *local_err = NULL;
+
+        cpufreq = kvmppc_get_clockfreq(&local_err);
+        if (local_err) {
+            cpufreq = SPAPR_CLOCK_FREQ;
+        }
+    }
+
     _FDT((fdt_setprop_cell(fdt, offset, "clock-frequency", cpufreq)));
     _FDT((fdt_setprop_cell(fdt, offset, "slb-size", cpu->hash64_opts->slb_size)));
     _FDT((fdt_setprop_cell(fdt, offset, "ibm,slb-size", cpu->hash64_opts->slb_size)));
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 072dda2c72..ed579635ca 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -26,6 +26,7 @@ typedef struct SpaprPendingHpt SpaprPendingHpt;
 #define SPAPR_ENTRY_POINT       0x100
 
 #define SPAPR_TIMEBASE_FREQ     512000000ULL
+#define SPAPR_CLOCK_FREQ        1000000000ULL
 
 #define TYPE_SPAPR_RTC "spapr-rtc"
 
-- 
2.36.1


