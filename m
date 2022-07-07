Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1B256ADBD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 23:35:27 +0200 (CEST)
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Z9i-00058b-Dd
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 17:35:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4t-0000HF-AH; Thu, 07 Jul 2022 17:30:27 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:35661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9Z4q-0004gH-Hu; Thu, 07 Jul 2022 17:30:26 -0400
Received: by mail-ua1-x92c.google.com with SMTP id s3so5269263uaq.2;
 Thu, 07 Jul 2022 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EbgRJ9MdyHPnaY3lqJatX0u5qeF8Vuc/iS2wZ00ilX4=;
 b=Iiluu95spCzepkDpGRhxq8d9IbRgVwmVIj+XEM6MWhGXlyvLsVBwCKmJDdnSK6HkVy
 lQJ1mxJFy88Bo3+CqE0YG+3cL1sop4nFcz+JJQ96ycBFPW2mT5dSBEq65ySoLck2xytQ
 vNxjlv1oWYAjnBVgcCLR2AdZVdAkS9yC8joEGrI6YJ/+cDikoTfBv3FYprh81jRdiH01
 UaV4QYMH6M/MzLFTHSVxazstW0Xs9SwXtgyti5icWVbEWsWEVU5gVEaxR6wxtxhXqq9l
 q6Svxh6OFFZCE3ahgQ0IU0Mv6m/qbJ1NFP4uH1UrOeuaNyAAGqLvw/DmXep6hwaBow1Q
 2UOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EbgRJ9MdyHPnaY3lqJatX0u5qeF8Vuc/iS2wZ00ilX4=;
 b=3Rm8G9xuC1qAhVX9yDEGV7oDav5sJBzMbfm4h22qxvuDM5BmBKP58EePZ+5gE0eBY7
 HjeGxIWI+WNbpcSvlhqcBKPL9hJMn1z30Xt6G+S+7WzZU9MO8WN02pnAUy7c6KzMXzRG
 WrHEcdHOqBw6IOmbLhyWGxustzdFlsj9u2ib6h2uyfCN8qtPII6Dejm9WNgQXdFpvIki
 7k3PkKnCwfmbw7+TivYdH/g/L6j+RgUjLsGthAF3PABryCooz1PTMRcRon1mBzqCWHXV
 r61sgB8iJoaz1ziGmyudxAKpoH1oPMtA5BR437H8/g0sT3TrCy0/ZvAjyhGFV/su5Psz
 huNA==
X-Gm-Message-State: AJIora+PeCD9ch3xcRznjA2fwyvvjD7qy3xoafm+DRAwQK+iZRXkStvX
 oHQEBKTj05CLpZluERHnSzIELn2lwyM=
X-Google-Smtp-Source: AGRyM1sZb5Xorwloee0Xq3jZC+LJGsBz9K05olPZPcnf2WPVNGsyO0aE9NTIyyuLaxrvRg2CxmN0/A==
X-Received: by 2002:ab0:69d4:0:b0:381:f49f:21ee with SMTP id
 u20-20020ab069d4000000b00381f49f21eemr17831uaq.92.1657229422729; 
 Thu, 07 Jul 2022 14:30:22 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 66-20020a1f1745000000b0036bfe74006esm12122103vkx.31.2022.07.07.14.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:30:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 jianchunfu <jianchunfu@cmss.chinamobile.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 1/4] target/ppc: add error report when fopen fails in
 kvmppc_read_int_dt()
Date: Thu,  7 Jul 2022 18:30:12 -0300
Message-Id: <20220707213015.552104-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707213015.552104-1-danielhb413@gmail.com>
References: <20220707213015.552104-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
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

From: jianchunfu <jianchunfu@cmss.chinamobile.com>

Use an Error pointer to report the error back to the caller.

While we're at it, return '0' instead of '-1' on error since the
function is supposed to return an uint64_t.

Signed-off-by: jianchunfu <jianchunfu@cmss.chinamobile.com>
[danielhb: return 0, use error_set_errno() instead of fprintf]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..65d136ed5a 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1896,7 +1896,7 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     return 0;
 }
 
-static uint64_t kvmppc_read_int_dt(const char *filename)
+static uint64_t kvmppc_read_int_dt(const char *filename, Error **errp)
 {
     union {
         uint32_t v32;
@@ -1907,7 +1907,8 @@ static uint64_t kvmppc_read_int_dt(const char *filename)
 
     f = fopen(filename, "rb");
     if (!f) {
-        return -1;
+        error_setg_errno(errp, errno, "error opening %s", filename);
+        return 0;
     }
 
     len = fread(&u, 1, sizeof(u), f);
@@ -1938,7 +1939,7 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
     }
 
     tmp = g_strdup_printf("%s/%s", buf, propname);
-    val = kvmppc_read_int_dt(tmp);
+    val = kvmppc_read_int_dt(tmp, NULL);
     g_free(tmp);
 
     return val;
-- 
2.36.1


