Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 892DF4EEF46
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 16:23:25 +0200 (CEST)
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIBQ-0002rv-KY
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 10:23:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI29-0003uV-SK
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:49 -0400
Received: from [2a00:1450:4864:20::629] (port=34343
 helo=mail-ej1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naI28-0006dx-6E
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 10:13:49 -0400
Received: by mail-ej1-x629.google.com with SMTP id o10so6194128ejd.1
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 07:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RvElqCJJdwBtUSZcN/Vs6DfBOSLpxpu+Vo0U1giLeAk=;
 b=nmb4CEVAvQNns1Cb9D8S6pWpraIMIG+1nytWK6pBSI0u9lQ+cbPNJn1ZUbtBEVMuzR
 JqKGNnZDlnyeKvrfUbYssDfCWdrmMD7e/ZePvCM8WeVlC9comY06uyp7rgKAr0EBUeOv
 U8/YzzS5kvOSAmd8WCl8YCOHZ2+63UQSz4gRAAFAuNOGiqNzA9Sp2q7JranE+YPUrMGr
 Leo6SunQpgCBP0wvyAyxgoR+D7Lh5KejMBRSBoxlUrgqh3tkh0qk2qSPJYymES5AmJff
 UTIfMKmJoPTYzFGYMjG9acBHF8GXMZyP/wRto9GjcjuJtatyWI59WXhh0NGgbNikTpti
 LKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RvElqCJJdwBtUSZcN/Vs6DfBOSLpxpu+Vo0U1giLeAk=;
 b=Hu7WGkq+jJ/16YZE2yuvo4boJ7HErgl+jeNf/07UtJGzK7N3CqPA/oHDx9Tl6ZKNGK
 DSqoXJfR/UAr3s12Ry2waxD9jCUSL6nnqhUS1jzBe7JhEPkoSJ4KxBN0JE9ZURnwneam
 SALRG9mW3aSAAfm44RgBYrrBLprgT7GCGgDPdHq2yxbcyholDHejk+ZLV78wCEFQizc0
 urAemMhHqwMt8mOkkmFukmNQN0bbLZIteNawqX3HTcCfxQBcFpNfh8el7Af9431zmt14
 fb5VcFczEzL8BAoSXd3x9Pk0tl2QB4VwMJjhl4O6rWcEOCA+BSCM3+2rrWG4K2fHWGDU
 MNkA==
X-Gm-Message-State: AOAM532clMLz5wIXVIL/62YcVWSG4XL/rbvGHKPPYmYmjGXvL41CnQK4
 Vl2agZFa7CRHf35kcm28taBuYyj17mQ=
X-Google-Smtp-Source: ABdhPJz2ipLZwLOBbHNKYHdNc/uTbfKLPlg/9uxqo1DtI/xKqOQ3HDGqrRcwpTaskrP5QQeTa8+qHw==
X-Received: by 2002:a17:907:8d1a:b0:6e0:6db8:8042 with SMTP id
 tc26-20020a1709078d1a00b006e06db88042mr41968ejc.300.1648822426858; 
 Fri, 01 Apr 2022 07:13:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 bn3-20020a170906c0c300b006e50416e24bsm212595ejb.98.2022.04.01.07.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/17] tests/tcg: isolate from QEMU's config-host.mak
Date: Fri,  1 Apr 2022 16:13:24 +0200
Message-Id: <20220401141326.1244422-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401141326.1244422-1-pbonzini@redhat.com>
References: <20220401141326.1244422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::629
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not include variables for the QEMU's own compiler, as they
are not necessarily related to the cross compiler used for tests/tcg.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure                 | 3 +--
 tests/tcg/Makefile.target | 3 +--
 tests/tcg/configure.sh    | 5 +++++
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 7c08c18358..e8786d478e 100755
--- a/configure
+++ b/configure
@@ -2937,7 +2937,6 @@ echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
-echo "HOST_CC=$host_cc" >> $config_host_mak
 echo "AR=$ar" >> $config_host_mak
 echo "AS=$as" >> $config_host_mak
 echo "CCAS=$ccas" >> $config_host_mak
@@ -3057,7 +3056,7 @@ done
 (for i in $cross_cc_vars; do
   export $i
 done
-export target_list source_path use_containers cpu
+export target_list source_path use_containers cpu host_cc
 $source_path/tests/tcg/configure.sh)
 
 # temporary config to build submodules
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 95499d8c9b..f427a0304e 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -30,7 +30,7 @@
 #
 
 all:
--include ../../../config-host.mak
+-include ../config-host.mak
 -include ../config-$(TARGET).mak
 
 # Get semihosting definitions for user-mode emulation
@@ -77,7 +77,6 @@ EXTRA_TESTS=
 
 # Start with a blank slate, the build targets get to add stuff first
 CFLAGS=
-QEMU_CFLAGS=
 LDFLAGS=
 
 QEMU_OPTS=
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index a577dd7ece..75603fee6d 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -83,6 +83,11 @@ fi
 makefile=tests/tcg/Makefile.prereqs
 echo "# Automatically generated by configure - do not modify" > $makefile
 
+config_host_mak=tests/tcg/config-host.mak
+echo "# Automatically generated by configure - do not modify" > $config_host_mak
+echo "SRC_PATH=$source_path" >> $config_host_mak
+echo "HOST_CC=$host_cc" >> $config_host_mak
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.35.1



