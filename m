Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BA5692D4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 21:48:08 +0200 (CEST)
Received: from localhost ([::1]:49998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9B0J-0002g2-21
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 15:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akj-0003Hw-Tj; Wed, 06 Jul 2022 15:32:06 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:36422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Akh-00068D-MV; Wed, 06 Jul 2022 15:32:01 -0400
Received: by mail-vk1-xa33.google.com with SMTP id m188so7887410vkm.3;
 Wed, 06 Jul 2022 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SzbsEb73BXpa6gMReMERwR04DzXaL19I57Pb6iUf4nQ=;
 b=apcOFQq+4xEkK9wdWgih/1zrkO9JO9NoE/GlEDpglS+RKmy5jQnp1FfK1enHi1vIV8
 SQJko1iCfJQ/lRPJO6S2Vzlhegdb60c65icR4Xm3SYmKxqPN7wMTnBYh0IeopmY16lFJ
 gZsyoBKVfvaWb9nBM/dBcJtKAD5qfORN634LvtZFXd0/z+zrCBVrQidz4PzSpBfnCQIt
 HcyLVwdPz4R/uX+HFVff6uq4m/PiGr74rR0vUC7A1OwnJIRg/Mv9jAe8twrSk6c1Qf52
 L8VmBQO89zCJEsTISANlwTrnCjCWrwiplftKzq6Q9dQYPYe1mFTkHJvJiNkhsax14wIJ
 b6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzbsEb73BXpa6gMReMERwR04DzXaL19I57Pb6iUf4nQ=;
 b=StpjwfLmioFch/q27QQ9si53Ek3OZ0tetrbueoC9CjkXYQLZBrPhWcNRBml1XNurXP
 ji9ZQW5+CSC8Fg7kRBk2xCAP95Hc5naTgGdIkSt19jS/ntBkjw8H5dFd37R+AH9Pv0wG
 0czWQOO4jrn949UCl1iNk/l5uvEV+Hbx2c2QBSmuHhpPT4jbu5FQnzZzYG+GCTH0JZFE
 PZanVE3Z3bEcCW44HdJBNOs27jfn36OdZvWDRn0akc9KlffhbmekJGycLYc4fZfDrsMT
 kkxV7F7DcKabu8MlnqySHcdG3EWUdVb72zjct44mxGFOfubikjF48u/lSHumVve3mwaE
 Y5Eg==
X-Gm-Message-State: AJIora96DMcaklqLKqhxqIG1KgVcniK7A7kh/Beaxe1eOjgVYAm55D9k
 vZ4eaEkwamSGtecpRSC9THnjmesmjTI=
X-Google-Smtp-Source: AGRyM1ufTzoGbWAB1Ll21l0JwsFamZicXTrueKNTIPQVsSR5thH0W+yStsr3hwmdvlmC5rgsjzNApg==
X-Received: by 2002:a1f:3055:0:b0:373:f1e0:aa57 with SMTP id
 w82-20020a1f3055000000b00373f1e0aa57mr8563359vkw.36.1657135916528; 
 Wed, 06 Jul 2022 12:31:56 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 p2-20020ab01ec2000000b003828ebf6b49sm6034791uak.4.2022.07.06.12.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:31:55 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 4/5] target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
Date: Wed,  6 Jul 2022 16:31:39 -0300
Message-Id: <20220706193140.468009-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706193140.468009-1-danielhb413@gmail.com>
References: <20220706193140.468009-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa33.google.com
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

This spares us a g_free() call. Let's also not use 'val' and return the
value of kvmppc_read_int_dt() directly.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 7611e9ccf6..c218380eb7 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1932,8 +1932,8 @@ static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
  */
 static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
 {
-    char buf[PATH_MAX], *tmp;
-    uint64_t val;
+    g_autofree char *tmp = NULL;
+    char buf[PATH_MAX];
 
     if (kvmppc_find_cpu_dt(buf, sizeof(buf))) {
         error_setg(errp, "Failed to read CPU property %s", propname);
@@ -1941,10 +1941,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname, Error **errp)
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp, errp);
-    g_free(tmp);
 
-    return val;
+    return kvmppc_read_int_dt(tmp, errp);
 }
 
 uint64_t kvmppc_get_clockfreq(void)
-- 
2.36.1


