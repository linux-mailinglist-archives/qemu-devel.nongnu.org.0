Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031285E66F1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:22:46 +0200 (CEST)
Received: from localhost ([::1]:37170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obO2H-0002Nx-1y
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNf3-0001Kk-N2
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1obNex-0000vt-5l
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:58:42 -0400
Received: by mail-wr1-x436.google.com with SMTP id z6so16052169wrq.1
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8sQLXny03pJvTAoQ1h1P+6dtK6yjUsxRfofzOnIWm9M=;
 b=Uau8ZezT84JHrq90e9goYQ/B/umwmDDwMUDOVBbPZh5424xmLYgGtmPsULrHfb0TB4
 Zs34+Ga547APfPzqtgeNI1JEOGM1h+hcofacItlJAooUHccIU7Zv/FRbFCm5GAWqtScD
 0aC0UzBnn+ThcKi8s9GWIkOkmMwPcO+nM71Y/hX1ZE1ARXeyhejTfMFA325lfdb8zHGW
 OJzt7BiVDcdCCjYU+1XoyLP/+j6gLR81ac0ZL/UmEklnIE50EKkFEEhIGfrHDZ/KGIun
 tOHDx7owT5XqFI57irAIgxZyN8Q2GWs+L+PQ1adQvXazjSqBD8tQozNCOXN1+Oa3U4Dy
 +hWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8sQLXny03pJvTAoQ1h1P+6dtK6yjUsxRfofzOnIWm9M=;
 b=6sYq8cvD30gbJ6zcJG0i5En4Bcy/BScroInDRRlmK7IkLy6aUaazd+J8sd6dLn8ZgR
 74PZqPVKjzvAt6IPLOOM6n0DcEUdIba/Vxfyrp0MBbPiQVqLcK9momM/5489059qmAIi
 ycemuHWBLfv5B/Q0Pg6ieitDUjWLgGUCy/VEAc+y4VbmADjeySIU/JAJtV4N35QZVrUL
 1sBMuYEgjjTHVkv/dnI7dlRUhuY+z3iaGvD5iW4brz/XjjokXee8GAs3hxi/no53mXlf
 K65dJK32YtFAq0JdM9k+BwzbgEY16zRdFRG6oSa8HoGQgEVc61sTy//wwmme+YcvThaZ
 N31A==
X-Gm-Message-State: ACrzQf3hQuKc5zMci+fKynhEsenETPsT10/Qh6OS8NZaojl9ktG5yExJ
 9ixyMUukjx/+2ybyz7Hg8XtLsQ==
X-Google-Smtp-Source: AMsMyM5JpUYWpdAhwIjbHnyPv44NpuPKBTBjBgMoVGekBNhAusWJE4ncqj0hFsOiyRNyw1HTgCmN2w==
X-Received: by 2002:adf:fbd2:0:b0:21e:7f74:5df1 with SMTP id
 d18-20020adffbd2000000b0021e7f745df1mr2355329wrs.43.1663858717808; 
 Thu, 22 Sep 2022 07:58:37 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003b340f00f10sm7625939wmq.31.2022.09.22.07.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 07:58:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C843B1FFBD;
 Thu, 22 Sep 2022 15:58:32 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 5/9] configure: move detected gdb to TCG's config-host.mak
Date: Thu, 22 Sep 2022 15:58:28 +0100
Message-Id: <20220922145832.1934429-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922145832.1934429-1-alex.bennee@linaro.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index 0bbf9d28af..fce677bd4a 100755
--- a/configure
+++ b/configure
@@ -2481,6 +2481,8 @@ if test -n "$gdb_bin"; then
     gdb_version=$($gdb_bin --version | head -n 1)
     if version_ge ${gdb_version##* } 9.1; then
         echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    else
+        gdb_bin=""
     fi
 fi
 
@@ -2565,6 +2567,11 @@ echo "# Automatically generated by configure - do not modify" > $config_host_mak
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


