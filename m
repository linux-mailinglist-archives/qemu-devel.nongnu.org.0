Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D3A56ADAD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:33:21 +0200 (CEST)
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Z7g-0002Oc-CY
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4u-0000Ho-Lu; Thu, 07 Jul 2022 17:30:28 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:35462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4s-0004gd-Mt; Thu, 07 Jul 2022 17:30:28 -0400
Received: by mail-vs1-xe35.google.com with SMTP id 189so19643128vsh.2;
 Thu, 07 Jul 2022 14:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XOredsu6SbX+k+sREA6mtNqWDsTUQkxRJJ/oY0tCG7w=;
 b=kHIwDjdP4iGtPuhOOQJmbV8p7lKrlcXNqpWiGhCO3dkIk+jERNqGJ1G9UhKPL4bbZ2
 z3/zrJvF5R51Tt+dLU+TpuIsVwRtQFYxnPXEXXdNT4JZeb7JgVEIHYmmonbJzOrdxIzI
 X093WGvULWSfEWC2AoaaDGZ5M3qd7USvYxOyJ57x0S/O9eDXQjvzXNmsVZGd/QhidcAF
 arXiRkHobd3LfuUFesh3h8u5vLgtyIFrlFwVB3bQvZJ5D8AJDxDxF9SDI0V6AHKC2uth
 4m2SKomCgOIiuZ2C/+0tVoxLW6a6RJMJkN7p79IbPU+w3YaWBisxEGVrY1wHDYwGPVfk
 UahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XOredsu6SbX+k+sREA6mtNqWDsTUQkxRJJ/oY0tCG7w=;
 b=B74pYKc4kmI+fN/Egrvm2I3fXBmYqwKoboEUnwGTP3EEfRa6bOINSDoWYPVTVVNlJe
 U1W6bOwhElRUMrXGEdfUyQxpEo9tjB9sU4lQO8TLW3rIzF/Eu7v5lkpqU7YICzs7WvrV
 Fikc6Qi/qWrzxdRoJhnONG34MSKXpuT7OTrU1T8qj0BfVLnFdfTtIDd1wi6Cn4EsdErV
 9S5/9cCeGxrRGuFH8MJg6xHz3LGFw8WLfz6Cbh13/AUoenYHeIKaRh9c5kRrEh2Bl0NO
 h1XG0b87aC6ZG7ctXfYNgC/ALKLjzVrsRVc7cPbxr2iE0MWeK/F2lk/yQRQHdtpL09vD
 5LJA==
X-Gm-Message-State: AJIora80JziKqRFEbtJ0iCy7Ytxn0H7LSF3r3gL0ZNm7kyonzU2FObPc
 BfgVrsEJvbV+zYC76r0D6eQC5r33+B4=
X-Google-Smtp-Source: AGRyM1uTAzIpUggWPLApzyFUPLNPfvzc6sEWOH47xWlvgj67xNr0GOgPHCsHlSp4M+x/NXB//RYhMQ==
X-Received: by 2002:a05:6102:a34:b0:354:4268:c2d4 with SMTP id
 20-20020a0561020a3400b003544268c2d4mr26784026vsb.21.1657229424446; 
 Thu, 07 Jul 2022 14:30:24 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 66-20020a1f1745000000b0036bfe74006esm12122103vkx.31.2022.07.07.14.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:30:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 2/4] target/ppc: enhance error report in
 kvmppc_read_int_cpu_dt()
Date: Thu,  7 Jul 2022 18:30:13 -0300
Message-Id: <20220707213015.552104-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707213015.552104-1-danielhb413@gmail.com>
References: <20220707213015.552104-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe35.google.com
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

First and foremost, the function can't return '-1' when an error occurs
because the return type is set to uint64_t. Let's fix that.

After that, the function can't simply return 0 whether an error happened
and call it a day. We must provide a way of letting callers know if the
zero return is legitimate or due to an error.

Add an Error pointer to kvmppc_read_int_cpu_dt() that will be filled
with an appropriate error, if one occurs. Callers are then free to pass
an Error pointer and handle it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 65d136ed5a..cf4610b6fa 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1926,20 +1926,22 @@ static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
 
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
-        return -1;
+        error_setg(errp, "Failed to read CPU property %s", propname);
+        return 0;
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp, NULL);
+    val = kvmppc_read_int_dt(tmp, errp);
     g_free(tmp);
 
     return val;
@@ -1947,12 +1949,12 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
 
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
@@ -2337,8 +2339,8 @@ static void alter_insns(uint64_t *word, uint64_t flags, bool on)
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


