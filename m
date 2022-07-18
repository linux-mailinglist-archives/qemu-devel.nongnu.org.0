Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A557888B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:36:22 +0200 (CEST)
Received: from localhost ([::1]:57812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUfN-0003A5-BE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:36:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS2-0007iM-Fx; Mon, 18 Jul 2022 13:22:34 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29]:40567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUS0-0001fh-Vo; Mon, 18 Jul 2022 13:22:34 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso25479601fac.7; 
 Mon, 18 Jul 2022 10:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aRFmRcNgd5GC2DIArjbokwij580jaxeWpwS8D8SMqH4=;
 b=oJG9FA6ZJBSO0zk2LdKXQUiYoZKfZilqd/bCGfzUt7jo53BL3xPuQZm6I6mQ0zO9uN
 6u1Y1OYli9ytYcUr1PZaSSrkRiI43yjJnpeTU0+AGeA17yE3ua/O0kps4oChcXbnhL2y
 e/XyR0ZLwqM0ffrj31iHTex0bO7+jRqgwAGvHaTRWrPk5SOef37PBzM8/ybIu8P2JcpZ
 WRawiwyNIArVoXXUgExBBCo1v4a1pGU4rFKwhawuB+76/KsFSiOeDYtYLREEuuvX3WKp
 O01KWVzkFMj/jhtbVEHuteSE9T1OdE0zHX9FvH7EdFTC0a3pxyXmUvSchDhOSc7ckH71
 CYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aRFmRcNgd5GC2DIArjbokwij580jaxeWpwS8D8SMqH4=;
 b=phA/SWqWTAH+IAZWPpSi7DxAX2knOjghDJQjoVDV8/aHE1UnAubVEWCap8frYSLEtP
 pabFynGudnxU3mC4gxBjWF51/d99ac0zRRe9nGaTin1VGA+GjO8bzIIovwRIQKSyMiKQ
 6re0dsVcJx2A4zC+aQW4nPvoaOFuIa+BkJ0nQbxyPm7gblMu2liJPLYPuOYspwWYbby8
 b64m7bhwfS1YSQVOVPFYTHtiK1aNbZ/Wkz+KBboQ1Lqvb5iy8BU6gvP0qPMVHcWq05Rv
 nUIJOtkEBSpccGxuJh8h9HgE+3454lysWMRN59BGluG7jq2CUOPeGxuYdjl0uaY4uIXP
 pHAQ==
X-Gm-Message-State: AJIora92AlCfvaGNfCRo8L8whC0sEr1NTr5hQ4f5J47zBray4+rC7bAS
 DHCBB5YLyLd+Lvs286wkTYWijvBye+U=
X-Google-Smtp-Source: AGRyM1vjw8G7paRQSswhuzbZZpGxe/m9aFi1fGGSaQv5icPEjf3G31Fsy3dsQJFspdtJNuz5lzp/8A==
X-Received: by 2002:a05:6808:bd6:b0:337:92db:df12 with SMTP id
 o22-20020a0568080bd600b0033792dbdf12mr13711669oik.135.1658164950435; 
 Mon, 18 Jul 2022 10:22:30 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL 07/30] target/ppc/kvm: Skip current and parent directories in
 kvmppc_find_cpu_dt
Date: Mon, 18 Jul 2022 14:21:45 -0300
Message-Id: <20220718172208.1247624-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Some systems have /proc/device-tree/cpus/../clock-frequency. However,
this is not the expected path for a CPU device tree directory.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220712210810.35514-1-muriloo@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/kvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..466d0d2f4c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     buf[0] = '\0';
     while ((dirp = readdir(dp)) != NULL) {
         FILE *f;
+
+        /* Don't accidentally read from the current and parent directories */
+        if (strcmp(dirp->d_name, ".") == 0 || strcmp(dirp->d_name, "..") == 0) {
+            continue;
+        }
+
         snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
                  dirp->d_name);
         f = fopen(buf, "r");
-- 
2.36.1


