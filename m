Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47597562389
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 21:52:33 +0200 (CEST)
Received: from localhost ([::1]:58438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o70DI-0005TN-Cj
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 15:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704T-0004TX-RA; Thu, 30 Jun 2022 15:43:26 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:41852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o704P-0006Fp-JK; Thu, 30 Jun 2022 15:43:25 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-101bb9275bcso626324fac.8; 
 Thu, 30 Jun 2022 12:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SzbsEb73BXpa6gMReMERwR04DzXaL19I57Pb6iUf4nQ=;
 b=kjzkiqERUMX0FpRQVV562fnf3M7xHqUw5oLEz55pCrvE/5rtAV+hJsgOngeuALA/16
 8VYxKb4d+oAoeoMxjNTjRWKoW0jOyxPzn1H4Pt9YCMTA5rh8ZBH/BLkMSksRAYX6LkSQ
 BrCQr4zczuZTolAOJ1cdoJGvIk90vflj7VHPOwzKQRzwWXrDYfDEsg4vTP+MU4/ZGRTe
 HA1rshkZaUAVFJgnSq/zDlzvMO8bEDsNkteRNclqKCrBcfMhEo2m6kzksEmniqsRcdTr
 DZ7u5Yl4L5Gc/1cgumvYKwhyNNhkt9zzwgm0rp7xCmafDXiKMBryzsVVqchSphDAXhvD
 2dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SzbsEb73BXpa6gMReMERwR04DzXaL19I57Pb6iUf4nQ=;
 b=pxO8xGMuYqIaeD8qNg6jYilB6WqoyY+V81ACOQ8qV2fOFXnSxVtQlPi4kPqxtxj6q5
 bwSnNV3tzUvsS/g490h4IBr79AVRI9nQEQGM/PoJuuZsGBoVVmFOdGakjrQB9v09S82/
 lXYem8klwUvPpGU6FnR6w2bjP00rfQaSlnG8ITDjA1WGlVemAf7C6D2b2eR94Xt5rW49
 HFcJz2Cd0ZNlV8J0P4B0Vv9beUCd8lH2k2OZSF67WQhbAiAZfn6Wp2/nfgagvOSGlS1M
 l5A7njmB6pGbWPs/HGeJAdhCvMP10h3ZZdR6W7HhWF1YieHd7pF36sed1IZrkd1RUWVV
 5kVA==
X-Gm-Message-State: AJIora/YDb+6qYxpEgY5w5/Ea3W+i2we08zL0lHGFHreXFKcN8LlZClb
 lCOlI6Jq1RyQ+BsNhzHrjai1+Lu6cuk=
X-Google-Smtp-Source: AGRyM1tMOaEb9TBn/alZybeXSL7p5OFfnX6Wf87mspQxPVY3jUKBydmE7Wkl1aXMxfq05r4me0wzvQ==
X-Received: by 2002:a05:6870:41ca:b0:101:d588:6241 with SMTP id
 z10-20020a05687041ca00b00101d5886241mr7311180oac.175.1656618197150; 
 Thu, 30 Jun 2022 12:43:17 -0700 (PDT)
Received: from balboa.ibmuc.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a4aa3c5000000b0035ef3da8387sm11250519ool.4.2022.06.30.12.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 12:43:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 4/9] target/ppc: use g_autofree in kvmppc_read_int_cpu_dt()
Date: Thu, 30 Jun 2022 16:42:44 -0300
Message-Id: <20220630194249.886747-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630194249.886747-1-danielhb413@gmail.com>
References: <20220630194249.886747-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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


