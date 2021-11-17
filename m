Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63266454AD8
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:21:08 +0100 (CET)
Received: from localhost ([::1]:53038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNgJ-0006EH-Ht
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:21:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQT-0000qT-Ca
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:45 -0500
Received: from [2a00:1450:4864:20::42f] (port=38861
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mnNQR-00035Z-UA
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:04:45 -0500
Received: by mail-wr1-x42f.google.com with SMTP id u18so5661924wrg.5
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+h63Maw63ktvyuEogld2/EfBtiWXaS9LUhKmRtLAPjA=;
 b=HPyfeM8jFO34EfE0TJJB+LB+lHN76nAmdIDZt4jb3r1Tpa5cNQaDsNktg3zuHujKYM
 ZdOtdn92sSaA4X2P/j/8KNnszRxJRRo7nTY9PBZCT0NtL9Q4QGUjYJV74JJWTrB+z5Gh
 a7BVkym1an1gTjqYT/CJAEQoUQjRUiOv3ENo5SPH77pKBVr6kNf5hfMU3OYJHrYMgdA5
 Bk5w8bETeChuHuOM+eWGwUwh6rZ+VIG9sbyXp753dryRdLkWlXYsioN49gcgfqYfTn/M
 CqOyulJc+N9gXp08NNPNjQBehVpbU0OF0RK4z2dovy04DN+n6bV5qERnZUxS1hq9xgid
 HNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+h63Maw63ktvyuEogld2/EfBtiWXaS9LUhKmRtLAPjA=;
 b=g73wisq1tx/FZmZi90BetZhoZR1Au/3IM95ePkVPgmlB8iqWFLO+aYcw5Wk8GDSuLW
 V08ekHYMrDCEds/qYNgpVxE7qHAZFssDoTFi5ifwFzk6Mnp9QG2FCkNuGByj/98fBCJq
 a3o4VOVJ+PUDIyLFMS9KXzqOu8z3pyVpSi0gZXJzzszvQgOW7EX3qkwxG01Gu2e8hEs0
 LPN2/vVIxSeEH4a3cj5LZV4dJzbsWy3f2eJMuMGPen837TKZPb3yDfcCl8McD+v3oPLP
 3e1oM9U0Jac5eWRb2Agn+FEuVoc3D3N0SZ7j0g4mL6+dIyIvKekaq0Mp98PQlwiSqVFk
 EcSg==
X-Gm-Message-State: AOAM531CAzZUoGjBC8P7ELGVnw0r61gXVAIS6860LPZkXqXiVbyEFFje
 eGlJ/H1GZxL4GaYg8zvodRdDuUF0Dt2U8Z1fa7g=
X-Google-Smtp-Source: ABdhPJxYZa4bB3d9F9Y3KuUqS32ZbPvRyYd4bWnNCu+eiDrjSQwbz3tyLm5q3zVvoPY6R0v+XQonyQ==
X-Received: by 2002:adf:e904:: with SMTP id f4mr21956298wrm.245.1637165082586; 
 Wed, 17 Nov 2021 08:04:42 -0800 (PST)
Received: from localhost.localdomain
 (101.red-176-80-44.dynamicip.rima-tde.net. [176.80.44.101])
 by smtp.gmail.com with ESMTPSA id m2sm5826742wml.15.2021.11.17.08.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 08:04:42 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 17/17] meson: Move bsd_user_ss to bsd-user/
Date: Wed, 17 Nov 2021 17:04:12 +0100
Message-Id: <20211117160412.71563-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211117160412.71563-1-richard.henderson@linaro.org>
References: <20211117160412.71563-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have no need to reference bsd_user_ss outside of bsd-user.
Go ahead and merge it directly into specific_ss.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 meson.build          | 3 ---
 bsd-user/meson.build | 4 ++++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index ecc181ea13..9f7756a805 100644
--- a/meson.build
+++ b/meson.build
@@ -2356,7 +2356,6 @@ genh += hxdep
 authz_ss = ss.source_set()
 blockdev_ss = ss.source_set()
 block_ss = ss.source_set()
-bsd_user_ss = ss.source_set()
 chardev_ss = ss.source_set()
 common_ss = ss.source_set()
 common_user_ss = ss.source_set()
@@ -2611,8 +2610,6 @@ subdir('common-user')
 subdir('bsd-user')
 subdir('linux-user')
 
-specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-
 common_user_ss = common_user_ss.apply(config_all, strict: false)
 common_user = static_library('common-user',
                              sources: common_user_ss.sources(),
diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 25c3976ead..9fcb80c3fa 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -2,6 +2,8 @@ if not have_bsd_user
    subdir_done()
 endif
 
+bsd_user_ss = ss.source_set()
+
 common_user_inc += include_directories('.')
 
 bsd_user_ss.add(files(
@@ -17,3 +19,5 @@ bsd_user_ss.add(files(
 
 # Pull in the OS-specific build glue, if any
 subdir(targetos)
+
+specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
-- 
2.25.1


