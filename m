Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D76A6E7B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 15:32:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXNUi-0005gT-RQ; Wed, 01 Mar 2023 09:31:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <williamvdvelde@gmail.com>)
 id 1pXIeT-0002rI-Id
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:21:33 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <williamvdvelde@gmail.com>)
 id 1pXIeS-0006C8-48
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 04:21:33 -0500
Received: by mail-ed1-x533.google.com with SMTP id s26so50962227edw.11
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 01:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677662490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UH/coAbyxU4ZirK2emktuM859u2bGuCi7NCkEdaHFwI=;
 b=RQ49F4yEbMdG3vh/BvH0yCzr8gTwXCHCCzm/5acLPwhrNEfL9MaTSM2o7CSoT9Dis9
 FudUHag8aHtKrlcpn81/UTQSBrKSbi9dDZs5uMIkFbwrE1lv8tlekBEredVnK6IYeAB6
 aaDsaElR85G09vws3gXHTUEtRtWhY4PMkkp0+bCb8DdBjYaKKHEHHNj88/zp1O1ZmcVV
 vQ3+fKSZ6rFhjLpfGui043rN/A9Pvz5ut0KqF5GZl/q271QJsOoBduWmXwxe0LEEItL+
 j0NiDkqi0Rkpc4t6BYhOvwO1GUmewymor5Y6FIeutRcLpx28kyoJxIV1f1dbPNnMCper
 omsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677662490;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UH/coAbyxU4ZirK2emktuM859u2bGuCi7NCkEdaHFwI=;
 b=v+sUagAXwDEsvjvtYERmSIpcC/rV0UKatPmexlPQUZVRJ8ObKt5qt58bpW2q12pZyP
 wcajI5vtaiNgYf3XRvp0Cwt0vBTe8y6InFa1cRc4SU3PImtes46AhWXfSde7/behu10K
 yYXeDYb3UQ3nkBRWsOaBjFH7qzzsqIi6Hgfkgw4SBrdn74k0rys2IxV+RKI5LU1bg+LF
 cBZKF5AgIEQDMaR/R6K2EYSH8yXu/xk/UoJXuiD99j5+kgoBSGyCqih9YKHG6bU1h8aD
 JZyMbvgBFS6JgS4FX1UMFFQODZSAb/QkGQ7WonxG33a6zI6/nDQUz1xcqG1hGH+QKaDW
 XXMw==
X-Gm-Message-State: AO0yUKVOQXnZA5fK5aSafYCDJldZdKlxY/HdKWo4woJP1DDNVJmgIt2s
 k4hVTBfC7mTVQ/UIJRs6aidaN59SMA4=
X-Google-Smtp-Source: AK7set9UjtPTfSjBa7a7+VGwHt4Orqj4rACd2fBlZGguMHrSK8d/QdNKUoMFwARsGGAx5ohFFGih3Q==
X-Received: by 2002:aa7:d708:0:b0:4af:765b:b68e with SMTP id
 t8-20020aa7d708000000b004af765bb68emr7050289edq.9.1677662489835; 
 Wed, 01 Mar 2023 01:21:29 -0800 (PST)
Received: from localhost.localdomain (77-162-74-183.fixed.kpn.net.
 [77.162.74.183]) by smtp.gmail.com with ESMTPSA id
 f22-20020a170906139600b008f398f25beesm5467963ejc.189.2023.03.01.01.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 01:21:29 -0800 (PST)
From: Willem van de Velde <williamvdvelde@gmail.com>
To: qemu-devel@nongnu.org
Cc: Willem van de Velde <williamvdvelde@gmail.com>
Subject: [PATCH] Add qemu qcode support for keys F13 to F24
Date: Wed,  1 Mar 2023 10:21:06 +0100
Message-Id: <20230301092106.268440-1-williamvdvelde@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=williamvdvelde@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Mar 2023 09:31:41 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To be able to use the function keys F13 to F24 these should be defined in de keycodemapdb and added to the qapi.
The keycodemapdb is updated in its own repository, this patch enables the use of those keys within qemu.

Signed-off-by: Willem van de Velde <williamvdvelde@gmail.com>
---
 qapi/ui.json    | 15 ++++++++++++++-
 ui/keycodemapdb |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..98322342f7 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -886,6 +886,19 @@
 # @lang1: since 6.1
 # @lang2: since 6.1
 #
+# @f13: since 8.0
+# @f14: since 8.0
+# @f15: since 8.0
+# @f16: since 8.0
+# @f17: since 8.0
+# @f18: since 8.0
+# @f19: since 8.0
+# @f20: since 8.0
+# @f21: since 8.0
+# @f22: since 8.0
+# @f23: since 8.0
+# @f24: since 8.0
+#
 # 'sysrq' was mistakenly added to hack around the fact that
 # the ps2 driver was not generating correct scancodes sequences
 # when 'alt+print' was pressed. This flaw is now fixed and the
@@ -918,7 +931,7 @@
             'volumeup', 'volumedown', 'mediaselect',
             'mail', 'calculator', 'computer',
             'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
-            'lang1', 'lang2' ] }
+            'lang1', 'lang2','f13','f14','f15','f16','f17','f18','f19','f20','f21','f22','f23','f24' ] }
 
 ##
 # @KeyValueKind:
diff --git a/ui/keycodemapdb b/ui/keycodemapdb
index d21009b1c9..f5772a62ec 160000
--- a/ui/keycodemapdb
+++ b/ui/keycodemapdb
@@ -1 +1 @@
-Subproject commit d21009b1c9f94b740ea66be8e48a1d8ad8124023
+Subproject commit f5772a62ec52591ff6870b7e8ef32482371f22c6
-- 
2.34.1


