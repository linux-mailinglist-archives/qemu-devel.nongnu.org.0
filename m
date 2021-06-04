Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CF39BD43
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:34:41 +0200 (CEST)
Received: from localhost ([::1]:34256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCmO-0001kH-69
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:34:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCI7-0008TA-19
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:24 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHi-0005t2-5M
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id o127so5677549wmo.4
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F0Zjuqp+eDe0I9dgRDfCqEr+Z2SzjMw09N7y7MQfjjk=;
 b=KoszT2d3OrEjU0HDXn5fRCMR3S1GCj6RVvYfry+e6n/8j96tISROd322ddLf2xL9Ks
 +FATjhE6Q9K3CXnsLg3atwAkjuSKV8l8zj7c5X36YeiudAJ6VhLcANszRsG3koq80d3m
 d7MC1D56rCRhSJfQo327AHvaPQ4uup6XM8+0lm0Shhuv3hNiUdorBBugq1vjzt6AgdtW
 vo++L0JTFtGkCVGgs2PqJMLrEgU7wLB6mB1zU1kH6N+ZJh6V9E4eOwsMWcjfLtWFBM66
 YI5RIxnM0VCiXz5XsuVXW+CgCsO5eRJAtw7iOi2WssadwuzSwTsTQzOZg2Yw7+mrL3Xw
 Kezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F0Zjuqp+eDe0I9dgRDfCqEr+Z2SzjMw09N7y7MQfjjk=;
 b=GJh1IV8bOT/ei2hezQsyk5HLTJOGGEJRJslZ/OgVWK7ntpnnsE/GcnKxOlJXXrcbVz
 eNdnP/Sx24kYOBEiZ0DE6GQCWPmALKbngeEaSF17uYYaWP26Xe7pzue5sxrSUCraxIu7
 aQZDZ0bADJSs4HV6AV/URiik0rEc3ikfMzTeLOopYLOG/0YkrsFolI7UADh4Dx5hsOBc
 U+EpzGxDzV7w2hYOG4lTtVrRic5mmLwyZp9HZZYx2B/CqSxnja3Pl2bCUo/hI2nCZ4Yo
 OyFvgyEW7LV3J6iDCtoy+osoaivbrFhNJRogEphpCvP/tgLLbchsor79uVFHP/uZ/YHQ
 aUfQ==
X-Gm-Message-State: AOAM532o9xk3AKskrivhFtCt4UdH/lU38HfKLCVxA55sTv8vbiqnvezv
 wtVW8cKcluTbo9rmcXyRE6fkdg==
X-Google-Smtp-Source: ABdhPJyTuLcSoC2UHlQLl981MANc0GQrFgEh63niPLzrEORvSJOYuAnzEPl9pBrNAnsdrBXLgmjoBA==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr4307814wmk.77.1622822576889;
 Fri, 04 Jun 2021 09:02:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z188sm6250138wme.38.2021.06.04.09.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 38A711FFA6;
 Fri,  4 Jun 2021 16:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 18/99] target/arm: tcg: add sysemu and user subdirs
Date: Fri,  4 Jun 2021 16:51:51 +0100
Message-Id: <20210604155312.15902-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/tcg/meson.build        | 3 +++
 target/arm/tcg/sysemu/meson.build | 2 ++
 target/arm/tcg/user/meson.build   | 2 ++
 3 files changed, 7 insertions(+)
 create mode 100644 target/arm/tcg/sysemu/meson.build
 create mode 100644 target/arm/tcg/user/meson.build

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 04b94a3bfb..3503ad96c8 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -39,3 +39,6 @@ arm_ss.add(when: ['TARGET_AARCH64','CONFIG_TCG'], if_true: files(
   'pauth_helper.c',
   'sve_helper.c',
 ))
+
+subdir('user')
+subdir('sysemu')
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
new file mode 100644
index 0000000000..726387b0b3
--- /dev/null
+++ b/target/arm/tcg/sysemu/meson.build
@@ -0,0 +1,2 @@
+arm_softmmu_ss.add(when: 'CONFIG_TCG', if_true: files(
+))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
new file mode 100644
index 0000000000..7af3311190
--- /dev/null
+++ b/target/arm/tcg/user/meson.build
@@ -0,0 +1,2 @@
+arm_user_ss.add(when: 'CONFIG_TCG', if_true: files(
+))
-- 
2.20.1


