Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958D56239B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:56:31 +0200 (CEST)
Received: from localhost ([::1]:38746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70H8-0002mY-8M
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704P-0004S9-Oa; Thu, 30 Jun 2022 15:43:23 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:43597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704I-0006Eq-A1; Thu, 30 Jun 2022 15:43:17 -0400
Received: by mail-oi1-x22d.google.com with SMTP id q11so610008oih.10;
 Thu, 30 Jun 2022 12:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zv+C2hnaWWyTyoVtR4hGQ7SdZfWBqLliCJNNJg9zX4Q=;
 b=VGxrDckrSjxRqU6JKnV6y1pcHIQ58g1Xur8uCoHST1wc1XvxfUKSdDORt5oYpr4P32
 XdP+yxJo5L7DNPzZ4Kc7h46qfJpCiVPwOu8pZSPC1AgBP41AllvX9zKXbXt/APGM60tZ
 ZgjvLC53LtEBBX6B9hYliTXNXT3XaycHocaWmilyF+DM7DfVltes+E3dTlBnYqySPmzK
 2AcWg/SZg88+0PW3TWirS7R2r4UZebMH5M51NdU6TQqPn5sFj+dDHpp4zUo0PPQWz1Ws
 7y8MTnyztwgg75lK5nJiXV0f1he5xoQJ4CJJTSIudHk5dzmW53pvRZ1eCvKw9LCU0KXD
 ga8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zv+C2hnaWWyTyoVtR4hGQ7SdZfWBqLliCJNNJg9zX4Q=;
 b=0TIDw15sg+hY2so2rEbYJPlvQOhTEzURALaGh3JmDA3Zxa1fLMVJ1PKihYTrbyJmJ6
 CmABFQ2FEUAQ6D4x4J6+CNN3vPVG+wPNO+dQZ8M91MVdPockABIzBEQs28A/rIw46GWd
 H3oXtuhWc57qlQZqDOkhryNqVNIjhe1sae6oXRhldepkeIg1bM3ENMzKulwmAhbVtMRH
 vR6+pNVsZkkoUE5qPhEPqUREC1+CvdZi8Msz2ozfPxoYIIHk1geJmzgHINiA2cNsSwO8
 tT8xopno9Td43E61AmJNPypsKQhQcDrrsVUHIxL8+6Y+Ip5W9zcdt+rELCNVb+pApTCq
 3Ndg==
X-Gm-Message-State: AJIora8Q7EPxUUMwMZJ0e99IX/kMqUhTooBxFCcgF0NO/6jNVqIPdFsQ
 9rJeGmOE3oPs+iB6JzDlNqeSU7b6UaE=
X-Google-Smtp-Source: AGRyM1uwMOTaouOPVRQSSGOhxaCpCcBDyJGfLYaJRTWWdQ67Bbqy6lwkXtaUIH3W2tXhfre0QG8Yzg==
X-Received: by 2002:a05:6808:170c:b0:335:1d14:f99d with SMTP id
 bc12-20020a056808170c00b003351d14f99dmr6086253oib.243.1656618192349; 
 Thu, 30 Jun 2022 12:43:12 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 2/9] target/ppc: add errp to kvmppc_read_int_cpu_dt()
Date: Thu, 30 Jun 2022 16:42:42 -0300
Message-Id: <20220630194249.886747-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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

The function can't just return 0 whether an error happened and call it a
day. We must provide a way of letting callers know if the zero return is
legitimate or due to an error.

Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
with an appropriate error, if one occurs. Callers are then free to pass
an Error pointer and handle it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 109823136d..bc17437097 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1925,15 +1925,17 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
 /*
  * Read a CPU node property from the host device tree that's a single
- * integer (32-bit or 64-bit).  Returns 0 if anything goes wrong
- * (can't find or open the property, or doesn't understand the format)
+ * integer (32-bit or 64-bit).  Returns 0 and set errp if anything goes
+ * wrong (can't find or open the property, or doesn't understand the
+ * format)
  */
-static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
+static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
 {
     char buf[PATH_MAX], *tmp;
     uint64_t val;
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
+        error_setg(errp, "Failed to read CPU property %s", propname);
         return 0;
     }
 
@@ -1946,12 +1948,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
 
 uint64_t kvmppc_get_clockfreq(void)
 {
-    return kvmppc_read_int_cpu_dt("clock-frequency");
+    return kvmppc_read_int_cpu_dt("clock-frequency", NULL);
 }
 
 static int kvmppc_get_dec_bits(void)
 {
-    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits");
+    int nr_bits = kvmppc_read_int_cpu_dt("ibm,dec-bits", NULL);
 
     if (nr_bits > 0) {
         return nr_bits;
@@ -2336,8 +2338,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
 static void kvmppc_host_cpu_class_init(ObjectClass *oc, void *data)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_CLASS(oc);
-    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size");
-    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size");
+    uint32_t dcache_size = kvmppc_read_int_cpu_dt("d-cache-size", NULL);
+    uint32_t icache_size = kvmppc_read_int_cpu_dt("i-cache-size", NULL);
 
     /* Now fix up the class with information we can query from the host */
     pcc->pvr = mfpvr();
-- 
2.36.1


