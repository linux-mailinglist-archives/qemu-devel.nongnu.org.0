Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD9A300D75
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:13:48 +0100 (CET)
Received: from localhost ([::1]:47940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l32oV-0006lG-Ki
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mC-0004tl-FM
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:24 -0500
Received: from mail-pl1-f171.google.com ([209.85.214.171]:41204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86github@gmail.com>)
 id 1l32mA-0004b3-My
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:11:24 -0500
Received: by mail-pl1-f171.google.com with SMTP id h15so1435813pli.8
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/ETCdKXydJNzx0rW+CikghF8e1mV5AV5I0qUIMj/2g=;
 b=QgREHlsctRHMzxIZro4TmfsvePHZpMhGpDuzTf/HIEooe2Y+cV65w6sMwL+XBWw0QP
 U4dJhKVAnV40fERchJ4lbPDO1K60ayBEyZudarQCPnREkmR1Rr3AqfEX1NbJd3HjFcGS
 xPO8dDtD0ypDjrMoalmc3ImU5qEUHWuQZPTeDj8Bae2SM/4+nCcey4rFmDNioglbDUpz
 Ifkyvr0xtVC1epYjwb4SF5RL2ybIlTqwGI4rtMK+fZL+5pmaq1DqZarQMV851cVMSgBN
 atxWZkhGn+QxY7Ja0KjDey0iBd9JzZ8Ej+neJ6dCcQyy+YfsAgHrbNB3OyMMFPmhoQED
 jFaQ==
X-Gm-Message-State: AOAM533J6fSIjggwnY9m4Z2/LvLFTOF9aLO+rtrPJaOL90kzNfcv6qtl
 1CsU52RGFhPYw1cvt8hj5O+HdCnya0Q=
X-Google-Smtp-Source: ABdhPJzwr9pxoM2ImHWMN1X1mChTynUMRGscZA1C0Dg0YpkIThwBFnIhCHfatCRD0D95Soa6G8zq7g==
X-Received: by 2002:a17:90a:6bc3:: with SMTP id
 w61mr7353832pjj.214.1611346281281; 
 Fri, 22 Jan 2021 12:11:21 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.129])
 by smtp.gmail.com with ESMTPSA id u12sm8741839pgi.91.2021.01.22.12.11.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Jan 2021 12:11:20 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/11] osdep: build with non-working system() function
Date: Fri, 22 Jan 2021 12:11:07 -0800
Message-Id: <20210122201113.63788-6-j@getutm.app>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210122201113.63788-1-j@getutm.app>
References: <20210122201113.63788-1-j@getutm.app>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.171;
 envelope-from=osy86github@gmail.com; helo=mail-pl1-f171.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Build without error on hosts without a working system(). An assertion
will trigger if system() is called.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 configure            | 19 +++++++++++++++++++
 include/qemu/osdep.h | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/configure b/configure
index 92da27846e..82ce28c660 100755
--- a/configure
+++ b/configure
@@ -5318,6 +5318,21 @@ else
   sys_disk_h=no
 fi
 
+##########################################
+# check for system()
+
+have_system_function=no
+cat > $TMPC << EOF
+#include <stdlib.h>
+int main(void) {
+    return system("");
+}
+EOF
+if compile_prog "" "" ; then
+    have_system_function=yes
+fi
+
+
 ##########################################
 # End of CC checks
 # After here, no more $cc or $ld runs
@@ -6222,6 +6237,10 @@ if test "$secret_keyring" = "yes" ; then
   echo "CONFIG_SECRET_KEYRING=y" >> $config_host_mak
 fi
 
+if test "$have_system_function" = "yes" ; then
+  echo "HAVE_SYSTEM_FUNCTION=y" >> $config_host_mak
+fi
+
 echo "ROMS=$roms" >> $config_host_mak
 echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index a434382c58..73346c4349 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -682,4 +682,15 @@ char *qemu_get_host_name(Error **errp);
  */
 size_t qemu_get_host_physmem(void);
 
+/**
+ * Platforms which do not support system() gets an assertion failure.
+ */
+#ifndef HAVE_SYSTEM_FUNCTION
+#define system platform_does_not_support_system
+static inline int platform_does_not_support_system(const char *command)
+{
+    assert(0);
+}
+#endif /* !HAVE_SYSTEM_FUNCTION */
+
 #endif
-- 
2.28.0


