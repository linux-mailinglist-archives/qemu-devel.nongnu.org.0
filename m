Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A45EC895
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:52:29 +0200 (CEST)
Received: from localhost ([::1]:48764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCsm-0000zV-1N
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMo-0005D7-Er
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:22 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMl-00061X-Ti
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:22 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u16-20020a05600c211000b003b5152ebf09so6974561wml.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=97ac4mk+qRn8Kl2p6oRtCylE7z7H+goRcyRaHwAJvpk=;
 b=czRlF50RH3LoDellwxcGp7CG1W7b47/roQ7W+JMF3aQe1l4jPeiRZyqTFG5pZ+y728
 wcGSRwupm5hUbYa453c/X9UQSbI7bNGQXtTllkbX+K8jhlv2BomOXANWYEjfph2ck6bM
 JCR5F3ycFYqEAylzMyDZj48yzGqYDy/tGSRsQ/oXkKdBKUDMj/ht9zcHCdkK+pjziS0G
 uzdKZdtX6lizLAz46285OpQ7nDN1MgvbSjMeOwOND2pt+8sVLPQflR7SyXEO9P2Ave7l
 4OO9dh/amt3Hd/AmXp/TQZC/HHgcKSyTHy+cLCrI7JqCWil5LnHuyIEkMh75poz2bFJb
 Jsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=97ac4mk+qRn8Kl2p6oRtCylE7z7H+goRcyRaHwAJvpk=;
 b=J0VamacMjmOMVC0jc4almvvYvlc1mnD+DC4PIp7LveZNjkAmd0qJlIMS48H+z5Zdh3
 QxMM8eWeq4k3Rffc+6b2LZGdbyc0mMqbom5xEGG/2UXiou1ew03OJjGCrUKKqTGGvISj
 vL+cu6BfCVuZzkZtZSAmAVefbkWwAvLSCxZbYwWtq7s8Y5xLrgXW6SgvoB7YJICTvWO+
 zglUPxY54fOdzs8CSTHV6bD2nOvSKojAS2PUVcMWFl3ZJ59A/+1Z2oG7EZ4N8kk3yY/H
 2j+L/l1GNA9L7oGD2/k+Mqrn8kRDG76e6BaDUSDwbmpnT5ENW2SuTM3/1I1GAhB/GAGp
 bxCg==
X-Gm-Message-State: ACrzQf2n4RMGwL5blRew2sNHamUjdb1fwNNdTTqkuypXQw3lMeQHeD2F
 9WedqmMR0xfk1Ftvg5O5NsAAtkZ5S+SPPw==
X-Google-Smtp-Source: AMsMyM4Yoc662MVwHw4TwhipB0ZrJTGQnnp0y665zjUlAClrMIBgzGGarjLSJSQg4YkRVnz/3T02LQ==
X-Received: by 2002:a05:600c:4fcb:b0:3b4:a4dd:6154 with SMTP id
 o11-20020a05600c4fcb00b003b4a4dd6154mr2826700wmq.60.1664288113211; 
 Tue, 27 Sep 2022 07:15:13 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c1c9600b003b340f00f10sm14701857wms.31.2022.09.27.07.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12BC31FFB8;
 Tue, 27 Sep 2022 15:15:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 10/15] configure: move detected gdb to TCG's config-host.mak
Date: Tue, 27 Sep 2022 15:14:59 +0100
Message-Id: <20220927141504.3886314-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When tests/tcg gained it's own config-host.mak we forgot to move the
GDB detection.

Fixes: 544f4a2578 (tests/tcg: isolate from QEMU's config-host.mak)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index cc4ecd6008..f6a36a5361 100755
--- a/configure
+++ b/configure
@@ -2475,6 +2475,8 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    else
+        gdb_bin=""
     fi
 fi
 
@@ -2559,6 +2561,11 @@ echo "# Automatically generated by configure - do not modify" > $config_host_mak
 echo "SRC_PATH=$source_path" >> $config_host_mak
 echo "HOST_CC=$host_cc" >> $config_host_mak
 
+# versioned checked in the main config_host.mak above
+if test -n "$gdb_bin"; then
+    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+fi
+
 tcg_tests_targets=
 for target in $target_list; do
   arch=${target%%-*}
-- 
2.34.1


