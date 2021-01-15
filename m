Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E02F7CEA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:43:37 +0100 (CET)
Received: from localhost ([::1]:37342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PO4-00038I-Pf
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:43:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozx-00055U-Gm
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:41 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozv-0002IS-Io
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d13so9225724wrc.13
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MngZD7MAUlTLKXGuVgx7HmpB6eRFsW1jUL6SSCJlos4=;
 b=mAz4IzcNWC3WECR6MTfbWLhLc0R1btqWr+oY87luKhUBrJNtQDiVYAN5011TyINzN0
 pPKL+yxeu3dE9OkWa9DmWBHnNGwb2xewl+vO3d+uX/Ii0vIknHngbTOu8cZsd0xJ0iut
 pYLNMxdQ82fi+eJ7T9U4tGNTGzcnjQdGXLxg9KVp4GwG6/ID3+EM5unx3dIvqrDwTYUr
 M4YPThZUrH3EELiCbbX04dlyUlJMe2LJTyIY0w6KsHuecf19IU3D6xKQvD4GMeyiLqMP
 1ZL7jqrL2a6kQC/3n1pTgzcG/J15CHIKwTUvRTleD0LDyyCwRBoujZhCBeDWxlm1tOf6
 SaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MngZD7MAUlTLKXGuVgx7HmpB6eRFsW1jUL6SSCJlos4=;
 b=rgKmKUkfGye43eL6hzJ7eswSR/8HWm/mx2ybpb6Gm8ndna5ST7/iyJc6j00da8csQy
 5Wui4jBxlLzo9s8S1u6VBoUcX5TPYSPjm/KqRojjxvWbWD1QgSJ8ECVcY+PZ0FhiKK0K
 SVrTDcY2iFBXYu0j1p7ATCSU83mkju8OyyXqRWRv8yZhvpnQaiLcrvSPnHZu230ZMMcW
 e5WL9KiHXThfih4LxcjSoiUV87VWSE/eK52Byzu7uj50fQ5mfNMMmBuwpz5yBK65lkQr
 UBIzvHAVKg0FsQ2D6F6DpE1XratyntaTqOorAcLvRTpBXulvmiebChW3NWEqtFyGPPEt
 aKrA==
X-Gm-Message-State: AOAM532twGr+lNw2ZEYvBieRSOczWOYjxK6bFJryOGwDk7bVCVtJlw7n
 9KQ+y9O42E5NKw8jpwtAxxySxQ==
X-Google-Smtp-Source: ABdhPJzU3djI58pPEnHHPeCXwGYu431zASrn4kblo/DFF9yhM7E6QRa2Q2ra+kyJsEZG9Y3vijjHrQ==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr13141755wrr.61.1610716717039; 
 Fri, 15 Jan 2021 05:18:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s13sm15767183wra.53.2021.01.15.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9019B1FF87;
 Fri, 15 Jan 2021 13:08:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 14/30] configure: gate our use of GDB to 8.3.1 or above
Date: Fri, 15 Jan 2021 13:08:12 +0000
Message-Id: <20210115130828.23968-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The support of socket based debugging which we need for linux-user
testing is only really stable as of 8.3.1 so lets gate our use of GDB
on having a relatively modern version.

For direct testing you can just point to a locally compiled version of
gdb via configure, e.g.:

  ../../configure --gdb=$HOME/src/binutils-gdb.git/builds/all/install/bin/gdb

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210108224256.2321-4-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 155dda124c..9f016b06b5 100755
--- a/configure
+++ b/configure
@@ -6166,8 +6166,11 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
-if test -n "$gdb_bin" ; then
-    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+if test -n "$gdb_bin"; then
+    gdb_version=$($gdb_bin --version | head -n 1)
+    if version_ge ${gdb_version##* } 8.3.1; then
+        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    fi
 fi
 
 if test "$secret_keyring" = "yes" ; then
-- 
2.20.1


