Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 119DB3C5C3C
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:37:20 +0200 (CEST)
Received: from localhost ([::1]:41098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vBX-00020L-1Z
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1x-0004Tp-Eb
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:26 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1t-0008F7-Ic
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id m2so14328550wrq.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tuIitrhF9ibjgdg1Td3JXbbYjhXcUV2FAxUCzTDO08g=;
 b=Mx+xxXsZo465t0kFDUsxnEwG/whdGYyTOonjmXYY9iDeCJT7LzGtN7UWe3pLjM5rPk
 R5ft2LJAwu5aeUjzjsaw5mi4gOPzfCJlz1u0sDWitbnxtwG7HU77r7b0GQHQzl0YIqhw
 O1R+dK8IrRKqc+upzCB1vp17aIEPBpOjAKNfmTHSNFc6YAYYJRp/D9JQlwgRqCoux3YD
 M6eMS0+xe0mK/pGRxeyxzLiJwNCJWC2Bgu0XKwLdmNOpAuIeVqZM+2DOY2+V07cr9uxA
 OxkW+PMYW51qseEvdy8LF5hHXj9ohn74Xgl0Rm616MgV6WdhvtsMI+Lf3vK4Bt6vz3nk
 Je3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tuIitrhF9ibjgdg1Td3JXbbYjhXcUV2FAxUCzTDO08g=;
 b=QjAcqWJm22pAQYWk5BLMgwMbmO1M4pgyXjQtnIJRE3IFGb9NSYYIpZMzX0t4MzfIbm
 rmaqclm/9jFnVrVABJASopcOB6pT4AzFjIAWUPmDh4QGjDghYeb9fypgm+vpswRXjGhk
 O+K3bDWiZZyLBriq3kHmUVkvl1rSPI3ISfqBtFphqFE8VeBeB1/Wc7h/Qa4Z3SCF6qFd
 JLZCNf7+zAoOp4qd25XpL1zlOE0LKvIlhJ7NABX7NfrghLMTPM3hKKZ9Akne7v82+7Va
 Nn0yQ7mYdn1mNNfMr4HdB46lEObuyRXCVaABzkRgISH1TvmwSaqPYBYrbV7TNAhnr1Vd
 joUw==
X-Gm-Message-State: AOAM530iDX7s04ox8SlJu8ojdKRLeprM2m79EpauvhrZkjGTolJiAD20
 A9OYAXvGhP9dT6LtUuFRpMaZL1oH1l8bKg==
X-Google-Smtp-Source: ABdhPJxR9JuhKYB/wzZg21KUiRfGrp8MUduU/Uu0PyBHGkP/MNDVCfPSBtKOH3KwwLgvDyEvaGYBEA==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr34699273wrv.155.1626092840208; 
 Mon, 12 Jul 2021 05:27:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o28sm15202121wra.71.2021.07.12.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E43EA1FFB5;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 29/40] configure: don't allow plugins to be enabled for a
 non-TCG build
Date: Mon, 12 Jul 2021 13:26:42 +0100
Message-Id: <20210712122653.11354-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-30-alex.bennee@linaro.org>

diff --git a/configure b/configure
index 650d9c0735..7f906be68d 100755
--- a/configure
+++ b/configure
@@ -1098,6 +1098,7 @@ for opt do
   --enable-cap-ng) cap_ng="enabled"
   ;;
   --disable-tcg) tcg="disabled"
+                 plugins="no"
   ;;
   --enable-tcg) tcg="enabled"
   ;;
@@ -1563,6 +1564,11 @@ for opt do
   esac
 done
 
+# test for any invalid configuration combinations
+if test "$plugins" = "yes" -a "$tcg" = "disabled"; then
+    error_exit "Can't enable plugins on non-TCG builds"
+fi
+
 case $git_submodules_action in
     update|validate)
         if test ! -e "$source_path/.git"; then
-- 
2.20.1


